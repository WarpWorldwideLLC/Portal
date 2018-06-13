package com.warpww.web.servlet.lingo;

import java.io.BufferedReader;  
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;  

import java.io.PrintWriter;
import java.net.URL;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;  


import org.apache.commons.codec.binary.Base64;

public class Test {

	public enum Environment {
		Test, Prod
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

	
	public static String sendHttpsPost(String POST_URL,String params, Environment envValue) throws IOException {
		String result = "";  
		
		String name = "";
		String password = "";
		String authString = "";
		
		switch(envValue) {
		
		// Production
		case Prod:
			name = "3945";
			password = "fJuWlfiB";
		
		// Test
		default:
			name = "2544";
			password = "fkelJ4bD";
			
		}
		
		authString = name + ":" + password;
		
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
