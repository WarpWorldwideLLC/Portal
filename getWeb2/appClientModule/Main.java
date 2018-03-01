
import java.net.*;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;
import java.nio.charset.Charset;
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
	
	
	
	public static void main(String[] args) {
		
		getImages();
		// https://stackoverflow.com/questions/13670692/403-forbidden-with-java-but-not-web-browser
	    /*
		try {
		    	URLConnection connection = new URL("http://readcomiconline.to/").openConnection();
		    	connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.95 Safari/537.11");
		    	connection.connect();
	
		    	BufferedReader r  = new BufferedReader(new InputStreamReader(connection.getInputStream(), Charset.forName("UTF-8")));
	
		    	StringBuilder sb = new StringBuilder();
		    	String line;
		    	while ((line = r.readLine()) != null) {
		    	    sb.append(line);
		    	}
		    	System.out.println(sb.toString());
	    } catch (Exception e) {
	    		System.out.println(e.toString());
	    } 
	    */
		System.out.println("Done.");

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