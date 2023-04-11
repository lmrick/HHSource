package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1224 implements IMessageParser
   {
       
      
      private var var_946:int = 0;
      
      public function class_1224()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_946 = param1.readInteger();
         return true;
      }
      
      public function get endReason() : int
      {
         return var_946;
      }
   }
}
