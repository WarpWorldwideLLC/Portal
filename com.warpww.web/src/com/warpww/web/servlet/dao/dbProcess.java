package com.warpww.web.servlet.dao;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.warpww.pymt.hsc;
import com.warpww.util.Util;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;

/**
 * Servlet implementation class registerUserAccount
 */
@WebServlet("/dbProcess")
public class dbProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dbProcess() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		processCommand(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String statusCode =  getClass().getName() + ".doGet()" + ".." + System.currentTimeMillis() + ";";
		//String statusCode2 = (String) request.getAttribute("ResultCode"); 
		//request.setAttribute("ResultCode", statusCode2);
		// System.out.println(System.getProperty("java.runtime.version"));
				
		processCommand(request, response);

	}
	
	private void processCommand(HttpServletRequest request, HttpServletResponse response)
	{
		String json = "";
		json = (String) request.getAttribute("CommandText");
		// Util.printParams("dbProcess.processCommand.Start", request);
		
		String spName = "";

		JsonReader reader = Json.createReader(new ByteArrayInputStream(json.getBytes()));
		JsonObject jsonst = reader.readObject();
        // spName = translateCommand("RegisterUserAccount");
		spName = translateCommand(jsonst.getString("Command"));
		
		// If the command is invalid,stop processing and return an error.
		if(spName == "Invalid_Command") {
			 request.setAttribute("CommandResults", "{\"MemberID\": -1, \"MemberName\": \"\", \"EmailAddress\": \"\", \"ProcStatus\": \"ERROR\", \"ProcMessage\": \"Invalid Command: '" + jsonst.getString("Command") + "'\"}");
			 /* {"MemberID": 43, "ProcStatus": "ERROR", "ProcMessage": "Invalid Command: '"+ jsonst.getString("Command") + "'"} */
			 return;
		}
		
		try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            // Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WarpAdmin2017", "root", "62XYhC;erw;zZaCmZVzrFEwW");
            Connection conn = DriverManager.getConnection(hsc.jdbcURI, hsc.jdbcUser, hsc.jdbcPassword);   
            
            // System.out.println("dbprocess.processCommand:StoredProc: " + spName);
            CallableStatement cStmt = conn.prepareCall("{call " + spName + "(?)}");
            cStmt.setString(1, json);
            
            boolean hadResults = cStmt.execute();
            while (hadResults) 
            {
            		ResultSet rs = cStmt.getResultSet();
            		ResultSetMetaData rsmd = rs.getMetaData(); 
                String name = rsmd.getColumnName(1);
                // System.out.println(name);
                while(rs.next())
                {
                 request.setAttribute("CommandResults", rs.getString(1));
                }
                hadResults = cStmt.getMoreResults();
            }          
            // Util.printParams("dbProcess.processCommand.AfterProcessing", request);
 
        } catch (Exception e2) 
        {
            System.out.println(e2);
        }	
	}

	private String translateCommand(String command)
	{
			String spName = "foo";
	        switch (command) {
	            case "RegisterMember":  spName = "registerMember";
	                     break;
	            case "GeneratePasswordResetToken": spName = "generatePasswordResetToken";
	            		break;
	            case "GetMemberList": spName = "getMemberList";
	            		break;
	            case "ValidateSignon": spName = "validateSignon";
	            		break;
	            case "SaveCampData":  spName = "saveCampData";
                		break;
	            case "SaveStripeCampData":  spName = "saveStripeCampData";
                		break;
	            case "GetGreeting":  spName = "getGreeting";
        				break;
	            default: spName = "Invalid_Command";
	                break;
	        }
	        
	        return spName;
	}
	
	public void mapParamsOld(String titleText, HttpServletRequest request)
	{
		System.out.println("**** HTTP Request Data for" + titleText + " ****");
		/* 
		Map params = request.getParameterMap();
	    Iterator i = params.keySet().iterator();
	    while ( i.hasNext() )
		{
		    String key = (String) i.next();
		    String value = ((String[]) params.get( key ))[ 0 ];
		    
		    System.out.println(key + ": " + value);		    
		    
		}
	   */
		System.out.println("All request attributes");
		
		Enumeration enAttr = request.getAttributeNames(); 
		while(enAttr.hasMoreElements()){
		 String attributeName = (String)enAttr.nextElement();
		 System.out.println("Attribute Name - "+attributeName+", Value - "+(request.getAttribute(attributeName)).toString());
		}
		
		System.out.println("All request parameters:");
		
		Enumeration enParams = request.getParameterNames(); 
		while(enParams.hasMoreElements()){
		 String paramName = (String)enParams.nextElement();
		 System.out.println("Attribute Name - "+paramName+", Value - "+request.getParameter(paramName));
		}
	
		
	}
	
}
