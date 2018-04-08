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
		<form action="cartmaint" method="post" id="shopping-cart">		
			
			This Is Your Receipt - Please Print For Your Records
			<div class="form-row" id="productDescription]">
				<fieldset>
					${displayCart}
				</fieldset>
			</div>	

		</form>
	    <footer>
	    		<%@ include file="/htx/footer1.html" %>
	    </footer>
	</body>
</html>