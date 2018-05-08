<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.warp" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/html.head.201804.html"%>
	    <title><fmt:message key="mysolutions.page_title" /></title>
	</head>
	<body>
		<header>
			<%@ include file="/htx/menu_201804.html"%>
		</header>
		<form action="mysolutions" method="post" id="shopping-cart">	
		My Solutions<br>
		<div class="form-row" id="my">
			<fieldset>
				${mySolutions}
			</fieldset>
		</div>			
	

		</form>
	    <footer>
	    		<%@ include file="/htx/footer1.html" %>
	    </footer>
	</body>
</html>