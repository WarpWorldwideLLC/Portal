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
 * Servlet implementation class payment
 */
@WebServlet("/payment")
public class payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public payment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Util.foo();
		// Util.printParams("payment.doGet", request);
		System.out.println("Payment GET.");
		request.getRequestDispatcher("/WEB-INF/payment.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Util.printParams("payment.doPost", request);
		System.out.println("Payment POST.");
		
		try {
			
			String sourceJSON = request.getParameter("source");
			
			StripeSource source = new StripeSource(sourceJSON);
			
			Stripe.apiKey = "sk_test_xxxxxxxxxxxxxxxxxxxxxxxx";
			
			// https://stripe.com/docs/sources/alipay
			
			// Create a charge. 
			Map<String, Object> chargeParams = new HashMap<String, Object>();
			chargeParams.put("amount", 500);
			chargeParams.put("currency", "usd");
			chargeParams.put("source", "src_1Bg2sxDm8rfcoBsJ1H7hdb96");
	
			Charge charge = Charge.create(chargeParams);
		
		} catch (AuthenticationException | InvalidRequestException | APIConnectionException | CardException
				| APIException ex) {
			System.out.println(ex.toString());
		}

		/* 
		{"source":

		{"id":"src_1BfeqSDm8rfcoBsJlVM3nGhv","object":"source","amount":500,"client_secret":"src_client_secret_C3mP5YgzHY7xWnRINd7IQOyQ","created":1514857536,"currency":"usd","flow":"redirect","livemode":false,"metadata":{},"owner":{"address":null,"email":null,"name":null,"phone":null,"verified_addre
		ss":null,"verified_email":null,"verified_name":null,"verified_phone":null},"redi
		rect":{"failure_reason":null,"return_url":"http://localhost:8080/com.warpww.web/alipay","status":"pending","url":"https://hooks.stripe.com/redirect/authenticate/src_1BfeqSDm8rfcoBsJlVM3nGhv?client_secret=src_client_secr
		et_C3mP5YgzHY7xWnRINd7IQOyQ"},"statement_descriptor":null,"status":"pending","ty
		pe":"alipay","usage":"single_use","alipay":{"statement_descriptor":null,"native_url":null,"data_string":null}}}
		
		*/
		
		doGet(request, response);
	}

}
