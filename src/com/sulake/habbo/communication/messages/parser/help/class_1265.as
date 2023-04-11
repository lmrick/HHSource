package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1265 implements IMessageParser
   {
       
      
      private var var_534:String;
      
      private var var_1323:int;
      
      public function class_1265()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_534 = param1.readString();
         var_1323 = param1.readInteger();
         return true;
      }
      
      public function get chatMessage() : String
      {
         return var_534;
      }
      
      public function get senderId() : int
      {
         return var_1323;
      }
   }
}
