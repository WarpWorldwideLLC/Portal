package com.warpww.sec;

import javax.json.Json;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.warpww.util.Command;

public class Login {

	public static boolean validateSignon(HttpServletRequest request, HttpServletResponse response)
	{
		boolean returnValue = false;
		// Util.printParams("landing.validateSignon", request);
		try
		{
		String json = Json.createObjectBuilder()
				 .add("Command", "ValidateSignon")
				 .add("AuID", 1)
				 .add("IuID", 1)
				 .add("MemberName", request.getParameter("memberName"))
				 .add("PassphraseHash", request.getAttribute("passphraseHash").toString())
				 .build()
				 .toString(); 		
		
		String jsonParms = "";
		jsonParms = json;
		request.setAttribute("CommandText", jsonParms);
		//Util.printParams("landing.validateSignon.Before", request);
		request.getRequestDispatcher("/dbProcess").include(request, response);
		//Util.printParams("landing.validateSignon.After", request);
		
		Command cmd = new Command(request.getAttribute("CommandResults").toString());

		if(cmd.ProcStatus.equals( cmd.COMMAND_SUCCESS)) {
			returnValue = true;
		}
		
		} catch (Exception ex)
		{
			System.out.println(ex.toString());
			ex.printStackTrace();
			returnValue = false;
		}
		
		return returnValue;
	}
	
	
}
