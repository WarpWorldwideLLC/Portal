package com.warpww.pymt;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.json.Json;
import javax.servlet.RequestDispatcher;
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

import com.warpww.pymt.hsc;
import com.warpww.sec.Login;
import com.warpww.util.Util;


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
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Authenticate 
		Login.authenticate(request, response);
		
		// Clear Messages
		request.setAttribute("statusMessage", "");
		if(Login.authenticateToken(request)) {
			request.setAttribute("statusMessage", "");

			// Public Keys
			request.setAttribute("paymentPublicKey", hsc.pk_stripe);
			
			// Check to see if there is a Stripe Source ID
			String tokenTest = request.getParameter("stripeSourceId");
			if(tokenTest != null && !tokenTest.isEmpty()) {
				System.out.println("Stripe Source Id Found");
				request.getRequestDispatcher("checkoutconfirm?vid=" + request.getParameter("stripeSourceId")).forward(request, response);
			
				
			} else {
				System.out.println("Stripe Source Id Not Found");
				request.getRequestDispatcher("/WEB-INF/checkout.jsp").forward(request, response);
			}
			
			// Util.printParams("StripeCheckout", request);
			
			// processPayment(request, response);
					
		} else {
			request.setAttribute("statusMessage", "You must register as a member and be signed in to complete a purchase.");
			request.getRequestDispatcher("/WEB-INF/checkout.jsp").forward(request, response);
		}
		
		

		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
	private String genStripeScriptSource(HttpServletRequest request) {
		String returnValue = "";
		
		
		
		return returnValue;
	}
	
	private String validateParameterField(HttpServletRequest request, String parameterName, String inputMessage) {

		String returnValue = inputMessage;
		if(request.getParameter(parameterName) + "" == "") {
			if(returnValue == "") {returnValue += ", ";}
			returnValue += "Traveler Name";
		}
		
		return returnValue;
	}
	

	// Sources Payment Processing via Stripe Sources
	private boolean processPayment(HttpServletRequest request, HttpServletResponse response) {
		boolean returnValue = false;
		
		//***********************************************************************************
		// Set your secret key: remember to change this to your live secret key in production
		// See your keys here: https://dashboard.stripe.com/account/apikeys
		//***********************************************************************************
		Stripe.apiKey = hsc.sk_stripe;
		
		
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

		// Create the charge and process the payment. 
		Charge charge = new Charge();
		try {
			charge = Charge.create(params);
			returnValue = true;
		} catch (AuthenticationException | InvalidRequestException | APIConnectionException | CardException
				| APIException e) {
			e.printStackTrace();
		}
		
		if(returnValue == true) {
			System.out.println("Payment Succeeded!");
			request.setAttribute("paymentMessage", "Your payment was successful! Thank you, and we will be contacting you soon! Please email us at WarpCustomer@warpww.com if you have any questions before then.");
			System.out.println("Charge ID: " + charge.getId());
		} else {
			System.out.println("Payment Failed!");
			request.setAttribute("paymentMessage", "There was a problem processing your payment. Please contact us via the Contact Us link and we will be happy to help resolve any issues.");

			System.out.println("Charge ID: " + charge.getId());
			System.out.println("Failure Code: " + charge.getFailureCode());
			System.out.println("Failure Message: " + charge.getFailureMessage());
		}
		
		return returnValue;
	}

	/* ********************************************************************************************** */
	/* ********************************************************************************************** */
	/* ********************************************************************************************** */
	
	private boolean validateRegistration(HttpServletRequest request, HttpServletResponse response) {
		boolean returnValue = false;
		String validateRegistrationMessage = "";

		
		validateParameterField(request, "travelerName", validateRegistrationMessage);

		validateParameterField(request, "parentName", validateRegistrationMessage);

		validateParameterField(request, "travelerAddress", validateRegistrationMessage);

		validateParameterField(request, "travelerPrimaryPhoneNumber", validateRegistrationMessage);

		validateParameterField(request, "travelerAlternatePhoneNumber", validateRegistrationMessage);

		validateParameterField(request, "travelerEMailAddress", validateRegistrationMessage);

		validateParameterField(request, "travelerGender", validateRegistrationMessage);
				
		validateParameterField(request, "travelerDateOfBirth", validateRegistrationMessage);
				
		validateParameterField(request, "travelerComments", validateRegistrationMessage);
		
		validateParameterField(request, "travelerComments", validateRegistrationMessage);
				
		

		validateParameterField(request, "paymentAmountText", validateRegistrationMessage);
				
		validateParameterField(request, "paymentAmount", validateRegistrationMessage);
				
		validateParameterField(request, "travelerName", validateRegistrationMessage);
				
		validateParameterField(request, "paymentNotes", validateRegistrationMessage);
		
		request.setAttribute("validateRegistrationMessage", validateRegistrationMessage);
	
		return returnValue;
	}
	
	private String genStripeScript (HttpServletRequest request) {
		String returnValue = "";
		
		returnValue = "<script \n"
		  + "src=\"https://checkout.stripe.com/checkout.js\" class=\"stripe-button\"\n"
		  + "data-key='" + request.getAttribute("paymentPublicKey") + "'\n"
		  + "data-name=\"WARP Worldwide, LLC\"\n"
		  + "data-image=\"https://stripe.com/img/documentation/checkout/marketplace.png\"\n"
		  + "data-locale=\"auto\"\n"
    		  + "data-allow-remember-me=\"false\"\n"
    		  + "data-zip-code=\"true\"\n"
    		  + "data-billing-address=\"true\"\n"
    		  + "\n"
    		  + "data-amount='" + request.getAttribute("paymentAmount") + "'\n"
    		  + "data-email='" + request.getAttribute("emailAddress") + "'\n"
    		  + "data-description='" + request.getAttribute("paymentDescription") + "'\n"
    		  + ">\n"
    		  + "</script>\n";
		
		return returnValue;
	}
	
	private boolean saveCampData(HttpServletRequest request, HttpServletResponse response) {
		boolean returnValue = false;
		try {
			
			// Create the command JSON.
			String json = Json.createObjectBuilder()
					 .add("Command", "SaveCampData")
					 .add("AuID", 1)
					 .add("IuID", 1)
					 .add("travelerName", request.getParameter("travelerName"))
					 .add("parentName", request.getParameter("parentName"))
					 .add("travelerAddress", request.getParameter("travelerAddress"))
					 .add("travelerPrimaryPhoneNumber",  request.getParameter("travelerPrimaryPhoneNumber"))
					 .add("travelerAlternatePhoneNumber",  request.getParameter("travelerAlternatePhoneNumber"))
					 .add("travelerEMailAddress",  request.getParameter("travelerEMailAddress"))
					 .add("travelerGender",  request.getParameter("travelerGender"))
					 .add("travelerDateOfBirth",  request.getParameter("travelerDateOfBirth"))
					 .add("travelerComments",  request.getParameter("travelerComments"))
					 .add("paymentType",  request.getParameter("paymentType"))
					 .add("paymentAmountText",  request.getParameter("paymentAmountText"))
					 .add("paymentAmount",  request.getParameter("paymentAmount"))
					 .add("paymentDescription",  request.getParameter("paymentDescription"))
					 .add("paymentNotes",  request.getParameter("paymentNotes"))
					 
					 .build()
					 .toString(); 		
			
			/*
			All request parameters:
	
				Parameter Name - stripeToken, Value - tok_1BkGAZDm8rfcoBsJt8IWbrxr
				Parameter Name - stripeTokenType, Value - card
				Parameter Name - stripeEmail, Value - john.arp@warpww.com
				Parameter Name - stripeBillingName, Value - John Arp
				Parameter Name - stripeBillingAddressCountry, Value - United States
				Parameter Name - stripeBillingAddressCountryCode, Value - US
				Parameter Name - stripeBillingAddressZip, Value - 9999
				Parameter Name - stripeBillingAddressLine1, Value - steeet
				Parameter Name - stripeBillingAddressCity, Value - coty
			*/


			String jsonParms = "";
		
			jsonParms = json;
			request.setAttribute("CommandText", jsonParms);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/dbProcess");
			dispatcher.include(request, response);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
			
		//Util.printParams("Register.processRequest", request);
					

		
		return returnValue;
	}
	
	private boolean saveStripeCampData(HttpServletRequest request, HttpServletResponse response) {
		boolean returnValue = false;
		try {
			
			// Create the command JSON.
			String json = Json.createObjectBuilder()
					 .add("Command", "SaveStripeCampData")
					 .add("AuID", 1)
					 .add("IuID", 1)
					 .add("stripeToken", request.getParameter("stripeToken"))
					 .add("stripeTokenType", request.getParameter("stripeTokenType"))
					 .add("stripeEmail", request.getParameter("stripeEmail"))
					 .add("stripeBillingName",  request.getParameter("stripeBillingName"))
					 .add("stripeBillingAddressCountry",  request.getParameter("stripeBillingAddressCountry"))
					 .add("stripeBillingAddressCountryCode",  request.getParameter("stripeBillingAddressCountryCode"))
					 .add("stripeBillingAddressZip",  request.getParameter("stripeBillingAddressZip"))
					 .add("stripeBillingAddressLine1",  request.getParameter("stripeBillingAddressLine1"))
					 .add("stripeBillingAddressCity",  request.getParameter("stripeBillingAddressCity"))

					 
					 .build()
					 .toString(); 		
			
			/*
			All request parameters:
	
				Parameter Name - stripeToken, Value - tok_1BkGAZDm8rfcoBsJt8IWbrxr
				Parameter Name - stripeTokenType, Value - card
				Parameter Name - stripeEmail, Value - john.arp@warpww.com
				Parameter Name - stripeBillingName, Value - John Arp
				Parameter Name - stripeBillingAddressCountry, Value - United States
				Parameter Name - stripeBillingAddressCountryCode, Value - US
				Parameter Name - stripeBillingAddressZip, Value - 9999
				Parameter Name - stripeBillingAddressLine1, Value - steeet
				Parameter Name - stripeBillingAddressCity, Value - coty
			*/


			String jsonParms = "";
		
			jsonParms = json;
			request.setAttribute("CommandText", jsonParms);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/dbProcess");
			dispatcher.include(request, response);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
			
		//Util.printParams("Register.processRequest", request);
		
		return returnValue;
	}
	
	
	/* Stripe Token Generatoon Script 
	/* 
	 <script>
		function foo1 {
			// Create Stripe Token for use
			
			  stripe.createToken(card).then(function(result) {
				    if (result.error) {
				      // Inform the user if there was an error.
				      var errorElement = document.getElementById('card-errors');
				      errorElement.textContent = result.error.message;
				    } else {
				      // Send the token to your server.
				      stripeTokenHandler(result.token);
				    }
				  });
				});
		}
	</script>
	 */

}
