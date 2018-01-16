<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.contact" />

<!DOCTYPE html>
<html>
    <head>
    		<%@ include file="/htx/head.html"%>
    </head>
	<body>
	    	<header class="row">
			<%@ include file="/htx/headerbar1.html"%>
		</header>
		<form>
		      <div class="row">
	            <div class="col-md-3" style="width:90%">
	                <ul>
	                    <h3><fmt:message key="contact.subject1" /></h3>
	                    <p><fmt:message key="contact.text1" /><a href="mailto:warpcustomer@warpww.com"><fmt:message key="contact.mail_link" /></a><fmt:message key="about.text2" /></p>
	                </ul>
	            </div>
			<div style=" margin-top: 1em;">
  				<!--  <p class="lead">Download the full brochure by clicking below.</p>  -->
  				<a href="mailto:warpcustomer@warpww.com" class="btn btn-primary">Contact WARP</a>
			</div>
			</div>
		</form>
		<footer>
	    		<%@ include file="/htx/footer1.html"%>
	    	</footer>
	</body>
</html>