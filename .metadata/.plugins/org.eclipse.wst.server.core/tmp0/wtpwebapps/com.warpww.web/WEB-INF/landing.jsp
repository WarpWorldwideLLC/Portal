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
	        <title>Welcome to WARP!</title>
	       

	    </head>
	<body>
		<header>
			<h1>
				<br><label><fmt:message key="landing.label.title1" /></label> 
				<br><label><fmt:message key="landing.label.title2" /></label> 
			</h1>

		</header>

		<section id="content">
			<div id="sideContent">	
				<br><label><fmt:message key="landing.label.messageA1" /></label> 
				<br><label><fmt:message key="landing.label.messageA2" /></label> 
			</div>		

			<div id=login>
				<label for="memberName">Account Name</label><br/>
				<input id="memberName" name="memberName" type="text" value="" /><br/>
				<label for="passPhrase">Passphrase</label><br/>
				<input id="passPhrase" name="passPhrase" type="text" value="" /><br/><br/>
				<input type="submit" value="Log In" /><br/>
				<a href="register">Not a WARP member? Membership is free, register now!</a><br/>
				<a href="passphrasereminder">Forgot your Passphrase or Member Name?</a><br/>
				
       		</div>
		</section>
		<br>
		<footer>
				<%@ include file="/htx/footer.html"%>
		</footer>
	</body>
</html>