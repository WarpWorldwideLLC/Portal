<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.campregistration" />

<!DOCTYPE html>
<html>
    <head>
		<%@ include file="/htx/head.html"%>
		<script>
		
		</script>
    </head>
    <body>
    		<header class="row">
			<%@ include file="/htx/headerbar1.html"%>
		</header>
    		<form method="post" action="campregistration" name="campregistration" autocomplete="off">
		Camp Registration<br><br>
		<table>
			<tr>
				<td>Name:</td>
				<td><input type="text" id="name" name="name"><br>
			</tr>
			<tr>
				Address: <input type="text" id="address" name="address"><br>
			</tr>
			<tr>
				Phone Number: <input type="text" id="phoneNumber" name="phoneNumber"><br>
			</tr>
			<tr>
				EmailAddress: <input type="text" id="eMailAddress" name="eMailAddress"><br>
			</tr>
			<tr>
				Comments: <input type="text" id="comments" name="comments" cols="40" rows="5"><br>
			</tr>
		</table>
		
		<button id="SaveRegisration" >Save My Registration</button>
		<button id="Pay Now" >Pay Now</button>
        </form>
         <footer>
         		<%@ include file="/htx/footer1.html"%>
         </footer>
    </body>
</html>