<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.about" />

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
    		<form method="post" action="about" name="about" autocomplete="off">
    		        
	        	<div id="vision" class="col-md-3" style="width:90%">
				<h2><fmt:message key="vision.title" /></h2><br>
				<h4><font size="5" color="red"> <i><fmt:message key="vision.vision_statement" /> </i> </font> </h4>
				<br/>
				<p><fmt:message key="vision.text1" /></p>
				<p><fmt:message key="vision.text2" /></p>
				<br><br>
			</div>
	        <div id="mission" class="col-md-3" style="width:90%">
	       		<h2><fmt:message key="mission.title" /></h2><br>
				<h4> <i><fmt:message key="mission.mission_statement" /> </i> </font> </h4>
				<br/>
				<p><fmt:message key="mission.text1" /></p>
				<p><fmt:message key="mission.text2" /></p>
				<p><fmt:message key="mission.text3" /></p>
				<p><fmt:message key="mission.text4" /></p>
	        		<br><br>
	        	</div>
	        <div id="values" class="col-md-3" style="width:90%">
	        		<h2><fmt:message key="values.title" /></h2>
				<br/>
				<ol>
					<li style="border-right: medium none;"><fmt:message key="values.principle1" /></li><br>
					<li style="border-right: medium none;"><fmt:message key="values.principle2" /></li><br>
					<li style="border-right: medium none;"><fmt:message key="values.principle3" /></li><br>
					<li style="border-right: medium none;"><fmt:message key="values.principle4" /></li><br>
					<li style="border-right: medium none;"><fmt:message key="values.principle5" /></li><br>
					<li style="border-right: medium none;"><fmt:message key="values.principle6" /></li><br>
					<li style="border-right: medium none;"><fmt:message key="values.principle7" /></li><br>
					<li style="border-right: medium none;"><fmt:message key="values.principle8" /></li><br>
				</ol>
				<br><br>
	        </div>
	        
	        	<div id="warp_team" class="col-md-3" style="width:90%">
				<h2><fmt:message key="team.title" /></h2><br>
				<p><fmt:message key="team.paragraph1" /></p>
				<p><fmt:message key="team.paragraph2" /></p>
				<p><fmt:message key="team.paragraph3" /></p>
				<br/><br>
	        </div>
	        
	        
	        
        </form>
         <footer>
         		<%@ include file="/htx/footer1.html"%>
         </footer>
    </body>
</html>

