package com.warpww.sec;

import java.math.BigInteger;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.RSAPrivateKeySpec;
import java.security.spec.RSAPublicKeySpec;

import javax.crypto.Cipher;

import org.apache.commons.codec.binary.Base64;

public class RSA {

	// Peteron's Public Key
	private String publicModulus = "mbN7+icC8rd1VpTGayh7JJVph4nla9UW35MjfLGSI0mjUART3N48U3MrR3x5gG1NbmcAakJp/yEhfeaWhj5rDKzz4tdbfEynXpME4U6UEOKabh/OfXSsnLTQ7Dqq3A2L4szIk5ehmFW5hqJX6DjVZAIPlyIHUeFTbb3PoIjjorc=";
	private String publicExponent = "AQAB";
	
	// Peterson's Private Key
	// *******************************************************************************************************************
    // <RSAKeyValue>
    // <Modulus>mbN7+icC8rd1VpTGayh7JJVph4nla9UW35MjfLGSI0mjUART3N48U3MrR3x5gG1NbmcAakJp/yEhfeaWhj5rDKzz4tdbfEynXpME4U6UEOKabh/OfXSsnLTQ7Dqq3A2L4szIk5ehmFW5hqJX6DjVZAIPlyIHUeFTbb3PoIjjorc=</Modulus>
    // <Exponent>AQAB</Exponent>
    // <P>0fWWUpEajHK3uNPH/TUrr2QxVSB9U5ggZq6fY0HZk/COMiJb0n8B+42k1bYQOj5zWKq+VQNJclyp3g+UzzM+gQ==</P>
    // <Q>u2e/3hCrwNFpuHtvu3gZ3+dORWONeIgD1+i1l2juJVWqtaJqVMm8BQimGVQK3A6WD4hh6BHA0lq88NCnUbC1Nw==</Q>
    // <DP>wYpdM2dGzcjBysKOS77Dsj3tq8bzQCevVngJvPlqk5Dfwx8g/XzOWxBKriXR956xvT5HjR4miiEZBPXf+tAGAQ==</DP>
    // <DQ>CPV7waTwYQZh1HTqMX8bVY3cOwr4T2PJM0AntjZI9DX1NDuwc581QtRYBGv1HPIBkHqHm62Fl0jJMYX4Cbq13w==</DQ>
    // <InverseQ>S9Tf8dhF/LfmEK1KzDgY8qJb7sYiiRAded7APZXri1qX3uOb3gvTsQUAuemAxsu3Ia7j+xN2K8ZRd0q2Q4JIRg==</InverseQ>
    // <D>ACQF7Qi0G/zHArlIJTj4Q+RPIGyj5SFgz/uWgLq444dhuuUGHqGldH4agApBIjj3ZS569Z3x8uXY3gCkCqNr/aqdvKs6aEw/jwLE487bUzxUSiudEdXNqx6Qlu7cESiyl6E6C6oaqriBO8DCRXnOniad6Q30mtQt4GO/nFvsBAE=</D>
    // </RSAKeyValue>"
	// *******************************************************************************************************************
	private String privateModulus = "mbN7+icC8rd1VpTGayh7JJVph4nla9UW35MjfLGSI0mjUART3N48U3MrR3x5gG1NbmcAakJp/yEhfeaWhj5rDKzz4tdbfEynXpME4U6UEOKabh/OfXSsnLTQ7Dqq3A2L4szIk5ehmFW5hqJX6DjVZAIPlyIHUeFTbb3PoIjjorc=";
    private String privateDD = "ACQF7Qi0G/zHArlIJTj4Q+RPIGyj5SFgz/uWgLq444dhuuUGHqGldH4agApBIjj3ZS569Z3x8uXY3gCkCqNr/aqdvKs6aEw/jwLE487bUzxUSiudEdXNqx6Qlu7cESiyl6E6C6oaqriBO8DCRXnOniad6Q30mtQt4GO/nFvsBAE="; 

    private byte[] byteRsaPublicKey = null;
    private byte[] byteRsaPrivateKey = null;
    private byte[] byteClearData = null;
    private byte[] byteEncryptedData = null;
    private byte[] byteDecryptedData = null;
   
    public void printDebugInfo()
    {
    		System.out.println("RSA.byteClearData: " + Base64.encodeBase64String(byteClearData));
    		System.out.println("RSA.byteEncryptedData: " + Base64.encodeBase64String(byteEncryptedData));
    		System.out.println("RSA.byteDecryptedData: " + Base64.encodeBase64String(byteDecryptedData));
    }
    
    public String getClearData64()
    {
    		return Base64.encodeBase64String(byteClearData);
    }
    
    public void SetClearData64(String inputData)
    {
    		byteClearData = Base64.decodeBase64(inputData);
    }
    
    public String getEncryptedData64()
    {
    		return Base64.encodeBase64String(byteEncryptedData);
    }
    
    public String getDecryptedData64()
    {
    		return Base64.encodeBase64String(byteDecryptedData);
    }
    // RSA Public Key Encryption
    public void Encrypt() throws Exception
    {    	
	    	byte[] bytMod = Base64.decodeBase64(publicModulus.trim());
	    	byte[] bytExp = Base64.decodeBase64(publicExponent.trim());
	    	
	    	BigInteger modulus = new BigInteger(1, bytMod);
	    BigInteger pubExp = new BigInteger(1, bytExp);
	
	    KeyFactory keyFactory = KeyFactory.getInstance("RSA");
	    RSAPublicKeySpec pubKeySpec = new RSAPublicKeySpec(modulus, pubExp);
	    RSAPublicKey publicKey = (RSAPublicKey) keyFactory.generatePublic(pubKeySpec);
	
	    Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
	    cipher.init(Cipher.ENCRYPT_MODE, publicKey);

	    byte[] cipherData = cipher.doFinal(byteClearData);
	    byteEncryptedData = new byte[cipherData.length];
	    System.arraycopy(cipherData, 0, byteEncryptedData, 0, cipherData.length);
    }

    public void Decrypt() throws Exception
    {
        byte[] modBytes = Base64.decodeBase64(privateModulus.trim());
        byte[] dBytes = Base64.decodeBase64(privateDD.trim());

        BigInteger modulus = new BigInteger(1, modBytes);
        BigInteger d = new BigInteger(1, dBytes);

        KeyFactory factory = KeyFactory.getInstance("RSA");
        Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");

        RSAPrivateKeySpec privSpec = new RSAPrivateKeySpec(modulus, d);
        PrivateKey privKey = factory.generatePrivate(privSpec);
        cipher.init(Cipher.DECRYPT_MODE, privKey);
        byte[] decrypted = cipher.doFinal(byteEncryptedData);
        byteDecryptedData = new byte[decrypted.length];
        System.arraycopy(decrypted, 0, byteDecryptedData, 0, decrypted.length);
    }
    
}
