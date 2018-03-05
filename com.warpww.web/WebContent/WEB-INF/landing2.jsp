<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.warp" />

<!DOCTYPE html>
<html>
    <head>
		<%@ include file="/htx/head.html"%>
		<title><fmt:message key="landing.page_title" /></title>
    </head>
    <body>
    		<header>
			<%@ include file="/htx/menu.html"%>
		</header>
    		<form method="post" action="landing" name="landing" autocomplete="off">
			<br><br><br/>
			<h4><fmt:message key="warp.short.description" /></h4>
			<br><br/>

			
			
		        <div id="warp_sol" class="row" style="background-color: yellow; border-radius: 25px; padding: 20px; display: flex; text-align: center; vertical-align: middle;">
		        		<div class="block">
		        			<a href="warp_sol" ><img src="imgx/k12.jpg" title="WARP Worldwide, LLC" width="142" height="80" /><br>
		        			<fmt:message key="solutions.p2.0" /></a>
		        		</div>
		        		<div style="display: inline; vertical-align: middle;">
		        			<span><fmt:message key="sol.description" /></span>
		        		</div>
		        	</div>
		        
		        <div id="warp_vega" class="row" style="background-color: coral; border-radius: 25px; padding: 20px; display: flex; text-align: center; vertical-align: middle;">
		        		<div class="block">
		        			<a href="warp_vega" ><img src="imgx/stem.png" title="WARP Worldwide, LLC" width="142" height="80" /><br>
		        			<fmt:message key="warp_vega.p1.0" /></a>
		        		</div>
		        		<div style="display: inline; vertical-align: middle;">
		        			<span><fmt:message key="vega.description" /></span>
		        		</div>

		        </div>
		        <div id="warp_sirius" class="row" style="background-color: skyblue; border-radius: 25px; padding: 20px; display: flex; text-align: center; vertical-align: middle;">
		        		<div class="block">
		        			<a href="warp_sirius" ><img src="imgx/warp_graduation_s.jpg" title="WARP Worldwide, LLC" width="142" height="80" /><br>
		        			<fmt:message key="warp_sirius.p1.0" /></a>
		        		</div>
		        		<div style="display: inline; vertical-align: middle;">
		        			<span><fmt:message key="sirius.description" /></span>
		        		</div>
		        </div>
	
        </form>
         <footer>
         	<%@ include file="/htx/footer1.html" %>
         </footer>
    </body>
</html>

