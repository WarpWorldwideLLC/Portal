package com.warpww.pymt;

import java.io.InputStream;
import java.io.StringReader;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.json.JsonValue;

import com.warpww.util.Util;

public class StripeSource {

	public String SourceID = "";
	public String URL = "";
	
	// Constructor
	public StripeSource (String sourceJson) {

		
		// if(pJsonInput.indexOf("MemberName") > -1) {MemberName = inputJson.getString("MemberName").toString();
        try {
          	
			InputStream stream = Util.StringToStream(sourceJson);
			sourceJson = sourceJson.replaceFirst("result: ", "");
			System.out.println("Modified Source Object: " + sourceJson);
			
			// Create JsonReader from JSON.
            JsonReader reader = Json.createReader(stream);
            
            // Get the JsonObject structure from JsonReader.
            JsonObject jsonObject = reader.readObject();
            JsonObject sourceObject = jsonObject.getJsonObject("source");
            JsonObject redirectObject = sourceObject.getJsonObject("redirect");
            
            reader.close();
         
            System.out.println("jsonObject Index:" + jsonObject.size());
            System.out.println("jsonObject Contains Key Source (source): " + jsonObject.containsKey("source"));
            System.out.println("jsonObject Contains Key Source (redirect): " + jsonObject.containsKey("redirect"));
            
            System.out.println("sourceObject Contains Key Source (id): " + sourceObject.containsKey("id"));
            System.out.println("sourceObject Contains Key Source (redirect): " + sourceObject.containsKey("redirect"));
            System.out.println("redirectObject Contains Key Source (url): " + redirectObject.containsKey("url"));
            
            this.SourceID = sourceObject.getJsonString("id").getString();
            this.URL = redirectObject.getJsonString("url").getString();
            
            System.out.println("sourceObject Contains Source ID: " + this.SourceID);
            System.out.println("redirectObject Contains URL: " + this.URL);
            
             
        } catch (Exception ex) {
            // TODO Auto-generated catch block
            System.out.println(ex.toString());
        }
		
		
		
    }	

}

/* 

result: {

"source":{"id":"src_1Bg17TDm8rfcoBsJF81THp9C","object":"source","amount":500,"client_secret":"src_client_secret_C49Qrv7Gfn1UB6Q8yLkG6AbQ","created":1514943159,"currency":"usd","flow":"redirect","livemode":false,"metadata":{},"owner":{"address":null,"email":null,"name":null,"phone":null,"verified_address":null,"verified_email":null,"verified_name":null,"verified_phone":null},
"redirect":{"failure_reason":null,"return_url":"http://localhost:8080/com.warpww.web/alipay","status":"pending","url":"https://hooks.stripe.com/redirect/authenticate/src_1Bg17TDm8rfcoBsJF81THp9C?client_secret=src_client_secret_C49Qrv7Gfn1UB6Q8yLkG6AbQ"},"statement_descriptor":null,"status":"pending","type":"alipay","usage":"single_use","alipay":{"statement_descriptor":null,"native_url":null,"data_string":null}}
}

*/

