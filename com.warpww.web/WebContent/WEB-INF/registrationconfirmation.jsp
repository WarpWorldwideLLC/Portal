<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.warpww.web.i18n.registrationconfirmation" />

<!DOCTYPE html>
<html>
	<head>
	    		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<meta http-equiv="cache-control" content="max-age=0" />
			<meta http-equiv="cache-control" content="no-cache" />
			<meta http-equiv="expires" content="-1" />
			<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
			<meta http-equiv="pragma" content="no-cache" />
			

    			<link href="cssx/warpSite3.css" rel="stylesheet"/>
	        <title>Confirm Registration</title>
	       

	    </head>
	<body>
		<header>
			<h1>

			</h1>

		</header>
		<form method="post" action="/com.warpww.web/registrationconfirmation" enctype="multipart/form-data" name="registrationconfirmation" autocomplete="off">
		        <div>
			  		<br><label><fmt:message key="label.membername" /></label> 
					<input type="text" name="memberName" id="memberName" value='<%=request.getAttribute("MemberName")%>'>
			  		<label><fmt:message key="label.emailaddress" /></label>
			  		<input type="text" name="emailAddress" id="emailAddress" value='<%=request.getAttribute("EmailAddress")%>'>
			  		<br/>
			  	  	
		  			Welcome to WARP! You can access your services now using the menu on the left. 
		  		
		  		</div>

			</form>

		<br>
		<footer>
				<%@ include file="/htx/footer1.html"%>
		</footer>
	</body>
</html>