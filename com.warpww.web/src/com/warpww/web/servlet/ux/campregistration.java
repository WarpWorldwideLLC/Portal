package com.warpww.web.servlet.ux;

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
import com.warpww.util.Util;

/**
 * Servlet implementation class campregistration
 */
@WebServlet("/campregistration")
public class campregistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public campregistration() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Parameter Value: " + request.getParameter("paymentmethod"));
		
		switch(request.getParameter("paymentmethod") + "") {
			case "deposit":
				request.setAttribute("paymentType", "Deposit");
				request.setAttribute("paymentAmountText", "$ 500.00");
				request.setAttribute("paymentAmount", "50000");
				request.setAttribute("paymentNotes", "Deposits are not refundable. Full Payment must be made before March 1st, 2018 or you will be removed from the trip and your deposit will not be returned.");
				request.setAttribute("paymentDescription", "XAIU Chinese Culture Summer Trip Deposit" );
				break;
			case "full":
				request.setAttribute("paymentType", "Full");
				request.setAttribute("paymentAmountText", "$ 5,990.00");
				request.setAttribute("paymentAmount", "599000");
				request.setAttribute("paymentNotes", "Thank you for your payment!");
				request.setAttribute("paymentDescription", "XAIU Chinese Culture Summer Trip Full Payment" );
				break;
			default:
				break;
		}
		
		request.getRequestDispatcher("/WEB-INF/campregistration.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Util.printParams("checkout.doPost", request);
		
		
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
		params.put("amount", request.getParameter("paymentAmount"));
		params.put("currency", "usd");
		params.put("description", request.getParameter("paymentDescription"));
		params.put("source", token);
		
		//Meta-data
		Map<String, String> initialMetadata = new HashMap<String, String>();
		String metadata = request.getParameter("travelerEMailAddress") + "; " + request.getParameter("travelerPrimaryPhoneNumber") + "; " + request.getParameter("travelerAlternatePhoneNumber");
		System.out.println(metadata);
		initialMetadata.put("metadata", metadata);
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
