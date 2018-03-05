<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.warp_sol" />

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
		        <div id="warp_sol" class="block" style="width: 33%; vertical-align: text-top;  background-color: yellow; border-radius: 25px; padding: 20px; ">
		            <div >
		                    <h2><fmt:message key="solutions.p2.0" /></h2>
		                    <h4><fmt:message key="solutions.p2.1" /></h4>
		                    <div style="margin-left: 25px; line-height: 125%;">
		                    <fmt:message key="solutions.p2.2" /><br><br>
							</div>
							<br>
			                <h4><fmt:message key="solutions.p3.0" /></h4>
							<div style="margin-left: 25px;">
			                    <fmt:message key="solutions.p3.1" /><br>
		                    </div>
		                    <br>
		                    <h4><fmt:message key="solutions.p4.0" /></h4>
		                    <div style="margin-left: 25px;">
			                    <fmt:message key="solutions.p4.1" /><br>
			                    <fmt:message key="solutions.p4.2" /><br>
							</div>
		                    <br>
		                    <h4><fmt:message key="solutions.p5.0" /></h4>
		                    <div style="margin-left: 25px;">
								<fmt:message key="solutions.p5.1" /><br>
							</div>
							<br>
							<h4><fmt:message key="solutions.p6.0" /></h4>
							<div style="margin-left: 25px;">
								<fmt:message key="solutions.p6.1" />
							</div>
							<br>
		            </div>
		          </div>

		<footer>
				<%@ include file="/htx/footer1.html"%>
		</footer>
	</body>
</html>