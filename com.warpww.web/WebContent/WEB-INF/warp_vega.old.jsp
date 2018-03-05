<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.warp_vega" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/head.html"%>
	</head>
	<body>
		<header>
			<h1>
				<br><label><fmt:message key="label.title1" /></label> 
				<br><label><fmt:message key="label.title2" /></label> 
			</h1>

		</header>
		<div id="warp_vega" class="block" style="width: 33%; vertical-align: text-top; background-color: coral; border-radius: 25px; padding: 20px; ">
		        		<div >
		        			<h2><fmt:message key="warp_vega.p1.0" /></h2>
		        			<h4><fmt:message key="warp_vega.p2.0" /></h4>
		        			<div style="margin-left: 25px;">
		        				<img src="imgx/stem.png" style="max-width: 85%; max-height: 85%; display: block; margin: 0 auto;" alt="<fmt:message key="warp_vega.p2.0.1" />" /><br>

		        				<div>
		        					<fmt:message key="warp_vega.p2.1.0" /><br><br>
		        					<fmt:message key="warp_vega.p2.1.1" />
		        				</div>
		        				<br>
		        				<fmt:message key="warp_vega.p2.2" />
		        			</div>
		        			<br>
		        			<h4><fmt:message key="warp_vega.p3.0" /></h4>
		        			<div style="margin-left: 25px;">
		        				<fmt:message key="warp_vega.p3.1" /><br><br>
		        				<!-- 
		        				<img src="imgx/what_we_offer.png" style="max-width: 100%; max-height: 100%;" alt="<fmt:message key="warp_vega.p2.0.1" />" /><br>
		        				 -->
		        			</div>
		        			
		        		</div>
		        </div>

		<footer>
				<%@ include file="/htx/footer1.html"%>
		</footer>
	</body>
</html>