<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.warp201804" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/html.head.201804.html"%>
		<title><fmt:message key="registrationconfirmation.page_title" /></title>
	</head>
	<body>
		<header>
			<%@ include file="/htx/menu_201804.html"%>
		</header>
		<form method="post" action="registrationconfirmation201804" enctype="multipart/form-data" name="registrationconfirmation" autocomplete="off">
		        <div>
		        		<table>
		        			<tr>
					  		<td><label><fmt:message key="register.confirm.membername" />: </label></td>
							<td><input type="text" name="memberName" id="memberName" value='<%=request.getAttribute("MemberName")%>'></td>
					  	</tr>
					  	<tr>	
					  		<td><label><fmt:message key="register.confirm.emailaddress" />: </label></td>
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
				<%@ include file="/htx/footer_201804.html"%>
		</footer>
	</body>
</html>