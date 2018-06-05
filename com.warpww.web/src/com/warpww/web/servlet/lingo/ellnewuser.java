package com.warpww.web.servlet.lingo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.RandomStringUtils;

/**
 * Servlet implementation class ellnewuser
 */
@WebServlet("/ellnewuser")
public class ellnewuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ellnewuser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		createNewUser();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	// https://api.elldevelopment.com/user/create
	protected String createNewUser() {
		String returnValue = null;
		
		
		String password = "";
		 String generatedString = RandomStringUtils.randomAlphabetic(10);
		 
		System.out.println(generatedString);
		
		//String url = "https://lms.ellcampus.com/user/create";
		String url = "https://api.elldevelopment.com/user/create";
		String param = "clientId=2544"
				+ "&username=ZeZeWarp"
				+ "&password=abcdef"
				+ "&email=john.arp2@warpww.com"
				+ "&firstName=ZeZe"
				+ "&lastName=Warp"
				+ "&birthdate=2017-04-27"
				+ "&language=english"
				+ "&country=China";
		
		try {
			
			System.out.println(Test.sendHttpsPost(url,param));
		
		} catch (IOException e) {
			e.printStackTrace();
		}

		
		return returnValue;
	}
	
	protected String assignLicense() {
		String returnValue = null;
		
		return returnValue;	
	}
	
	

}
