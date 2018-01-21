<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.warpww.web.filecounter.i18n.Contact" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8; width=device-width, initial-scale=1.0" name="viewport">
        <script src="jsx/header.js"></script>

    <title>Sign In and Start Reaching for the Stars with WARP!</title>
    <link href="cssx/bootstrap.css" rel="stylesheet"/>
    <link href="cssx/site.css" rel="stylesheet"/>


    <script src="http://warp.eastasia.cloudapp.azure.com/warp/Scripts/modernizr-2.6.2.js"></script>
        
        <title>WARP Sign In</title>
    </head>
	<body>
		<label><fmt:message key="register.label.username" /></label> 
		<br><input class="form-control text-box single-line" id="username" name="LastName" type="text" value="Last Name" />
	</body>
</html>