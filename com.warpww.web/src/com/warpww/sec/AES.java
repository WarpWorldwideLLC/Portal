package com.warpww.sec;

import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Arrays;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

public class AES {

	
	public void Hello()
	{
		System.out.println("Hello from warpww.com.sec.AES!");
	}
	
	
	//Private members
	private byte[] byteInitVector = null;
	private int nInitVectorSize = 16;			// InitVectorSize is in bytes to make it easy to relate to how IV's are typically described.
	private byte[] byteAesKey = null;
	private int nAesKeySize = 128;				// AesKeySize is in bits to make it easy to relate to how AES Keys are typically described.
	private byte[] byteClearData = null;
	private byte[] byteEncryptedData = null;
	private byte[] byteDecryptedData = null;
	
	private String aesError = null;
	private String aesWarning = null;
	
	// Public Methods
	public void setClearData(byte[] inputData)
	{
		byteClearData = new byte[inputData.length];
		
		System.arraycopy(inputData, 0, byteClearData, 0, inputData.length);
	}
	
	public String getEncryptedDataBase64()
	{
		return Base64.encodeBase64String(byteEncryptedData);
	}
	
	public String getClearDataBase64()
	{
		return Base64.encodeBase64String(byteClearData);
	}
	
	public byte[] getInitVectorBytes()
	{
		return byteInitVector;
	}
	
	public String getInitVectorBase64()
	{
		return Base64.encodeBase64String(byteInitVector);
	}
	
	public String getKeyBase64()
	{
		return Base64.encodeBase64String(byteAesKey);
	}
	
	public void printDebugInfo()
	{
		System.out.println("AES.byteInitVector: " + Base64.encodeBase64String(byteInitVector));
		System.out.println("AES.nInitVectorSize: " + nInitVectorSize);
		System.out.println("AES.byteAesKey: " + Base64.encodeBase64String(byteAesKey));
		System.out.println("AES.nAesKeySize: " + nAesKeySize);
		System.out.println("AES.byteClearData: " + Base64.encodeBase64String(byteClearData));
		System.out.println("AES.byteEncryptedData: " + Base64.encodeBase64String(byteEncryptedData));
		System.out.println("AES.byteDecryptedData: " + Base64.encodeBase64String(byteDecryptedData));
		System.out.println("AES.Decrypt == Clear: " + java.util.Arrays.equals(byteClearData, byteDecryptedData));
		System.out.println("AES.aesWarning: " + aesWarning);
		System.out.println("AES.aesError: " + aesError);
	}
	
	public void aesEncrypt() throws Exception
	{
		String encryptedText = null;
        String decryptedText = null;

        KeyGenerator KeyGen = KeyGenerator.getInstance("AES");
        KeyGen.init(128);

        SecretKey SecKey = KeyGen.generateKey();

        Cipher AesCipher = Cipher.getInstance("AES");

        byte[] byteText = "Your Plain Text Here".getBytes();
        System.out.println("byteText: " + new String(byteText));
        	
        	// Encrypt the text
        AesCipher.init(Cipher.ENCRYPT_MODE, SecKey);
        byte[] byteCipherText = AesCipher.doFinal(byteText);
        System.out.println("byteCipherText: " + new String(byteCipherText));

        // Decrypt the text
        AesCipher.init(Cipher.DECRYPT_MODE, SecKey);
        byte[] bytePlainText = AesCipher.doFinal(byteCipherText);
        System.out.println("Decrypted Text: " + new String(bytePlainText));
        
	}
	
	public void genInitializationVector()
	{
		// Generating IV.
        byte[] iv = new byte[nInitVectorSize];
        SecureRandom random = new SecureRandom();
        random.nextBytes(iv);
        byteInitVector = iv;
	}
	
	public void genAesSecretKey() throws Exception
	{
		// Generate Key - Way 1
        KeyGenerator KeyGen = KeyGenerator.getInstance("AES");
        KeyGen.init(nAesKeySize);
        SecretKey SecKey = KeyGen.generateKey();
        byteAesKey = SecKey.getEncoded();

	}
	
