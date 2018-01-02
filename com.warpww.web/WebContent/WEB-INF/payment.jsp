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
					var stripe = Stripe('pk_test_by26sehj2q4BVMDuUjCvfHg6');
					// alert(stripe);
					// var sourceData = "foo";
					/* */
					var sourceData = {type: 'alipay', 
										amount: 500, 
										currency: 'usd', 
										redirect: {return_url: 'http://localhost:8080/com.warpww.web/alipay', },
									};
					
					
					stripe.createSource(sourceData).then(function(result) {alert("Success!"); alert("result: " + JSON.stringify(result));}, function(err) { alert("Failure.");});
					
				} catch (err) {
					alert(err.message);
				}
	
			}
			
			function saveSource() {
				
			}
			
			function saveError() {
				
			}
			
		</script>
	    <title>WARP Worldwide</title>
	</head>
	<body>
		<header>
			<h1>
				<br><label><fmt:message key="label.title1" /></label> 
				<br><label><fmt:message key="label.title2" /></label> 
			</h1>

		</header>
		<div class="wrapper">
			<!-- Sidebar -->
			<%@ include file="/htx/sidebar.html"%>
			
			<!-- Page Content -->
		    <div id="content">
				<button id="customButton" onclick="createSource();">Purchase</button>
				<input type="hidden" id="source" name="source" value="foo">
		    </div>
		</div>

		<footer>
				<%@ include file="/htx/footer.html"%>
		</footer>
	</body>
</html>

<!--  

{"source":

{"id":"src_1BfeqSDm8rfcoBsJlVM3nGhv","object":"source","amount":500,"client_secret":"src_client_secret_C3mP5YgzHY7xWnRINd7IQOyQ","created":1514857536,"currency":"usd","flow":"redirect","livemode":false,"metadata":{},"owner":{"address":null,"email":null,"name":null,"phone":null,"verified_addre
ss":null,"verified_email":null,"verified_name":null,"verified_phone":null},"redi
rect":{"failure_reason":null,"return_url":"http://localhost:8080/com.warpww.web/alipay","status":"pending","url":"https://hooks.stripe.com/redirect/authenticate/src_1BfeqSDm8rfcoBsJlVM3nGhv?client_secret=src_client_secr
et_C3mP5YgzHY7xWnRINd7IQOyQ"},"statement_descriptor":null,"status":"pending","ty
pe":"alipay","usage":"single_use","alipay":{"statement_descriptor":null,"native_url":null,"data_string":null}}}

 -->