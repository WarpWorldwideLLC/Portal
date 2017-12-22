package com.warpww.web.servlet.dao;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.json.Json;

/**
 * Servlet implementation class registerUserAccount
 */
@WebServlet("/registerUserAccount")
public class registerUserAccount2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerUserAccount2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String statusCode =  getClass().getName() + ".doGet()" + ".." + System.currentTimeMillis() + ";";
		//String statusCode2 = (String) request.getAttribute("ResultCode"); 
		//request.setAttribute("ResultCode", statusCode2);
		
		registerUserAccount(request, response);

	}
	
	private void registerUserAccount(HttpServletRequest request, HttpServletResponse response)
	{
		String entityID = request.getParameter("EntityID");
		 System.out.println(System.getProperty("java.runtime.version"));
		 
		 String json = Json.createObjectBuilder()
				 .add("AuthenticatedUserID", 1)
				 .add("ProxyUserID", 1)
				 .add("MemberName", "memberName")
				 .add("eMail", "eMail")
				 .add("passphraseHash", "passphraseHash")
				 .build()
				 .toString();
		 		
		 
		 try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WarpAdmin2017", "root", "62XYhC;erw;zZaCmZVzrFEwW");
           
            String spName = "";
            spName = "registerUserAccount";
            
            CallableStatement cStmt = conn.prepareCall("{call " + spName + "(?)}");
            cStmt.setString(1, json);

 
            boolean hadResults = cStmt.execute();
            while (hadResults) {
                ResultSet rs = cStmt.getResultSet();

                // process result set
                //...

                hadResults = cStmt.getMoreResults();
            }
            
          
 
        } catch (Exception e2) 
        {
            System.out.println(e2);
        }	
	}

}
