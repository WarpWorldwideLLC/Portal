<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.warp" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/head.html"%>
	    <title><fmt:message key="mycourses.page_title" /></title>
	</head>
	<body>
		<header>
			<%@ include file="/htx/menu.html"%>
		</header>
		<form method="post" action="landing" name="landing" autocomplete="off">
		<a href="gwba18?course=SAT2016">SAT2016</a>
		
		</form>
		<footer>
				<%@ include file="/htx/footer1.html"%>
		</footer>
	</body>
</html>