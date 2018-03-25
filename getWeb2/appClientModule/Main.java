
import java.net.*;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;
import java.nio.charset.Charset;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javax.net.SocketFactory;

import org.apache.commons.io.FileUtils;


import java.io.*;

public class Main {
	
	/* (non-Java-doc)
	 * @see java.lang.Object#Object()
	 */
	public Main() {
		super();
	}
	
	// TO-DO: Add logic to trim the input file to what is needed, shrink them down.
	// TO-DO: Add logic to move files to AWS S3 and get them off the local drive ASAP.
	
	public static void main(String[] args) {

		String directory = "/Users/jarp/comics/input/";
		
		// List<String> fileNames = new ArrayList<>();
        try (DirectoryStream<Path> directoryStream = Files.newDirectoryStream(Paths.get(directory))) {
            for (Path path : directoryStream) {
                // fileNames.add(path.toString());
                System.out.println(path.toString());
                readHtmlFile(path.toString());
            }
        } catch (IOException ex) {}
		
		// readHtmlFile("New Fun Issue #2 - Read New Fun Issue #2 comic online in high quality.html");
		
		System.out.println("Done.");

	}
	
	private static int readHtmlFile(String fileName) {
		int returnValue = -1;
		
		try { 
			
            // Class.forName("com.mysql.jdbc.Driver");
            // Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WarpAdmin2017", "root", "62XYhC;erw;zZaCmZVzrFEwW");
               
            // CallableStatement cStmt = conn.prepareCall("{call " + spName + "(?)}");
            //cStmt.setString(1, json);
			
			// String pathName = "/Users/jarp/comics/input/";
			String pathName = "";
			
			String allData = new String(Files.readAllBytes(Paths.get(pathName + fileName))); 

			String titleIndexValue = "<a href=\"http://readcomiconline.to/Comic/";
			String issueIndexValue = "Issue #";
			
			String imageIndexValue = "http://2.bp.blogspot.com/";
			String imageIndexEndValue = "src";
			
			int titleStart = allData.indexOf(titleIndexValue);
			int titleStop = allData.indexOf("\"", titleStart + titleIndexValue.length());
			String title = allData.substring(titleStart + titleIndexValue.length(), titleStop);
			
			int issueStart = allData.indexOf(issueIndexValue);
			int issueStop = allData.indexOf("-", issueStart + issueIndexValue.length());
			String issue = allData.substring(issueStart + issueIndexValue.length(), issueStop);
			
			try { 
				Integer.parseInt(issue);
			} catch (Exception ex) {
				issue = "0";
			}
			
			
			System.out.println("Title : " + title);
			System.out.println("Issue : " + issue);
			
			// Set the Library Path for images
			String savePath = "/Users/jarp/comics/library/" + title + "/";
			createDirectory(savePath);
			/* ******************************************************************************************/
			/* ******************************************************************************************/
			/* Image Retrieval                                                                          */
			/* ******************************************************************************************/
			/* ******************************************************************************************/
			int sequenceNumber = 0;
			int imagesStart = allData.indexOf(imageIndexValue);
			int imagesStop = allData.indexOf(imageIndexEndValue, imagesStart);
			String images = allData.substring(imagesStart, imagesStop -2);
			
			String imageFileName = title + "_" + String.format("%04d", Integer.parseInt(issue.trim())) + "_" + String.format("%04d", sequenceNumber) + ".jpg";
			System.out.println("Save Image: " + imageFileName );
			
			URL website = new URL(images);
			File output = new File(savePath + imageFileName);
			
			FileUtils.copyURLToFile(website, output);
	
			while(allData.indexOf(imageIndexValue, imagesStop) > -1) {
	
				// System.out.println("Index : " + imagesStart + "," + imagesStop);
				sequenceNumber = sequenceNumber + 1;
				
				imagesStart = allData.indexOf(imageIndexValue, imagesStop);
				imagesStop = allData.indexOf(imageIndexEndValue, imagesStart);
				// System.out.println("Index : " + imagesStart + "," + imagesStop);
				
				images = allData.substring(imagesStart, imagesStop -2);
				imageFileName = title + "_" + String.format("%04d", Integer.parseInt(issue.trim())) + "_" + String.format("%04d", sequenceNumber) + ".jpg";
				System.out.println("Save Image: " + imageFileName );
				// System.out.println("Image Origine: " + images);
				
	    			website = new URL(images);
	    			output = new File(savePath + imageFileName);
	    			
	    			FileUtils.copyURLToFile(website, output);
				
			}

			
		} catch (Exception e) {
			System.out.println(e.toString());
			System.out.println(e.getStackTrace());
		}
		
		
		return returnValue;
	}
	
