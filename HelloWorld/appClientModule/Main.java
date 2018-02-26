import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.nio.file.FileSystem;
import java.nio.file.FileSystems;
import java.nio.file.FileVisitResult;
import java.nio.file.FileVisitor;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;

public class Main {
	public static void main(String[] args) {
		System.out.println("Hello World.");
		warpweb();
	}

	/* (non-Java-doc)
	 * @see java.lang.Object#Object()
	 */
	public Main() {
		super();
	}
	
	public static void warpweb() {

	    FileVisitor<Path> simpleFileVisitor = new SimpleFileVisitor<Path>() {
	        @Override
	        public FileVisitResult preVisitDirectory(Path dir,BasicFileAttributes attrs)
	            throws IOException {
	        /*   
	        	System.out.println("-------------------------------------");
	          System.out.println("DIRECTORY NAME: "+ dir.getFileName() 
	                             + "LOCATION: "+ dir.toFile().getPath());
	          System.out.println("-------------------------------------");
	          */
	          return FileVisitResult.CONTINUE;
	        }
	         
	        @Override
	        public FileVisitResult visitFile(Path visitedFile,BasicFileAttributes fileAttributes)
	            throws IOException {
	        		if(visitedFile.getFileName().toString().contains(".java")) {
	        			// System.out.println("FILE NAME: "+ visitedFile.getParent() + visitedFile.getFileName());
	        			Path filePath = visitedFile.toAbsolutePath();
	        			checkSourceFile(filePath);
	        		}
	          return FileVisitResult.CONTINUE;
	        }
	      };
	      
	      FileSystem fileSystem = FileSystems.getDefault();
	      Path rootPath = fileSystem.getPath("/Users/jarp/Dropbox/Personal/Warp Worldwide/Warp Source/JWeb/com.warpww.web");
	      try {
	        Files.walkFileTree(rootPath, simpleFileVisitor);
	      } catch (IOException ioe) {
	        ioe.printStackTrace();
	      }
	
	
	
	}
	
	public static void checkSourceFile(Path filePath) {
		
	    try(BufferedReader reader = Files.newBufferedReader(filePath, Charset.forName("UTF-8"))){

	      
	      String currentLine = null;
	      while((currentLine = reader.readLine()) != null){//while there is content on the current line
	    	  	if(currentLine.contains("import ")) {
	    	  		String output = currentLine.replace("import ", "");
	    	  		output += output.replaceAll(";", "");
	    	  		System.out.println(filePath.getFileName() + "\t" + output); // print the current line
	    	  	}
	      }
	    }catch(IOException ex){
	      ex.printStackTrace(); //handle an exception here
	    }
		
	}
	
	public static void tomcat() {
		
		File[] files = new File("/Users/jarp/Dropbox/servers/logs/").listFiles();
		for (File file : files) {
			 // System.out.println(file.getName());
			 // System.out.println(file.getName().substring(0,  3));
			 // manager, host, localhost, catalina
			switch (file.getName().substring(0,  3)) {
				case "man":
					break;
					
				case "hos":
					break;
					
				case "loc":
					
					if(file.getName().indexOf("access_log") != -1)
					{	
						//host_acccess_log(file);
						parseHostAccess(file);
					}
					break;
					
				case "cat":
					break;
					
				default:
					break;
			}
			 
			 //System.out.println(file.getName().substring(0,  20));
		}
		
	}
	
	public static void host_acccess_log(File file) {
		
		// System.out.println(file.getName());
		
		// Ensure this is the correct file. 
		if(file.getName().indexOf("localhost_access_log") == -1)
			return;
		
		// Read the file, parse each line and write the useful information out. 
		try {
			
			// Open the file
			FileInputStream fstream = new FileInputStream(file);
			BufferedReader br = new BufferedReader(new InputStreamReader(fstream));

			String strLine;

			//Read File Line By Line
			while ((strLine = br.readLine()) != null)   {
			  
				String ipAddress = strLine.substring(0, strLine.indexOf(" "));
				System.out.println(ipAddress + ", " + strLine.substring(strLine.indexOf("["), strLine.length()));
				//System.out.println(strLine);
			}

			//Close the input stream
			br.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		
		
		/*
		List<String> lines = Arrays.asList("The first line", "The second line");
		Path file = Paths.get("the-file-name.txt");
		Files.write(file, lines, Charset.forName("UTF-8"));
		*/
		//Files.write(file, lines, Charset.forName("UTF-8"), StandardOpenOption.APPEND);
	}

	public static void showFiles(File[] files) {
	    for (File file : files) {
	        if (file.isDirectory()) {
	            System.out.println("Directory: " + file.getName());
	            showFiles(file.listFiles()); // Calls same method again.
	        } else {
	            System.out.println("File: " + file.getName());
	        }
	    }
	}
	

	public static void parseHostAccess(File file) {

	//File file = new File(fileName);
	BufferedReader reader = null;

	try {
	    reader = new BufferedReader(new FileReader(file));
	    String text = null;

	    while ((text = reader.readLine()) != null) {
	    System.out.println(text);
	    	
	    	// ipAddress
	    String ipAddress = "";
	    int ip_ub = text.indexOf("-");
	    try {	
	    		ipAddress = text.substring(0, ip_ub).trim();
	    } catch (Exception ex) {
	    	
	    }
	    
	    	// actionDate
		String actionDate = "";
    		int logDate_lb = text.indexOf("[");
    		int logDate_ub = text.indexOf("]");
	    try {	
	 	    	actionDate = text.substring(logDate_lb, logDate_ub +1);
	    } catch (Exception ex) {
	    	
	    }
	    	
 	    	// commandText
	    String commandText = "";
	    	int command_lb = logDate_ub + 2;
	    	int command_ub = text.lastIndexOf("\"") + 1;
	    try {	
	 	    	commandText = text.substring(command_lb, command_ub).trim();
	    } catch (Exception ex) {
	    	
	    }
	    
 	    	//commandType
 		String commandType = "***";
 		try {	
	 	    	if(commandText.length() < 5)
	 	    	{
	 	    		commandType = commandText.replace("\"", "");  
	 	    	} else {
	 	    		commandType = commandText.substring(1, commandText.indexOf(" "));   		
	 	    	}
	    } catch (Exception ex) {
	    	
	    }
	 	    	
 	    	// responseCode
 		String responseCode = "";
	    	int response_lb = command_ub +1;
	    	int response_ub = response_lb + 3;
 		try {	
	 	    	responseCode = text.substring(response_lb, response_ub);
	    } catch (Exception ex) {
	    	
	    }
 	    	
 	    	// bytesSent, excluding HTTP headers, or '-' if no bytes were sent
 		String bytesSent = "";
 		int byteSent_lb = response_ub + 1;
 		try {	
	 	    	
	 	    	bytesSent = text.substring(byteSent_lb);
	    } catch (Exception ex) {
	    	
	    }
 	    	
 	    	
	    	switch (ipAddress) {
	    		case "67.3.142.158":  // Warp Home IP
		    		// do nothing.
		    		break;
		    		
		    default: 
		    		System.out.println(ipAddress + ", " + actionDate + ", " + commandType + ", " + commandText + ", " +  responseCode + ", " + bytesSent );
		    		break;	    	
	    	}

	    }
	} catch (FileNotFoundException e) {
	    e.printStackTrace();	
	} catch (IOException e) {
	    e.printStackTrace();
	} finally {
	    try {
	        if (reader != null) {
	            reader.close();
	        }
	    } catch (IOException e) {
	    }
	}

	//print out the list
	System.out.println("Done.");
	
	
	}

}