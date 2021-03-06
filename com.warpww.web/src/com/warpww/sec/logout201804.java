package com.warpww.sec;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.warpww.pymt.hsc;
import com.warpww.sec.AuthMod;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class logout201804
 */
@WebServlet("/logout201804")
public class logout201804 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public logout201804() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AuthMod a = new AuthMod(request, response);
		a.authenticate();
		
		request.setAttribute("signin_out", "out");
		
		deleteCookie(request, response);
		
		String forwardServlet = "landing201804";
		request.getRequestDispatcher(forwardServlet).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

	
	private boolean deleteCookie(HttpServletRequest request, HttpServletResponse response) {
		
		boolean returnValue = false;
		
		// Set Cookie MaxAge to 0, deleting it when the browser processes the header.
		hsc hscObject = new hsc();
		Cookie userCookie = new Cookie(hscObject.cookieName, "");
		userCookie.setMaxAge(0);      
		response.addCookie(userCookie);
		System.out.println("Authentication Cookie Deleted.");
		returnValue = true;
		
		return returnValue;
	}
	
	private boolean findCookie(HttpServletRequest request, HttpServletResponse response) {
		
		boolean returnValue = false;
		
		// Loop through available Cookes and find the correct one.
		String cookieValue = null;
		
		Cookie[] cookies = request.getCookies();
		if (cookies != null) 
		{
		    for(int i=0; i<cookies.length; i++) 
		    {
		    		
		        Cookie cookie = cookies[i];
		        
		        hsc hscObject = new hsc();
		        if (hscObject.cookieName.equals(cookie.getName())) 
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
		        
		        
		         returnValue = true;
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
		
		return returnValue;
	}
	
}
