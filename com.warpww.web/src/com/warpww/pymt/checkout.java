package com.warpww.pymt;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stripe.Stripe;
import com.stripe.exception.APIConnectionException;
import com.stripe.exception.APIException;
import com.stripe.exception.AuthenticationException;
import com.stripe.exception.CardException;
import com.stripe.exception.InvalidRequestException;
import com.stripe.model.Charge;
import com.warpww.util.*;


/**
 * Servlet implementation class checkout
 */
@WebServlet("/checkout")
public class checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkout() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("payorName", "John Arp");
		request.setAttribute("emailAddress", "jarp@ansebbian.com");
		request.setAttribute("paymentAmount", "500");
		request.setAttribute("paymentDescription", "A Test transaction");
	
		// Util.printParams("checkout.doGet", request);
	
		request.getRequestDispatcher("/WEB-INF/checkout.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Util.printParams("checkout.doPost", request);
		
		
		// Set your secret key: remember to change this to your live secret key in production
		// See your keys here: https://dashboard.stripe.com/account/apikeys
		Stripe.apiKey = "sk_test_iYDame9B8KD9g5b5SOQr3FlB";
		/* Test & Live Keys
		  Stripe.apiKey = "sk_test_iYDame9B8KD9g5b5SOQr3FlB"
		  Stripe.apiKey = "sk_live_o8BwAQAIAlxQiJlanq8fdABC"
		*/
		
		// Token is created using Checkout or Elements!
		// Get the payment token ID submitted by the form:
		String token = request.getParameter("stripeToken");

		// Charge the user's card:
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("amount", "500");
		params.put("currency", "usd");
		params.put("description", request.getAttribute("paymentDescription"));
		params.put("source", token);
		
		//Meta-data
		Map<String, String> initialMetadata = new HashMap<String, String>();
		initialMetadata.put("product", "WARP Card");
		params.put("metadata", initialMetadata);

		try {
			Charge charge = Charge.create(params);
			System.out.println("Payment Succeeded!");
		} catch (AuthenticationException | InvalidRequestException | APIConnectionException | CardException
				| APIException e) {
			e.printStackTrace();
		}
	}

}
