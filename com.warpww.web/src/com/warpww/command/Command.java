package com.warpww.command;

import java.io.StringReader;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.warpww.util.Util;

import javax.json.Json;
import javax.json.JsonObjectBuilder;
import javax.json.JsonReader;
import javax.json.JsonString;
import javax.json.JsonObject;


public class Command 
{
	
	// Take request object and convert Parameters and Attributes to JSON objects for ease of handling
	public static String createRequestInput(HttpServletRequest request)
	{
		Util.foo();
		int inputCount = 0;
		String inputName = "NO_PARAMETERS";
		String inputValue = "NO_PARAMETERS";
		
		JsonObjectBuilder jsonBuilder = Json.createObjectBuilder();
				
		// Attributes First - Server Side data
		Enumeration<String> enAttr = request.getAttributeNames(); 
		while(enAttr.hasMoreElements())
		{
			inputName = (String)enAttr.nextElement();
			inputValue = request.getAttribute(inputName).toString();
			jsonBuilder.add(inputName, inputValue);
			inputCount +=1;
		}
		
		Enumeration<String> enParams = request.getParameterNames(); 
		while(enParams.hasMoreElements())
		{
			inputName = (String)enParams.nextElement();
			inputValue = request.getParameter(inputName).toString();
		 jsonBuilder.add(inputName, inputValue);
		 inputCount +=1;
		}
		
		// Empty Values
		if(inputCount <1 )
		{
			jsonBuilder.add(inputName, inputValue);
		}
		
		jsonBuilder.add("PARAMETER_COUNT", inputCount);
		
		String returnValue = jsonBuilder.build().toString();
		request.setAttribute("inputList", returnValue);
		return returnValue;

	}

	
	public static String createCommand(String pCommandName, String pInputJSON)
	{
		String returnValue = "";
		
		switch(pCommandName) 
		{
			case "AddAccount":
				break;
			case "GetMemberNameFromEmailAddress":
				GetMemberNameFromEmailAddress(pCommandName, pInputJSON);
			default:
				break;
		}
		
		
		return returnValue;
	}
	
	private static String GetMemberNameFromEmailAddress(String pCommandName, String pInputJSON)
	{
		String returnValue = "";
		
		// Parse the InputJSON
		JsonReader reader = Json.createReader(new StringReader(pInputJSON));
		JsonObject originalDoc = reader.readObject();
		JsonString temp = originalDoc.getJsonString("emailAddress");
		System.out.println("EMailValue:" + temp);
		
		
		// Build the Command JSON 
		JsonObjectBuilder jsonBuilder = Json.createObjectBuilder();
		jsonBuilder.add("CommandName", pCommandName);
		jsonBuilder.add("CommandVersion", originalDoc.getJsonString("1.0"));
		jsonBuilder.add("AuID", originalDoc.getJsonString("emailAddress"));
		jsonBuilder.add("PuID", originalDoc.getJsonString("emailAddress"));
		jsonBuilder.add("EMailAddress", originalDoc.getJsonString("emailAddress"));

		 returnValue = jsonBuilder.build().toString();
		
		/*
		
		
		// Attributes First - Server Side data
		Enumeration<String> enAttr = request.getAttributeNames(); 
		while(enAttr.hasMoreElements())
		{
			inputName = (String)enAttr.nextElement();
			inputValue = request.getAttribute(inputName).toString();
			jsonBuilder.add(inputName, inputValue);
			inputCount +=1;
		}
		
		String returnValue = jsonBuilder.build().toString(););
		*/
		
		return returnValue;
	}
	
	
}
