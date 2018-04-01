
<!DOCTYPE html>
<html>
 
	<head>
		<title>STRIPE Checkout</title>
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
			function stripeTokenHandler(token) {
			  // Insert the token ID into the form so it gets submitted to the server
			  var form = document.getElementById('payment-form');
			  var hiddenInput = document.createElement('input');
			  hiddenInput.setAttribute('type', 'hidden');
			  hiddenInput.setAttribute('name', 'stripeToken');
			  hiddenInput.setAttribute('value', token.id);
			  form.appendChild(hiddenInput);
	
			  // Submit the form
			  form.submit();
			}
			
			function stripeSourceHandler(source) {
				  // Insert the token ID into the form so it gets submitted to the server
				  var form = document.getElementById('payment-form');
				  var hiddenInput = document.createElement('input');
				  hiddenInput.setAttribute('type', 'hidden');
				  hiddenInput.setAttribute('name', 'stripeSourceId');
				  hiddenInput.setAttribute('value', source.id);
				  form.appendChild(hiddenInput);
		
				  // Submit the form
				  form.submit();
				}
			
		</script>
		
	</head>
	
	<form action="checkout" method="post" id="payment-form">
	
	/* 
		1. When the user selects Purchase/Pay, add the item to the shopping cart.
		2. Redirect the user to Checkout.
		3. Checkout retrieves the info from the shopping cart, displays it, and asks the user to enter payment information. 
		4. Redirect to CheckoutConfirm
		5. CheckoutConfirm retrieves shopping cart, displays it, asks for confirmation. 
		6. Confirmation and thank you is presented. 
		
		
		For the solution description, take the solution code passed in, validate it, and pull the information from the database for confirmation. 
		First Query pulls the solution by ID from the database. 
		Secont action builds the display table HTML = showing Solution Code, Solution Price, Solution Description
		Third action pulls the Product info for the Solution and displays it. 
		Checkout Confirmation pulls the pricing from the database again, so it cant' be tampered with by manipulating the HTML. 
	*/
	<div class="form-row" id="productDescription]">
	<fieldset>
		<label>${param["product"]}</label><br>
		<label>${param["price"]}</label>
	</fieldset>
	</div>	
	<div class="form-row" id="ownerInfo">
		<fieldset>
			<input id="owner-name" name="owner-name" placeholder="Cardholder Name" type="text"><br>
			<input id="email-address" name="email-address" placeholder="E-Mail Address" type="text"><br>
			<input id="street-address" name="street-address" placeholder="Street Address" type="text"><br>
			<input id="city" name="city" placeholder="City" type="text"><br>
			<input id="state" name="state" placeholder="State" type="text"><br>
			<input id="zip-code" name="zip-code" placeholder="Postal Code" type="text"><br>
			
		</fieldset>
		   
	</div>
	
	
	  <div class="form-row" id="cardInfo">
	    <label for="card-element">
	      Credit or debit card
	    </label>
	    <div id="card-element">
	      <!-- A Stripe Element will be inserted here. -->
	    </div>
	
	    <!-- Used to display form errors. -->
	    <div id="card-errors" role="alert"></div>
	  </div>
	
	  <button>Submit Payment</button>
	  
	</form>

	<script>
		// Create a Stripe client.
		var stripe = Stripe('${paymentPublicKey}');
	
		// Create an instance of Elements.
		var elements = stripe.elements();
	
		// Custom styling can be passed to options when creating an Element.
		// (Note that this demo uses a wider set of styles than the guide below.)
		var myStyle = {
		  base: {
		    color: '#32325d',
		    lineHeight: '18px',
		    fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
		    fontSmoothing: 'antialiased',
		    fontSize: '16px',
		    '::placeholder': {
		      color: '#aab7c4'
		    }
		  },
		  invalid: {
		    color: '#fa755a',
		    iconColor: '#fa755a'
		  }
		};
	
		// Create an instance of the card Element.
		var card = elements.create('card', {
			hidePostalCode: true, 
			style: myStyle
		});
		
		
		// Add an instance of the card Element into the `card-element` <div>.
		card.mount('#card-element');
	
		// Handle real-time validation errors from the card Element.
		card.addEventListener('change', function(event) {
		  var displayError = document.getElementById('card-errors');
		  if (event.error) {
		    displayError.textContent = event.error.message;
		  } else {
		    displayError.textContent = '';
		  }
		});
	
		
		
		// Handle form submission.
		var form = document.getElementById('payment-form');
		
				form.addEventListener('submit', function(event) {
				  event.preventDefault();
	
				  var ownerInfo = {
						  owner: {
						    name: document.getElementById("owner-name").value,
						    address: {
						      line1: document.getElementById("street-address").value,
						      city: document.getElementById("city").value,
						      postal_code: document.getElementById("zip-code").value,
						      country: document.getElementById("state").value,
						    },
						    email: document.getElementById("email-address").value
						  },
					};
				  
				  //var ownerName =  document.getElementById("owner-name").value;
				  //alert(ownerName);
				  
				  stripe.createSource(card, ownerInfo).then(function(result) {
				    if (result.error) {
				      // Inform the user if there was an error
				      var errorElement = document.getElementById('card-errors');
				      errorElement.textContent = result.error.message;
				      alert("fail");
				    } else {
				      // Send the source to your server
				      alert("success");
				      stripeSourceHandler(result.source);
				      
				    }
				  });
				});

	

</script>


</html>