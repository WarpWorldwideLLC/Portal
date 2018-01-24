<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.partner" />

<!DOCTYPE html>
<html>
    <head>
		<%@ include file="/htx/head.html"%>
    </head>
    <body>
    		<header class="row" class="col-md-3" style="width:90%">
			<%@ include file="/htx/headerbar1.html"%>
			<hr/>
		</header>
    		<form method="post" action="partner" name="partner" autocomplete="off">
    		        
	        	<div id="partner" class="col-md-3" style="width:90%">
				<h2><fmt:message key="page_title" /></h2><br>
				<br/>
	
				 <div class="col-md-3" style="width:90%; margin: 0 auto;">
			 		<a href="http://www.bellevue.edu" > <img src="imgx/Bellevue_University.png" style="max-width: 75%; max-height: 75%; display: block; margin: 0 auto;" /> </a> <br>
				 </div>
				<div class="col-md-3" style="width:90%; margin: 0 auto;">
			 		<a href="http://www.xaiu.edu.cn" > <img src="imgx/XAIU-Logo.png" style="max-width: 75%; max-height: 75%; display: block; margin: 0 auto;" /> </a> <br>
				 </div>
				 	 <div class="col-md-3" style="width:90%; margin: 0 auto;">
			 		<a href="https://www.petersons.com"><img src="imgx/Petersons_Logo.png"  style="max-width: 75%; max-height: 75%; display: block; margin: 0 auto;" /></a> <br>
				 </div>
				 	 <div class="col-md-3" style="width:90%; margin: 0 auto;">
			 		<a href="http://www.zcogps.com" > <img src="imgx/ZCo-GPS-Logo.png" style="max-width: 75%; max-height: 75%; display: block; margin: 0 auto;" /> </a> <br>
				 </div>
				 <div class="col-md-3" style="width:90%; margin: 0 auto;">
			 		<img src="imgx/Qingdao Xunyue Consulting.png" style="max-width: 75%; max-height: 75%; display: block; margin: 0 auto;" /> <br>
				 </div>
	            	<br><br>
	            <div class="col-md-3" style="width:90%; margin: 0 auto;">
			 		<a href="https://ewh.ieee.org/conf/stem/index.html" > <img src="imgx/ZCo-GPS-Logo.png" style="max-width: 75%; max-height: 75%; display: block; margin: 0 auto;" /> </a> <br>
				 </div>
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

