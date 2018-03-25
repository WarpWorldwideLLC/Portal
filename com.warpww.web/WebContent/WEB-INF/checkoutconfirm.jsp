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
		<form>
			<textarea id="statusMessage" style="color: red; width: 100%; border-style: none; text-align: center;">${statusMessage}</textarea>
			<label>SolutionCode</label><br>
			<label>SolutionName</label><br>
			<label>Price</label><br>
			<label>License Period</label><br>
			<textarea rows="" cols=""></textarea><br>
			<div style=" margin-top: 1em;">
				<a href="checkout?product=WARP-STEM-002;" class="btn btn-primary"><fmt:message key="warp_vega.p102.payment" /></a>
			</div><br>
		</form>
		<footer>
				<%@ include file="/htx/footer1.html"%>
		</footer>
	</body>
</html>