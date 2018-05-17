package com.warpww.web.servlet.ux;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.warpww.pymt.hsc;
import com.warpww.sec.AuthMod;
import com.warpww.sec.Login;
import com.warpww.util.Util;

/**
 * Servlet implementation class cartmaint
 */
@WebServlet("/cartmaint201804")
public class cartmaint201804 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartmaint201804() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AuthMod a = new AuthMod(request, response);
		a.authenticate();
		
		if(a.getAuthenticated()) {
			
			Util.markCartPending(request, response, a.getMemberID());
			// request.setAttribute("ReceiptNumber", Util.getJsonValueString(request.getAttribute("CommandResults").toString(),"ReceiptNumber"));
			
				
			// determine if a remove button was pressed
			String buttonRemove = request.getParameter("remove");
			if(buttonRemove != null) {
				Util.removeSolutionFromCart(request, response, a.getMemberID(), Integer.parseInt(buttonRemove));
			}
			
			// And retrieve the full ShoppingCart - on cartmaint, always pull the full cart. 
			Util.getShoppingCart(request, response, a.getMemberID()); 

			// Go back to shopping
			if(request.getParameter("continueShopping") != null) { 
				request.getRequestDispatcher("landing").forward(request, response);
			
			// Proceed to payment
			} else if(request.getParameter("completePurchase") != null) {
				
				// Determine  Payment Method
				
				switch(request.getParameter("payment").toString()){
					case "payment-ach":
						
						break;
					
					case "payment-card":
						request.getRequestDispatcher("checkout201804").forward(request, response); 
						break;
					
					case "payment-alipay":
						request.getRequestDispatcher("checkout_alipay201804").forward(request, response); 
						break;
					
					default:
						break;
			
					
				}
				
			// Not sure what happened, go back to this page. 
			} else { 
				request.getRequestDispatcher("/WEB-INF/cartmaint201804.jsp").forward(request, response);
			}
			
		} else {
			request.setAttribute("displayCart", "<b>You must register as a member and be signed in to complete a purchase.</b>");
			request.getRequestDispatcher("/WEB-INF/cartmaint201804.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
