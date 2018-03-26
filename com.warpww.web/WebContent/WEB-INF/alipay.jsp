<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.warp" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/head.html"%>


		
		<script>			
		function createSourceAlipay() {
			// .then is from the JavaScript Promise API
			try {
				
				alert("Running!");
				var stripe = Stripe('pk_test_xxxxxxxxxxxxxxxxxxxxxxxx');
				
				var sourceData = {type: 'alipay'};
				
				stripe.createSource( {
					  type: 'alipay',
					  amount: 500,
					  currency: 'usd',
					  redirect: {
					    return_url: 'http://localhost:8080/com.warpww.web/alipay',
					  },
				}).then(function(result) {
					showObject(result);
					// handle result.error or result.source
				});
				
		
			
			} catch (err) {
				alert(err.message);
			}

		}

		function createSourceCard() {
			stripe.createSource(card, ownerInfo).then(function(result) {
		    	if (result.error) {
		      	// Inform the user if there was an error
		      	var errorElement = document.getElementById('card-errors');
		      	errorElement.textContent = result.error.message;
		    	} else {
		      // Send the source to your server
		      stripeSourceHandler(result.source);
		    }
		}
			
		function createSourceAch() {
			
		}
		
		function test() {
			alert("Test!");
		}
		
	
		</script>
		
		
	    <title>WARP AliPay</title>
	</head>
	<body>
		<header>
			<h1>
				<br><label><fmt:message key="label.title1" /></label> 
				<br><label><fmt:message key="label.title2" /></label> 
			</h1>

		</header>
		<form>
			

		
		</form>
		<footer>
				<%@ include file="/htx/footer1.html"%>
		</footer>
	</body>
</html>