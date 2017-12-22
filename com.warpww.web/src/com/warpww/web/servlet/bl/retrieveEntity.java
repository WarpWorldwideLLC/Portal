package com.warpww.web.servlet.bl;

// https://stackoverflow.com/questions/2793150/using-java-net-urlconnection-to-fire-and-handle-http-requests

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

/**
 * Servlet implementation class retrieveEntity
 */
@WebServlet("/retrieveEntity")
public class retrieveEntity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public retrieveEntity() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String statusCode =  getClass().getName() + ".doGet()" + ".." + System.currentTimeMillis() + ";";
		String statusCode2 = (String) request.getAttribute("ResultCode"); 
		statusCode2 += statusCode;
		request.setAttribute("ResultCode", statusCode2);
		
		
		response.getWriter().append("HTTP GET method is not supported. Please use HTTP POST to interact with this service.").append(request.getContextPath());

		// doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String statusCode =  getClass().getName() + ".doGet()" + ".." + System.currentTimeMillis() + ";";
		String statusCode2 = (String) request.getAttribute("ResultCode"); 
		statusCode2 += statusCode;
		request.setAttribute("ResultCode", statusCode2);
		
		//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/getEntity");
		//dispatcher.include(request, response);
		
		String url = "http://localhost:8080/com.warpww.web/getEntity";
		//String charset = "UTF-8";  // Or in Java 7 and later, use the constant: java.nio.charset.StandardCharsets.UTF_8.name()
		String charset = java.nio.charset.StandardCharsets.UTF_8.name();
		String param1 = "1";
		String param2 = "value2";
		// ...

		String query = String.format("param1=%s&param2=%s", 
		     URLEncoder.encode(param1, charset), 
		     URLEncoder.encode(param2, charset));
	
		URLConnection connection = new URL(url).openConnection();
		connection.setDoOutput(true); // Triggers POST.
		connection.setRequestProperty("Accept-Charset", charset);
		connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=" + charset);

		try (OutputStream output = connection.getOutputStream()) {
		    output.write(query.getBytes(charset));
		}

		InputStream postResponse = connection.getInputStream();
		
		
	}

}
