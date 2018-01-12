<%@page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.warpww.web.i18n.landing" />

<!DOCTYPE html>
<html>
	<head>
	    		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<meta http-equiv="cache-control" content="max-age=0" />
			<meta http-equiv="cache-control" content="no-cache" />
			<meta http-equiv="expires" content="-1" />
			<meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
			<meta http-equiv="pragma" content="no-cache" />
			
			<script src="jsx/jquery.js"></script>

    			<!--  link href="cssx/warpSite2.css" rel="stylesheet"/>-->
	        <title>WARP Worldwide</title>
	       
			<script>
			
			var myList = [
				  { "name": "abc", "age": 50 },
				  { "age": "25", "hobby": "swimming" },
				  { "name": "xyz", "hobby": "programming" }
				];

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
				      if ($.inArray(key, columnSet) == -1) {
				        columnSet.push(key);
				        headerTr$.append($('<th/>').html(key));
				      }
				    }
				  }
				  $(selector).append(headerTr$);

				  return columnSet;
				}
			</script>
	    
	    </head>
	<body  onLoad="buildHtmlTable('#excelDataTable')">
		<header>
			<h1>
				<br><label><fmt:message key="label.title1" /></label> 
				<br><label><fmt:message key="label.title2" /></label> 
			</h1>

		</header>
		


		  <table id="excelDataTable" border="1">
		  </table>


		<br>
		<footer>
				<%@ include file="/htx/footer1.html"%>
		</footer>
	</body>
</html>