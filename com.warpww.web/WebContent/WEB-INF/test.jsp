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
		    <b>Tomcat Version</b> : <%= application.getServerInfo() %><br>    
    			<b>Servlet Specification Version :</b> 
			<%= application.getMajorVersion() %>.<%= application.getMinorVersion() %> <br>    
    			<b>JSP version :</b>
			<%=JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %><br>
		
			<b>Java Class Path :</b>b
			<%=System.getProperty("java.class.path") %><br>
			<b>Java VM Version :</b>
			<%=System.getProperty("java.vm.version") %><br>
			<b>Java Version :</b>
			<%=System.getProperty("java.version") %><br>
			
			<b>User-Agent:</b> 
			<%=request.getHeader("User-Agent") %><br>
			<b>Headers:</b><br>
			<textarea id="headers" name="headers" rows="4" cols="120" style="overflow-y: scroll;"><%=  request.getAttribute("headers")  %></textarea><br>
			<b>IP Address</b>
			<%=request.getRemoteAddr() %><br>
			<button id="refresh" name="refresh">Refresh</button>
		</form>
		<footer>
			<%@ include file="/htx/footer1.html"%>
		</footer>
	</body>
</html>