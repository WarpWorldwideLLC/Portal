<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.warp201804" />


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
	
<div id="myCarousel" class="carousel slide" data-ride="carousel">
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
      <img src="imgx/1600x650-grace2.jpg" alt=<fmt:message key="landing.carousel.grace_alt" />>
    </div>

    <div class="item">
      <img src="imgx/1600x650-hands2.jpg" alt=<fmt:message key="landing.carousel.hands_alt" />>
    </div>
    
    <div class="item">
      <img src="imgx/Warp_Image_Shutterstock_Success-1600-650-Resize.jpg" alt=<fmt:message key="landing.carousel.success_alt" />>
    </div>
    
    <div class="item">
      <img src="imgx/Warp_Image_Shutterstock_English-1600-650-Resize.jpg" alt=<fmt:message key="landing.carousel.english_alt" />>
    </div>
  <!--  
    <div class="item">
      <img src="imgx/Warp_Image_Shutterstock_Chinese-1600-650-Resize.jpg" alt=<fmt:message key="landing.carousel.chinese_alt" /> >
    </div>
  -->    
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only"><fmt:message key="landing.carousel.chevron_left" /></span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only"><fmt:message key="landing.carousel.chevron_right" /></span>
  </a>

  <!--  
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
   </a>
  -->
</div> <!--  Carousel -->
	


<div class="warpRow" >
  	<!--  ELL  -->
  	<div class="col-sm-4 warpItem">
		<h2><fmt:message key="landing.ell_header" /></h2>
		<p>
			<img class="myImage" src="http://warp.zaisscodev2.info/wp-content/uploads/2018/03/800x450-3.jpg" alt=<fmt:message key="landing.ell_alt" /> /><br />
			<fmt:message key="landing.ell_text1" />
		</p>
	</div>
	
	<!--  STEM -->
	<div class="col-sm-4 warpItem">
		<h2><fmt:message key="landing.stem_header" /></h2>
		<!-- 	<p><img class="warpImage" src="http://warp.zaisscodev2.info/wp-content/uploads/2018/03/800x450-2.jpg" alt="" /><br />  -->
		<p>
			<img class="myImage" src="imgx/Warp_Image_Shutterstock_STEM-800-450-Resize.jpg" alt="STEM Innovation & Camps" /><br />
			<fmt:message key="landing.stem_text1" />
		</p>
	</div>
	
	<!-- Professional Development -->
	<!-- class="wpb_animate_when_almost_visible wpb_fadeIn fadeIn wpb_column vc_column_container vc_col-sm-4" -->
	<div class="col-sm-4 warpItem">
		<h2><fmt:message key="landing.prodev_header" /></h2>
	<!-- ZCo image college learning src="http://warp.zaisscodev2.info/wp-content/uploads/2018/03/800x450-1 -->	
		<p>
			<img class="myImage" src="imgx/consulting-professional-dev-800-450-resize.jpg" alt=<fmt:message key="landing.prodev_alt" /> /><br />
			<fmt:message key="landing.prodev_text1" />
		</p>
	</div>
</div>


 <!--  warpRow -->
	</form>
	<!-- BODY.FOOTER -->
    <footer>
    
    </footer>
</body>

</html>