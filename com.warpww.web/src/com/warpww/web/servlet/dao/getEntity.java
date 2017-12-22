package com.warpww.web.servlet.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.CallableStatement;

/**
 * Servlet implementation class getEntity
 */
@WebServlet("/getEntity")
public class getEntity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getEntity() {
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
		
		String statusCode =  getClass().getName() + ".doGet()" + ".." + System.currentTimeMillis() + ";";
		String statusCode2 = (String) request.getAttribute("ResultCode"); 
		statusCode2 += statusCode;
		request.setAttribute("ResultCode", statusCode2);
		
		String entityID = request.getParameter("EntityID");
        
 
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/WarpAdmin2017", "root", "62XYhC;erw;zZaCmZVzrFEwW");
           
            CallableStatement cStmt = conn.prepareCall("{call getEntity(?)}");
            cStmt.setString(1, entityID);

 
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
