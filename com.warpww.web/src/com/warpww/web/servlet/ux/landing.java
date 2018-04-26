package com.warpww.web.servlet.ux;

// http://www.dummies.com/web-design-development/site-development/how-to-put-text-boxes-in-an-html5-form/

import java.io.IOException;

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
		/* Set PageName & System Mode
		String uri = request.getRequestURI();
		String pageName = uri.substring(uri.lastIndexOf("/")+1);
		request.setAttribute("pageName", pageName);
		
		int memberID = 0;
		String authTime = null;
		boolean authenticated = false;
		
		// Authenticate the User via Cookie; populate memberID and authTime fields.
		if(Login.authenticate(request, response)) {
			memberID = Integer.parseInt(request.getAttribute("verifyToken_MemberID").toString());
			System.out.println("Member ID: " + memberID);
			authTime = request.getAttribute("verifyToken_CreateTime").toString();
			authenticated = true;
		} else {
			authenticated = false;
			memberID = 0;
			
		}
		*/
		//Check to see if this page was loaded after a sign in or sign out
		Util.printParams("landing.doGet", request);
		if(null == request.getAttribute("signin_out")) {
			AuthMod a = new AuthMod(request, response);
			a.authenticate();	
		} else if(request.getAttribute("signin_out").toString() == "in") {
			AuthMod a = new AuthMod(request, response, AuthMod.Sign.in);
		} else {
			AuthMod a = new AuthMod(request, response, AuthMod.Sign.out);
		}
		
		
		request.getRequestDispatcher("/WEB-INF/landing2.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void validate234(HttpServletRequest request, HttpServletResponse response)
	{
		boolean validated = false;
		boolean tryValidation = false;
		
		//Util.printParams("landing.doPost", request);
		
        // Check if memberName parameter exists
        if (request.getParameterMap().containsKey("memberName")) {
        		if(request.getParameter("memberName").trim().isEmpty() || request.getParameter("memberName").trim() == null )
        		{
        			tryValidation = false;
        		} else {
        			tryValidation = true;
        		}
        } else {
        		tryValidation = false;
        }

        // Check if passPhrase parameter exists
        if (tryValidation == true) {
        		tryValidation = false;
            if (request.getParameterMap().containsKey("passPhrase")) {
        		if(request.getParameter("passPhrase").trim().isEmpty() || request.getParameter("passPhrase").trim() == null)
			{ 
        			tryValidation = false;
			} else {
				tryValidation = true;
			}
        } else {
        		tryValidation = false;
        }        
        	
        }

		
		
		// Hash passPhrase and validate memberName and passPhrase
        String passphraseHash = "";
		try {
			if(tryValidation) {
				passphraseHash = Password.createHash(request.getParameter("passPhrase"));
				request.setAttribute("passphraseHash", passphraseHash);
				validated = Login.validateSignon(request, response);
			}
	
		} catch (Exception ex) {
			validated = false;
			System.out.println(ex.toString());
			ex.printStackTrace();
		}
		
		// If memberName and passPhrase pass validation, react appropriately
		try {		
			if(validated) {
					request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("/WEB-INF/landing2.jsp").forward(request, response);
			}
		} catch (Exception ex) {
			validated = false;
			System.out.println(ex.toString());
			ex.printStackTrace();
		}
	}
	
	
	
}
