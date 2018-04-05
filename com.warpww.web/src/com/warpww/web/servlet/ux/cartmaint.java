package com.warpww.web.servlet.ux;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.warpww.pymt.hsc;
import com.warpww.sec.Login;
import com.warpww.util.Util;

/**
 * Servlet implementation class cartmaint
 */
@WebServlet("/cartmaint")
public class cartmaint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartmaint() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberID = 0;
		String authTime = null;
		boolean authenticated = false;
		
		// Authenticate the User via Cookie; populate memberID and authTime fields.
		if(Login.authenticate(request, response)) {
			memberID = Integer.parseInt(request.getAttribute("verifyToken_MemberID").toString());
			authTime = request.getAttribute("verifyToken_CreateTime").toString();
			authenticated = true;
		} else {
			authenticated = false;
			memberID = 0;
			
		}

		System.out.println("Auth Time - " + authTime);
		
		if(authenticated) {

			Util.markCartPending(request, response, memberID);
			
			// determine if a remove button was pressed
			String buttonRemove = request.getParameter("remove");
			if(buttonRemove != null) {
				Util.removeSolutionFromCart(request, response, memberID, Integer.parseInt(buttonRemove));
			}
			
			Util.printParams("Cartmaint.doGet", request);
			
			// And retrieve the full ShoppingCart
			Util.getShoppingCart(request, response);
			if(request.getParameter("completePurchase") != null) {
				request.getRequestDispatcher("checkout").forward(request, response);
			} else { 
				request.getRequestDispatcher("/WEB-INF/cartmaint.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("displayCart", "<b>You must register as a member and be signed in to complete a purchase.</b>");
			request.getRequestDispatcher("/WEB-INF/cartmaint.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
