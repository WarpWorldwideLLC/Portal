<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.warp" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/head.html"%>
		<title><fmt:message key="checkout.page_title" /></title>
	</head>
	<body>
		<header>
			<%@ include file="/htx/menu.html"%>
		</header>
		<form action="checkoutconfirm" method="post">
			<textarea id="statusMessage" style="color: red; width: 100%; border-style: none; text-align: center;">${statusMessage}</textarea>
			<input id="paymentSourceId" name="paymentSourceId" type="text" value=${param["vid"]}>
			<input id="email-address" name=email-address type="text" value=${param["email-address"]}>
			<div style=" margin-top: 1em;">
			<button id="confirmPayment" name="confirmPayment" type="submit" class="btn btn-primary">Confirm Payment</button>
			</div><br>
		</form>
		<footer>
				<%@ include file="/htx/footer1.html"%>
		</footer>
	</body>
</html>