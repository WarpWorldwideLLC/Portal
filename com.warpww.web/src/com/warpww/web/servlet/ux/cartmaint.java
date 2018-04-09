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
		
		if(authenticated) {
			
			Util.markCartPending(request, response, memberID);
			// request.setAttribute("ReceiptNumber", Util.getJsonValueString(request.getAttribute("CommandResults").toString(),"ReceiptNumber"));
			
				
			// determine if a remove button was pressed
			String buttonRemove = request.getParameter("remove");
			if(buttonRemove != null) {
				Util.removeSolutionFromCart(request, response, memberID, Integer.parseInt(buttonRemove));
			}
			
			// And retrieve the full ShoppingCart - on cartmaint, always pull the full cart. 
			Util.getShoppingCart(request, response, memberID); 

			if(request.getParameter("continueShopping") != null) {
				request.getRequestDispatcher("landing").forward(request, response);
			} else if(request.getParameter("completePurchase") != null) {
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
