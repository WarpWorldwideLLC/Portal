package com.warpww.web.servlet.ux;

import java.io.IOException;

import javax.json.Json;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.warpww.util.*;

/**
 * Servlet implementation class membermanagement
 */
@WebServlet("/membermanagement")
public class membermanagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public membermanagement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/membermanagement.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			
		// Process the request		
		try 
		{
			//setRequestState(request, response);
			processRequest(request, response);
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		// Pass control to RegistrationConfirmation
		request.getRequestDispatcher("/WEB-INF/membermanagement.jsp").forward(request, response);
		
	}
	
	public void processRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		
		String json = Json.createObjectBuilder()
				 .add("Command", "GetMemberList")
				 .add("AuID", 1)
				 .add("IuID", 1)
				 .build()
				 .toString(); 		
		
		
			String jsonParms = "";
		
			jsonParms = json;
			request.setAttribute("CommandText", jsonParms);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/dbProcess");
			dispatcher.include(request, response);
			
			Util.printParams("MemberManagement.processRequest", request);
	
		
		
	}
		


}
