package com.hurlant.crypto.tls
{
   public class TLSError extends Error
   {
      
      public static const const_502:uint = 0;
      
      public static const const_690:uint = 10;
      
      public static const bad_record_mac:uint = 20;
      
      public static const decryption_failed:uint = 21;
      
      public static const record_overflow:uint = 22;
      
      public static const decompression_failure:uint = 30;
      
      public static const handshake_failure:uint = 40;
      
      public static const bad_certificate:uint = 42;
      
      public static const const_689:uint = 43;
      
      public static const const_758:uint = 44;
      
      public static const const_911:uint = 45;
      
      public static const const_773:uint = 46;
      
      public static const const_582:uint = 47;
      
      public static const unknown_ca:uint = 48;
      
      public static const access_denied:uint = 49;
      
      public static const decode_error:uint = 50;
      
      public static const decrypt_error:uint = 51;
      
      public static const protocol_version:uint = 70;
      
      public static const insufficient_security:uint = 71;
      
      public static const internal_error:uint = 80;
      
      public static const user_canceled:uint = 90;
      
      public static const no_renegotiation:uint = 100;
       
      
      public function TLSError(param1:String, param2:int)
      {
         super(param1,param2);
      }
   }
}
