/*!
 * warp_util v1.0.0 
 * WARP Utility Functions
 * 
 */


function toggleHide(targetElement)
{

	var att = document.getElementById(targetElement).getAttribute('type');

	if(att == 'password')
		{
			document.getElementById(targetElement).setAttribute('type', 'text');
		}
	else 
		{
		document.getElementById(targetElement).setAttribute('type', 'password');
		}
}


function toggleHide2(inputValue1, inputValue2)
{
	toggleHide(inputValue1);
	toggleHide(inputValue2);
}

//************************************************************************************************************************************************************************
//*** Table Buider
//************************************************************************************************************************************************************************

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
		alert ('Table Building Begins!');
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
	alert('Building Table');
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

	// Adds Header List to HTML Table
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

	
	