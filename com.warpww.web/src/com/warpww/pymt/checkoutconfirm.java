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
import com.stripe.model.Customer;
import com.warpww.util.Util;

/**
 * Servlet implementation class checkoutconfirm
 */
@WebServlet("/checkoutconfirm")
public class checkoutconfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkoutconfirm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Util.printParams("CheckoutConfirm", request);
		request.setAttribute("stripeSourceId", request.getAttribute("stripeSourceId"));
		request.getRequestDispatcher("/WEB-INF/checkoutconfirm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Util.printParams("CheckoutConfirm", request);
		
		if(request.getParameter("confirmPayment") != null) {
			String customerId = addToCustomer(request.getParameter("paymentSourceId"), request.getParameter("email-address"));
			processPayment(request.getParameter("paymentSourceId"), customerId, 1000);
			System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
			System.out.println("Payment Source ID: " + request.getParameter("paymentSourceId"));
			System.out.println("Email Address: " + request.getParameter("email-address"));
			System.out.println("Customer ID: " + customerId);
		}
		
		
		doGet(request, response);
		
		
		
	}
	
	protected String addToCustomer(String sourceId, String emailAddress) {
		String returnValue = null;
		
		Stripe.apiKey = hsc.sk_stripe;

		Map<String, Object> customerParams = new HashMap<String, Object>();
		customerParams.put("email", emailAddress);
		customerParams.put("source", sourceId);

		try {
			Customer customer = Customer.create(customerParams);
			returnValue = customer.getId();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		
		
		return returnValue;
	}
	
	protected String processPayment(String sourceId, String customerId, int paymentAmount) { 
		String returnValue = null;
		
		// Set your secret key: remember to change this to your live secret key in production
		// See your keys here: https://dashboard.stripe.com/account/apikeys
		Stripe.apiKey = hsc.sk_stripe;

		Map<String, Object> chargeParams = new HashMap<String, Object>();
		chargeParams.put("amount", paymentAmount);
		chargeParams.put("currency", "usd");
		chargeParams.put("customer", customerId);
		chargeParams.put("source", sourceId);

		try {
			Charge charge = Charge.create(chargeParams);
		} catch (AuthenticationException | InvalidRequestException | APIConnectionException | CardException
				| APIException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return returnValue;
	}

}
