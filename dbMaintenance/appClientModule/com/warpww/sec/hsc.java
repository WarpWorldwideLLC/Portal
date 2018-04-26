package com.warpww.sec;

public class hsc {

	public String pk_stripe = "";
	public String sk_stripe = "";
	
    public String jdbcKey = "";   
    public String jdbcURI = "";
    public String jdbcUser = "";
    public String jdbcPassword = "";
   
    public String tokenSalt = "";
    public int tokenMemberPadding = 0;
	public int tokenExpirationDuration = 0;
	public String cookieName = "";
	public String cookieDomain = ""; 
	
	public boolean cookieSSL = false;
	
	public String currencySymbol = "";
	
	public String systemMode = "";
			
	public static enum Environment {
		Test, Production
	}

	public static enum Element {
		Column, Key
	}
	
	public hsc(Environment targetEnvironment) {
		switch (targetEnvironment) {
		case Production: 
			hscProd();
			break;
			
		case Test:
			hscTest();
			break;
			
		default:  // Test
 			hscTest();
			break;
		}
	}
	
	private boolean hscProd() {
		boolean returnValue = false;		
		// P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D 
		// P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D 
		// P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D 
		// P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D 
		// P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D 
		// P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D 
		// P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D 
		// P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D 
		// P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D 
		// P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D 

		this.pk_stripe = "pk_live_9IU3u0bPEmnKRLb103pW4ILu";
		this.sk_stripe = "sk_live_R3mT2ILaX6p0OdO6Dk9cotz6";
		
		this.jdbcKey = "\"jdbc:mysql://singapore-db-1.cuwqizgjegfw.ap-southeast-1.rds.amazonaws.com:3306/WarpAdmin2017\", \"warpdbm\", \"warp-is-live-2018\"";   
		this.jdbcURI = "jdbc:mysql://singapore-db-1.cuwqizgjegfw.ap-southeast-1.rds.amazonaws.com:3306/WarpAdmin2017";
		this.jdbcUser = "warpdbm";
		this.jdbcPassword = "warp-is-live-2018";
	   
		this.tokenSalt = "Action Comics #1, June 1939";
		this.tokenMemberPadding = 1100000; 		// Ensures a 6-byte hex value
		this.tokenExpirationDuration = 18000;  	// 5 hours
		this.cookieName = "com.warpww";
		this.cookieDomain = ""; // warpww.com  - 
		
		this.cookieSSL = false;
		
		this.currencySymbol = "$";
		
		this.systemMode = "Prod";

		
		// P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D 
		// P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D 
		// P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D 
		// P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D 
		// P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D 
		// P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D 
		// P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D 
		// P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D 
		// P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D 
		// P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D * * P R O D 		
		return returnValue;
	}
	
	
	private boolean hscTest() {
		boolean returnValue = false;
		// T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T 
		// T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T 
		// T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T 
		// T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T 
		// T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T 
		// T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T 
		// T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T 
		// T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T 
		// T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T 
		// T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T 
		
		this.pk_stripe = "pk_test_SVBFNF3t7mU3ycUFW8nEzENp";
		this.sk_stripe = "sk_test_STal0dCNUL1dUZ09CswwVe7E";

	 
		this.jdbcURI = "jdbc:mysql://localhost:3306/WarpAdmin2017";
		this.jdbcUser = "root";
		this.jdbcPassword = "62XYhC;erw;zZaCmZVzrFEwW";
	        
		this.tokenSalt = "Action Comics #1, June 1939";
		this.tokenMemberPadding = 1100000; 		// Ensures a 6-byte hex value
		this.tokenExpirationDuration = 18000;  	// 5 hours
		this.cookieName = "com.warpww";
		this.cookieDomain = ""; // warpww.com  - 
		
		this.cookieSSL = false;
		
		this.currencySymbol = "$";
		
		this.systemMode = "Test";

		
		// T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T 
		// T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T 
		// T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T 
		// T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T 
		// T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T 
		// T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T 
		// T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T 
		// T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T 
		// T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T * * T E S T 		
		return returnValue;
	}
	
	
}
