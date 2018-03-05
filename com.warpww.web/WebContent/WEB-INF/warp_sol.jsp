<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.warp" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/head.html"%>
		<title><fmt:message key="warp_sol.page_title" /></title>
	</head>
	<body>
		<header>
			<%@ include file="/htx/menu.html"%>
		</header>
		        <div id="warp_sol" class="block" style="width: 100%; vertical-align: text-top;  background-color: yellow; border-radius: 25px; padding: 20px; ">
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