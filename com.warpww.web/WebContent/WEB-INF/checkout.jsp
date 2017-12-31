<%@page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.warpww.web.i18n.landing" />

<!DOCTYPE html>
<html>
	<head>
	    		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<meta http-equiv="cache-control" content="max-age=0" />
			<meta http-equiv="cache-control" content="no-cache" />
			<meta http-equiv="expires" content="-1" />
			<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
			<meta http-equiv="pragma" content="no-cache" />
			

    			<link href="cssx/warpSite2.css" rel="stylesheet"/>
	        <title>WARP Worldwide</title>
	       

	    </head>
	<body>
		<header>
			<h1>
				<br><label><fmt:message key="label.title1" /></label> 
				<br><label><fmt:message key="label.title2" /></label> 
			</h1>

		</header>
		<form action="/checkout" method="POST">
		  <script
		    src="https://checkout.stripe.com/checkout.js" class="stripe-button"
		    data-key="pk_test_by26sehj2q4BVMDuUjCvfHg6"
		    data-amount="999"
		    data-name="WARP Worldwide, LLC"
		    data-description="Widget"
		    data-image="https://stripe.com/img/documentation/checkout/marketplace.png"
		    data-locale="auto">
		  </script>
		</form>
		<footer>
				<%@ include file="/htx/footer.html"%>
		</footer>
	</body>
</html>