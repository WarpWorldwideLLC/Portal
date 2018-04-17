package com.warpww.web.servlet.ux;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.warpww.sec.AuthMod;
import com.warpww.sec.Login;
import com.warpww.util.Util;

/**
 * Servlet implementation class warp18001
 */
@WebServlet("/warp18001")
public class warp18001 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public warp18001() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AuthMod a = new AuthMod(request, response);
		a.authenticate();
		
		
		
		String purchase_action = request.getParameter("purchase") + "";
		switch(purchase_action) {
		case "24":  // Business Analytics
			break;
		case "25":  // Project Manager
			break;
		default:
			purchase_action = "-1";
			 break;
	
	}
		if(Integer.parseInt(purchase_action) >= 0) {
			Util.addSolutionToCart(request, response, a.getMemberID(), Integer.parseInt(purchase_action));
			request.getRequestDispatcher("cartmaint").forward(request, response);
		} else {
			request.getRequestDispatcher("/WEB-INF/warp18001.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
