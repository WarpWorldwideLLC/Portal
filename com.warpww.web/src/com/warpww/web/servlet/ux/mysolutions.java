package com.warpww.web.servlet.ux;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.warpww.sec.Login;
import com.warpww.util.Util;

/**
 * Servlet implementation class mysolutions
 */
@WebServlet("/mysolutions")
public class mysolutions extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mysolutions() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Set PageName & System Mode
		String uri = request.getRequestURI();
		String pageName = uri.substring(uri.lastIndexOf("/")+1);
		request.setAttribute("pageName", pageName);
		
		int memberID = 0;
		String authTime = null;
		boolean authenticated = false;
		
		
		
		// Authenticate the User via Cookie; populate memberID and authTime fields.
		if(Login.authenticate(request, response)) {
			memberID = Integer.parseInt(request.getAttribute("verifyToken_MemberID").toString());
			authTime = request.getAttribute("verifyToken_CreateTime").toString();
			authenticated = true;
		} else {
			authenticated = false;
			memberID = 0;
			
		}
		
		if(authenticated) { 
			request.setAttribute("mySolutions", Util.getMemberSolution(request, response, memberID));
			// request.setAttribute("mySolutions", "Your solutions go here.");
		} else {
			request.setAttribute("mySolutions", "You must be logged in to view your solutions.");
		}
		
		if(request.getParameter("olcCmd") != null) {
			try {
				Util.getMemberInfo(request, response, memberID);
				Util.printParams("mySolutions.doGet", request);
				String s = Util.sendGetOLC(memberID, request.getAttribute("MemberName").toString(), request.getAttribute("MemberFirstName").toString(), request.getAttribute("MemberLastName").toString(), request.getAttribute("MemberEmail").toString(), request.getParameter("olcCmd").toString());
				response.getWriter().append(s).append(request.getContextPath());
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else { 
			request.getRequestDispatcher("/WEB-INF/mysolutions.jsp").forward(request, response);
		}
		
		// request.getRequestDispatcher("/WEB-INF/mysolutions.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
