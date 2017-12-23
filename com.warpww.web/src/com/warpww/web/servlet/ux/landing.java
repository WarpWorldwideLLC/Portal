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
        // TODO Auto-generated constructor stub
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
		// TODO Auto-generated method stub
		boolean validated = validateSignon(request, response);
		
		if(validated) {
			request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
			
		} else {
			request.getRequestDispatcher("/WEB-INF/landing.jsp").forward(request, response);
		}
	}

	protected boolean validateSignon(HttpServletRequest request, HttpServletResponse response)
	{
		boolean returnValue = false;
		
		try
		{
		String json = Json.createObjectBuilder()
				 .add("Command", "ValidateSignon")
				 .add("AuID", 1)
				 .add("IuID", 1)
				 .add("MemberName", request.getParameter("memberName"))
				 .add("PassphraseHash", request.getParameter("passphraseHash"))
				 .build()
				 .toString(); 		
		
		String jsonParms = "";
		jsonParms = json;
		request.setAttribute("CommandText", jsonParms);
		
		request.getRequestDispatcher("/dbProcess").forward(request, response);

		} catch (Exception ex)
		{
			returnValue = false;
		}
		
		return returnValue;
	}
	
	
}
