<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.warp" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/head.html"%>
		<title><fmt:message key="warp18002.page_title" /></title>
	</head>
	<body>
		<header>
			<%@ include file="/htx/menu.html"%>
		</header>
		<div id="solution_panel" class="row" style="width: 99%; vertical-align: text-top; display: flex;">
		   
	   		 <div id="pictures" class="block" style="width: 33%; vertical-align: text-top; horizontal-align: center; padding: 10px; border-right: thin solid darkgoldenrod;">
	        		<div >
					<img src="imgx/warp18002_1.jpg" alt=<fmt:message key="warp18002.image1.alt.text" /> style="width: 75%;">	 
				</div>
			
				<div style=" margin-top: 1em; margin-left: 15%;">
					<a href="register" class="btn btn-primary" style="width: 45%;"><fmt:message key="warp18002.button.apply" /></a>
				</div>
				<div style=" margin-top: 1em; margin-left: 15%;">
			  		<a href="campregistration?paymentmethod=deposit" class="btn btn-primary disabled" style="width: 45%;"><fmt:message key="warp18002.button.pay" /></a>

				</div>   
				<br><br>
				<div>
					<p>
						<fmt:message key="warp18xxx.warp.text1" />
					</p>
					<p>
					<fmt:message key="warp18002.certficate.text0" />
					
					</p>
					<p>

				</div>    		
			
	        </div>
	        
	        <div id="text" class="block" style="width: 57%; vertical-align: text-top;  border-radius: 25px; padding: 20px; ">
	            <div >

					<div style=" font-style: italic; font-size: 1.1em;">
						<fmt:message key="warp18002.certficate.text1" />
						
					</div>
					</p>		
							
					<a class="productBullet">&bull; <fmt:message key="warp18002.certficate.heading1" /></a><br>
					<div style="padding-left: 1em;">
						<fmt:message key="warp18002.certficate.text2" />	
						.
					</div><br>

					<a class="productBullet">&bull; <fmt:message key="warp18002.certficate.heading2" /></a><br>
					<div style="padding-left: 1em;">
						<fmt:message key="warp18002.certficate.text3" />
					</div><br>
					
					<a class="productBullet">&bull; <fmt:message key="warp18002.certficate.heading3" /></a><br>
					<div style="padding-left: 1em;">
						<fmt:message key="warp18002.certficate.text4" />
									
					</div><br>

					<a class="productBullet">&bull; <fmt:message key="warp18002.certficate.heading4" /></a><br>
					<div style="padding-left: 1em;">
						<fmt:message key="warp18002.certficate.text5" />
						.
					</div><br>
					
					<p><a style="font-size: 1.5em; color: black;"><fmt:message key="warp18002.certficate.heading5" /></a></p>
					<p>&bull; 
					<fmt:message key="warp18002.certficate.text6" />
					</p>
					<p>&bull; 
					<fmt:message key="warp18002.certficate.text7" />
					</p>
					
					<div>
						<div>
							<img src="imgx/gaclogo.png" style="float: right; width:20%;">
							<p>&bull; 
							<fmt:message key="warp18002.certficate.text8" />
							</p>
							</div>
						<div>
							
						</div>
					</div>
					<p>&bull; 
					<fmt:message key="warp18002.certficate.text9" />
					</p>
					
					<p>&bull; 
					<fmt:message key="warp18002.certficate.text10" />
					</p>
					
					<p>&bull; 
					<fmt:message key="warp18002.certficate.text11" />
					
					</p>
					<p>
						&bull;<fmt:message key="warp18002.certficate.text12" />
					</p>
          			<div>
						<p><a style="font-size: .75em; font-style: italic; color: black;"><fmt:message key="warp18xxx.certficate.bellevue" /></a></p>	
						<br><br><br><br><br><br><br><br><br><br><br>	  
					</div>
				</div>
			</div>

		</div>

		<footer>
				<%@ include file="/htx/footer1.html"%>
		</footer>
	</body>
</html>