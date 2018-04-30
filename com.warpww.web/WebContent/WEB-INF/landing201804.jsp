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
		<h2>K-12 Courses</h2>
		<p><img class="warpImage" src="http://warp.zaisscodev2.info/wp-content/uploads/2018/03/800x450-3.jpg" alt="K-12 students"/><br />
		Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod sapien nec sapien dignissim gravida. Nulla cursus, mi vel pharetra eleifend, justo felis ullamcorper ex, ut lobortis ex erat quis massa.</p>
	</div>
	
	<div class="col-sm-4 warpItem">
		<h2>Stem Courses</h2>
		<p><img class="warpImage" src="http://warp.zaisscodev2.info/wp-content/uploads/2018/03/800x450-2.jpg" alt="Student at laptop" /><br />
		Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod sapien nec sapien dignissim gravida. Nulla cursus, mi vel pharetra eleifend, justo felis ullamcorper ex, ut lobortis ex erat quis massa.</p>
	</div>
	
	<!-- class="wpb_animate_when_almost_visible wpb_fadeIn fadeIn wpb_column vc_column_container vc_col-sm-4" -->
	<div class="col-sm-4 warpItem">
		<h2>College Learning</h2>
		<p><img class="warpImage" src="http://warp.zaisscodev2.info/wp-content/uploads/2018/03/800x450-1.jpg" alt="Student studying online"/><br />
		Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod sapien nec sapien dignissim gravida. Nulla cursus, mi vel pharetra eleifend, justo felis ullamcorper ex, ut lobortis ex erat quis massa.</p>
	</div>
</div>

  <div class="warpRow" >
  	<div class="col-sm-4 warpItem">
		<h2>R2 K-12 Courses</h2>
	</div>
	
	<div class="col-sm-4 warpItem">
		<h2>R2 Stem Courses</h2>
	</div>
	
	<!-- class="wpb_animate_when_almost_visible wpb_fadeIn fadeIn wpb_column vc_column_container vc_col-sm-4" -->
	<div class="col-sm-4 warpItem">
		<h2>R2 College Learning</h2>
	</div>
</div>

 <!--  warpRow -->
	</form>
	<!-- BODY.FOOTER -->
    <footer>
    
    </footer>
</body>

</html>