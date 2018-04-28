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
		<!-- -------------------------- -->
		<!--        TOP NAVBAR          -->
		<!-- -------------------------- -->	
		<nav class="">
		    <div align="right" class="topMenu">
				<!-- Just an image -->
				<ul>
			  		<li><a href="#">Join</a></li>
			  		<li><a href="#">Sign In</a></li>
			  		<li><a href="#">Contact</a></li>				
				</ul>
		    </div>
		</nav>
		
		<!-- -------------------------- -->
		<!--        MID NAVBAR          -->
		<!-- -------------------------- -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
			    <!-- Brand and toggle get grouped for better mobile display -->
			    <div class="navbar-header">
					<!-- Just an image -->
					<nav class="navbar navbar-light bg-light">
					  <a class="navbar-brand" href="#">
					     <img src="imgx/warp_logo3.png" class="e5-6 x-image" alt="WARP Worldwide, LLC" width="300" height="140" class="midLogo">
					  </a>

					</nav>
			    </div>
			    <div>
			    					   <h1><p class="navbar-form navbar-right" >Creating life-fulfilling learning opportunities for all learners</p></h1>
			    </div>
		    </div>
		</nav>

		<!-- -------------------------- -->
		<!--        BOTTOM NAVBAR       -->
		<!-- -------------------------- -->
		<nav class="navbar navbar-default">

		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
		        <li><a href="#">Link</a></li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="#">Action</a></li>
		            <li><a href="#">Another action</a></li>
		            <li><a href="#">Something else here</a></li>
		            <li role="separator" class="divider"></li>
		            <li><a href="#">Separated link</a></li>
		            <li role="separator" class="divider"></li>
		            <li><a href="#">One more separated link</a></li>
		          </ul>
		        </li> 
		      </ul>
		      <form class="navbar-form navbar-right">
		        <div class="form-group">
		          <input type="text" class="form-control" placeholder="Search">
		        </div>
		        <button type="submit" class="btn btn-default">Submit</button>
		      </form>
		      <ul class="nav navbar-nav navbar-right">
		        <li><a href="#">Link</a></li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="#">Action</a></li>
		            <li><a href="#">Another action</a></li>
		            <li><a href="#">Something else here</a></li>
		            <li role="separator" class="divider"></li>
		            <li><a href="#">Separated link</a></li>
		          </ul>
		        </li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
		
	</header>
	<!--  BODY.FORM  -->
	<form method="post" action="landing201804" name="landing" autocomplete="off">
	
	
	

		
		<div class="container">
		  <div class="jumbotron">
		    <h1>My First Bootstrap Page</h1>
		    <p>Resize this responsive page to see the effect!</p> 
		  </div>
		  <div class="row">
		    <div class="col-sm-4">
		      <h3>Column 1</h3>
		      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
		      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris...</p>
		    </div>
		    <div class="col-sm-4">
		      <h3>Column 2</h3>
		      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
		      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris...</p>
		    </div>
		    <div class="col-sm-4">
		      <h3>Column 3</h3>        
		      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
		      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris...</p>
		    </div>
		  </div>
		</div>
	
	
	
	
	</form>
	<!-- BODY.FOOTER -->
    <footer>
    
    </footer>
</body>

</html>