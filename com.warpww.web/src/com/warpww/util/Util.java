package com.warpww.util;

import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class Util {
	
	public static String GetFunctionName()
	{
		return "FunctionName";
	}
	
	public static void foo()
	{
		// Util x = new Util();
		
		//String statusCode =  getClass().getName() + ".doGet()" + ".." + System.currentTimeMillis() + ";";
		//String statusCode2 = (String) request.getAttribute("ResultCode"); 
		//statusCode2 = Thread.currentThread().getStackTrace()[1].getClassName();
		//statusCode2 += "." + Thread.currentThread().getStackTrace()[1].getMethodName();
		//statusCode2 += x.GetFunctionName();
		//statusCode2 += statusCode;
		//request.setAttribute("ResultCode", statusCode2);
	}
	
	public static void printParams(String titleText, HttpServletRequest request)
	{
		System.out.println("**** HTTP Servlet Request Data for " + titleText + " ****");
		
		System.out.println("Parameter Map:");
		Map params = request.getParameterMap();
	    Iterator i = params.keySet().iterator();
	    while ( i.hasNext() )
		{
		    String key = (String) i.next();
		    String value = ((String[]) params.get( key ))[ 0 ];
		    
		    System.out.println(key + ": " + value);		    
		    
		}
	  
		System.out.println("All request attributes:");
		Enumeration enAttr = request.getAttributeNames(); 
		while(enAttr.hasMoreElements()){
		 String attributeName = (String)enAttr.nextElement();
		 System.out.println("Attribute Name - "+attributeName+", Value - "+(request.getAttribute(attributeName)).toString());
		}
		
		System.out.println("All request parameters:");
		Enumeration enParams = request.getParameterNames(); 
		while(enParams.hasMoreElements()){
		 String paramName = (String)enParams.nextElement();
		 System.out.println("Parameter Name - "+paramName+", Value - "+request.getParameter(paramName));
		}

	}

}
