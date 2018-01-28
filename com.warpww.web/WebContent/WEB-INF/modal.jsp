<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.about" />

<!DOCTYPE html>
<html>
    <head>
		<%@ include file="/htx/head.html"%>
    </head>
    <body>
    		<header class="row" class="col-md-3" style="width:90%">
			<%@ include file="/htx/headerbar1.html"%>
	
	
			 
		</header>
    		<form method="post" action="about" name="about" autocomplete="off">
    		       
		  <a href="#openModal">Open Modal</a>
		
		<div id="openModal" class="modalDialog">
			<div>
				<a href="#close" title="Close" class="close">X</a>
				<h2>Modal Box</h2>
				<p>This is a sample modal box that can be created using the powers of CSS3.</p>
				<p>You could do a lot of things here like have a pop-up ad that shows when your website loads, or create a login/register form for users.</p>
			</div>
		</div>  		       
    		        
     	</form>
         <footer>
         		<%@ include file="/htx/footer1.html"%>
         </footer>
    </body>
</html>

