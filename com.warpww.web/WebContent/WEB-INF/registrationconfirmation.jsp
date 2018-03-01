<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.registrationconfirmation" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/head.html"%>
	</head>
	<body>
		<header>
			<%@ include file="/htx/headerbar1.html"%>
		</header>
		<form method="post" action="registrationconfirmation" enctype="multipart/form-data" name="registrationconfirmation" autocomplete="off">
		        <div>
		        		<table>
		        			<tr>
					  		<td><label><fmt:message key="label.membername" />: </label></td>
							<td><input type="text" name="memberName" id="memberName" value='<%=request.getAttribute("MemberName")%>'></td>
					  	</tr>
					  	<tr>	
					  		<td><label><fmt:message key="label.emailaddress" />: </label></td>
					  		<td><input type="text" name="emailAddress" id="emailAddress" value='<%=request.getAttribute("EmailAddress")%>'></td>
			  			</tr>
			  		</table>
			  		<br>
			  	  	<br>
		  			Your registration was successful. Welcome to WARP! <br>
		  			We will contact you as programs you sign up for become available, or you can contact us any time using the Contact Us page. 
		  		</div>

			</form>

		<br>
		<footer>
				<%@ include file="/htx/footer1.html"%>
		</footer>
	</body>
</html>