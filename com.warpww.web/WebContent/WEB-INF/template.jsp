<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.landing" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/head.html"%>
	    <title>WARP Worldwide</title>
	</head>
	<body>
		<header>
			<h1>
				<br><label><fmt:message key="label.title1" /></label> 
				<br><label><fmt:message key="label.title2" /></label> 
			</h1>

		</header>
		<form action="http://localhost:8080/com.warpww.web/checkout" method="POST">
			<div class="wrapper">
				<!-- Sidebar -->
				<%@ include file="/htx/sidebar.html"%>
				
				<!-- Page Content -->
			    <div id="content">
				    <br>
	     			<table id="jsonDataTable" border="1"></table>
				    <br>
				    <button type="submit" id="Submit" >Submit</button>
			    </div>
			</div>
		</form>
		<footer>
				<%@ include file="/htx/footer1.html"%>
		</footer>
	</body>
</html>