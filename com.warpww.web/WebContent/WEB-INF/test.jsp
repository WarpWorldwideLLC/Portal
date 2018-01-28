<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.landing" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/head.html"%>
	</head>
	<body>
		<header class="row" class="col-md-3" style="width:90%">
			<%@ include file="/htx/headerbar1.html"%>
		</header>
		<form method="post" action="test" name="test" autocomplete="off">
		    Tomcat Version : <%= application.getServerInfo() %><br>    
    			Servlet Specification Version : 
			<%= application.getMajorVersion() %>.<%= application.getMinorVersion() %> <br>    
    			JSP version :
			<%=JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %><br>
		
			Java Class Path :
			<%=System.getProperty("java.class.path") %><br>
			Java VM Version :
			<%=System.getProperty("java.vm.version") %><br>
			Java Version :
			<%=System.getProperty("java.version") %><br>
			
		
		
			<button id="refresh" name="refresh">Refresh</button>
		</form>
		<footer>
			<%@ include file="/htx/footer1.html"%>
		</footer>
	</body>
</html>