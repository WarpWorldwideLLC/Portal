package com.warpww.web.servlet.ux;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.warpww.util.*;

/**
 * Servlet implementation class passphrasereminder
 */
@WebServlet("/passphrasereminder")
public class passphrasereminder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public passphrasereminder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
		request.getRequestDispatcher("WEB-INF/passphrasereminder.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String inputJSON = Command.createRequestInput(request);
		System.out.println(inputJSON);

		
		if(request.getParameter("emailAddress") != "")
		{
			processEmail(inputJSON, request, response);
		}
		else if(request.getParameter("memberName") != "")
		{
			processMemberName(inputJSON, request, response);
		}
		else
		{
		
		}
		
		doGet(request, response);
	}
	
	
	// If the member has only their email, retrieve the Member Names associated with this email and send them to the email address. 
	protected void processEmail(String pInputJSON, HttpServletRequest pRequest, HttpServletResponse pResponse)
	{
		try
		{
			System.out.println("Have an email!");
			
			String commandText = Command.createCommand("GetMemberNameFromEmailAddress", pInputJSON);
			System.out.println("commandText");
			pRequest.setAttribute("CommandText", commandText);
		
			//pRequest.getRequestDispatcher("/dbProcess.jsp").include(pRequest, pResponse);
			
		
		} catch(Exception ex)
		{
			System.out.println(ex.toString());
		}
	}
	
	
	// If the Member has their Member Name, email them a token to reset their password. 
	protected void processMemberName(String pInputJSON, HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println("Have a Member ID!");
	}

}
