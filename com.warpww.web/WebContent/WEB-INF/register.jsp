<%@page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="botDetect" uri="https://captcha.com/java/jsp"%>
<%@page import="com.captcha.botdetect.web.servlet.Captcha"%>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.warpww.web.i18n.register" />


<!DOCTYPE html>
<html>
    <head>
    		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WARP Registration</title>
        <script src="jsx/warp_util.js"></script>
    </head>
<body>
		<%@include  file="/htx/LanguageSelector.html" %>

        <form method="post" action="/com.warpww.web/register" enctype="multipart/form-data" name="registration" autocomplete="off">
        <div>
	  		<br><label><fmt:message key="register.label.username" /></label> 
			<input type="text" name="memberName" id="memberName" value=${param["memberName"]}>
	  		<label>Email Address:</label>
	  		<input type="text" name="emailAddress" id="emailAddress" value=${param["emailAddress"]}>
	  		<br/>
	  	  	<label>Passphrase:</label>
	  		<input type="password" name="passPhrase1" id="passPhrase1"}>
	  		<br>
	  		<label>Re-Enter Passphrase:</label>
	  		<input type="password" name="passPhrase2" id="passPhrase2"}>
	  		<br>
	  		<button type="button" onclick="toggleHide2('passPhrase1','passPhrase2')" id="passToggle">Show/Hide Passphrase</button>
	  		<textarea id="errorMessage" name="errorMessage" style='<%=request.getAttribute("ErrorMessageVisible")%>' readonly>value='<%=request.getAttribute("ErrorMessage")%>'</textarea>	
  		
  		</div>
  		<br>
		<div>
              <label for="captchaCode" class="prompt">Retype the characters from the picture:</label>

                 <!-- Adding BotDetect Captcha to the page -->
                 <botDetect:captcha id="exampleCaptcha" 
                             userInputID="captchaCode"
                             codeLength="4"
                             imageWidth="200"
                             codeStyle="ALPHA"
                              />

                 <div class="validationDiv">
                     <input id="captchaCode" type="text" name="captchaCode" />
                     <span class="incorrect">${messages.captchaIncorrect}</span>
                 </div>
			
		</div>
		<br/>
		<button type="submit" value="native" name="btnNative">Join WARP Now!</button>
		
  		  

	</form>
</body>
</html>