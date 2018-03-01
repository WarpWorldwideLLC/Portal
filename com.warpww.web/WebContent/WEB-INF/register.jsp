<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.register" />

<!DOCTYPE html>
<html>
    <head>
		<%@ include file="/htx/head.html"%>
    </head>
<body>
    		<header class="row" class="col-md-3" style="width:90%">
			<%@ include file="/htx/headerbar1.html"%>
		</header>
        <form method="post" action="register" enctype="multipart/form-data" name="registration" autocomplete="off">
        <div>
	        <table>
	        		<tr>
			  		<td><br><label><fmt:message key="register.label.username" /></label></td>
			  		<td><input type="text" name="memberName" id="memberName" class="registerInput" value=${param["memberName"]}></td>
		  		</tr>
	        		<tr>
	        			<td><label>Country:</label></td>
				  	<td>	
				  		<select name="countrySelector" id="countrySelector">
				  			<option value="0">- Choose One -</option>
						  	<option value="236">United States</option>
						  	<option value="46">China</option>
						  	<option value="41">Canada</option>
						</select>
				  	</td>
				  <tr>
				  	<td><label>Email Address:</label></td>
				  	<td><input type="text" name="emailAddress" id="emailAddress" class="registerInput" value=${param["emailAddress"]}></td>
				  </tr>
				  <tr>	
				  	<td>	<label>First Name:</label></td>
				  	<td><input type="text" name="firstName" id="firstName" class="registerInput" value=${param["firstName"]}></td>
				  </tr>
				  
				  <tr>
				  	<td>	<label>Last Name:</label></td>
				  	<td>	<input type="text" name="lastName" id="lastName" class="registerInput" value=${param["lastName"]}></td>
				  </tr>
				  <tr>	
				  	<td>	<label>Phone Number:</label></td>
				  	<td><input type="text" name="phoneNumber" id="phoneNumber" class="registerInput" value=${param["phoneNumber"]}></td>
				  </tr>
				  <tr>	
				  	<td>	<label>Passphrase:</label></td>
				  	<td><input type="password" name="passPhrase1" id="passPhrase1" class="registerInput"></td>
				  </tr>		
				  <tr>
				  	<td><label>Re-Enter Passphrase:</label></td>
				  	<td><input type="password" name="passPhrase2" id="passPhrase2" class="registerInput"></td>
				  </tr>		
				  <tr>
				  	<td><button type="button" onclick="toggleHide2('passPhrase1','passPhrase2')" id="passToggle" class="btn btn-primary">Show/Hide Passphrase</button></td>
				  	<td><textarea id="errorMessage" name="errorMessage" class="statusMessageBox" style='<%=request.getAttribute("ErrorMessageVisible")%>' readonly><%=request.getAttribute("ErrorMessage")%></textarea></td>
	  			</tr>
	  		</table>
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
		<button type="submit" value="native" name="btnNative" class="btn btn-primary">Join WARP Now!</button>
		
  		  

	</form>
	<footer>
		<%@ include file="/htx/footer1.html"%>
	</footer>
</body>
</html>