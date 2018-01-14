<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.landing" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/head.html"%>
		<script>			
			function createSource() {
				// .then is from the JavaScript Promise API
				try {
					
					// alert("Running!");
					var stripe = Stripe('pk_test_xxxxxxxxxxxxxxxxxxxxxxxx');
	
					var sourceData = {type: 'alipay', 
										amount: 500, 
										currency: 'usd', 
										redirect: {return_url: 'http://localhost:8080/com.warpww.web/alipay', },
									};
					
					
					stripe.createSource(sourceData).then(function(result) {saveSource(result);}, function(err) {saveError(err);});
					
				} catch (err) {
					alert(err.message);
				}
	
			}
			
			function saveSource(result) {
				
				try {
					alert("Success!"); 
					//alert("result: " + JSON.stringify(result));
					
					oForm = document.getElementById("payment");
					oForm.elements["source"].value = JSON.stringify(result);
					
					//alert(oForm.elements["source"].value);
					submitForm("payment");
				} catch (err) {
					alert(err.message);
				}
			}
			
			function saveError(err) {
				alert("Failure.");
			}
			
			function submitForm(formID) {
				try {
			    		document.getElementById("payment").submit();
				} catch (err) {
					alert(err.message);
				}
			}
			
		</script>
	</head>
	<body>
    		<header class="row">
			<%@ include file="/htx/headerbar1.html"%>
		</header>
		<form id="payment" name="payment" method="post">
			<input type="hidden" id="source" name="source" value="foo">
			<div class="form-row">
				<fieldset>
			       <legend>Selecting Payment Type</legend>
			       <p>
			          <label>Payment Type: </label>            
			          <input type = "radio"
			                 name = "paymentType"
			                 id = "typeCreditCard"
			                 value = "CreditCard"
			               	 />
			          <label for = "typeCreditCard">Credit Card</label>
			          
			          <input type = "radio"
			                 name = "paymentType"
			                 id = "typeAliPay"
			                 value = "AliPay" 
			                 />
			          <label for = "typeAliPay">AliPay</label>
			        </p>       
			      </fieldset>     
			
			    <label for="card-element">
			      Credit or debit card
			    </label>
			    <div id="card-element">
			      <!-- a Stripe Element will be inserted here. -->
			    </div>
		
			    <!-- Used to display Element errors -->
			    <div id="card-errors" role="alert"></div>
	  			</div>
			<br>
			<button id="customButton" onclick="createSource();">Purchase</button>
		</form>
	<footer>
		<%@ include file="/htx/footer1.html"%>
	</footer>
	</body>
</html>
