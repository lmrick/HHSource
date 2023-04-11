package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1095 implements IMessageParser
   {
      
      private static const const_264:int = 0;
      
      private static const const_70:int = 1;
      
      private static const const_381:int = 2;
       
      
      private var var_257:int = -1;
      
      public function class_1095()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_257 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_257 = param1.readInteger();
         return true;
      }
      
      public function get localizationCode() : String
      {
         if(var_257 == 0 || var_257 == 1)
         {
            return "valid";
         }
         return "invalid";
      }
   }
}
