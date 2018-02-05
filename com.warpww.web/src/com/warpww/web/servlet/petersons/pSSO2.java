package com.warpww.web.servlet.petersons;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.warpww.sec.AES;
import com.warpww.sec.RSA;

/**
 * Integration Gateway ba18 - Peterson's Clear Integration
 */
@WebServlet("/pSSO2")
public class pSSO2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pSSO2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		  String payload = "<proxieduser><ACCESSCODE>BELLEVUE13</ACCESSCODE><SPONSORID>1</SPONSORID><SUBSPONSORID>1</SUBSPONSORID><USERID>ddsr3rffssd</USERID><ROLEID>6</ROLEID><GRADEID>12058</GRADEID><CLASSID>0</CLASSID><FNAME>ddsfdasf</FNAME><LNAME>sdsdsd</LNAME><EMAIL>myemail@petersons.com</EMAIL><STREETADDRESS>sstreet</STREETADDRESS><GRADUATIONYEAR>2021</GRADUATIONYEAR><applicationid>2</applicationid><errorurl>Error.aspx</errorurl><RETURNURL>Login.htm</RETURNURL><SELTESTCATEGORY>SAT2016</SELTESTCATEGORY><TESTDATE>1/2/2004</TESTDATE><TESTACTIVATIONDATE>1/1/2004</TESTACTIVATIONDATE><TESTEXPIREDATE>1/1/2004</TESTEXPIREDATE><RegDate>1/1/2004</RegDate><REGISTRATIONDATE>1/1/2004</REGISTRATIONDATE><Gender></Gender><Ethnicity></Ethnicity><County>DuPage</County><State>Illinois</State><Nation>USA</Nation><DISTRICTNAME></DISTRICTNAME><SCHOOLNAME></SCHOOLNAME><GRADENAME></GRADENAME><CLASSNAME></CLASSNAME><EconoDisadvantaged></EconoDisadvantaged><LimitedEng></LimitedEng><SpecialEducation></SpecialEducation><GradeCategoryId></GradeCategoryId><opinionservice></opinionservice><OnlineTutoring></OnlineTutoring></proxieduser>";
		
		// Instantiate the AES crypto object
		AES aes = new AES();
		
		// Encrypt the Data
		try 
		{
			//String s = genPayload("1234", "ABCD");
			String s = payload;
			
			aes.aesEncrypt(s);
			/* 
			aes.setClearData(s.getBytes("UTF-8"));
			aes.genInitializationVector();
			aes.genAesKeyBytes();
			aes.aesivEncrypt(false);
			aes.aesivDecrypt(false);
			aes.printDebugInfo();
			*/
	
		} catch (Exception ex)
		{
			ex.printStackTrace();
		}
		
		
		// Instantiate the RSA crypto object.
		/*
		RSA rsa = new RSA();
		
		try 
		{
			rsa.SetClearData64(aes.getKeyBase64());
			rsa.Encrypt();
			rsa.Decrypt();
			rsa.printDebugInfo();
		} catch (Exception ex)
		{
			ex.printStackTrace();
		}
		
		try
		{
			String postResponse = "";
			// Encrypted POST
			// postResponse = sendPost2(aes.getEncryptedDataBase64(), "111", aes.getInitVectorBase64(), rsa.getEncryptedData64());
			
			// Clear POST
			//String vToken = "E21vDQ1pfVBZnspJsel1sJ9daYLPFAyvCNe7YG-VO7p6y-dYFdj0f2K1H3h8ZuGxLuzBCjKCLFzAVuy8P0qasgD984gS8Df8AKMX2P4aJHw1";
			//postResponse = sendPost3(vToken, "john.arp@warpww.com", "John", "Arp", "john.arp@warpww.com", "OCAD");
			
			//response.getWriter().append(postResponse);
		} catch (Exception ex)
		{
			ex.printStackTrace();
		}
		*/
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

	// Create the XML that is being sent to Peterson's
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
				Element teacher = doc.createElement("Teacher");
				rootElement.appendChild(teacher);

				// set attribute to staff element
				Attr attr = doc.createAttribute("id");
				attr.setValue(TeacherID);
				teacher.setAttributeNode(attr);

				Element student = doc.createElement("Student");
				rootElement.appendChild(student);
				
				// set attribute to staff element
				attr = doc.createAttribute("id");
				attr.setValue(StudentID);
				student.setAttributeNode(attr);
				
				// write the content into XML  
				TransformerFactory transformerFactory = TransformerFactory.newInstance();
				Transformer transformer = transformerFactory.newTransformer();
				//DOMSource source = new DOMSource(doc);
				//StreamResult result = new StreamResult(new File("\\file.xml"));

				// Output to console for testing
				//StreamResult result = new StreamResult(System.out);
				//transformer.transform(source, result);
				
				// Store StreamResult in returnValue
				StringWriter writer = new StringWriter();
				transformer.transform(new DOMSource(doc), new StreamResult(writer));
				String output = writer.getBuffer().toString().replaceAll("\n|\r", "");
				System.out.println("Payload: " + output);
								
				returnValue = output;
				

			  } catch (ParserConfigurationException pce) {
				pce.printStackTrace();
			  } catch (TransformerException tfe) {
				tfe.printStackTrace();
			  }
		
		return returnValue;
	}

	private String sendPost2(String userData, String clientID, String symIV, String symKey) throws Exception {
		
		String USER_AGENT = "Mozilla/5.0";
		// String url = "http://warp.eastasia.cloudapp.azure.com/warp/olc/authenticate";
		//String url = "http://warpauth.petersons.com/olc/authenticate";
		String url = "http://warpauth.petersons.com/WarpTest/authenticate";
		//String url = "http://warpauth.petersons.com/WarpTest/Plainauthenticate";
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		//add request header
		con.setRequestMethod("POST");
		con.setRequestProperty("User-Agent", USER_AGENT);
		con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
			
		String urlParameters = "userData=" + userData
				+ "&clientId=" + clientID
				+ "&symIV=" + symIV
				+ "&symKey=" + symKey;

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
		System.out.println(response.toString());
		return response.toString();

	}

	private String sendPost3(String verificationToken, String userID, String firstName, String lastName, String eMail, String testName) throws Exception {
		
		String USER_AGENT = "Mozilla/5.0";
		// String url = "http://warp.eastasia.cloudapp.azure.com/warp/olc/authenticate";
		//String url = "http://warpauth.petersons.com/olc/authenticate";
		//String url = "http://warpauth.petersons.com/WarpTest/authenticate";
		String url = "http://warpauth.petersons.com/WarpTest/Plainauthenticate";
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		//add request header
		con.setRequestMethod("POST");
		con.setRequestProperty("User-Agent", USER_AGENT);
		con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
			
		String urlParameters = "_RequestVerificationToken=" + verificationToken
				+ "&Userid=" + userID
				+ "&FirstName=" + firstName
				+ "&LastName=" + lastName
				+ "&Email=" + eMail
				+ "&TestName=" + testName;

		
		
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
		System.out.println(response.toString());
		return response.toString();

	}

	
}
