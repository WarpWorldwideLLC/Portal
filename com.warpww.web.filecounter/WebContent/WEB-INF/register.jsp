<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.warpww.web.filecounter.i18n.register" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="register" method="post">
 
        Name:<input type="text" name="userName"/><br/>
        Password:<input type="password" name="password"/><br/>
        Email Id:<input type="text" name="email" /><br/>
        Language: <select name="language">
            <option>Hindi</option>
            <option>English</option>
            <option>French</option>
        </select> <br/>
        <input type="submit" value="Submit"/>
 
    </form>
</body>
</html>


