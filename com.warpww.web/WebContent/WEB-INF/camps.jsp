<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.camps" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/head.html"%>
	</head>
	<body>
    		<header class="row">
			<%@ include file="/htx/headerbar1.html"%>
		</header>
		<form method="post" action="/com.warpww.web/campregistration" name="camps" autocomplete="off">>
			<button id="btnCampRegistration" name="btnCampRegistration" >Register for the Trip!</button>
		</form>
		<footer>
				<%@ include file="/htx/footer1.html"%>
		</footer>
	</body>
</html>