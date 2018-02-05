package com.warpww.sec;

import java.security.MessageDigest;
import java.security.SecureRandom;
import java.security.Security;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

import org.bouncycastle.crypto.CipherParameters;
import org.bouncycastle.crypto.AsymmetricBlockCipher;
import org.bouncycastle.crypto.BlockCipher;
import org.bouncycastle.crypto.BufferedBlockCipher;
import org.bouncycastle.crypto.DataLengthException;
import org.bouncycastle.crypto.InvalidCipherTextException;
import org.bouncycastle.crypto.PBEParametersGenerator;
import org.bouncycastle.crypto.digests.SHA3Digest;
import org.bouncycastle.crypto.engines.RijndaelEngine;
import org.bouncycastle.crypto.generators.PKCS12ParametersGenerator;
import org.bouncycastle.crypto.modes.CBCBlockCipher;
import org.bouncycastle.crypto.paddings.PKCS7Padding;
import org.bouncycastle.crypto.paddings.ISO10126d2Padding;
import org.bouncycastle.crypto.paddings.PaddedBufferedBlockCipher;
import org.bouncycastle.crypto.params.KeyParameter;
import org.bouncycastle.crypto.params.ParametersWithIV;
import org.bouncycastle.util.encoders.Base64;

// import org.apache.commons.codec.binary.Base64;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

public class Rijndael {

