package com.warpww.sec;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthMod {

	//**********************************************************************
	// Private Variables
	//**********************************************************************
	private HttpServletRequest request;
	private HttpServletResponse response;
		
	private String currentPage;
	private String lastPageVisited;
	private int memberID;
	private String authTime;
	private boolean authenticated;
	private String firstName;
	private String lastName;
	
	
	
	//**********************************************************************
	// Accessors and Mutators (Getters and Setters)
	//**********************************************************************
	
	// memberID
	public int getMemberID() {
		return this.memberID;
	}
	
	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}
	
	
	// firstName
	public String getFirstName() {
		return this.firstName;
	}
	
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	// lastName
	public String getLastName() {
		return this.lastName;
	}
	
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	// request
	public HttpServletRequest getRequest() {
		return this.request;
	}
	
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	// response
	public HttpServletResponse getResponse() {
		return this.response;
	}
	
	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	// currentPage
	public String getCurrentPage() {
		String returnValue = null;
		returnValue = this.currentPage;
		return returnValue;
	}
	
	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}
	
	// lastPageVisited
	public String getLastPageVisited() {
		String returnValue = null;
		returnValue = this.lastPageVisited;
		return returnValue;
	}
	
	public void setLastPageVisited(String lastPageVisited) {
		this.lastPageVisited = lastPageVisited;
	}
	
	// authTime
	public String getAuthTime() {
		String returnValue = null;
		returnValue = this.authTime;
		return returnValue;
	}
	
	public void setAuthTime(String authTime) {
		this.authTime = authTime;
	}
	
	// authenticated
	public boolean getAuthenticated() {
		boolean returnValue = false;
		returnValue = this.authenticated;
		return returnValue;
	}
	
	public void setAuthenticated(boolean authenticated) {
		this.authenticated = authenticated;
	}
	
	
	//**********************************************************************
	// Constructors
	//**********************************************************************
	public AuthMod() {
		/* 
		 * A class with a zero-argument constructor is subject to being instantiated in an invalid state.
		 * If such a class is instantiated manually by a developer (rather than automatically by some kind of framework), 
		 * the developer might not realize that the class has been improperly instantiated. 
		 * The compiler cannot detect such a problem, and even if it is documented, there is no guarantee that the developer will see the documentation.
		 */
	}
	
	public AuthMod(HttpServletRequest request, HttpServletResponse response) {
		
		this.request = request;
		this.response = response;
		
	}
	
	//**********************************************************************
	// Methods
	//**********************************************************************
	//----------------------------------------------------------------------
	//Authenticate: Authenticates Users when a page loads. 
	//----------------------------------------------------------------------
	public boolean authenticate() {
		String callingMethod = Thread.currentThread().getStackTrace()[2].getClassName() + "." + Thread.currentThread().getStackTrace()[2].getMethodName();
		
		boolean returnValue = false;
		
		try {
			
			// Set lastVisitedPageName 
			String uri = request.getRequestURI();
			String pageName = uri.substring(uri.lastIndexOf("/")+1);
			request.setAttribute("pageName", pageName);
			String greeting = "";
		
			// Authenticate the User via Cookie; populate memberID and authTime fields.
			if(Login.authenticateToken(this.request)) {
				greeting = Login.getGreeting(Integer.parseInt(this.request.getAttribute("TokenMemberID").toString()), this.request, this.response, true);
				this.memberID = Integer.parseInt(request.getAttribute("verifyToken_MemberID").toString());
				this.authTime = request.getAttribute("verifyToken_CreateTime").toString();
				this.authenticated = true;
			} else {
				this.authenticated = false;
				this.memberID = 0;
				greeting = Login.getGreeting(this.memberID, this.request, this.response, false);
			}	

			request.setAttribute("Greeting", greeting);
			returnValue = true;
		
		} catch(Exception ex) {
			returnValue = false;
			System.out.println("Calling Method: " + callingMethod);
			ex.printStackTrace();
		}
		
		return returnValue;
	}
	
	
}
