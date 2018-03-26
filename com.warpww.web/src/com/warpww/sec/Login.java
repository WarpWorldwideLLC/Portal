package com.warpww.sec;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAccessor;
import java.util.UUID;

import javax.json.Json;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.xml.internal.security.utils.Base64;
import com.warpww.pymt.hsc;
import com.warpww.util.Command;
import com.warpww.util.Util;

public class Login {

	public static String getGreeting(int MemberID, HttpServletRequest request, HttpServletResponse response) {
		String returnValue = null;
		
		try
		{
		String json = Json.createObjectBuilder()
				 .add("Command", "GetGreeting")
				 .add("AuID", 1)
				 .add("IuID", 1)
				 .add("MemberID", MemberID)
				 .build()
				 .toString(); 		
		
		String jsonParms = "";
		jsonParms = json;
		request.setAttribute("CommandText", jsonParms);
		
		//request.getRequestDispatcher("/dbProcess").include(request, response);
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/dbProcess");
		dispatcher.include(request, response);
		
		// Util.printParams("getGreeting", request);
		Command cmd = new Command(request.getAttribute("CommandResults").toString());
		
		/* 
		System.out.println("Status: " + cmd.CommandResults);
		System.out.println("Constant: " + cmd.COMMAND_SUCCESS);
		System.out.println("Comparison: " + cmd.ProcStatus.equals( cmd.COMMAND_SUCCESS));
		*/
		
		if(cmd.CommandResults.equals( cmd.COMMAND_SUCCESS)) {
			returnValue = "Hello, " + cmd.FirstName + " " + cmd.LastName;
			request.setAttribute("Greeting", returnValue);
		}
		
		} catch (Exception ex)
		{
			System.out.println(ex.toString());
			ex.printStackTrace();
			returnValue = null;
		}
			
		return returnValue;
	}
	
	// Format time for the token. 
	public static String formatTokenTime(Instant instantValue) {
		String returnValue = null;
		
		LocalDateTime datetime = LocalDateTime.ofInstant(instantValue, ZoneOffset.UTC);
		returnValue = DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS").format(datetime);
		
		return returnValue;
	}
	
	public static int getTokenMemberID(String memberHex, String createTime) {
		int returnValue = -1;
		
		int rawValue = Integer.parseInt(memberHex, 16);
		String offset = createTime.substring(14);
		returnValue = rawValue - Integer.parseInt(offset) - hsc.tokenMemberPadding;
		
		return returnValue;
	}
	
	public static String formatTokenMemberID(String createTime, int memberID) {
		String returnValue = null;
		
			// Token is: Embedded Member ID
			String offset = createTime.substring(14);
			int memberCodeN = memberID + Integer.parseInt(offset) + hsc.tokenMemberPadding;
			String memberCode = Integer.toHexString(memberCodeN);
			
			returnValue = memberCode;
					
		return returnValue;
	}
	
	public static boolean validateTokenHash(String tokenHash, String createTime, String userAgent, String remoteAddr, int memberID) {
		boolean returnValue = false;
		
		try {

			String hashCheck = formatTokenHash(createTime, userAgent, remoteAddr, memberID);
			
			if(tokenHash.equals(hashCheck))
			{
				returnValue = true;
			}
			
			
		} catch (Exception ex) {
			System.out.println(ex.toString());
			ex.printStackTrace();
			returnValue = false;				
		}
		
		// System.out.println("validateTokenHash: " + returnValue);
		return returnValue;
	}
	
	public static String formatTokenHash (String createTime, String userAgent, String remoteAddr, int memberID) {
		String returnValue = null;
		
		try { 
			String tokenHashInput = createTime + userAgent + remoteAddr + Integer.toString(memberID);
					
			MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
			messageDigest.update(tokenHashInput.getBytes());
			returnValue = new String(messageDigest.digest());
			
		} catch (Exception ex) {
			System.out.println(ex.toString());
			ex.printStackTrace();
			returnValue = null;				
		}
		
		return returnValue;
	}
	
	public static String encodeToken (String rawTokenValue) { 
		String returnValue = null;
		
		try {
			
			returnValue = URLEncoder.encode(rawTokenValue, "UTF-8");
			
		} catch (Exception ex) {
			System.out.println(ex.toString());
			ex.printStackTrace();
			returnValue = null;
		}

		return returnValue;
	}
	
	public static String decodeToken (String encodedTokenValue) {
		String returnValue = null;
		
		try {
			
			returnValue = URLDecoder.decode(encodedTokenValue, "UTF-8");
			
		} catch (Exception ex) {
			System.out.println(ex.toString());
			ex.printStackTrace();
			returnValue = null;

		}
		
		return returnValue;
	}
	
	public static String createAuthenticationToken(HttpServletRequest request, HttpServletResponse response, int memberID) {
		String returnValue = null;
		try {

			// Start creating the token in tokenFinal.
			// tokenFinal format a string is: 
			// formatted createTime (yyyyMMddHHmmssSSS)
			// memberCode = memberID + offSet + tokenMemberPadding, converted to Hex
			
			
			// Date/Time Token Created
			Instant createTime = Instant.now();
			String tokenCreateTime = formatTokenTime(createTime);
			
			// MemberID Token Value
			String tokenMemberCode = formatTokenMemberID(tokenCreateTime, memberID);
			
			// Token HASH Value
			String tokenHashValue = formatTokenHash(tokenCreateTime, request.getHeader("User-Agent"), request.getRemoteAddr(), memberID);
			
			// Compose the Raw Token
			String tokenRaw = tokenCreateTime + tokenMemberCode + tokenHashValue;
			
			// Encode the entire token
			String tokenFinal = encodeToken(tokenRaw);
			
			// Store a token in a cookie. 
			Cookie userCookie = new Cookie(hsc.cookieName, tokenFinal);
			userCookie.setComment("Used by Warp Worldwide website.");
			userCookie.setMaxAge(hsc.tokenExpirationDuration);      
			// userCookie.setDomain(hsc.cookieDomain);
			userCookie.setSecure(hsc.cookieSSL);       	// Cookie can only be retreived over SSL
			userCookie.setHttpOnly(true);       		 	// Cookie can only be retrieved via HTTP 
			response.addCookie(userCookie);
			
			returnValue = tokenFinal;
			
		} catch (Exception ex) {
			System.out.println(ex.toString());
			ex.printStackTrace();
			returnValue = null;			
		}		
		return returnValue;
	}
	
