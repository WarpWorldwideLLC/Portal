package com.warpww.web.servlet.ux;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.warpww.sec.AuthMod;
import com.warpww.sec.Login;
import com.warpww.util.*;

/**
 * Servlet implementation class registrationconfirmation
 */
@WebServlet("/registrationconfirmation201804")
public class registrationconfirmation201804 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registrationconfirmation201804() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		AuthMod a = new AuthMod(request, response);
		a.authenticate();
		
		// Clear any existing error messages.
		request.setAttribute("ErrorMessage","");
		
		
		
		String jsonResults = request.getAttribute("CommandResults").toString();
		
		System.out.println("jsonResults: " + jsonResults);
		System.out.println("MemberName: " + Util.getJsonValue(jsonResults, "MemberName"));
		System.out.println("EmailAddress: " + Util.getJsonValue(jsonResults, "EmailAddress"));
		
		request.getRequestDispatcher("/WEB-INF/registrationconfirmation201804.jsp").forward(request, response);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

	protected void errorResponse() {
		
	}
	
}
