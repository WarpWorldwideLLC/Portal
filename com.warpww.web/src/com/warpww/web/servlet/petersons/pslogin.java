package com.warpww.web.servlet.petersons;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//*********************************************
// AES Encrypt Libraries
//*********************************************
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

import javax.crypto.Mac;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import java.security.Key;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.MessageDigest;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.Security;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.RSAPrivateKeySpec;
import java.security.spec.RSAPublicKeySpec;
import java.security.spec.X509EncodedKeySpec;

import com.warpww.sec.AES;

import org.bouncycastle.jce.provider.BouncyCastleProvider;
//*********************************************
//XML Libraries
//*********************************************
import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.commons.codec.binary.Base64;

/**
 * Servlet implementation class pslogin
 */
@WebServlet("/pslogin")
public class pslogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Environment to perform POST
	private final String USER_AGENT = "Mozilla/5.0";

	
	// Clear Text Payload to be encrypted.
	private String clearPayload = null;
	// AES CBC Encrypted Payload - Base64 Encoded.
	private String userData = null;
	
	// Dynamically generated AES Key and IV - both Base64 Encoded
	private String aesKey = null;
	private byte[] aesKeyByte = null;
	private String aesIv = null;

	// BASE64 AES Key Encrypted with Peterson's public key AND Base64 Encoded.
	private String postKey = null;
	
	// Provided by Peterson's.
	private String clientId = "empty for now";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public pslogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			
			AES a = new AES();
			a.Hello();
			// Create Data to Post - format to be defined by Peterson's.
			clearPayload = genPayload("TCH001", "STUD001");
			System.out.println("\nPayload Generated: " + clearPayload);
			
			// Straight AES Encryption
			//aesEncrypt();
			
			// Encrypt the payload with AES CBC Encryption
			//String shortKey = "ABCD";
	        //String key = "abcdefghijklmop";
	        //String clean = "Quisque eget odio ac lectus vestibulum faucibus eget.";
			
			
			// AES Encrypt the payload.
	        byte[] encrypted = aesivEncrypt(clearPayload, false);
	        System.out.println("\nBase64 Encoded AES Encrypted Payload: " + new String(Base64.encodeBase64(encrypted)));
	        
	        
	        // Decrypt the payload to see if encryption worked.
	        String decrypted = aesivDecrypt(encrypted, new String(Base64.decodeBase64(aesKey)), false);
	        System.out.println("Decrypted Value: " + decrypted);
	        System.out.println("aesKey: " + aesKey);
	        System.out.println("userData: " + userData);
	        
	        // RSA Encryption
	        rsaEncrypt(aesKey);
	        String decValue = rsaDecrypt(postKey);
	        
	        String postResponse = "";
			
			postResponse = sendPost2();
			response.getWriter().append(postResponse);
			
		} catch (Exception ex)
		{
			ex.printStackTrace();
		}
		response.getWriter().append("Served at: " + System.currentTimeMillis() + " ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected String genPayload (String TeacherID, String StudentID)
	{
		String returnValue = null;
				
		 try {

				DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder docBuilder = docFactory.newDocumentBuilder();

				// root elements
				Document doc = docBuilder.newDocument();
				Element rootElement = doc.createElement("PetersonsSso");
				doc.appendChild(rootElement);

				// staff elements
				Element staff = doc.createElement("Staff");
				rootElement.appendChild(staff);

				// set attribute to staff element
				Attr attr = doc.createAttribute("id");
				attr.setValue("1");
				staff.setAttributeNode(attr);

				// shorten way
				// staff.setAttribute("id", "1");

				// firstname elements
				Element firstname = doc.createElement("firstname");
				firstname.appendChild(doc.createTextNode("yong"));
				staff.appendChild(firstname);

				// lastname elements
				Element lastname = doc.createElement("lastname");
				lastname.appendChild(doc.createTextNode("mook kim"));
				staff.appendChild(lastname);

				// nickname elements
				Element nickname = doc.createElement("nickname");
				nickname.appendChild(doc.createTextNode("mkyong"));
				staff.appendChild(nickname);

				// salary elements
				Element salary = doc.createElement("salary");
				salary.appendChild(doc.createTextNode("100000"));
				staff.appendChild(salary);

				// write the content into xml file
				TransformerFactory transformerFactory = TransformerFactory.newInstance();
				Transformer transformer = transformerFactory.newTransformer();
				DOMSource source = new DOMSource(doc);
				//StreamResult result = new StreamResult(new File("\\file.xml"));

				// Output to console for testing
				//StreamResult result = new StreamResult(System.out);
				//transformer.transform(source, result);
				
				// Store StreamResult in returnValue
				StringWriter writer = new StringWriter();
				transformer.transform(new DOMSource(doc), new StreamResult(writer));
				String output = writer.getBuffer().toString().replaceAll("\n|\r", "");
								
				returnValue = output;
				

			  } catch (ParserConfigurationException pce) {
				pce.printStackTrace();
			  } catch (TransformerException tfe) {
				tfe.printStackTrace();
			  }
		
		return returnValue;
	}

	protected void aesEncrypt() throws Exception
	{
		String encryptedText = null;
        String decryptedText = null;

        KeyGenerator KeyGen = KeyGenerator.getInstance("AES");
        KeyGen.init(128);

        SecretKey SecKey = KeyGen.generateKey();

        Cipher AesCipher = Cipher.getInstance("AES");

        byte[] byteText = "Your Plain Text Here".getBytes();
        System.out.println("byteText: " + new String(byteText));
        	
        	// Encrypt the text
        AesCipher.init(Cipher.ENCRYPT_MODE, SecKey);
        byte[] byteCipherText = AesCipher.doFinal(byteText);
        System.out.println("byteCipherText: " + new String(byteCipherText));

        // Decrypt the text
        AesCipher.init(Cipher.DECRYPT_MODE, SecKey);
        byte[] bytePlainText = AesCipher.doFinal(byteCipherText);
        System.out.println("Decrypted Text: " + new String(bytePlainText));
        
	}
	
    public byte[] aesivEncrypt(String plainText, boolean IncludeIV) throws Exception {
        byte[] clean = plainText.getBytes();
        byte[] returnValue = null;
        
        
        // Generating IV.
        int ivSize = 16;
        byte[] iv = new byte[ivSize];
        SecureRandom random = new SecureRandom();
        random.nextBytes(iv);
        IvParameterSpec ivParameterSpec = new IvParameterSpec(iv);
        aesIv = Base64.encodeBase64String(iv);

        // Generate Key - Way 1
        KeyGenerator KeyGen = KeyGenerator.getInstance("AES");
        KeyGen.init(128);
        SecretKey SecKey = KeyGen.generateKey();

        // Generate a random key value.
        byte[] tempKeyBytes = new byte[16];        
        	random = new SecureRandom();
        random.nextBytes(tempKeyBytes);
        String key = new String(tempKeyBytes);
        
        // Hashing key.
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        digest.update(key.getBytes("UTF-8"));
        byte[] keyBytes = new byte[16];
        System.arraycopy(digest.digest(), 0, keyBytes, 0, keyBytes.length);
        SecretKeySpec secretKeySpec = new SecretKeySpec(keyBytes, "AES");
        aesKeyByte = keyBytes;
        aesKey = Base64.encodeBase64String(keyBytes);

        // Encrypt.
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec, ivParameterSpec);
        byte[] encrypted = cipher.doFinal(clean);
        returnValue = encrypted;
        userData = Base64.encodeBase64String(encrypted);

        // Combine IV and encrypted part.
        if(IncludeIV)
        {
	        byte[] encryptedIVAndText = new byte[ivSize + encrypted.length];
	        System.arraycopy(iv, 0, encryptedIVAndText, 0, ivSize);
	        System.arraycopy(encrypted, 0, encryptedIVAndText, ivSize, encrypted.length);
	        returnValue = encryptedIVAndText;
	    }
        
        return returnValue;
    }

    public String aesivDecrypt(byte[] encryptedIvTextBytes, String key, boolean IncludeIv) throws Exception {
        
    		
    		//int ivSize = 16;
        int keySize = 16;

        // Extract IV.
        //byte[] iv = new byte[ivSize];
        //System.arraycopy(encryptedIvTextBytes, 0, iv, 0, iv.length);
        //IvParameterSpec ivParameterSpec = new IvParameterSpec(iv);
        System.out.println("aesIv: " + aesIv);
        IvParameterSpec ivParameterSpec = new IvParameterSpec(Base64.decodeBase64(aesIv));
       
        // Extract encrypted part.
        //int encryptedSize = encryptedIvTextBytes.length - ivSize;
        //byte[] encryptedBytes = new byte[encryptedSize];
        //System.arraycopy(encryptedIvTextBytes, ivSize, encryptedBytes, 0, encryptedSize);

        byte[] encryptedBytes = Base64.decodeBase64(userData);
        
        // Hash key.
        byte[] keyBytes = new byte[keySize];
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(key.getBytes());
        System.arraycopy(md.digest(), 0, keyBytes, 0, keyBytes.length);
        //SecretKeySpec secretKeySpec = new SecretKeySpec(keyBytes, "AES");
        SecretKeySpec secretKeySpec = new SecretKeySpec(aesKeyByte, "AES");
        
        // Decrypt.
        Cipher cipherDecrypt = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipherDecrypt.init(Cipher.DECRYPT_MODE, secretKeySpec, ivParameterSpec);
        byte[] decrypted = cipherDecrypt.doFinal(encryptedBytes);

        return new String(decrypted);
    }

    // Public Key Encryption
    private void rsaEncrypt(String text) throws Exception
    {
    
	    	String publicModulus = "mbN7+icC8rd1VpTGayh7JJVph4nla9UW35MjfLGSI0mjUART3N48U3MrR3x5gG1NbmcAakJp/yEhfeaWhj5rDKzz4tdbfEynXpME4U6UEOKabh/OfXSsnLTQ7Dqq3A2L4szIk5ehmFW5hqJX6DjVZAIPlyIHUeFTbb3PoIjjorc=";
	    	String publicExponent = "AQAB";
	    	
	    	byte[] bytMod = Base64.decodeBase64(publicModulus.trim());
	    	byte[] bytExp = Base64.decodeBase64(publicExponent.trim());
	    	
	    	BigInteger modulus = new BigInteger(1, bytMod);
	    BigInteger pubExp = new BigInteger(1, bytExp);

	    
	    System.out.println("nMod: " + modulus);
	    System.out.println("nExp: " + pubExp);
	    
	
	    KeyFactory keyFactory = KeyFactory.getInstance("RSA");
	    RSAPublicKeySpec pubKeySpec = new RSAPublicKeySpec(modulus, pubExp);
	    RSAPublicKey key = (RSAPublicKey) keyFactory.generatePublic(pubKeySpec);
	
	    Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
	    cipher.init(Cipher.ENCRYPT_MODE, key);
	
	    System.out.println("Data to enc: " + text + " / " + text.length());
	    byte[] cipherData = cipher.doFinal(text.getBytes());
	    postKey = Base64.encodeBase64String(cipherData);
    }
    
    private byte[] decodeBase64(String dataToDecode)
    {
        byte[] dataDecoded = Base64.decodeBase64(dataToDecode);
        return dataDecoded;
    }
    
    private String rsaDecrypt(String encryptedText) throws Exception
    {
    	String modulus = "mbN7+icC8rd1VpTGayh7JJVph4nla9UW35MjfLGSI0mjUART3N48U3MrR3x5gG1NbmcAakJp/yEhfeaWhj5rDKzz4tdbfEynXpME4U6UEOKabh/OfXSsnLTQ7Dqq3A2L4szIk5ehmFW5hqJX6DjVZAIPlyIHUeFTbb3PoIjjorc=";
        String dD = "ACQF7Qi0G/zHArlIJTj4Q+RPIGyj5SFgz/uWgLq444dhuuUGHqGldH4agApBIjj3ZS569Z3x8uXY3gCkCqNr/aqdvKs6aEw/jwLE487bUzxUSiudEdXNqx6Qlu7cESiyl6E6C6oaqriBO8DCRXnOniad6Q30mtQt4GO/nFvsBAE="; 
 
        // <RSAKeyValue>
        // <Modulus>mbN7+icC8rd1VpTGayh7JJVph4nla9UW35MjfLGSI0mjUART3N48U3MrR3x5gG1NbmcAakJp/yEhfeaWhj5rDKzz4tdbfEynXpME4U6UEOKabh/OfXSsnLTQ7Dqq3A2L4szIk5ehmFW5hqJX6DjVZAIPlyIHUeFTbb3PoIjjorc=</Modulus>
        // <Exponent>AQAB</Exponent>
        // <P>0fWWUpEajHK3uNPH/TUrr2QxVSB9U5ggZq6fY0HZk/COMiJb0n8B+42k1bYQOj5zWKq+VQNJclyp3g+UzzM+gQ==</P>
        // <Q>u2e/3hCrwNFpuHtvu3gZ3+dORWONeIgD1+i1l2juJVWqtaJqVMm8BQimGVQK3A6WD4hh6BHA0lq88NCnUbC1Nw==</Q>
        // <DP>wYpdM2dGzcjBysKOS77Dsj3tq8bzQCevVngJvPlqk5Dfwx8g/XzOWxBKriXR956xvT5HjR4miiEZBPXf+tAGAQ==</DP>
        // <DQ>CPV7waTwYQZh1HTqMX8bVY3cOwr4T2PJM0AntjZI9DX1NDuwc581QtRYBGv1HPIBkHqHm62Fl0jJMYX4Cbq13w==</DQ>
        // <InverseQ>S9Tf8dhF/LfmEK1KzDgY8qJb7sYiiRAded7APZXri1qX3uOb3gvTsQUAuemAxsu3Ia7j+xN2K8ZRd0q2Q4JIRg==</InverseQ>
        // <D>ACQF7Qi0G/zHArlIJTj4Q+RPIGyj5SFgz/uWgLq444dhuuUGHqGldH4agApBIjj3ZS569Z3x8uXY3gCkCqNr/aqdvKs6aEw/jwLE487bUzxUSiudEdXNqx6Qlu7cESiyl6E6C6oaqriBO8DCRXnOniad6Q30mtQt4GO/nFvsBAE=</D>
        // </RSAKeyValue>"

        
        byte[] modBytes = decodeBase64(modulus.trim());
        byte[] dBytes = decodeBase64(dD.trim());

        BigInteger modules = new BigInteger(1, modBytes);
        BigInteger d = new BigInteger(1, dBytes);

        KeyFactory factory = KeyFactory.getInstance("RSA");
        Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");

        RSAPrivateKeySpec privSpec = new RSAPrivateKeySpec(modules, d);
        PrivateKey privKey = factory.generatePrivate(privSpec);
        cipher.init(Cipher.DECRYPT_MODE, privKey);
        byte[] decrypted = cipher.doFinal(decodeBase64(encryptedText));
        String originalKey = new String(decrypted);
        System.out.println(originalKey);
        return originalKey;
    }
    
    // 

	private String sendPost2() throws Exception {
		// https://stackoverflow.com/questions/24418118/getting-http-response-code-500-for-posting-on-localhost
		
		// String url = "http://warp.eastasia.cloudapp.azure.com/warp/olc/authenticate";
		String url = "http://warpauth.petersons.com/olc/authenticate";
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
		String urlParameters = "userData=" + userData
				+ "&clientId=111"
				+ "&symIV=NA"
				+ "&symKey=" + aesKey;

		// Send post request
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(urlParameters);
		wr.flush();
		wr.close();

		int responseCode = con.getResponseCode();
		System.out.println(responseCode);

		InputStream _is;
		
		if (con.getResponseCode() < HttpURLConnection.HTTP_BAD_REQUEST) {
		    _is = con.getInputStream();
		} else {
		     /* error from server */
		    _is = con.getErrorStream();
		}
		
		BufferedReader in = new BufferedReader(new InputStreamReader(_is));
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

}

