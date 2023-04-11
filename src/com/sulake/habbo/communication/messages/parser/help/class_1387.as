package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1387 implements IMessageParser
   {
       
      
      private var var_1283:int;
      
      private var var_330:String;
      
      public function class_1387()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1283 = param1.readInteger();
         var_330 = param1.readString();
         return true;
      }
      
      public function get closeReason() : int
      {
         return var_1283;
      }
      
      public function get messageText() : String
      {
         return var_330;
      }
   }
}
