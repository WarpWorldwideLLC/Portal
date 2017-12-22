package com.warpww.web.servlet.petersons;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.ValidationException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.bouncycastle.crypto.BufferedBlockCipher;
import org.bouncycastle.crypto.CipherParameters;
import org.bouncycastle.crypto.paddings.BlockCipherPadding;
import org.bouncycastle.crypto.paddings.PKCS7Padding;
import org.bouncycastle.crypto.paddings.PaddedBufferedBlockCipher;
import org.bouncycastle.crypto.params.KeyParameter;
import org.bouncycastle.crypto.params.ParametersWithIV;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;


import org.bouncycastle.crypto.modes.CBCBlockCipher;
import org.bouncycastle.crypto.engines.AESEngine;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.security.NoSuchAlgorithmException;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;
import java.util.Random;
import java.security.*;
import javax.crypto.*;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import javax.net.ssl.HttpsURLConnection;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;

import org.bouncycastle.crypto.*;

// https://www.codeproject.com/Articles/6623/Porting-Java-Public-Key-Hash-to-C-NET
// http://www.itcsolutions.eu/2011/08/24/how-to-encrypt-decrypt-files-in-java-with-aes-in-cbc-mode-using-bouncy-castle-api-and-netbeans-or-eclipse/

/**
 * Servlet implementation class login2
 */
