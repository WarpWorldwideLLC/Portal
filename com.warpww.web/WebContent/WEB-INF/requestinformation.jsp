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
	
					Your Name:<br>
					<input type="text" id="travelerName" name="name" size="40" required><br>
	
					EmailAddress:<br> 
					<input type="text" id="travelerEMailAddress" name="eMailAddress" size="40" required><br>
	
					Comments:<br> 
					<textarea name="travelerComments" cols="43" rows="10"  aria-required="true" aria-invalid="false"></textarea><br>
			<button id="Submit" >Submit</button>

        </form>
         <footer>
         		<%@ include file="/htx/footer1.html"%>
         </footer>
    </body>
</html>