	private String encryptedData64 = "bJ7Z2iMSPYUSXzBbHoCSzR6Y0Y8rHHZ7RLP7V6Uff41bK8uVyhAVtAUCNfWpfdqfedDpuLI5s5GaBSJJ3uElMmlE8fpX2Ic5jxsq4rmjK6rdvOG7K+fs1WF9hbpq0nC2YH8hAorBmhfjhcTettnZ5j0mMHbfZKjhNAIULpaRL60T1BR3+EgFvYreqJBxuvlMsyP48xCod2MMgi9YM4N1KJWG+V3MqBH72dS1CTUhOX546OgF6ABbx6RZktv8CSGAs6x+nylXr8aDQsLkG80fJBFu2zoL+oOTODSa7IhuT1s7/G+r07yLPZ/rdpnOIrW8dUdHARj92jE5IKx2TAbuynbVNlqiXrrE7oEmCWGoaVfiInlIrcsJk1o/VrroUmwySCn7KGhej+DxJkON9HAhOB1Ip23W0dULjD7fDNzNc4n9FZSbfgfWPMvLr2uZv8J7uK1Y28w/JR/skACo2NCL1Hfd88GEVYCJmO8tnOjuFKv/Drk/XGWE0IFWOVG5TumhTwwMLHRx8jA0koExFyPio6jZGipg62YEUHX8xH9VpVa0B0NoDY1b1dxpvCyzyTiihJTi0dSuMZQgLT5qtFVzrtv4vOXSzIBCaM/ZTrjqS5Ok0skpvVp/WUvmKT6JuumZHOanLAHSKR4oigrthkp+nLMjDzdKDqVrPtIMQiuNPafBDMFHC88Fi+rjF/L3dcR0SwqE8qzzopgIQAlAH6IFBzbyOO+L1kAdGLYuDrq86zLOm58DfjhndFPQChZwL843O38VyEX9pGFYcRglgZFEL4eHW5OpWFaCBfazquxnWE78VZoxla5ywyreWJD5kUu2Ln+hEmEoXeObrE+UVc4y+02c2jwmnlD8Ny9Saf9Q7p21zPxvkILpSTweiR/BjNCPEVYZJ46cpAZH/vgDe2X78mun1z9GKbZy0KJEjT3QF1jioq9cnyzHB+wBvyMjxhGl9NKW2fnnr2upIzzO49HYaiCPjPYLEduS6eg+72kUPBnxz38HHSjus1cIekrxzKYAMRkmB+KSl2jyqaqsrmagjIOlONg5CJ42M0LUu0Ps5Kz0ZsEQs141UUpf7EpRaKkCcpuLusqbX5fJNIzHcPaBaIA5T2/Doib3EXfXHzseBuHksTdo2K3+KtYvdT5LUmIx/+V5VJ6dqhIGSOeb8VfvBBWzD4rw7oc/3jWcUdRS6EizKFtpL4BwjdnpbNN3aaNP6lzn7w1wTKm9YwgFGHYvXBvg2FbRba6k7MfxrMVPmBhfx3N3VZupvtHLC04WXh8pbG/11qrRuvEzcH37fN1ZFh3Ppm68SCIdgju7Wjgpjfz6OsunKyUOinSCQrFpj+yhAx0fcznx0za3NriIDdJlPMBcHxy7T9HmQngbHVSTurY07QlZKv2MsCCt8CiuC0BuS481Vr/yyoo8A7AtjmWi/3GgXUY3k0HdNYXrn5YPmJXDul8GdYLg+6KH4DSYWpz4XK7pCenAmvPIr4vkFJcgWg==";
	private String clearData = "<proxieduser><ACCESSCODE>BELLEVUE13</ACCESSCODE><SPONSORID>1</SPONSORID><SUBSPONSORID>1</SUBSPONSORID><USERID>ddsr3rffssd</USERID><ROLEID>6</ROLEID><GRADEID>12058</GRADEID><CLASSID>0</CLASSID><FNAME>ddsfdasf</FNAME><LNAME>sdsdsd</LNAME><EMAIL>myemail@petersons.com</EMAIL><STREETADDRESS>sstreet</STREETADDRESS><GRADUATIONYEAR>2021</GRADUATIONYEAR><applicationid>2</applicationid><errorurl>Error.aspx</errorurl><RETURNURL>Login.htm</RETURNURL><SELTESTCATEGORY>SAT2016</SELTESTCATEGORY><TESTDATE>1/2/2004</TESTDATE><TESTACTIVATIONDATE>1/1/2004</TESTACTIVATIONDATE><TESTEXPIREDATE>1/1/2004</TESTEXPIREDATE><RegDate>1/1/2004</RegDate><REGISTRATIONDATE>1/1/2004</REGISTRATIONDATE><Gender></Gender><Ethnicity></Ethnicity><County>DuPage</County><State>Illinois</State><Nation>USA</Nation><DISTRICTNAME></DISTRICTNAME><SCHOOLNAME></SCHOOLNAME><GRADENAME></GRADENAME><CLASSNAME></CLASSNAME><EconoDisadvantaged></EconoDisadvantaged><LimitedEng></LimitedEng><SpecialEducation></SpecialEducation><GradeCategoryId></GradeCategoryId><opinionservice></opinionservice><OnlineTutoring></OnlineTutoring></proxieduser>";
	private String secretKey64 = "zTAMXVdQ9YlPUT1HXDkKrgjBxDOetDq56vbR5UWH5Uo=";
	
	public void Hello()
	{
		System.out.println("Hello from warpww.com.sec.Rijndael!");
	}
	
	public void warpKey() throws Exception {
		byte[] buff = Base64.decode(secretKey64);
		// byte[] buff = secretKey64.getBytes();
		for(byte c : buff) {
		    System.out.format("%d ", c);
		}
		System.out.println();
	}
	