@WebServlet("/login2")
public class login2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static String Test_Public_Key = "<RSAKeyValue><Modulus>xTSiS4+I/x9awUXcF66Ffw7tracsQfGCn6g6k/hGkLquHYMFTCYk4mOB5NwLwqczwvl8HkQfDShGcvrm47XHKUzA8iadWdA5n4toBECzRxiCWCHm1KEg59LUD3fxTG5ogGiNxDj9wSguCIzFdUxBYq5ot2J4iLgGu0qShml5vwk=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>";
	private static String Petersons_Authentication_RSA_PUBLIC_KEY = "<RSAKeyValue><Modulus>mbN7+icC8rd1VpTGayh7JJVph4nla9UW35MjfLGSI0mjUART3N48U3MrR3x5gG1NbmcAakJp/yEhfeaWhj5rDKzz4tdbfEynXpME4U6UEOKabh/OfXSsnLTQ7Dqq3A2L4szIk5ehmFW5hqJX6DjVZAIPlyIHUeFTbb3PoIjjorc=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>";
	private static String Petersons_Authentication_RSA_KEYS = "<RSAKeyValue><Modulus>mbN7+icC8rd1VpTGayh7JJVph4nla9UW35MjfLGSI0mjUART3N48U3MrR3x5gG1NbmcAakJp/yEhfeaWhj5rDKzz4tdbfEynXpME4U6UEOKabh/OfXSsnLTQ7Dqq3A2L4szIk5ehmFW5hqJX6DjVZAIPlyIHUeFTbb3PoIjjorc=</Modulus><Exponent>AQAB</Exponent><P>0fWWUpEajHK3uNPH/TUrr2QxVSB9U5ggZq6fY0HZk/COMiJb0n8B+42k1bYQOj5zWKq+VQNJclyp3g+UzzM+gQ==</P><Q>u2e/3hCrwNFpuHtvu3gZ3+dORWONeIgD1+i1l2juJVWqtaJqVMm8BQimGVQK3A6WD4hh6BHA0lq88NCnUbC1Nw==</Q><DP>wYpdM2dGzcjBysKOS77Dsj3tq8bzQCevVngJvPlqk5Dfwx8g/XzOWxBKriXR956xvT5HjR4miiEZBPXf+tAGAQ==</DP><DQ>CPV7waTwYQZh1HTqMX8bVY3cOwr4T2PJM0AntjZI9DX1NDuwc581QtRYBGv1HPIBkHqHm62Fl0jJMYX4Cbq13w==</DQ><InverseQ>S9Tf8dhF/LfmEK1KzDgY8qJb7sYiiRAded7APZXri1qX3uOb3gvTsQUAuemAxsu3Ia7j+xN2K8ZRd0q2Q4JIRg==</InverseQ><D>ACQF7Qi0G/zHArlIJTj4Q+RPIGyj5SFgz/uWgLq444dhuuUGHqGldH4agApBIjj3ZS569Z3x8uXY3gCkCqNr/aqdvKs6aEw/jwLE487bUzxUSiudEdXNqx6Qlu7cESiyl6E6C6oaqriBO8DCRXnOniad6Q30mtQt4GO/nFvsBAE=</D></RSAKeyValue>";

	private static String publicModulus = "mbN7+icC8rd1VpTGayh7JJVph4nla9UW35MjfLGSI0mjUART3N48U3MrR3x5gG1NbmcAakJp/yEhfeaWhj5rDKzz4tdbfEynXpME4U6UEOKabh/OfXSsnLTQ7Dqq3A2L4szIk5ehmFW5hqJX6DjVZAIPlyIHUeFTbb3PoIjjorc=";
	private static String publicExponent = "AQAB";
	
	private final String USER_AGENT = "Mozilla/5.0";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login2() {
        super();
        System.out.println("Constructor Starup.");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			String postResponse = "";
			
			postResponse = sendPost();
			response.getWriter().append(postResponse);
			
		    	//String skey = "6543210987654321";
			String skey = publicModulus;
			
		    String siv = "1234567890123456";
		    
		    //parseNetPublicKey(Test_Public_Key);
		    
		    System.out.println("Complete.");
		    	

			
			

			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	
	
	// HTTP GET request
	private void sendGet() throws Exception {

		String url = "http://www.google.com/search?q=mkyong";

		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		// optional default is GET
		con.setRequestMethod("GET");

		//add request header
		con.setRequestProperty("User-Agent", USER_AGENT);

		int responseCode = con.getResponseCode();

		BufferedReader in = new BufferedReader(
		        new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		//print result
		//System.out.println(response.toString());

	}

	// HTTP POST request - Login page
	private String sendPost() throws Exception {

		String url = "http://warp.eastasia.cloudapp.azure.com/warp/WarpTest/authenticate";
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		//add request header
		con.setRequestMethod("POST");
		con.setRequestProperty("User-Agent", USER_AGENT);
		con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
		
		
		// Form item: "__RequestVerificationToken" = "3GBgOFg9tLxtHU_YKj9xxpuSC-rONZUa4-IdxNAZu_j4HPhdgzjzP-yPEQ6huToOqNLxY20xELM1PrFn_Sgvi-kM3AoLyS0QTxTVHCWRd-s1"
		// Form item: "Userid" = "jarp"
		// Form item: "FirstName" = "John"
		// Form item: "LastName" = "Arp"
		// Form item: "Email" = "test@warp.cn"
				
				
		// String urlParameters = "sn=C02G8416DRJM&cn=&locale=&caller=&num=12345";
		String urlParameters = "__RequestVerificationToken=3GBgOFg9tLxtHU_YKj9xxpuSC-rONZUa4-IdxNAZu_j4HPhdgzjzP-yPEQ6huToOqNLxY20xELM1PrFn_Sgvi-kM3AoLyS0QTxTVHCWRd-s1&Userid=jarp&FirstName=John&LastName=Arp&Email=test@warp.cn";

		// Send post request
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(urlParameters);
		wr.flush();
		wr.close();

		int responseCode = con.getResponseCode();

		BufferedReader in = new BufferedReader(
		        new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		//print result
		//System.out.println(response.toString());
		return response.toString();

	}

	// HTTP POST request - OLC
	private String sendPost2() throws Exception {

		String url = "http://warp.eastasia.cloudapp.azure.com/warp/olc/authenticate";
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		//add reuqest header
		con.setRequestMethod("POST");
		con.setRequestProperty("User-Agent", USER_AGENT);
		con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
		
		
		// Form item: Form item: "userData" = "8qt4D+9hKjvEJeOPRGX1OwYPuXtsC/XTjFzjqGIVcJ7n+D8KexUKTJfyNg751YFbdUtiL0HJFQwAaVxISQsPO/13famJGQNzSykCgQwaqjicmPdOb7Zq2enCif77oKaYZ3DVylEoXFcm6QIcu554bU4T13bgRww5WLECdoX+cDIuuMPH8P1Raqdq1pBl43BrHOcMUuHwVeuFciqcbimPvH
		// Form item: Form item: "clientId" = "111"
		// Form item: Form item: "symKey" = "P4M8yHsRQvCgv3EtrXYSQ+lmKEfYj1ccs6BDyfBBuEsBtZzBT2Fix4sd6nJKLZwcAGAZSQEoqkQqWr9ZK96jMj8dCTPdZubn4FQAyPx/J/pxN41O+l7JlxFsZkH8XAmdvoBY6DusSvyl3ZYXw/oxox/m+x1PW5IUTOL2APUE20I="
		
		/*              
			 string userData = encryptedData;
			 string clientId = "empty for now"
	         string symIV = "N/A";
            	 string symKey = encryptedKey;

		
		
		 */
				
		// String urlParameters = "sn=C02G8416DRJM&cn=&locale=&caller=&num=12345";
		String urlParameters = "userData=3GBgOFg9tLxtHU_YKj9xxpuSC-rONZUa4-IdxNAZu_j4HPhdgzjzP-yPEQ6huToOqNLxY20xELM1PrFn_Sgvi-kM3AoLyS0QTxTVHCWRd-s1"
				+ "&clientId=111"
				+ "&symKey=P4M8yHsRQvCgv3EtrXYSQ+lmKEfYj1ccs6BDyfBBuEsBtZzBT2Fix4sd6nJKLZwcAGAZSQEoqkQqWr9ZK96jMj8dCTPdZubn4FQAyPx/J/pxN41O+l7JlxFsZkH8XAmdvoBY6DusSvyl3ZYXw/oxox/m+x1PW5IUTOL2APUE20I=";

		// Send post request
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(urlParameters);
		wr.flush();
		wr.close();

		int responseCode = con.getResponseCode();


		BufferedReader in = new BufferedReader(
		        new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		//print result
		//System.out.println(response.toString());
		return response.toString();

	}

	// HTTP POST - AuthRemote.aspx
	private void sendPost3() throws Exception {

		String url = "http://warp.eastasia.cloudapp.azure.com/AuthRemote.aspx";
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		//add reuqest header
		con.setRequestMethod("POST");
		con.setRequestProperty("User-Agent", USER_AGENT);
		con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
		
		
		// Form item: "DAT" = "XbLWNboWF9W0ykFZkz2UTS7ap3WceMLsLYXcYYr0RByLjlqJRPj6ImIp4R+74yPRDzobjoBMYdC1yLUwytv4RG+o6zcM8rW4Iors6f8myWxT4rnmQleDem9lzDX3cTXa+YQQsJDafDB81Jdzx4HHr8weStabwql7SB3qr/5cI2WVSeNgD2VWmc+om4GEn4hkIFIb685ROMomtmyq0x17cJscVQC
		// Form item: "publickey" = "Peterson"
		// Form item: "from" = "local"
		// Form item: "IV" = "kkP4tzCoou+TDtJRYhbOfxSoSsMcWyUF9EOArcVSSc4="
		// Form item: "encryptedKey" = "DJUBrpf4rPiJK66YjRaVmt+xSkqZl5aJNsjgktHA9vIBA6QtLGb4hoUN8egAvTLze0snDsD1WTwciOA4TuvFFjnfTx2zJ0V0ntYGr5mexVbYlnhREw7Ywcp1eYelE2c93EBz8pMy1tB8j5gEZNhGrbeplXDydqQ1GB6P5fA6IT8="
				
				
		// String urlParameters = "sn=C02G8416DRJM&cn=&locale=&caller=&num=12345";
		String urlParameters = "DAT=XbLWNboWF9W0ykFZkz2UTS7ap3WceMLsLYXcYYr0RByLjlqJRPj6ImIp4R+74yPRDzobjoBMYdC1yLUwytv4RG+o6zcM8rW4Iors6f8myWxT4rnmQleDem9lzDX3cTXa+YQQsJDafDB81Jdzx4HHr8weStabwql7SB3qr/5cI2WVSeNgD2VWmc+om4GEn4hkIFIb685ROMomtmyq0x17cJscVQC";
		urlParameters += "&publickey=Peterson";
		urlParameters += "&from=local";
		urlParameters += "&IV=kkP4tzCoou+TDtJRYhbOfxSoSsMcWyUF9EOArcVSSc4=";
		urlParameters += "&encryptedKey=DJUBrpf4rPiJK66YjRaVmt+xSkqZl5aJNsjgktHA9vIBA6QtLGb4hoUN8egAvTLze0snDsD1WTwciOA4TuvFFjnfTx2zJ0V0ntYGr5mexVbYlnhREw7Ywcp1eYelE2c93EBz8pMy1tB8j5gEZNhGrbeplXDydqQ1GB6P5fA6IT8=";
							

		// Send post request
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(urlParameters);
		wr.flush();
		wr.close();

		int responseCode = con.getResponseCode();


		BufferedReader in = new BufferedReader(
		        new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		//print result
		//System.out.println(response.toString());

	}
	
  
}
