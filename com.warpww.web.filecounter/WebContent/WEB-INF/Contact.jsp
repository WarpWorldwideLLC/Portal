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
        <script src="jsx/header.js"></script>
        <title><fmt:message key="title" />:</title>
    </head>
    <body>
    		<form>
        		<script src="jsx/menu.js"></script>
        		<br><br><br/>
        		<script src="jsx/carousel.js"></script>

        <div class="row">

            <div class="col-md-3" style="width:90%">

                    <h1><label><fmt:message key="header1" /></label></h1>
                    <p>Do you want to expand your business globally? Are you faced with the challenge of technology changes? <a href="mailto:warpcustomer@warpww.com">  Contact WARP Worldwide. </a></p>
                    <br/>
                    <p>We are here to help your business grow! </p>
        
            </div>
        </div>
        
        <div>
            <hr />
            <footer>
                <p><fmt:message key="copyright" /></p>
            </footer>
        </div>
        
        <script src="jsx/carousel_run.js"></script>
        
        </form>
    </body>
</html>