	public static boolean authenticateToken(HttpServletRequest request) {

		boolean returnValue = false;
		
		// Loop through available Cookes and find the correct one.
		String cookieValue = null;
		
		Cookie[] cookies = request.getCookies();
		if (cookies != null) 
		{
		    for(int i=0; i<cookies.length; i++) 
		    {
		    		
		        Cookie cookie = cookies[i];
		        
		        if (hsc.cookieName.equals(cookie.getName())) 
		        {
		        		/*
		            System.out.println("Domain: " + cookie.getDomain()); 
		            System.out.println("Comment: " + cookie.getComment());
		            System.out.println("MaxAge: " + cookie.getMaxAge());
		            System.out.println("Name: " + cookie.getName());
		            System.out.println("Path: " + cookie.getPath());
		            System.out.println("Value: " + cookie.getValue());
		            System.out.println("Cookie Name: " + cookie.getName());
		            */
		        		
		            cookieValue = cookie.getValue();
		            // System.out.println("Cookie Name: " + cookie.getName() + " [" + cookieValue + "]");
		            
		            /*
		            System.out.println("cookieValue: " + cookieValue);
		            System.out.println("Version: " + cookie.getVersion());
		            System.out.println("Class: " + cookie.getClass().toString());
		            System.out.println("Secure: " + cookie.getSecure());
		            */
		        }
		        
		        
		         returnValue = verifyToken(cookieValue, request);
		         if(returnValue) {
		        	 	//System.out.println(Instant.now().toString() + " " + request.getRequestURI() + " " + request.getMethod() + " authentication succeeded [" + cookieValue + "].");
		         } else {
		        	 	//System.out.println(Instant.now().toString() + " " + request.getRequestURI() + " " + request.getMethod() + " authentication failed [" + cookieValue + "].");
		         }
		    }
		}
		else
		{
		    returnValue = false;
		}   
		
		//System.out.println("authenticateToken: " + returnValue);
		return returnValue;
	}
	
	public static boolean verifyToken (String tokenValue, HttpServletRequest request) {
		boolean returnValue = false;
		// Opposite of creating a token
		if(tokenValue == null) {
			return false;
		}
		
		try {
			String tokenRaw = decodeToken(tokenValue);		
			
			String tokenCreateTime = tokenRaw.substring(0,  17);
			
			String tokenMemberHex = tokenRaw.substring(17, 23);
			
			int tokenMemberID = getTokenMemberID(tokenMemberHex, tokenCreateTime);
			
			boolean tokenHash = validateTokenHash(tokenRaw.substring(23), tokenCreateTime, request.getHeader("User-Agent"), request.getRemoteAddr(), tokenMemberID);
			
			if(tokenHash) { request.setAttribute("TokenMemberID", tokenMemberID); }
			
			returnValue = tokenHash;
			
		} catch (Exception ex) {
			System.out.println(ex.toString());
			ex.printStackTrace();
			returnValue = false;
		}
		
		// System.out.println("verifyToken: " + returnValue);
		return returnValue;
	}
	
	public static boolean validateSignon(HttpServletRequest request, HttpServletResponse response)
	{
		boolean returnValue = false;
		
		try
		{
		String json = Json.createObjectBuilder()
				 .add("Command", "ValidateSignon")
				 .add("AuID", 1)
				 .add("IuID", 1)
				 .add("MemberName", request.getParameter("memberName"))
				 .add("PassphraseHash", request.getAttribute("passphraseHash").toString())
				 .build()
				 .toString(); 		
		
		String jsonParms = "";
		jsonParms = json;
		request.setAttribute("CommandText", jsonParms);
		
		request.getRequestDispatcher("/dbProcess").include(request, response);
		
		Command cmd = new Command(request.getAttribute("CommandResults").toString());
		
		/* 
		System.out.println("Status: " + cmd.CommandResults);
		System.out.println("Constant: " + cmd.COMMAND_SUCCESS);
		System.out.println("Comparison: " + cmd.ProcStatus.equals( cmd.COMMAND_SUCCESS));
		*/
		
		if(cmd.CommandResults.equals( cmd.COMMAND_SUCCESS)) {
			String token = createAuthenticationToken(request, response, Integer.parseInt(cmd.MemberID));
			// System.out.println("Token: " + token);
			returnValue = true;
		}
		
		} catch (Exception ex)
		{
			System.out.println(ex.toString());
			ex.printStackTrace();
			returnValue = false;
		}
		
		return returnValue;
	}
	
	public static void authenticate(HttpServletRequest request, HttpServletResponse response) { 
		// Validate authentication - 
		String callingMethod = Thread.currentThread().getStackTrace()[2].getClassName() + "." + Thread.currentThread().getStackTrace()[2].getMethodName();
		
		if(Login.authenticateToken(request)) {
			System.out.println(callingMethod + ": authenticateToken Succeeded.");
			// Util.printParams(location, request);
			Login.getGreeting(Integer.parseInt(request.getAttribute("TokenMemberID").toString()), request, response);
			
		} else {
			System.out.println(callingMethod + ": authenticateToken Failed.");
		}
	}
	
}
