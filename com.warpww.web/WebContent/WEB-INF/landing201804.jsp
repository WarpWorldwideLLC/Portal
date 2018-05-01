<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.warp" />


<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/html.head.201804.html"%>
	    <title><fmt:message key="landing.page_title" /></title>
	</head>

<body >
	<!--  BODY.HEADER -->
	<header>		
		<%@ include file="/htx/menu_201804.html"%>
	</header>
	<!--  BODY.FORM  -->
	<form method="post" action="landing201804" name="landing" autocomplete="off">
	
<div id="myCarousel" class="noPadding carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
  <!-- 
    <div class="item active">
      <img src="imgx/1_Panda.png" alt="Los Angeles">
      <div class="carousel-caption">
        <h3>Los Angeles</h3>
        <p>LA is always so much fun!</p>
      </div>
    </div>
 -->
 
    <div class="item active">
      <img src="imgx/1600x650-grace2.jpg" alt="Grace">
    </div>

    <div class="item">
      <img src="imgx/1600x650-hands2.jpg" alt="New York">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div> <!--  Carousel -->
	


 	<div class="warpRow" >
	  	<div class="col-sm-4 warpItem">
			<h2>English for Success with Lucy Avatar</h2>
			<p><img class="myImage" src="http://warp.zaisscodev2.info/wp-content/uploads/2018/03/800x450-3.jpg" alt="English for Success"/><br />
			Everyday, there are 470 million to over a billion people speak English as their second language. Our speech recognition and speech analysis enabled English Online learning courses were developed for learners of English at every level - from K-12 students, college and university students and professionals. Let our Lucy Avatar practice English with you everyday!</p>
		</div>
		
		<div class="col-sm-4 warpItem">
			<h2>STEM Innovation and Camps</h2>
			<!-- 	<p><img class="warpImage" src="http://warp.zaisscodev2.info/wp-content/uploads/2018/03/800x450-2.jpg" alt="STEM Innovation & Camps" /><br />  -->
			<p><img class="myImage" src="imgx/stem.png" alt="STEM Innovation & Camps" /><br />
			Help kids learn Science, Math, Engineering and Technology is one of our mission at WARP Worldwide. Our STEM professionals are chosen based on their rapport with children, knowledge of the subject matter and love of learning. Your child will learn so much and enjoy every moment of STEM programs.</p>
		</div>
		
		<!-- class="wpb_animate_when_almost_visible wpb_fadeIn fadeIn wpb_column vc_column_container vc_col-sm-4" -->
		<div class="col-sm-4 warpItem">
			<h2>Professional Development</h2>
			<p><img class="myImage" src="http://warp.zaisscodev2.info/wp-content/uploads/2018/03/800x450-1.jpg" alt="Professional Studying Online"/><br />
			Start upskilling your employee's today. Our curated professional development online learning programs that align your employees' needs with your company strategy. Every course is designed by top professors or industry leaders. Sharpening your employees' skills and gaining their confidence on career path.</p>
		</div>
	</div>
	<br>
	<div class="warpRow" >
	 	<div class="col-sm-4 warpItem">
		<h2>R2 English for Success with Lucy Avatar</h2>
	</div>
	
	<div class="col-sm-4 warpItem">
		<h2>R2 STEM Innovation and Camps</h2>
	</div>
	
	<!-- class="wpb_animate_when_almost_visible wpb_fadeIn fadeIn wpb_column vc_column_container vc_col-sm-4" -->
		<div class="col-sm-4 warpItem">
			<h2>R2 Professional Development Learning</h2>
		</div>
	</div><!--  warpRow -->
	
	</form>
	<!-- BODY.FOOTER -->
    <footer>
		<%@ include file="/htx/footer_201804.html"%>
    </footer>
</body>

</html>