	public void warpEncrypt () throws Exception {
		
		// Initialize a Rijndael engine with a block size of 256. 
		RijndaelEngine engine = new RijndaelEngine(256);
		
		// CBC Block Cipher
		CBCBlockCipher cbc = new CBCBlockCipher(engine);
		
		// ISO 10126 Padding. This padding method is obsolete, and used for compatibility with Peterson's.
		BufferedBlockCipher cipher = new PaddedBufferedBlockCipher(cbc, new ISO10126d2Padding());
		
		// decode the base64 encoded string
		byte[] decodedKey = Base64.decode(secretKey64);
			
		// arg0 is true of initialised for encryption, false if for decryption.
		// CipherParameters arg1 is for secret key and other parameters.
		cipher.init(true, new KeyParameter(decodedKey));
		byte[] encrypted = new byte[cipher.getOutputSize(clearData.length())];
		
		int processedBytes = cipher.processBytes(clearData.getBytes(), 0, clearData.getBytes().length, encrypted, 0);
		
		cipher.doFinal(encrypted, processedBytes);
		
		String result = new String(Base64.encode(encrypted));
		
		System.out.println("Peterson's Encrypted Value :  " + encryptedData64);
		System.out.println("warpEncrypt Rijndael result : " + result);
	}
	

    public void testEncryptRijndael() throws DataLengthException, IllegalStateException, InvalidCipherTextException {

        PKCS12ParametersGenerator pGen = new PKCS12ParametersGenerator(new SHA3Digest(256));
        // char[] passwordChars = password;
        char[] passwordChars = null;

        final byte[] pkcs12PasswordBytes = PBEParametersGenerator.PKCS12PasswordToBytes(passwordChars);
        // pGen.init(pkcs12PasswordBytes, salt , iterationCount );     

        BlockCipher engine = new RijndaelEngine(256);
        CBCBlockCipher cbc = new CBCBlockCipher(engine);
        BufferedBlockCipher cipher = new PaddedBufferedBlockCipher(cbc, new PKCS7Padding());

        ParametersWithIV aesCBCParams = (ParametersWithIV) pGen.generateDerivedParameters(256, 256);
        cipher.init(true, aesCBCParams);

        byte[] input = "Hallo ich bin ein Test".getBytes();
        byte[] cipherText = new byte[cipher.getOutputSize(input.length)];

        int cipherLength = cipher.processBytes(input, 0, input.length, cipherText, 0);
        cipher.doFinal(cipherText, cipherLength);

        String result = new String(Base64.encode(cipherText));
        System.out.println("testEncryptRijndael result : " + result);
        // assertEquals("cMoMSNMNsikAkLjaheE6iD48Xkfvo7Y6gS8/zroGfHc=",result);
    }


    public void testDecryptRijndael() throws DataLengthException, IllegalStateException, InvalidCipherTextException {
        PKCS12ParametersGenerator pGen = new PKCS12ParametersGenerator(new SHA3Digest(256));
        // char[] passwordChars = password;
        char[] passwordChars = null;
        	
        final byte[] pkcs12PasswordBytes = PBEParametersGenerator.PKCS12PasswordToBytes(passwordChars);
        // pGen.init(pkcs12PasswordBytes, salt , iterationCount );     

        BlockCipher engine = new RijndaelEngine(256);
        CBCBlockCipher cbc = new CBCBlockCipher(engine);
        BufferedBlockCipher cipher = new PaddedBufferedBlockCipher(cbc, new PKCS7Padding());

        ParametersWithIV aesCBCParams = (ParametersWithIV) pGen.generateDerivedParameters(256, 256);
        cipher.init(false, aesCBCParams);

        byte[] output = Base64.decode("cMoMSNMNsikAkLjaheE6iD48Xkfvo7Y6gS8/zroGfHc=".getBytes());
        byte[] cipherText = new byte[cipher.getOutputSize(output.length)];

        int cipherLength = cipher.processBytes(output, 0, output.length, cipherText, 0);
        int outputLength = cipher.doFinal(cipherText, cipherLength);
        outputLength += cipherLength;

        byte[] resultBytes = cipherText;
        if (outputLength != output.length) {
            resultBytes = new byte[outputLength];
            System.arraycopy(
                    cipherText, 0,
                    resultBytes, 0,
                    outputLength
                    );
        }

        String result = new String(resultBytes);
        System.out.println("testDecryptRijndael result : " + result);
        // assertEquals("Hallo ich bin ein Test", result);
    }

}
