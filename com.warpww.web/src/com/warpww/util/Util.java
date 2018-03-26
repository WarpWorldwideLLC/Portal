package com.warpww.util;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.servlet.http.HttpServletRequest;

public class Util {
	
	public static String GetFunctionName()
	{
		return "FunctionName";
	}
	
	public static void foo()
	{
		// Util x = new Util();
		
		//String statusCode =  getClass().getName() + ".doGet()" + ".." + System.currentTimeMillis() + ";";
		//String statusCode2 = (String) request.getAttribute("ResultCode"); 
		//statusCode2 = Thread.currentThread().getStackTrace()[1].getClassName();
		//statusCode2 += "." + Thread.currentThread().getStackTrace()[1].getMethodName();
		//statusCode2 += x.GetFunctionName();
		//statusCode2 += statusCode;
		//request.setAttribute("ResultCode", statusCode2);
	}
	
	public static void printParams(String titleText, HttpServletRequest request)
	{
		System.out.println();
		System.out.println("**** HTTP Servlet Request Data for " + titleText + " " + Instant.now().toString() + " ****");
		
		System.out.println("Parameter Map:");
		Map params = request.getParameterMap();
	    Iterator i = params.keySet().iterator();
	    while ( i.hasNext() )
		{
		    String key = (String) i.next();
		    String value = ((String[]) params.get( key ))[ 0 ];
		    
		    System.out.println(key + ": " + value);		    
		    
		}
	  
		System.out.println("All request attributes:");
		Enumeration enAttr = request.getAttributeNames(); 
		while(enAttr.hasMoreElements()){
		 String attributeName = (String)enAttr.nextElement();
		 System.out.println("Attribute Name - "+attributeName+", Value - "+(request.getAttribute(attributeName)).toString());
		}
		
		System.out.println("All request parameters:");
		Enumeration enParams = request.getParameterNames(); 
		while(enParams.hasMoreElements()){
		 String paramName = (String)enParams.nextElement();
		 System.out.println("Parameter Name - "+paramName+", Value - "+request.getParameter(paramName));
		}

	}
	
	// Returns null on error, prints error to the system log.
	public static InputStream StringToStream(String inputString)
	{
		try 
		{
			InputStream stream = new ByteArrayInputStream(inputString.getBytes(StandardCharsets.UTF_8.name()));
			return stream;
		} catch (Exception ex)
		{
			System.out.println(ex.toString());
			System.out.println(ex.getStackTrace().toString());
			return null;
		}
	}
	
	// Returns an unquoted JSON value
	public static String getJsonArrayValue(String jsonInput, String arrayName, String keyName) {
		String returnValue = "";
		
		try {
			InputStream stream = Util.StringToStream(jsonInput);
			JsonReader reader = Json.createReader(stream);
			JsonObject jsonst = reader.readObject();
			reader.close();
			// Get the array
			JsonArray jsonArr = jsonst.getJsonArray(arrayName);
			
			returnValue = jsonArr.getJsonString(0).getString();
			
			// returnValue = jsonst.getJSONArray("arrayName").getJsonString(keyName).getString();
		} catch (Exception ex) {
			System.out.println(ex.toString());
			System.out.println(ex.getStackTrace().toString());
			returnValue =  null;
		}
		
		return returnValue;
	}
		
	// Returns an unquoted JSON value
	public static String getJsonValue(String jsonInput, String keyName) {
		String returnValue = "";
		
		try {
			InputStream stream = Util.StringToStream(jsonInput);
			JsonReader reader = Json.createReader(stream);
			JsonObject jsonst = reader.readObject();
			returnValue = jsonst.getJsonString(keyName).getString();
		} catch (Exception ex) {
			System.out.println(ex.toString());
			System.out.println(ex.getStackTrace().toString());
			returnValue =  null;
		}
		
		return returnValue;
	}
	
	public static boolean setErrorMessage(HttpServletRequest request) {
		boolean returnValue = false;
		
		try {
			String jsonResponse = request.getAttribute("jsonResponse").toString();
			
			String procStatus = getJsonValue(jsonResponse, "ProcStatus");
			String procMessage = getJsonValue(jsonResponse, "ProcMessage");
			String messageSource = getJsonValue(jsonResponse, "MessageSource");
			String messageCode = getJsonValue(jsonResponse, "MessageCode");
	
			String userMessage = "(" + messageSource + ") " + messageCode + ": " + procMessage;
			request.setAttribute("ErrorMessage", userMessage);
			request.setAttribute("ErrorMessageVisible", "\"display:none;\"");
			returnValue = true;
			
		} catch (Exception ex) {
			returnValue = false;
		}
		
		return returnValue;
	}
	
	public static boolean clearErrorMessage(HttpServletRequest request) {
		boolean returnValue = false;
		
		try {
				
			String userMessage = "";
			request.setAttribute("ErrorMessage", userMessage);
			request.setAttribute("ErrorMessageVisible", "\"display:none;\"");
			returnValue = true;
			
		} catch (Exception ex) {
			returnValue = false;
		}
		
		return returnValue;
	}
	
	public static String getErrorCode (String jsonResponse) {
		String returnValue = "";
		
		
		return returnValue;
	}
	
	public static String getErrorMessage(String jsonResponse) {
		String returnValue = "";
		
		
		return returnValue;
	}

	private String sendPost(String destinationUrl, String userID, String firstName, String lastName, String eMail, String testName) throws Exception {
		
		String USER_AGENT = "Mozilla/5.0";
		
		// Clear Text Redirects - Curren
		String url = "http://warpauth.petersons.com/WarpTest/Plainauthenticate";
		
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		//add request header
		con.setRequestMethod("POST");
		con.setRequestProperty("User-Agent", USER_AGENT);
		con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
			
		String urlParameters = "_RequestVerificationToken=";
		
		// Send post request
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(urlParameters);
		wr.flush();
		wr.close();

		int responseCode = con.getResponseCode();
		System.out.println("Response Code: " + responseCode);

		InputStream _is;
		
		if (con.getResponseCode() < HttpURLConnection.HTTP_BAD_REQUEST) {
		    _is = con.getInputStream();
		} else {
		     /* error from server */
		    _is = con.getErrorStream();
		}
		
		BufferedReader in = new BufferedReader(new InputStreamReader(_is));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		// print result
		// System.out.println(response.toString());
		return response.toString();

	}


}
