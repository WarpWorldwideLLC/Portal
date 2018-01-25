<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.partner" />

<!DOCTYPE html>
<html>
    <head>
		<%@ include file="/htx/head.html"%>

    </head>
    <body onclick="insert_picture()">
    		<header class="row" class="col-md-3" style="width:90%">
			<%@ include file="/htx/headerbar1.html"%>
			<hr/>
		</header>
    		<form method="post" action="partner" name="partner" autocomplete="off">
	        	<div>
				<h2><fmt:message key="page_title" /></h2><br>
				<br/>
	
				 <div style="position: relative; top: 20px; left: 20px;">
			 		<a href="http://www.bellevue.edu" > <img src="imgx/Bellevue_University.png" style="max-width: 10%; max-height: 10%;" /> </a> <br>
				 </div>
				<div style="position: relative; top: 200px; left: 320px;">
			 		<a href="http://www.xaiu.edu.cn" > <img src="imgx/XAIU-Logo.png" style="max-width: 10%; max-height: 10%;"/> </a> <br>
				 </div>
				 <div style="position: relative; top: 70px; left: 120px;">
			 		<a href="https://www.petersons.com"><img src="imgx/Petersons_Logo.png" style="max-width: 10%; max-height: 10%;"/></a> <br>
				 </div>
				 <div style="position: relative; top: 20px; left: 20px;">
			 		<a href="http://www.zcogps.com" > <img src="imgx/ZCo-GPS-Logo.png" style="max-width: 25%; max-height: 25%;"/> </a> <br>
				 </div>
				 <div style="position: relative; top: 20px; left: 20px;">
			 		<img src="imgx/Qingdao Xunyue Consulting.png" style="max-width: 10%; max-height: 10%;"/> <br>
				 </div>
	            	<br><br>
	            	<!-- 
	            <div class="col-md-3" style="width:90%; margin: 0 auto;">
			 		<a href="https://ewh.ieee.org/conf/stem/index.html" > <img src="imgx/ZCo-GPS-Logo.png" /> </a> <br>
				 </div>
				  -->
	            	<br><br>			
				<div style=" margin-top: 1em;">
  					<a href="mailto:warpcustomer@warpww.com" class="btn btn-primary"><fmt:message key="partner.text1" /></a>
				</div>
	            <br><br><br><br>
				<br><br><br><br>
				</div>
			
				<br/><br>
				<br><br><br><br>
	        		<br><br><br><br>
        </form>
         <footer>
         		<%@ include file="/htx/footer1.html"%>
         </footer>
    </body>
</html>

