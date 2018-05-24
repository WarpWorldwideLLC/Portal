<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.warp201804" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/html.head.201804.html"%>
	    <title><fmt:message key="warp_stem.page_title" /></title>
	</head>
	<body>
	<header>		
		<%@ include file="/htx/menu_201804.html"%>
	</header>
	<form method="post" action="product" name="warp_stem" autocomplete="off">
			
		<h2><fmt:message key="warp_stem.p1.00" /></h2>
		<div>	
			<img class="warpImage" src="imgx/Warp_Image_Shutterstock_STEM-800-450-Resize.jpg" alt=<fmt:message key="landing.stem_alt" /> />
		</div>
		<div>
			<fmt:message key="warp_stem.p1.10" />		
		</div>
		<div>
			<fmt:message key="warp_stem.p1.99.99" />
		</div>
			
	</form>
    <footer>
    		<%@ include file="/htx/footer_201804.html" %>
    </footer>
	</body>
</html>