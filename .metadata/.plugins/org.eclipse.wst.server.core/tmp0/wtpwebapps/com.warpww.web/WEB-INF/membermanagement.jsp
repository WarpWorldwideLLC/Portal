<%@page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.warpww.web.i18n.membermanagement" />

<!DOCTYPE html>
<html>
	<head>
	    		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<meta http-equiv="cache-control" content="max-age=0" />
			<meta http-equiv="cache-control" content="no-cache" />
			<meta http-equiv="expires" content="-1" />
			<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
			<meta http-equiv="pragma" content="no-cache" />
			
			<!-- Bootstrap and Custom CSS -->
			<!--  
    			<link href="cssx/bootstrap.min.css" rel="stylesheet"/>
    			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    			<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
    			 -->
    			 <link href="cssx/bootstrap.css" rel="stylesheet"/>
    			
    			<link href="cssx/warp_custom.css" rel="stylesheet"/>
    			
    				<!-- jQuery  -->
		    <script src="jsx/jquery.js"></script>
		  
		    <!-- Bootstrap Js CDN -->
		    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
 			<script>
 			
	 			// Retrieve the jsonResults parameter contents into a javascript variable. 
	 			var myList = '${jsonResults}'; 
	 			//alert(myList);
				var myList2 = 
				[
				  { "name": "abc", "age": 50 },
				  { "age": "25", "hobby": "swimming" },
				  { "name": "xyz", "hobby": "programming" }
				];
				

				// showArray(myList2);
				// showObject(myList2[0]);
				// showObject(myList2);
				
				// List Elements of an array
				function showArray(objArr) {
					$.each(objArr, function(index, element) {
						alert("ArrayIndex: " + index + " ArrayElement: " + element);
					}) 
							
				}
				
				// List properties of an object
				function showObject(obj) {
						alert(JSON.stringify(obj));
					  $.each(obj, function(objectProperty, objectValue) {
						alert("PropertyName: " + objectProperty + " PropertyValue: " + objectValue)
					  });
					}
				
				
				// Build HTML Table from JSON input. 
				function warpBuildHtmlTable(selector) {
					
					jsonData = JSON.parse(myList);
					
					var columnList = warpAddAllColumnHeaders(selector, jsonData);
					
					$.each(jsonData, function(arrayIndex, arrayValue) {
						var row$ = $('<tr>');
						// Pull arrayValue for each corresponding ColumnValue to ensure Table Header and Table Data align properly.
						$.each(columnList, function(columnIndex, columnValue) {
							var cellValue = arrayValue[columnValue];
							if(cellValue == null) cellValue == "";
							row$.append($('<td/>').html(cellValue));
						});
						$(selector).append(row$);
					});
				}
				
				// Adds a header row to the table and returns the set of columns.
				// Need to do union of keys from all records as some records may not contain
				// all records.
				function warpAddAllColumnHeaders (selector, jsonData) {
					var columnSet = [];
					var headerTr$ = $('<tr/>');
					
					$.each(jsonData, function(arrayIndex, arrayValue) {
						var rowHash = arrayValue;
						$.each(arrayValue, function(elementName, elementValue) {
							if ($.inArray(elementName, columnSet) == -1) 
						      {
						        columnSet.push(elementName);
						        headerTr$.append($('<th/>').html(elementName));
						      }
						});
						
					});
					$(selector).append(headerTr$);
					return columnSet;
				}
				
				
				// Builds the HTML Table out of myList.
				function buildHtmlTable(selector) {
				  var columns = addAllColumnHeaders(myList, selector);

				  for (var i = 0; i < myList.length; i++) {
				    var row$ = $('<tr/>');
				    for (var colIndex = 0; colIndex < columns.length; colIndex++) {
				      var cellValue = myList[i][columns[colIndex]];
				      if (cellValue == null) cellValue = "";
				      row$.append($('<td/>').html(cellValue));
				    }
				    $(selector).append(row$);
				  }
				}

				// Adds a header row to the table and returns the set of columns.
				// Need to do union of keys from all records as some records may not contain
				// all records.
				function addAllColumnHeaders(myList, selector) {
				  var columnSet = [];
				  var headerTr$ = $('<tr/>');
				  
				  for (var i = 0; i < myList.length; i++) {
				    var rowHash = myList[i];
				    for (var key in rowHash) {
				      if ($.inArray(key, columnSet) == -1) 
				      {
				        columnSet.push(key);
				        headerTr$.append($('<th/>').html(key));
				      }
				    }
				  }
				  $(selector).append(headerTr$);

				  return columnSet;
				}
			</script>
    			
    			
	        <title>WARP Member Management</title>
	    </head>
	<body onLoad="warpBuildHtmlTable('#jsonDataTable')">
	<!-- onLoad="buildHtmlTable('#jsonDataTable')"  -->
	     <form method="post" action="/com.warpww.web/membermanagement" enctype="multipart/form-data" name="membermanagement" autocomplete="off">


	    
			<header>
				<h1>
					<br><label><fmt:message key="label.title1" /></label> 
					<br><label><fmt:message key="label.title2" /></label> 
				</h1>
			</header>	
					
			<div class="wrapper">
			
			    <!-- Sidebar -->
			    
			    <nav id="sidebar">
					<!-- Sidebar Header -->
			        <div class="sidebar-header">
			            <h3>Collapsible Sidebar</h3>
			        </div>		       
	
					<!-- Sidebar Links -->
			        <ul class="list-unstyled components">
			            <li class="active"><a href="#">Home</a></li>
			            <li><a href="#">About</a></li>
			
			            <li><!-- Link with dropdown items -->
			                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false">Pages</a>
			                <ul class="collapse list-unstyled" id="homeSubmenu">
			                    <li><a href="#">Page</a></li>
			                    <li><a href="#">Page</a></li>
			                    <li><a href="#">Page</a></li>
			                </ul>
			
			            <li><a href="#">Portfolio</a></li>
			            <li><a href="#">Contact</a></li>
			        </ul>
	
	
			    </nav>
			
			    <!-- Page Content -->
			    <div id="content">
				    <button type="button" id="sidebarCollapse" class="btn btn-info navbar-btn">
				        <i class="glyphicon glyphicon-align-left"></i>
				        Toggle Sidebar
				    </button>
				    <br>

	     			<table id="jsonDataTable" border="1"></table>

				    <br>
				    
				    <button type="submit" id="Submit" >Submit</button>
			    </div>
			</div>       
	
			<br>
			<footer>
					<%@ include file="/htx/footer.html"%>
			</footer>
			
			 <script type="text/javascript">
	             $(document).ready(function () {
	                 $('#sidebarCollapse').on('click', function () {
	                     $('#sidebar').toggleClass('active');
	                 });
	             });
	         </script>
   
	    </form>
	</body>
</html>