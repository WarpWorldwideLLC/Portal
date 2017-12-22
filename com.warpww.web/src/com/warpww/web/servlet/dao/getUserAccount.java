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

import com.warpww.util.Util;

/**
 * Servlet implementation class getUserAccount
 */
@WebServlet("/getUserAccount")
public class getUserAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getUserAccount() {
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
		String statusCode =  getClass().getName() + ".doPost()" + ".." + System.currentTimeMillis() + ";";
		String statusCode2 = (String) request.getAttribute("ResultCode"); 
		statusCode2 += statusCode;
		request.setAttribute("ResultCode", statusCode2);
		
		
		Util.printParams("getUserAccount.doPost", request);
		
		String AuthenticatedUserID = (String) request.getAttribute("AuthenticatedUserID");
		String ProxyUserID = (String) request.getAttribute("ProxyUserID");
		String UserAccountID = (String) request.getAttribute("UserAccountID");
        
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WarpAdmin2017", "root", "62XYhC;erw;zZaCmZVzrFEwW");
           
            CallableStatement cStmt = conn.prepareCall("{call getUserAccount(?,?,?)}");
            cStmt.setString(1, AuthenticatedUserID);
            cStmt.setString(2, ProxyUserID);
            cStmt.setString(3, UserAccountID);

            boolean hadResults = cStmt.execute();
            while (hadResults) {
                ResultSet rs = cStmt.getResultSet();
                if(rs.next())
                {
                		System.out.println(rs.getString(1));
                }
                hadResults = cStmt.getMoreResults();
            }
            
          
 
        } catch (Exception e2) 
        {
            System.out.println(statusCode);
        		System.out.println(e2);
        }	
	}

}
