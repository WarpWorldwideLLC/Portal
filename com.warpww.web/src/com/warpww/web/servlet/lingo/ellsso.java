package com.warpww.web.servlet.lingo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.warpww.sec.DES;

/**
 * Servlet implementation class ellsso
 */
@WebServlet("/ellsso")
public class ellsso extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ellsso() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// sdb.elldevelopment.com/user/autoLogin?userInfo=stSfHclj%2BFl7736j5I47hQ%3D%3D&partnerId=2544
		// sdb.elldevelopment.com/user/autoLogin?userInfo=stSfHclj%2BFm22%2B7jnVBh7w%3D%3D&partnerId=2544 // Gracie
	

		String key = "fkelJ4bD";
		//String inputValue = "uid=229453";  // JohnnyWarp
		String inputValue = "uid=229462";  // gracewarp - stSfHclj%2BFm22%2B7jnVBh7w%3D%3D
		String outputValue = "";
		try {
			DES.encrypt(key, inputValue);
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	// Login as JohnnyWarp
	// sdb.elldevelopment.com/user/autoLogin?userInfo=stSfHclj%2BFl7736j5I47hQ%3D%3D&partnerId=2544
	protected void login() {
		
	}


}
