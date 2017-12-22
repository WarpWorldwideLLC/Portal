<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Authenticate - Authentication Testing Application</title>
    <!--   <link href="http://warp.eastasia.cloudapp.azure.com/warp/Content/bootstrap.css" rel="stylesheet"/> -->
	<!--   <link href="http://warp.eastasia.cloudapp.azure.com/warp/Content/site.css" rel="stylesheet"/> -->
    <link href="cssx/bootstrap.css" rel="stylesheet"/>
    <link href="cssx/site.css" rel="stylesheet"/>


    <script src="http://warp.eastasia.cloudapp.azure.com/warp/Scripts/modernizr-2.6.2.js"></script>

</head>
<body>
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="http://warp.eastasia.cloudapp.azure.com/warp/WarpTest/Authenticate">Application name</a>
            </div>
             
        </div>
    </div>
    <div class="container body-content">
        


<h2>Authenticate</h2>


<form action="http://warp.eastasia.cloudapp.azure.com/warp/WarpTest/authenticate" method="post"><input name="__RequestVerificationToken" type="hidden" value="3GBgOFg9tLxtHU_YKj9xxpuSC-rONZUa4-IdxNAZu_j4HPhdgzjzP-yPEQ6huToOqNLxY20xELM1PrFn_Sgvi-kM3AoLyS0QTxTVHCWRd-s1" />    <div class="form-horizontal">
        <h4>WARPUser</h4>
        <hr />
        
        <div class="form-group">
            <label class="control-label col-md-2" for="Userid">Userid</label>
            <div class="col-md-10">
                <input class="form-control text-box single-line" id="Userid" name="Userid" type="text" value="some userid" />
                <span class="field-validation-valid text-danger" data-valmsg-for="Userid" data-valmsg-replace="true"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-md-2" for="FirstName">FirstName</label>
            <div class="col-md-10">
                <input class="form-control text-box single-line" id="FirstName" name="FirstName" type="text" value="First Name" />
                <span class="field-validation-valid text-danger" data-valmsg-for="FirstName" data-valmsg-replace="true"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-md-2" for="LastName">LastName</label>
            <div class="col-md-10">
                <input class="form-control text-box single-line" id="LastName" name="LastName" type="text" value="Last Name" />
                <span class="field-validation-valid text-danger" data-valmsg-for="LastName" data-valmsg-replace="true"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-md-2" for="Email">Email</label>
            <div class="col-md-10">
                <input class="form-control text-box single-line" id="Email" name="Email" type="text" value="test@warp.cn" />
                <span class="field-validation-valid text-danger" data-valmsg-for="Email" data-valmsg-replace="true"></span>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <input type="submit" value="Save" class="btn btn-default" />
            </div>
        </div>
    </div>
</form>
<div>
    <a href="http://warp.eastasia.cloudapp.azure.com/warp/WarpTest">Back to List</a>
</div>


        <hr />
         
    </div>

    <script src="http://warp.eastasia.cloudapp.azure.com/warp/Scripts/jquery-1.10.2.js"></script>

    <script src="http://warp.eastasia.cloudapp.azure.com/warp/Scripts/bootstrap.js"></script>
<script src="http://warp.eastasia.cloudapp.azure.com/warp/Scripts/respond.js"></script>

    
    <script src="http://warp.eastasia.cloudapp.azure.com/warp/Scripts/jquery.validate.js"></script>
<script src="http://warp.eastasia.cloudapp.azure.com/warp/Scripts/jquery.validate.unobtrusive.js"></script>


</body>
</html>

