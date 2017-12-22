<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.warpww.web.i18n.passphrasereminder" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Passphrase Reminder</title>
</head>
<body>
<form method="post" action="/com.warpww.web/passphrasereminder">
			<label>Email Address:</label>
	  		<input type="text" name="emailAddress" id="emailAddress"  value=${param["emailAddress"]}>
	  		<br>
	  		<label>Member Name</label> 
			<input type="text" name="memberName" id="memberName" value=${param["memberName"]}>
			<button type="submit" value="native" name="btnNative">Get me back to WARP!</button>
</form>
</body>
</html>