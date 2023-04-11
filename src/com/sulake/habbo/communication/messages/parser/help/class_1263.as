package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1263 implements IMessageParser
   {
       
      
      private var var_492:int;
      
      private var var_330:String;
      
      public function class_1263()
      {
         super();
      }
      
      public function get resultType() : int
      {
         return var_492;
      }
      
      public function get messageText() : String
      {
         return var_330;
      }
      
      public function flush() : Boolean
      {
         var_492 = -1;
         var_330 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_492 = param1.readInteger();
         var_330 = param1.readString();
         return true;
      }
   }
}
