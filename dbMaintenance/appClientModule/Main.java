import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import com.warpww.sec.*;

public class Main {
	public static void main(String[] args) {
		
		getData(hsc.Environment.Test, hsc.Element.Column);
		
	}

	/* (non-Java-doc)
	 * @see java.lang.Object#Object()
	 */
	public Main() {
		super();
	}

	
	private int getTableList() {
		int returnValue = -1;
		
		return returnValue;
	}
	
	private int getColumnList() {
		int returnValue = -1;
		
		return returnValue;
	}
	
	private int getKeyList() {
		int returnValue = -1;
		
		return returnValue;
	}
	
	private int getProcedureList() {
		int returnValue = -1;
		
		return returnValue;
	}
	
	private static int getData (hsc.Environment targetEnvironment, hsc.Element targetElement) {
		int returnValue = 0;
		
		try 
        {
			
			hsc hsco = new hsc(targetEnvironment);
			
            Class.forName("com.mysql.jdbc.Driver");
            Connection connSource = DriverManager.getConnection(hsco.jdbcURI, hsco.jdbcUser, hsco.jdbcPassword);   
            
            String spName = "adminGetColumns";
            
            CallableStatement cStmt = connSource.prepareCall("{call " + spName + "(?)}");
            // cStmt.setString(1, json);
         
            
            boolean hadResults = cStmt.execute();
            while (hadResults) 
            {
            		ResultSet rs = cStmt.getResultSet();
            		ResultSetMetaData rsmd = rs.getMetaData(); 
                String name = rsmd.getColumnName(1);
                // System.out.println(name);
                while(rs.next())
                {
                	
                 System.out.println(rs.getString(1).toString() + "." + rs.getString(2).toString());
                 
                }
                hadResults = cStmt.getMoreResults();
            }          
            // Util.printParams("dbProcess.processCommand.AfterProcessing", request);
 
        } catch (Exception e2) 
        {
            System.out.println(e2);
        }
		
		return returnValue;
	}
	
	
	
	
	
}


