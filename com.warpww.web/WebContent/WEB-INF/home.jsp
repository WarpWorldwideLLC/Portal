<%@page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.warpww.web.i18n.home" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/head.html"%>
		<title>WARP Home</title>
	</head>
	<body >
	<!-- 
		onLoad="buildHtmlTable('#jsonDataTable')"  
		onLoad="warpBuildHtmlTable('#jsonDataTable')"
	-->
	     <form method="post" action="/com.warpww.web/home" enctype="multipart/form-data" name="home" autocomplete="off">
			<header>
				<h1>
					<br><label><fmt:message key="label.title1" /></label> 
					<br><label><fmt:message key="label.title2" /></label> 
				</h1>
			</header>	
					
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
	
			<br>
			<footer>
				<%@ include file="/htx/footer.html"%>
			</footer>
					
			 <script type="text/javascript">
			     $(document).ready(function () {
			         $('#sidebarCollapse').on('click', function () {
			            	$('#sidebar').toggleClass('active');
			         });
			     });
	      	</script>
   
    		</form>
	</body>
</html>