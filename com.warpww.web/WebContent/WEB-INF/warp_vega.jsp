<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.warp" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/head.html"%>
		<title><fmt:message key="warp_vega.page_title" /></title>
	</head>
	<body>
		<header>
			<%@ include file="/htx/menu.html"%>
		</header>
		<form>
		<div id="warp_vega" class="block" style="width: 100%; vertical-align: text-top; background-color: coral; border-radius: 25px; padding: 20px; ">
		        		<div >
		        			<h2 style="text-align: center;"><fmt:message key="warp_vega.p1.0" /></h2>
		        			<h4 style="text-align: center;"><fmt:message key="warp_vega.p2.0" /></h4>
		        			<div style="margin-left: 25px;">
		        				<img src="imgx/stem.png" style="max-width: 85%; max-height: 85%; display: block; margin: auto auto;" alt="<fmt:message key="warp_vega.p2.0.1" />" /><br>

		        				<div>
		        					<fmt:message key="warp_vega.p2.1.0" /><br><br>
		        					<fmt:message key="warp_vega.p2.1.1" />
		        				</div>
		        				<br>
		        				<fmt:message key="warp_vega.p2.2" />
		        			</div>
		        			<br>
		        			<table>
							<tr>
								<td>&nbsp;</td>
								<td>
									<div style=" margin-top: 1em;">
						  				<a href="checkout?paymentmethod=full" class="btn btn-primary">Purchase (USD $1.487.00)</a>
									</div>
								</td>
								<td>&nbsp;</td>
								<td>
									<div style=" margin-top: 1em;">
						  				<!--  <p class="lead">Download the full brochure by clicking below.</p>  -->
						  				<a href="mailto:warpcustomer@warpww.com" class="btn btn-primary">Request More Information</a>
									</div>
								</td>
							</tr>
						</table>
		        		</div>
		        </div>
		</form>
		<footer>
				<%@ include file="/htx/footer1.html"%>
		</footer>
	</body>
</html>