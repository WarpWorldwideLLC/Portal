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
	    		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<meta http-equiv="cache-control" content="max-age=0" />
			<meta http-equiv="cache-control" content="no-cache" />
			<meta http-equiv="expires" content="-1" />
			<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
			<meta http-equiv="pragma" content="no-cache" />
			
			<!-- Bootstrap and Custom CSS -->
			<!--  
    			<link href="cssx/bootstrap.min.css" rel="stylesheet"/>
    			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    			<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
    			 -->
    			 <link href="cssx/bootstrap.css" rel="stylesheet"/>
    			
    			<link href="cssx/warp_custom.css" rel="stylesheet"/>
    			
    				<!-- jQuery  -->
		    <script src="jsx/jquery.js"></script>
		  
		    <!-- Bootstrap Js CDN -->
		    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    

	        <title>WARP Member Management</title>
	    </head>
	<body onLoad="warpBuildHtmlTable('#jsonDataTable')">
	<!-- onLoad="buildHtmlTable('#jsonDataTable')"  -->
	     <form method="post" action="/com.warpww.web/membermanagement" enctype="multipart/form-data" name="membermanagement" autocomplete="off">


	    
			<header>
				<h1>
					<br><label><fmt:message key="label.title1" /></label> 
					<br><label><fmt:message key="label.title2" /></label> 
				</h1>
			</header>	
					
			<div class="wrapper">
			
			    <!-- Sidebar -->
			    
			    <nav id="sidebar">
					<!-- Sidebar Header -->
			        <div class="sidebar-header">
			            <h3>Collapsible Sidebar</h3>
			        </div>		       
	
					<!-- Sidebar Links -->
			        <ul class="list-unstyled components">
			            <li class="active"><a href="#">Home</a></li>
			            <li><a href="#">About</a></li>
			
			            <li><!-- Link with dropdown items -->
			                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false">Pages</a>
			                <ul class="collapse list-unstyled" id="homeSubmenu">
			                    <li><a href="#">Page</a></li>
			                    <li><a href="#">Page</a></li>
			                    <li><a href="#">Page</a></li>
			                </ul>
			
			            <li><a href="#">Portfolio</a></li>
			            <li><a href="#">Contact</a></li>
			        </ul>
	
	
			    </nav>
			
			    <!-- Page Content -->
			    <div id="content">
				    <button type="button" id="sidebarCollapse" class="btn btn-info navbar-btn">
				        <i class="glyphicon glyphicon-align-left"></i>
				        Toggle Sidebar
				    </button>
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