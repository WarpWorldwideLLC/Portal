<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.landing" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/head.html"%>
	</head>
	<body>
		<header class="row" class="col-md-3" style="width:90%">
			<%@ include file="/htx/headerbar1.html"%>
		</header>
		<form method="post" action="test" name="test" autocomplete="off">
		
		
		
			<button id="refresh" name="refresh">Refresh</button>
		</form>
		<footer>
			<%@ include file="/htx/footer1.html"%>
		</footer>
	</body>
</html>