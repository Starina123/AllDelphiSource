/**
 * {*******************************************************}
 * {                                                       }
 * {  Delphi FireMonkey In-App Purchase Security Service   }
 * {                                                       }
 * { Copyright(c) 2013-2014 Embarcadero Technologies, Inc. }
 * {                                                       }
 * {*******************************************************}
 */
package com.embarcadero.firemonkey.purchasing;

import android.util.Base64;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.security.Signature;
import java.security.SignatureException;


public class IAPSecurity {

    private static final String TAG = "IAPSecurity";
    private static String keyFactoryAlgorithm = "RSA";
    private static String signatureAlgorithm = "SHA1withRSA";
     
    private static PublicKey generatePublicKey(String base64EncodedPublicKey) {
        try {
            KeySpec keySpec = new X509EncodedKeySpec(Base64.decode(base64EncodedPublicKey, android.util.Base64.DEFAULT));
            return KeyFactory.getInstance(keyFactoryAlgorithm).generatePublic(keySpec);
        } 
        catch (NoSuchAlgorithmException ex) {
            return null;
        }
        catch (InvalidKeySpecException ex) {
            return null;
        }
        catch (IllegalArgumentException ex) {
            return null;
        }
    }
    
    private static boolean verify(PublicKey publicKey, String signedData, String signature) {
        try {
            Signature sig = Signature.getInstance(signatureAlgorithm);
            sig.initVerify(publicKey);
            sig.update(signedData.getBytes());
            if (sig.verify(Base64.decode(signature, android.util.Base64.DEFAULT)))
                return true;
            else
                return false;
        }
        catch (NoSuchAlgorithmException ex) {
            return false;
        }
        catch (InvalidKeyException ex) {
            return false;
        }
        catch (SignatureException ex) {
            return false;
        }
        catch (IllegalArgumentException ex) {
            return false;
        }
    }
    
    public static boolean verifyPurchase(String base64PublicKey, String signedData, String signature) {
        if ((base64PublicKey != null) && (signedData != null) && (signature != null)) 
            return verify(generatePublicKey(base64PublicKey), signedData, signature);
        else
            return false;
    }
}