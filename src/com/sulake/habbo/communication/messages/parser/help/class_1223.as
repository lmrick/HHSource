package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1223 implements IMessageParser
   {
      
      private static const const_106:int = 0;
      
      private static const const_71:int = 1;
      
      private static const const_164:int = 2;
      
      private static const const_66:int = 3;
       
      
      private var var_170:int = -1;
      
      public function class_1223()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_170 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_170 = param1.readInteger();
         return true;
      }
      
      public function get localizationCode() : String
      {
         switch(var_170)
         {
            case 0:
               return "sent";
            case 1:
               return "blocked";
            case 2:
               return "nochat";
            case 3:
               return "alreadyreported";
            default:
               return "invalid";
         }
      }
   }
}
