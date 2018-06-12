package com.warpww.ell;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringReader;
import java.net.URL;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Properties;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;

import com.warpww.pymt.hsc;
import com.warpww.sec.DES;
import com.warpww.web.servlet.lingo.Test;

public class ellutil {
	
	private String nullVar = "fkelJ4bD";
	
	private String ellUserID = "";
	private String clientID = "2544";
	private String userName = "";
	private String password = "";
	private String email = "";
	private String firstName = "";
	private String lastName = "";
	private String birthDate = "";
	private String language = "";
	private String country = "";
	
	
	// Constructor
	public ellutil() {
		
	}
	
	public boolean getMemberDataFromDb(int memberID, HttpServletRequest request, HttpServletResponse response) {
		boolean returnValue = false;

		
		try {
			
			String commandValue = "GetEllNewUserData";
			
			// Create the command JSON
			String json = Json.createObjectBuilder()
					 .add("Command", commandValue)
					 .add("AuID", 1)
					 .add("IuID", 1)
					 .add("MemberID", memberID)
					 .build()
					 .toString(); 		

			String jsonParms = "";

			jsonParms = json;
			request.setAttribute("CommandText", jsonParms);
			
			// Retrieve the shopping cart information in JSON format.
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/dbProcess");
			dispatcher.include(request, response);
					
			System.out.println(request.getAttribute("CommandResults"));
			
			// Load and Parse the InputJSON
			if(request.getAttribute("CommandResults") != null ) {
				JsonReader reader = Json.createReader(new StringReader(request.getAttribute("CommandResults").toString()));
				JsonObject originalDoc = reader.readObject();
				String jsonResults = originalDoc.getJsonString("Country").toString();
				System.out.println("ellUtil User Data: " +jsonResults);
				
				this.ellUserID = originalDoc.getJsonString("MemberName").toString().replaceAll("\"", "");
				this.password =  originalDoc.getJsonString("Password").toString().replaceAll("\"", "");
				this.email =  originalDoc.getJsonString("Email").toString().replaceAll("\"", "");
				this.firstName = originalDoc.getJsonString("FirstName").toString().replaceAll("\"", "");
				this.lastName =  originalDoc.getJsonString("LastName").toString().replaceAll("\"", "");
				this.birthDate =  originalDoc.getJsonString("BirthDate").toString().replaceAll("\"", "");
				
				this.language =  originalDoc.getJsonString("Country").toString().replaceAll("\"", "");
				this.country =  originalDoc.getJsonString("Country").toString().replaceAll("\"", "");
				
			}

			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		
		return returnValue;
	}
	
	public boolean createNewUser() {
		boolean returnValue = false;
		
		//String url = "https://lms.ellcampus.com/user/create";
		String url = "https://api.elldevelopment.com/user/create";
		String param = "clientId=" + this.clientID
				+ "&username=" + this.ellUserID 
				+ "&password=" + this.password
				+ "&email=" + this.email
				+ "&firstName=" + this.firstName
				+ "&lastName=" + this.lastName
				+ "&birthdate=" + this.birthDate
				+ "&language=english"
				+ "&country=China";
		
		try {
			
			System.out.println(sendHttpsPost(url,param));
		
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return returnValue;
	}
	
	public boolean assignLicense() {
		boolean returnValue = false;
		
		String url = "https://api.ellcampus.com/license/assign";
		String param = "clientId=2544&userId=229460&licenseId=1542";
		
		try {
			System.out.println(Test.sendHttpsPost(url,param));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return returnValue;
		
	}
	
	public int setSolutionCredentials() {
		int returnValue = -1;
		
		
		
		return returnValue;
	}
	
	public String encryptCredentials(String inputValue) {
		String returnValue = null;
		
		try {
			
			returnValue = DES.encrypt2(this.nullVar, inputValue);
			
		} catch (Throwable e) {
			
			e.printStackTrace();
		}
		
		return returnValue;
	}
	
	
	
	public static SSLSocketFactory init() throws Exception { 
		
		class MyX509TrustManager implements X509TrustManager {
			public MyX509TrustManager() throws Exception {}  
	
			@Override
			public void checkClientTrusted(X509Certificate[] chain,  String authType) throws CertificateException {}  
	
			@Override
			public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {}
	
			@Override
			public X509Certificate[] getAcceptedIssuers() {  
	
				return new X509Certificate[] {};  
			}  
		} 
		
		TrustManager[] tm = { new MyX509TrustManager() };  
	
		System.setProperty("https.protocols", "TLSv1");  
	
		SSLContext sslContext = SSLContext.getInstance("TLSv1","SunJSSE");  
		sslContext.init(null, tm, new java.security.SecureRandom());  
		SSLSocketFactory ssf = sslContext.getSocketFactory();  
	
		return ssf;  
	}

	/** 
     *  
     * @param POST_URL 
     * @param token 
     * @return
     * @throwsIOException
     */
	public static String sendHttpsPost(String POST_URL,String params) throws IOException {
		String result = "";  
		String name = "2544";//provided by ELL
		String password = "fkelJ4bD";// provided by ELL
		String authString = name + ":" + password;
		
		System.out.println("POST_URL: " + POST_URL);
		System.out.println("params: " + params);
	
		byte[] authEncBytes = Base64.encodeBase64(authString.getBytes());
		String authStringEnc = new String(authEncBytes);
	
		URL myURL = new URL(POST_URL);
		HttpsURLConnection con = (HttpsURLConnection) myURL.openConnection();  
		con.setRequestProperty("Authorization", "Basic " + authStringEnc);

		HostnameVerifier hostNameVerify = new HostnameVerifier() {
			public boolean verify(String urlHostName, SSLSession session) { 
				return true;
			}
        };  

        con.setHostnameVerifier(hostNameVerify); 

        try {
        		con.setSSLSocketFactory(init()); 
        } catch (Exception e1) {
        		throw new IOException(e1);  
        }

		con.setDoOutput(true);      
		con.setDoInput(true);      
		con.setRequestMethod("POST");      
		con.setUseCaches(false);      
		con.setInstanceFollowRedirects(true);      
		con.setRequestProperty("Content-Type "," application/x-www-form-urlencoded ");      
	
		con.connect();   

		PrintWriter out = new PrintWriter(con.getOutputStream());
		out.print(params); 

		out.flush(); 
		out.close(); 
	
		System.out.println("Response Code: " + con.getResponseCode());
		System.out.println("Response Message: " + con.getResponseMessage());
		
		InputStream _is;
		if (con.getResponseCode() < HttpsURLConnection.HTTP_BAD_REQUEST) {
		    _is = con.getInputStream();
		} else {
		     /* error from server */
		    _is = con.getErrorStream();
		}
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(_is));
		
		/*
		BufferedReader reader = new BufferedReader(
				new InputStreamReader( 
						con.getInputStream()
				)
		); 
		*/
		
        String line; 

		while ((line = reader.readLine()) != null) { 
			result += line;
		        } 
		reader.close(); 
		con.disconnect();
	
		return result;
    }
}
