<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.checkout" />

<!DOCTYPE html>
<html>
    <head>
		<%@ include file="/htx/head.html"%>
    </head>
	<body>
    		<header class="row">
			<%@ include file="/htx/headerbar1.html"%>
		</header>
		<form action="http://localhost:8080/com.warpww.web/checkout" method="POST">

		  <script
			  src="https://checkout.stripe.com/checkout.js" class="stripe-button"
			  data-key="pk_test_xxxxxxxxxxxxxxxxxxxxxxxx"
			  data-name="WARP Worldwide, LLC"
			  data-image="https://stripe.com/img/documentation/checkout/marketplace.png"
			  data-locale="auto"
	    		  data-allow-remember-me="false"
	    		  data-zip-code="true"
	    		  data-billing-address="true"
	    		  
	    		  data-amount='${paymentAmount}'
	    		  data-email='${emailAddress}'
	    		  data-description='${paymentDescription}'
	    		    
		>
		</script>
		
		<input type="text" id="payorName" name= "payorName" value='<%=request.getAttribute("payorName")%>' />
		<input type="email" id="emailAddress" name = "emailAddress" value='<%=request.getAttribute("emailAddress")%>'>
		<input type="text" id="paymentAmount" name = "paymentAmount" value='<%=request.getAttribute("paymentAmount")%>'>
		<input type="text" id="paymentDescription" name = "paymentDescription" value='<%=request.getAttribute("paymentDescription")%>'>
		
		
		
		
		</form>
         <footer>
         		<%@ include file="/htx/footer1.html"%>
         </footer>
	</body>
</html>