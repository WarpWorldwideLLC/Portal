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
		validate(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		validate(request, response);
	}

	protected void validate(HttpServletRequest request, HttpServletResponse response)
	{
		boolean validated = false;
		
		Util.printParams("landing.doPost", request);
		
		// if(str != null && !str.isEmpty())
		// Ensure member name and passphrase were typed, hash passphrase before continuing. 
		try {
			if(!request.getParameter("memberName").trim().isEmpty() && request.getParameter("memberName").trim() != null )
			{
				if(!request.getParameter("passPhrase").trim().isEmpty() && request.getParameter("passPhrase").trim() != null)
				{ 
					String passphraseHash = Password.createHash(request.getParameter("passPhrase"));
					request.setAttribute("passphraseHash", passphraseHash);
					validated = Login.validateSignon(request, response);
				}
			}
			
		} catch (Exception ex)
		{
			validated = false;
			System.out.println(ex.toString());
			ex.printStackTrace();
		}
		try {		
			if(validated) {
	
					request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
				
				
			} else {
				request.getRequestDispatcher("/WEB-INF/landing.jsp").forward(request, response);
			}
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
}
