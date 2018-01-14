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
		
			<div class="wrapper">
				<!-- Sidebar -->
				<%@ include file="/htx/sidebar.html"%>
			
				<!-- Page Content -->
			    <div id="content">
					<button id="customButton" onclick="createSource();">Purchase</button>
					
					
					<script>
					
	
						
						

					    
					</script>			    
				</div>
			</div>
		</form>
		<footer>
				<%@ include file="/htx/footer1.html"%>
		</footer>
	</body>
</html>