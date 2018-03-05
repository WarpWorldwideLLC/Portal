<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.warp" />

<!DOCTYPE html>
<html>
    <head>
    		<%@ include file="/htx/head.html"%>
    		<title><fmt:message key="contact.page_title" /></title>
    </head>
	<body>
	    	<header class="row">
			<%@ include file="/htx/menu.html"%>
		</header>
		<form>
		      <div class="row">
	            <div class="col-md-3" style="width:90%; margin: 0 auto;">
                    <h3><fmt:message key="contact.subject1" /></h3>
                    <p><fmt:message key="contact.text1" /><a href="mailto:warpcustomer@warpww.com"><fmt:message key="contact.mail_link" /></a><fmt:message key="about.text2" /></p>
	            </div>
			</div>
			<div style=" margin-top: 1em;">
  				<a href="mailto:warpcustomer@warpww.com" class="btn btn-primary"><fmt:message key="contact.subject1" /></a><br>
  				Email: warpcustomer@warpww.com<br>
  				Phone: 1-866-341-8535
			</div>
			 <div class="col-md-3" style="width:90%; margin: 0 auto;">
			 	<img src="imgx/warp_contact.jpg" style="max-width: 75%; max-height: 75%; display: block; margin: 0 auto;" />"<br>
			 </div>
		</form>
		<footer>
	    		<%@ include file="/htx/footer1.html"%>
	    	</footer>
	</body>
</html>