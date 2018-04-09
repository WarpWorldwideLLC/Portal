package com.warpww.web.servlet.ux;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.warpww.sec.Login;
import com.warpww.util.Util;

/**
 * Servlet implementation class warp_vega
 */
@WebServlet("/warp_vega")
public class warp_vega extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public warp_vega() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Set PageName & System Mode
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
		
		
		String purchase_action = request.getParameter("purchase") + "";
		switch(purchase_action) {
			case "1":  // STEM Science Hub
				break;
			case "2":  // STEM Mathematics Hub
				break;
			case "3":  //Technology
				break;
			case "4":  // Social Science
				break; 
			case "5":  // Medical
				break;
			case "6":  // Pre-Engineering
				break;
			default:
				purchase_action = "-1";
				 break;
		
		}
		if(Integer.parseInt(purchase_action) >= 0) {
			Util.addSolutionToCart(request, response, memberID, Integer.parseInt(purchase_action));
			// request.getRequestDispatcher("checkout").forward(request, response);
			request.getRequestDispatcher("cartmaint").forward(request, response);
		} else {
			request.getRequestDispatcher("/WEB-INF/warp_vega.jsp").forward(request, response);
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
