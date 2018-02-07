<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.landing" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/head.html"%>
	</head>
	<body class="landingPage">
		<form action="landing" method="post">
			<header class="warpHeader2">
				<h1>
					<br><label><fmt:message key="landing.label.title1" /></label>
				</h1>
					<div class="carousel-div">
						<h1><a class="mySlides" href="Main.html"><label><fmt:message key="carousel.label.message1" /></label></a></h1> 
						<h1><a class="mySlides" href="Main.html"><label><fmt:message key="carousel.label.message2" /></label></a></h1> 
						<h1><a class="mySlides" href="Main.html"><label><fmt:message key="carousel.label.message3" /></label></a></h1> 
						<h1><a class="mySlides" href="Main.html"><label><fmt:message key="carousel.label.message4" /></label></a></h1> 
						<h1><a class="mySlides" href="Main.html"><label><fmt:message key="carousel.label.message5" /></label></a></h1> 
						<h1><a class="mySlides" href="Main.html"><label><fmt:message key="carousel.label.message6" /></label></a></h1> 
					</div>
			</header>
	
			<section id="content" class="content">
				<div id="sideContent">	
			
		

				</div>		
	
				<div id="compBurst" class="centered">
					<a href="camps"><img src="imgx/burst_camp-2.png" width="600" height="300" title=<fmt:message key="landing.image1" /> /></a>
				</div>
				<!-- style="display: none;" -->
				<div id="login" style="display: none;">
					<label><fmt:message key="landing.memberName" /></label><br/>
					<input type="text" name="memberName" id="memberName" value=${param["memberName"]}>
					<br/>
					<label for="passPhrase"><fmt:message key="landing.passPhrase" /></label><br/>
					<input id="passPhrase" name="passPhrase" type="password"  value="" />
					<br/><br/>
					<button type="submit" id="validateSignOn" value="validateSignon" >Sign In</button><br>
					<a href="register">Not a WARP member? Membership is free, register now!</a><br/>
					<a href="passphrasereminder">Forgot your Passphrase or Member Name?</a><br/>
	       		</div>
	       		
			</section>
			<br>
			<footer>
					<%@ include file="/htx/footer1.html"%>
			</footer>
			<script src="jsx/carousel_run.js"></script>
		</form>
	</body>
</html>