package com.sulake.habbo.help.enum
{
   public class CallForHelpResultEnum
   {
      
      public static const CALL_FOR_HELP_SENT_OK:String = "CFHRE_SENT_OK";
      
      public static const TOO_MANY_PENDING_CALLS:String = "CFHRE_ERROR_TOO_MANY_PENDING";
      
      public static const HAS_ABUSIVE_CALL:String = "CFHRE_HAS_ABUSIVE_CALL";
      
      public static const TOO_MANY_PENDING_CALLS_CODE:int = 1;
      
      public static const HAS_ABUSIVE_CALL_CODE:int = 2;
       
      
      public function CallForHelpResultEnum()
      {
         super();
      }
   }
}
