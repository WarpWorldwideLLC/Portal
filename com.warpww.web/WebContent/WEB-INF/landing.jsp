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
		<%@ include file="/htx/head.html"%>
	</head>
	<body class="landingPage">
		<form method="post" action="/com.warpww.web/landing" name="landing" autocomplete="off">

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
					<label><fmt:message key="landing.memberName" /></label><br/>
					<input type="text" name="memberName" id="memberName" value=${param["memberName"]}>
					<br/>
					<label for="passPhrase"><fmt:message key="landing.passPhrase" /></label><br/>
					<input id="passPhrase" name="passPhrase" type="password"  value="" />
					<br/><br/>
					<button type="submit" id="validateSignOn" value="validateSignon" >Sign In</button><br>
					<a href="register">Not a WARP member? Membership is free, register now!</a><br/>
					<a href="passphrasereminder">Forgot your Passphrase or Member Name?</a><br/>
					
	       		</div>
			</section>
			<br>
			
	
			<div id="openModal" class="modalDialog">
				<div>
					<a href="#close" title="Close" class="close">X</a>
					<h2>Modal Box</h2>
					<p>This is a sample modal box that can be created using the powers of CSS3.</p>
					<p>You could do a lot of things here like have a pop-up ad that shows when your website loads, or create a login/register form for users.</p>
				</div>
			</div>
			
			<footer>
					<%@ include file="/htx/footer1.html"%>
			</footer>
		</form>
	</body>
</html>