	public void genAesKeyBytes() throws Exception
	{
	    // Generate a random key value.
        byte[] tempKeyBytes = new byte[16];  
        SecureRandom random = new SecureRandom();
        	random = new SecureRandom();
        random.nextBytes(tempKeyBytes);
        
        // Hashing key.
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        digest.update(tempKeyBytes);
        byte[] keyBytes = new byte[nAesKeySize/8];  // Translate AES Key length in bits into bytes (nAesKeySize/8) to size the byte array.
        System.arraycopy(digest.digest(), 0, keyBytes, 0, keyBytes.length);
        
        byteAesKey = keyBytes;
	}
	
    public void aesivEncrypt(boolean IncludeIV) throws Exception {
 
    		// If no initialization vector has been assigned, generate one.
        if(byteInitVector == null)
        {
        		genInitializationVector();
        }
        IvParameterSpec ivParameterSpec = new IvParameterSpec(byteInitVector);
       
        // If no AES key has been assigned, generate one.
        if(byteAesKey == null)
        {
        		genAesKeyBytes();
        }
        SecretKeySpec secretKeySpec = new SecretKeySpec(byteAesKey, "AES");
        
        // Encrypt.
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec, ivParameterSpec);
        byte[] tempEncyrptedData = cipher.doFinal(byteClearData);
        byteEncryptedData = new byte[tempEncyrptedData.length];
        System.arraycopy(tempEncyrptedData, 0, byteEncryptedData, 0, tempEncyrptedData.length);
       
        // Combine IV and encrypted part.
        if(IncludeIV)
        {
	        byte[] encryptedIVAndText = new byte[nInitVectorSize + byteEncryptedData.length];
	        System.arraycopy(byteInitVector, 0, encryptedIVAndText, 0, nInitVectorSize);
	        System.arraycopy(byteEncryptedData, 0, encryptedIVAndText, nInitVectorSize, byteEncryptedData.length);
	    }

    }

    public void aesivDecrypt(boolean IncludeIv) throws Exception {

	    IvParameterSpec ivParameterSpec = new IvParameterSpec(byteInitVector);
	   
	    // Hash key.
	    byte[] keyBytes = new byte[nAesKeySize/8]; 		// Translate AES Key length in bits into bytes (nAesKeySize/8) to size the byte array.
	    MessageDigest md = MessageDigest.getInstance("SHA-256");
	    md.update(byteAesKey);
	    System.arraycopy(md.digest(), 0, keyBytes, 0, keyBytes.length);
	    SecretKeySpec secretKeySpec = new SecretKeySpec(byteAesKey, "AES");
	    
	    // Decrypt 
	    Cipher cipherDecrypt = Cipher.getInstance("AES/CBC/PKCS5Padding");
	    cipherDecrypt.init(Cipher.DECRYPT_MODE, secretKeySpec, ivParameterSpec);
	    byte[] decrypted = cipherDecrypt.doFinal(byteEncryptedData);
	    byteDecryptedData = new byte[decrypted.length];
	    System.arraycopy(decrypted, 0, byteDecryptedData, 0, decrypted.length);
    
    }
    
    private void aesivDecrypCombined()
    {
    	
	    // Extract IV.
	    //byte[] iv = new byte[ivSize];
	    //System.arraycopy(encryptedIvTextBytes, 0, iv, 0, iv.length);
	    //IvParameterSpec ivParameterSpec = new IvParameterSpec(iv);
	    
	    IvParameterSpec ivParameterSpec = new IvParameterSpec(byteInitVector);
	   
	    // Extract encrypted part.
	    //int encryptedSize = encryptedIvTextBytes.length - ivSize;
	    //byte[] encryptedBytes = new byte[encryptedSize];
	    //System.arraycopy(encryptedIvTextBytes, ivSize, encryptedBytes, 0, encryptedSize);
    }

	
	
}
