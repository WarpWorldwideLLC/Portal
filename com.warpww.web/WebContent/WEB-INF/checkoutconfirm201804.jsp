<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.warp" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/html.head.201804.html"%>
	    <title><fmt:message key="checkout.page_title" /></title>
	</head>
	<body>
		<header>
			<%@ include file="/htx/menu_201804.html"%>
		</header>
		<form action="checkoutconfirm201804" method="post">
		<div class="form-row" id="productDescription">
			<fieldset>
				${displayCart}
			</fieldset>
		</div>	
		<br><br>
			<input id="paymentSourceId" name="paymentSourceId" type="hidden" value=${param["vid"]}>
			<input id="email-address" name=email-address type="hidden" value=${param["email-address"]}>
			<div style=" margin-top: 1em;">
			<button id="confirmPayment" name="confirmPayment" type="submit" class="btn btn-primary">Confirm Payment</button>
			</div><br>
		</form>
		<footer>
				<%@ include file="/htx/footer_201804.html"%>
		</footer>
	</body>
</html>