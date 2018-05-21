<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.warp" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/head.html"%>
	    <title><fmt:message key="cartmaint.page_title" /></title>
	</head>
	<body>
		<header>
			<%@ include file="/htx/menu.html"%>
		</header>
		<form action="cartmaint" method="post" id="shopping-cart">
			Shopping Cart Maintenance
			<div class="form-row" id="productDescription">
				<fieldset>
					${displayCart}
				</fieldset>
			</div>	
			<button name="completePurchase" class="btn btn-primary" value="completePurchase">Complete Purchase</button>
			<button name="continueShopping" class="btn btn-primary" value="continueShopping">Continue Shopping</button>
		</form>
	    <footer>
	    		<%@ include file="/htx/footer1.html" %>
	    </footer>
	</body>
</html>