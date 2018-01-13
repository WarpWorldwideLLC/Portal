<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.about" />

<!DOCTYPE html>
<html>
    <head>
		<%@ include file="/htx/head.html"%>
        
    </head>
    <body>
    		<form method="post" action="/com.warpww.web/landing" name="landing" autocomplete="off">
	        <a><img src="imgx/consulting.jpg" title=<fmt:message key="about.image1" /> width="600" height="450" /></a>
	        <div class="row">
	            <div class="col-md-3" style="width:90%">	
	                    <h2><fmt:message key="about.subject1" /></h2>
	                    <p><fmt:message key="about.paragraph1" />
	                    <br/><br>
	                    <div class="subnav">
	                        <h3><fmt:message key="about.subject2" /></h3>
	                        <p><fmt:message key="about.paragraph2" /></p>
	                        <br>
	                        
	                        <h3><fmt:message key="about.gracie_name" /></h3>
	                        <h4><fmt:message key="about.gracie_title" /></h4>
	                        <p><fmt:message key="about.gracie_bio" />
	                        </p>
	                        <br>
	                        
	                        <h3><fmt:message key="about.johnny_name" /></h3>
	                        <h4><fmt:message key="about.johnny_title" /></h4>
	                        <p><fmt:message key="about.johnny_bio1" />
	                        <p><fmt:message key="about.johnny_bio2" />
	                        <p>
	                        <br>	                        
	                    </div>	                   
	            </div>
	        </div>
        </form>
         <footer>
         		<%@ include file="/htx/footer1.html"%>
         </footer>
    </body>
</html>

