package com.warpww.web.servlet.ux;

// http://www.dummies.com/web-design-development/site-development/how-to-put-text-boxes-in-an-html5-form/

import java.io.IOException;

import javax.json.Json;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.warpww.sec.*;
import com.warpww.util.*;

/**
 * Servlet implementation class landing
 */
@WebServlet("/landing")
public class landing extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public landing() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("/WEB-INF/landing.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean validated = false;
		
		//Util.printParams("landing.doPost", request);
		
		// if(str != null && !str.isEmpty())
		// Ensure member name and passphrase were typed, hash passphrase before continuing. 
		try {
			if(!request.getParameter("memberName").trim().isEmpty() && request.getParameter("memberName").trim() != null )
			{
				if(!request.getParameter("passPhrase").trim().isEmpty() && request.getParameter("passPhrase").trim() != null)
				{ 
					String passphraseHash = Password.createHash(request.getParameter("passPhrase"));
					request.setAttribute("passphraseHash", passphraseHash);
					validated = validateSignon(request, response);
				}
			}
			
		} catch (Exception ex)
		{
			validated = false;
			System.out.println(ex.toString());
			ex.printStackTrace();
		}
		
		if(validated) {
			request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
			
		} else {
			request.getRequestDispatcher("/WEB-INF/landing.jsp").forward(request, response);
		}
	}

	protected boolean validateSignon(HttpServletRequest request, HttpServletResponse response)
	{
		boolean returnValue = false;
		// Util.printParams("landing.validateSignon", request);
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
		//Util.printParams("landing.validateSignon.Before", request);
		request.getRequestDispatcher("/dbProcess").include(request, response);
		//Util.printParams("landing.validateSignon.After", request);
		
		Command cmd = new Command(request.getAttribute("CommandResults").toString());

		if(cmd.ProcStatus.equals( cmd.COMMAND_SUCCESS)) {
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
	
	
}
