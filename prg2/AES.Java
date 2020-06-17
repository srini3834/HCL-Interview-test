import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Base64;
 
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.io.IOException;

import java.io.FileWriter;
 
public class AES {
 
    private static SecretKeySpec secretKey;
    private static byte[] key;
 
    public static void setKey(String myKey)
    {
        MessageDigest sha = null;
        try {
            key = myKey.getBytes("UTF-8");
            sha = MessageDigest.getInstance("SHA-1");
            key = sha.digest(key);
            key = Arrays.copyOf(key, 16);
            secretKey = new SecretKeySpec(key, "AES");
        }
        catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
 
    public static String encrypt(String strToEncrypt, String secret)
    {
        try
        {
            setKey(secret);
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, secretKey);
            return Base64.getEncoder().encodeToString(cipher.doFinal(strToEncrypt.getBytes("UTF-8")));
        }
        catch (Exception e)
        {
            System.out.println("Error while encrypting: " + e.toString());
        }
        return null;
    }
 
    public static String decrypt(String strToDecrypt, String secret)
    {
        try
        {
            setKey(secret);
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
            cipher.init(Cipher.DECRYPT_MODE, secretKey);
            return new String(cipher.doFinal(Base64.getDecoder().decode(strToDecrypt)));
        }
        catch (Exception e)
        {
            System.out.println("Error while decrypting: " + e.toString());
        }
        return null;
    }


public static void main(String[] args) throws Exception {
    	
		final String secretKey = "ssshhhhhhhhhhh!!!!";
	    String userid = args[0];
        String pwd = args[1];
        String type = args[2];
        String useridencoded = null;
        String pwdencoded =null;
        String useriddecoded=null ;
        String pwddecoded =null;

          
        System.out.println("Program Arguments:");
        for (String arg : args) {
            System.out.println("\t" + args[0]);
        }

              
        if(type.equalsIgnoreCase("E"))
        {
	      	  // Encode data 
	         useridencoded = encrypt(userid,secretKey);
	         System.out.println("UserId Encoded String is" + useridencoded);
	         pwdencoded = encrypt(pwd,secretKey);
	         System.out.println("Password Encoded String is" + pwdencoded);
        }
        else if(type.equalsIgnoreCase("D"))
        {
        	// Decode data 
        	 useriddecoded = decrypt(userid,secretKey);
        	 System.out.println("UserId Decoded String is" + useriddecoded);
        	 pwddecoded = decrypt(pwd,secretKey);
        	 System.out.println("UserId Decoded String is" + pwddecoded);
	        
        
        try
        {
        	
        	 FileWriter writer = new FileWriter("/usr1/myPc/bin/myuserid.txt", false);
        	 writer.write(useriddecoded);
	        writer.close();
	        FileWriter writer1 = new FileWriter("/usr1/myPc/bin/mypwd.txt", false);
        	 writer1.write(pwddecoded);
	        writer1.close();
	        
        }
        
       catch (IOException e)
       {
    	   e.printStackTrace();
       }
        }
       
        

    }

}