	private static boolean createDirectory (String pathName) {
        boolean returnValue = false;
		
        try { 
			Path path = Paths.get(pathName);
	  
	        if (!Files.exists(path)) {
	        		Files.createDirectories(path);
	        }
	         	
		} catch (Exception e) {
			System.out.println(e.toString());
			System.out.println(e.getStackTrace());
		}
      
        return returnValue;
      
	}
	
	
	private static int getPage() {
		int returnValue = -1;

		try {
			URL url;
	
			url = new URL("http://readcomiconline.to/Comic/More-Fun-Comics/Issue-74");
	
			InputStream is = url.openStream();
			int ptr = 0;
			StringBuffer buffer = new StringBuffer();
			while ((ptr = is.read()) != -1) {
			    buffer.append((char)ptr);
			}
			System.out.println(buffer);
		
		} catch (Exception e) {
    			System.out.println(e.toString());
	    } 
		
		return returnValue;
	}
	
	private static int getImages() {
		int returnValue = -1;
		
		// https://stackoverflow.com/questions/921262/how-to-download-and-save-a-file-from-internet-using-java
		try {
			
			// push("http://2.bp.blogspot.com/x1HVFLlXTU3JTV_McPsq4hZgLhCeg8SI-R_DGUgRTY61yi4Jht2swB1pF32PMM5nxRHBMkePIvhg=s0");
			
	        Scanner scanner = new Scanner(new File("/Users/jarp/comics/inputList.csv"));
	        scanner.useDelimiter(",");
	        String fileName = "";
	        
	       
	        while(scanner.hasNextLine()){
	        	 	String line = scanner.nextLine();
	        	    String[] fields = line.split(",");
	        	    if (fields.length == 5) // All fields present
	        	    {
	        	    		String currUrl = fields[4];
	        	    		// System.out.println(currUrl);
	        	    		currUrl = currUrl.replaceAll("\"", "");
	        	    		// System.out.println(currUrl);
	        	    		currUrl = currUrl.replace("lstImages.push(","");
	        	    		//System.out.println(currUrl);
	        	    		currUrl = currUrl.replace(");", "");
	        	    		String imageFileName = fields[1] + "_" + String.format("%04d", Integer.parseInt(fields[2])) + "_" + String.format("%04d", Integer.parseInt(fields[3])) + "_" + String.format("%04d", Integer.parseInt(fields[0])) + ".jpg";
	        	    		File output = new File("/Users/jarp/comics/" + imageFileName);
	        	    		
	
	        	    		
	        	    		
	        	    		URL website = new URL(currUrl);
	        	    		
	        	    		FileUtils.copyURLToFile(website, output);
	        	        System.out.println(imageFileName);
	     
	        	    }
	        	    else
	        	    {
	        	        System.err.println("Invalid record: " + line);
	        	    }
	     
	            
	        }
	        scanner.close();

			URL website = new URL("http://2.bp.blogspot.com/x1HVFLlXTU3JTV_McPsq4hZgLhCeg8SI-R_DGUgRTY61yi4Jht2swB1pF32PMM5nxRHBMkePIvhg=s0");
			File output = new File("/Users/jarp/comics/GL40.jpg");
			
			FileUtils.copyURLToFile(website, output);

			
			/* 
			ReadableByteChannel rbc = Channels.newChannel(website.openStream());
			FileOutputStream fos = new FileOutputStream("GL40.jpg");
			fos.getChannel().transferFrom(rbc, 0, Long.MAX_VALUE);
			*/

	    } catch (Exception e) {
    		System.out.println(e.toString());
	    } 

		
		return returnValue;
		
	}



}