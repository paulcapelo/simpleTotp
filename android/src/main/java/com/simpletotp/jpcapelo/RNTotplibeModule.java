
package com.simpletotp.jpcapelo;

/**
 * Created by jpcapelo on 28/04/20.
 * jhonnathanp27@gmail.com
 */

import android.content.Context;
import android.util.Log;
import android.widget.Toast;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

public class RNTotplibeModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;
  private static final int[] DIGITS_POWER // 0 1  2   3    4     5      6       7        8
          = {1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000};
  private final static Charset UTF8_CHARSET = Charset.forName("UTF-8");
  private boolean IS_READY;


  public RNTotplibeModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNTotplibe";
  }

  @ReactMethod
  public void getTOTP(String semilla, String tiempo,String fecha, Promise promise) {
    if(semilla.equals("")||tiempo.equals("")|| fecha.equals("") ){ promise.reject("error", "Verifique sus valores");}

    try {
      Context context = getReactApplicationContext();
//    Toast.makeText(context, text, Toast.LENGTH_LONG).show();
      long tiempo2 = Long.parseLong(tiempo);
      String TOTP = generateByTimeOTP(semilla, tiempo2, fecha);
      promise.resolve(TOTP);
      //Toast.makeText(context, TOTP, Toast.LENGTH_LONG).show();

    } catch (NumberFormatException e) {

      promise.reject("error", "error generando Token", e);
    }
  }


  public static  String generateByTimeOTP (String semilla, long window) {
    String valor_f = "";
    String pass = semilla;
    byte[] code = pass.getBytes(UTF8_CHARSET);

    String tiempo = String.valueOf(new Date().getTime()).substring(0, 10);
    long time = Long.parseLong(tiempo);
    long counter = (time / window);

    try {
      String valor = generateTOTP(code, counter, 6);
      Log.e("TOTP", valor);
      valor_f = valor;
    } catch (Exception e) {
      String valor =  "Exception = " + e.getMessage();
      Log.e("TOTP", valor);
      valor_f = valor;
    }

    return valor_f;
  }




  public static String generateByTimeOTP (String semilla, long window, String fecha) {
    String valor_f = "";
    String pass = semilla;
    byte[] code = pass.getBytes(UTF8_CHARSET);

    if (fecha.equals("")) {
      fecha = parseStringDate5(new Date());
    }

    Date date = parseDate2(fecha);

    String tiempo = String.valueOf(date.getTime()).substring(0, 10);
    long time = Long.parseLong(tiempo);
    long counter = (time / window);

    try {
      String valor = generateTOTP(code, counter, 6);
      Log.e("TOTP", valor);
      valor_f = valor;
    } catch (Exception e) {
      String valor =  "Exception = " + e.getMessage();
      Log.e("TOTP", valor);
      valor_f = valor;
    }

    return valor_f;
  }


  public static String generateTOTP (byte[] secret,
                                     long movingFactor,
                                     int codeDigits)
          throws NoSuchAlgorithmException, InvalidKeyException, UnsupportedEncodingException {
    // put movingFactor value into text byte array
    String result = null;
    byte[] text = new byte[8];
    for (int i = text.length - 1; i >= 0; i--) {
      text[i] = (byte) (movingFactor & 0xff);
      movingFactor = movingFactor >> 8;
    }

    // compute hmac hash
    byte[] hash = hmac_sha1(secret, text);

    // put selected bytes into result int
    int offset = hash[hash.length - 1] & 0xf;

    int binary =
            ((hash[offset] & 0x7f) << 24) |
                    ((hash[offset + 1] & 0xff) << 16) |
                    ((hash[offset + 2] & 0xff) << 8) |
                    (hash[offset + 3] & 0xff);

    int otp = binary % DIGITS_POWER[codeDigits];
    result = Integer.toString(otp);
    while (result.length() < codeDigits) {
      result = "0" + result;
    }
    return result;
  }

  public static byte[] hmac_sha1(byte[] keyBytes, byte[] text)
          throws NoSuchAlgorithmException, InvalidKeyException {
    Mac hmacSha1;
    try {
      hmacSha1 = Mac.getInstance("HmacSHA1");
    } catch (NoSuchAlgorithmException nsae) {
      hmacSha1 = Mac.getInstance("HMAC-SHA-1");
    }
    SecretKeySpec macKey =
            new SecretKeySpec(keyBytes, "RAW");
    hmacSha1.init(macKey);
    return hmacSha1.doFinal(text);
  }
  public static String parseStringDate5(Date date) {
    String inputFormat = "yyyy-MM-dd HH:mm:ss";
    SimpleDateFormat inputParser = new SimpleDateFormat(inputFormat);
    inputParser.setTimeZone(TimeZone.getTimeZone("GMT-5"));
    return inputParser.format(date);
  }

  public static Date parseDate2(String date) {
    try {
      String inputFormat = "yyyy-MM-dd HH:mm:ss";
      SimpleDateFormat inputParser = new SimpleDateFormat(inputFormat);
      inputParser.setTimeZone(TimeZone.getTimeZone("GMT-5"));
      return inputParser.parse(date);
    } catch (java.text.ParseException e) {
      return new Date(0);
    }
  }
  private boolean notReady(Promise promise) {
    if(!IS_READY) {
      promise.reject("not_ready", "TTS Engine Not Ready");
      return true;
    } else {
      return false;
    }
  }
}