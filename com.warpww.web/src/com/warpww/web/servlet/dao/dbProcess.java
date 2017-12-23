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
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
		//Util.printParams("dbProcess.processCommand", request);
		
		String spName = "";
        // spName = translateCommand("RegisterUserAccount");
		JsonReader reader = Json.createReader(new ByteArrayInputStream(json.getBytes()));
		JsonObject jsonst = reader.readObject();
		spName = jsonst.getString("Command");
		
		try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WarpAdmin2017", "root", "62XYhC;erw;zZaCmZVzrFEwW");          
            
            System.out.println("StoredProc: " + spName);
            CallableStatement cStmt = conn.prepareCall("{call " + spName + "(?)}");
            cStmt.setString(1, json);
            
            boolean hadResults = cStmt.execute();
            while (hadResults) 
            {
            		ResultSet rs = cStmt.getResultSet();
            		ResultSetMetaData rsmd = rs.getMetaData(); 
                String name = rsmd.getColumnName(1);
                System.out.println(name);
                while(rs.next())
                {
                 request.setAttribute("jsonResults", rs.getString(1));
                }
                hadResults = cStmt.getMoreResults();
            }          
 
        } catch (Exception e2) 
        {
            System.out.println(e2);
        }	
	}

	private String translateCommand(String command)
	{
			String spName = "foo";
	        switch (command) {
	            case "RegisterUserAccount":  spName = "registerUserAccount";
	                     break;
	            case "GeneratePasswordResetToken": spName = "generatePasswordResetToken";
	            		break;
	            case "GetMemberList": spName = "getMemberList";
	            		break;
	            case "ValidateSignon": spName = "validateSignon";
	            		break;
	            default: spName = "Invalid_Command";
	                     break;
	        }
	        
	        return spName;
	}
	
	public void mapParams(String titleText, HttpServletRequest request)
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
