package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1363 implements IMessageParser
   {
       
      
      private var var_383:int;
      
      private var var_505:String;
      
      public function class_1363()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_383 = -1;
         var_505 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_383 = param1.readInteger();
         var_505 = param1.readString();
         return true;
      }
      
      public function get votingTimeout() : int
      {
         return var_383;
      }
      
      public function get chatRecord() : String
      {
         return var_505;
      }
   }
}
