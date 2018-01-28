<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.home" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/head.html"%>
		<style>
			body {
			    font-family: "Lato", sans-serif;
			}
			

			
			.sidenav .closebtn {
			    position: absolute;
			    top: 0;
			    right: 25px;
			    font-size: 36px;
			    margin-left: 50px;
			}
			
			@media screen and (max-height: 450px) {
			  .sidenav {padding-top: 15px;}
			  .sidenav a {font-size: 18px;}
			}
		</style>
	</head>
	<body >
		<header>
			<h1>
				<%@ include file="/htx/headerbar1.html"%>
			</h1>
		</header>	
		<form method="post" action="home" enctype="multipart/form-data" name="home" autocomplete="off">
			<!-- 
				onLoad="buildHtmlTable('#jsonDataTable')"  
				onLoad="warpBuildHtmlTable('#jsonDataTable')"
			-->

			
			    <!-- Sidebar -->
				<div id="mySidenav" class="sidenav">
				  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
				  <a href="about">About</a>
				 	<a href="contact">Contact Us</a>
				  <a href="solutions">Solutions</a>
				  <a href="camps">Camps</a>
				  <a href="login">Login</a>
				</div>
			
				<!-- Use any element to open the sidenav -->
				<span onclick="openNav()">open</span>
			
			    <!-- Page Content -->
			    <div id="main">
				    <br>
	     			<table id="jsonDataTable" border="1"></table>
				    <br>
				    <button type="submit" id="Submit" >Submit</button>
			    </div>
   
	
			<br>
			 <script type="text/javascript">

	      	</script>
			<footer>
				<%@ include file="/htx/footer1.html"%>
			</footer>
   
    		</form>
	</body>
</html>