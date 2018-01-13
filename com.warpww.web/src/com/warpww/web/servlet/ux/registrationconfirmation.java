package com.warpww.web.servlet.ux;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.warpww.util.*;

/**
 * Servlet implementation class registrationconfirmation
 */
@WebServlet("/registrationconfirmation")
public class registrationconfirmation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registrationconfirmation() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Clear any existing error messages.
		request.setAttribute("ErrorMessage","");
		
		
		
		String jsonResults = request.getAttribute("CommandResults").toString();
		
		System.out.println("jsonResults: " + jsonResults);
		System.out.println("MemberName: " + Util.getJsonValue(jsonResults, "MemberName"));
		System.out.println("EmailAddress: " + Util.getJsonValue(jsonResults, "EmailAddress"));
		
		request.getRequestDispatcher("/WEB-INF/registrationconfirmation.jsp").forward(request, response);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Registration Confirmation POST fired.");
		doGet(request, response);
	}

	protected void errorResponse() {
		
	}
	
}