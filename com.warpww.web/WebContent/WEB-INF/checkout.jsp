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
		</form>
		<footer>
				<%@ include file="/htx/footer1.html"%>
		</footer>
	</body>
</html>