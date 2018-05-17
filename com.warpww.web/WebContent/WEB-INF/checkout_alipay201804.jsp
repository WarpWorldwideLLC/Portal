<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.warp" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/html.head.201804.html"%>
	    <title><fmt:message key="checkout_alipay.page_title" /></title>
		<script src="https://js.stripe.com/v3/"></script>
		<style>
		/**
		 * The CSS shown here will not be introduced in the Quickstart guide, but shows
		 * how you can use CSS to style your Element's container.
		 */
		.StripeElement {
		  background-color: white;
		  height: 40px;
		  padding: 10px 12px;
		  border-radius: 4px;
		  border: 1px solid transparent;
		  box-shadow: 0 1px 3px 0 #e6ebf1;
		  -webkit-transition: box-shadow 150ms ease;
		  transition: box-shadow 150ms ease;
		}
		
		.StripeElement--focus {
		  box-shadow: 0 1px 3px 0 #cfd7df;
		}
		
		.StripeElement--invalid {
		  border-color: #fa755a;
		}
		
		.StripeElement--webkit-autofill {
		  background-color: #fefde5 !important;
		}
		</style>
		
		<script>
			
			function stripeSourceHandler(source) {
				  // Insert the token ID into the form so it gets submitted to the server
				  var form = document.getElementById('payment-form');
				  var hiddenInput = document.createElement('input');
				  hiddenInput.setAttribute('type', 'hidden');
				  hiddenInput.setAttribute('name', 'stripeSourceId');
				  hiddenInput.setAttribute('value', source.id);
				  form.appendChild(hiddenInput);
		
				  var  authURL = document.createElement('input');
				  authURL.setAttribute('type', 'hidden');
				  authURL.setAttribute('name', 'authURL');
				  authURL.setAttribute('value', source.redirect.url);
				  form.appendChild(authURL);
				  
				  var  clientSecret = document.createElement('input');
				  clientSecret.setAttribute('type', 'hidden');
				  clientSecret.setAttribute('name', 'clientSecret');
				  clientSecret.setAttribute('value', source.client_secret);
				  form.appendChild(clientSecret);
		
				  alert('authURL: ' + source.redirect.url);
				  // Submit the form
				  form.submit();
				}
			
		</script>
		
	</head>
	<body>
		<header>
			<%@ include file="/htx/menu_201804.html"%>
		</header>
		<form action="checkout_alipay201804" method="post" id="payment-form">
		
		Shopping Cart Checkout
		<div class="form-row" id="productDescription]">
			<fieldset>
				${displayCart}
			</fieldset>
		</div>	
		<br><br>
		<label for="owner-name">
		      Payment Information
		</label>
		<br>
		<div class="form-row" id="ownerInfo">
			<fieldset>
				<input id="owner-name" name="owner-name" placeholder="Cardholder Name" type="text"><br>
				<input id="email-address" name="email-address" placeholder="E-Mail Address" type="text"><br>
				<input id="street-address" name="street-address" placeholder="Street Address" type="text"><br>
				<input id="city" name="city" placeholder="City" type="text"><br>
				<input id="state" name="state" placeholder="State" type="text"><br>
				<input id="zip-code" name="zip-code" placeholder="Postal Code" type="text"><br>
				<input id="receiptNumber" name="receiptNumber" type="hidden" value="${ReceiptNumber}">
			</fieldset>
			   
		</div>
		<br><br>
		
		  <div class="form-row" id="cardInfo">
		
		    <!-- Used to display form errors. -->
		    <div id="card-errors" role="alert"></div>
		  </div>
			<br><br>
		  <button id="SubmitPayment" name="SubmitPayment" value="posted">Submit Payment</button>
		  
		</form>
	    <footer>
	    		<%@ include file="/htx/footer1.html" %>
	    </footer>
	
		<script>
			// Create a Stripe client.
			var stripe = Stripe('${paymentPublicKey}');
				
			// Handle form submission.
			var form = document.getElementById('payment-form');
			
					form.addEventListener('submit', function(event) {
					  event.preventDefault();
					  
					  stripe.createSource({
						  type: 'alipay',
						  amount: 1099,
						  currency: 'usd',
						  redirect: {
						    return_url: 'http://localhost:8080/com.warpww.web/checkoutconfirm201804',
						  },
						}).then(function(result) {
					    if (result.error) {
					      // Inform the user if there was an error
					      var errorElement = document.getElementById('card-errors');
					      errorElement.textContent = result.error.message;
					      //alert("fail");
					    } else {
					      // Send the source to your server
					      // alert("success");
					      stripeSourceHandler(result.source);
					      
					    }
					  });
					});
	
		
	
	</script>

    </body>
    		<footer>
				<%@ include file="/htx/footer_201804.html"%>
		</footer>
</html>