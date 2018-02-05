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

import com.warpww.sec.Rijndael;

/**
 * Integration Gatway ba18 - Peterson's Clear
 */
@WebServlet("/gwba18")
public class gwba18 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public gwba18() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String data = genPayload("test", "test");
		try {
			
			Rijndael r = new Rijndael();
			r.warpKey();
			r.warpEncrypt();
			
			// String postResponse = sendPost("BELLEVUE13", "JohnnyWarp", "Johnny", "Warp", "myemail@petersons.com", "SAT2016");
			// response.getWriter().append(postResponse);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// String verificationToken, String userID, String firstName, String lastName, String eMail, String testName
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
		String payload = "<proxieduser><ACCESSCODE>BELLEVUE13</ACCESSCODE><SPONSORID>1</SPONSORID><SUBSPONSORID>1</SUBSPONSORID><USERID>ddsr3rffssd</USERID><ROLEID>6</ROLEID><GRADEID>12058</GRADEID><CLASSID>0</CLASSID><FNAME>ddsfdasf</FNAME><LNAME>sdsdsd</LNAME><EMAIL>myemail@petersons.com</EMAIL><STREETADDRESS>sstreet</STREETADDRESS><GRADUATIONYEAR>2021</GRADUATIONYEAR><applicationid>2</applicationid><errorurl>Error.aspx</errorurl><RETURNURL>Login.htm</RETURNURL><SELTESTCATEGORY>SAT2016</SELTESTCATEGORY><TESTDATE>1/2/2004</TESTDATE><TESTACTIVATIONDATE>1/1/2004</TESTACTIVATIONDATE><TESTEXPIREDATE>1/1/2004</TESTEXPIREDATE><RegDate>1/1/2004</RegDate><REGISTRATIONDATE>1/1/2004</REGISTRATIONDATE><Gender></Gender><Ethnicity></Ethnicity><County>DuPage</County><State>Illinois</State><Nation>USA</Nation><DISTRICTNAME></DISTRICTNAME><SCHOOLNAME></SCHOOLNAME><GRADENAME></GRADENAME><CLASSNAME></CLASSNAME><EconoDisadvantaged></EconoDisadvantaged><LimitedEng></LimitedEng><SpecialEducation></SpecialEducation><GradeCategoryId></GradeCategoryId><opinionservice></opinionservice><OnlineTutoring></OnlineTutoring></proxieduser>";

				
		 try {

				DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder docBuilder = docFactory.newDocumentBuilder();

				// root elements
				Document doc = docBuilder.newDocument();
				Element rootElement = doc.createElement("proxieduser");
				doc.appendChild(rootElement);

				// AccessCode
				Element accessCode = doc.createElement("ACCESSCODE");
				accessCode.setTextContent("BELLEVUE13");
				rootElement.appendChild(accessCode);

				// sponsorID
				Element sponsorID = doc.createElement("SPONSORID");
				sponsorID.setTextContent("1");
				rootElement.appendChild(sponsorID);
				
				// subSponsorID
				Element subSponsorID = doc.createElement("SUBSPONSORID");
				subSponsorID.setTextContent("1");
				rootElement.appendChild(subSponsorID);
				
				// userID
				Element userID = doc.createElement("USERID");
				userID.setTextContent("ddsr3rffssd");
				rootElement.appendChild(userID);

				// roleID
				Element roleID = doc.createElement("ROLEID");
				roleID.setTextContent("6");
				rootElement.appendChild(roleID);
			
				// gradeID
				Element gradeID = doc.createElement("GRADEID");
				gradeID.setTextContent("12058");
				rootElement.appendChild(gradeID);
			
				// classID
				Element classID = doc.createElement("CLASSID");
				classID.setTextContent("0");
				rootElement.appendChild(classID);
			

				// fName
				Element fName = doc.createElement("FNAME");
				fName.setTextContent("ddsfdasf");
				rootElement.appendChild(fName);
			

				// lName
				Element lName = doc.createElement("LNAME");
				lName.setTextContent("sdsdsd");
				rootElement.appendChild(lName);
			

				// eMail
				Element eMail = doc.createElement("EMAIL");
				eMail.setTextContent("myemail@petersons.com");
				rootElement.appendChild(eMail);
			

				// streetAddress
				Element streetAddress = doc.createElement("STREETADDRESS");
				streetAddress.setTextContent("sstreet");
				rootElement.appendChild(streetAddress);
			

				// graduationYear
				Element graduationYear = doc.createElement("GRADUATIONYEAR");
				graduationYear.setTextContent("2021");
				rootElement.appendChild(graduationYear);
			

				// applicationID
				Element applicationID = doc.createElement("applicationid");
				applicationID.setTextContent("2");
				rootElement.appendChild(applicationID);
			

				// errorUrl
				Element errorUrl = doc.createElement("errorurl");
				errorUrl.setTextContent("Error.aspx");
				rootElement.appendChild(errorUrl);
			

				// returnUrl
				Element returnUrl = doc.createElement("RETURNURL");
				returnUrl.setTextContent("Login.htm");
				rootElement.appendChild(returnUrl);
			

				// selTestCategory
				Element selTestCategory = doc.createElement("SELTESTCATEGORY");
				selTestCategory.setTextContent("SAT2016");
				rootElement.appendChild(selTestCategory);
			

				// testDate
				Element testDate = doc.createElement("TESTDATE");
				testDate.setTextContent("1/2/2004");
				rootElement.appendChild(testDate);
			

				// testActivationDate
				Element testActivationDate = doc.createElement("TESTACTIVATIONDATE");
				testActivationDate.setTextContent("1/1/2004");
				rootElement.appendChild(testActivationDate);
			

				// testExpireDate
				Element testExpireDate = doc.createElement("TESTEXPIREDATE");
				testExpireDate.setTextContent("1/1/2004");
				rootElement.appendChild(testExpireDate);
			

				// regDate
				Element regDate = doc.createElement("RegDate");
				regDate.setTextContent("1/1/2004");
				rootElement.appendChild(regDate);
			

				// registrationDate
				Element registrationDate = doc.createElement("REGISTRATIONDATE");
				registrationDate.setTextContent("1/1/2004");
				rootElement.appendChild(registrationDate);
			

				// gender
				Element gender = doc.createElement("Gender");
				gender.setTextContent("");
				rootElement.appendChild(gender);
			

				// ethnicity
				Element ethnicity = doc.createElement("Ethnicity");
				ethnicity.setTextContent("");
				rootElement.appendChild(ethnicity);
			

				// county
				Element county = doc.createElement("county");
				county.setTextContent("DuPage");
				rootElement.appendChild(county);
			

				// state
				Element state = doc.createElement("State");
				state.setTextContent("Illinois");
				rootElement.appendChild(state);
			

				// nation
				Element nation = doc.createElement("Nation");
				nation.setTextContent("USA");
				rootElement.appendChild(nation);
			

				// districtName
				Element districtName = doc.createElement("DISTRICTNAME");
				districtName.setTextContent("");
				rootElement.appendChild(districtName);
			

				// schoolName
				Element schoolName = doc.createElement("SCHOOLNAME");
				schoolName.setTextContent("");
				rootElement.appendChild(schoolName);
			

				// gradeName
				Element gradeName = doc.createElement("GRADENAME");
				gradeName.setTextContent("");
				rootElement.appendChild(gradeName);
			

				// className
				Element className = doc.createElement("CLASSNAME");
				className.setTextContent("");
				rootElement.appendChild(className);
			

				// econoDisadvantaged
				Element econoDisadvantaged = doc.createElement("EconoDisadvantaged");
				econoDisadvantaged.setTextContent("");
				rootElement.appendChild(econoDisadvantaged);
			

				// limitedEng
				Element limitedEng = doc.createElement("LimitedEng");
				limitedEng.setTextContent("");
				rootElement.appendChild(limitedEng);
			

				// specialEducation
				Element specialEducation = doc.createElement("SpecialEducation");
				specialEducation.setTextContent("");
				rootElement.appendChild(specialEducation);
			

				// gradeCategoryID
				Element gradeCategoryID = doc.createElement("GradeCategoryId");
				gradeCategoryID.setTextContent("");
				rootElement.appendChild(gradeCategoryID);
			

				// opinionService
				Element opinionService = doc.createElement("opinionservice");
				opinionService.setTextContent("");
				rootElement.appendChild(opinionService);
			

				// onlineTutoring
				Element onlineTutoring = doc.createElement("OnlineTutoring");
				onlineTutoring.setTextContent("");
				rootElement.appendChild(onlineTutoring);

				/*
				// set attribute to staff element
				Attr attr = doc.createAttribute("ACCESSCODE");
				attr.setValue(TeacherID);
				teacher.setAttributeNode(attr);
				*/
						
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

	private String sendPost(String verificationToken, String userID, String firstName, String lastName, String eMail, String testName) throws Exception {
		
		String USER_AGENT = "Mozilla/5.0";
		//OLD - DO NOT USE: String url = "http://warp.eastasia.cloudapp.azure.com/warp/olc/authenticate";
		
		// Current URL for Peterson's 9/1/17
		String url = "http://warpauth.petersons.com/olc/authenticate";
		
		
		//String url = "http://warpauth.petersons.com/WarpTest/authenticate";
		
		// Clear Text Redirects
		// String url = "http://warpauth.petersons.com/WarpTest/Plainauthenticate";
		
		
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
		System.out.println("Response Code: " + responseCode);

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

		// print result
		// System.out.println(response.toString());
		return response.toString();

	}

}
