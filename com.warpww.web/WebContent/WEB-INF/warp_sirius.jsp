<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.warp" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/head.html"%>
		<title><fmt:message key="warp_sirius.page_title" /></title>
	</head>
	<body>
		<header>
				<%@ include file="/htx/menu.html"%> 
		</header>
		        <div id="warp_sirius" class="block" style="width: 100%; vertical-align: text-top;  background-color: skyblue; border-radius: 25px; padding: 20px; ">
		        		<div >
		        			<h2><fmt:message key="warp_sirius.p1.0" /></h2>
		        			<h4><fmt:message key="warp_sirius.p2.0" /></h4>
		        			<div style="margin-left: 25px;">
		        				<fmt:message key="warp_sirius.p2.1" /><br>
		        				<fmt:message key="warp_sirius.p2.4" /><br>
		        				<fmt:message key="warp_sirius.p2.5" /><br>
		        			</div>

		        			<h4><fmt:message key="warp_sirius.p3.0" /></h4>
		        			<div style="margin-left: 25px;">
		        				<fmt:message key="warp_sirius.p3.1" /><br>
		        				<div style="margin-left: 25px;">
		        					<a href="warp18001"><fmt:message key="warp_sirius.p3.2" /></a><br>
		        					<a href="warp18002"><fmt:message key="warp_sirius.p3.3" /></a><br>
		        				</div>
		        			</div>
		        			<br><br>
		        			<!--  
		        			<h4><fmt:message key="warp_sirius.p4.0" /></h4>
		        			<div style="margin-left: 25px;">
		        				<a href="imgx/logo3.png"><fmt:message key="warp_sirius.p4.1" /></a><br>
		        				<a href="imgx/logo3.png"><fmt:message key="warp_sirius.p4.2" /></a><br>
		        			</div>
						<br>
						 -->
						<img src="imgx/warp_graduation_s.jpg" style="max-width: 85%; max-height: 85%; display: block; margin: 0 auto;" alt="<fmt:message key="warp_sirius.p5.0.1" />" /><br>
						<h4><fmt:message key="warp_sirius.p5.0" /></h4>
		        			
		        		</div>		        
		        </div>

		<footer>
				<%@ include file="/htx/footer1.html"%>
		</footer>
	</body>
</html>