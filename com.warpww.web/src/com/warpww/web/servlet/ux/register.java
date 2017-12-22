package com.warpww.web.servlet.ux;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.json.Json;
import javax.servlet.RequestDispatcher;
import com.warpww.sec.Password;
import com.warpww.util.*;
import com.captcha.botdetect.web.servlet.Captcha;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
@MultipartConfig
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected String actionMode;
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Process the request
		setRequestState(request, response);
		
		request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Check the Captcha first. 
		Captcha captcha = Captcha.load(request, "exampleCaptcha");
		// validate the Captcha to check we're not dealing with a bot
		boolean isHuman = captcha.validate(request.getParameter("captchaCode"));
		if (isHuman) {
		  // TODO: Captcha validation passed, perform protected action
			
			// Process the request		
			try 
			{
				setRequestState(request, response);
				processRequest(request, response);
			} catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			// Pass control to RegistrationConfirmation
			request.getRequestDispatcher("/WEB-INF/registrationconfirmation.jsp").forward(request, response);
			
		} else {
		  // TODO: Captcha validation failed, show error message
			
			request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
		}


		
		
		
	}

	public void setRequestState(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		
		
		// Determine which button was pressed. 
		Map params = request.getParameterMap();
	    Iterator i = params.keySet().iterator();
	    actionMode = "None";
	    while ( i.hasNext() )
		{
		    String key = (String) i.next();
		    String value = ((String[]) params.get( key ))[ 0 ];
		    
			if(key.substring(0, 3).contains("btn"))
			{
				actionMode = value;
		    	}
		    
		    
		}
	    		
		        
	}
	
	public void processRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		
		Password pw = new Password();
		String passphraseHash = pw.createHash(request.getParameter("passPhrase1"));
		
		String json = Json.createObjectBuilder()
				 .add("Command", "RegisterUserAccount")
				 .add("AuID", 1)
				 .add("IuID", 1)
				 .add("MemberName", request.getParameter("memberName"))
				 .add("EmailAddress", request.getParameter("emailAddress"))
				 .add("PassphraseHash", passphraseHash)
				 .build()
				 .toString(); 		
		
		if(actionMode == null)
		{
			actionMode = "NullAction";
		}
		
		switch(actionMode)
		{
		case "native":
			String jsonParms = "";
		
			jsonParms = json;
			request.setAttribute("CommandText", jsonParms);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/dbProcess");
			dispatcher.include(request, response);
			
			//Util.printParams("Register.processRequest", request);
			
			break;
		case "twitter":
			break;
		default: 
			
			break;
		}
		
		
	}
	
}