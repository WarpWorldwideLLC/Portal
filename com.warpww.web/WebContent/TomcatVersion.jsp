<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.warpww.web.filecounter.i18n.Contact" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    Tomcat Version : <%= application.getServerInfo() %><br>    
    Servlet Specification Version : 
<%= application.getMajorVersion() %>.<%= application.getMinorVersion() %> <br>    
    JSP version :
<%=JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %><br>
</body>
</html>