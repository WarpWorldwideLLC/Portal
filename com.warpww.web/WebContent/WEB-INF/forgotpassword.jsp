<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.warpww.web.i18n.forgotpassword" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Forgot Password</title>
</head>
<body>
				<label for="memberName">Account Name</label><br/>
				<input id="memberName" name="memberName" type="text" value="" /><br/>
				or
				<label for="eMailAddress">Email Address</label><br/>
				<input id="eMailAddress" name="eMailAddress" type="text" value="" /><br/>
				<input type="submit" value="Reset Password" /><br/>
</body>
</html>