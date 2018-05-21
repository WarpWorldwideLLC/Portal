<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.warp201804" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/html.head.201804.html"%>
	    <title><fmt:message key="checkoutreceipt.page_title" /></title>
	</head>
	<body>
		<header>
			<%@ include file="/htx/menu_201804.html"%>
		</header>
		<form action="checkoutreceipt201804" method="post" id="shopping-cart">		
			
			<fmt:message key="checkoutconfirm.page_label" />
			<div class="form-row" id="productDescription]">
				<fieldset>
					${displayCart}
				</fieldset>
			</div>	

		</form>
	    <footer>
	    		<%@ include file="/htx/footer_201804.html"%>
	    </footer>
	</body>
</html>