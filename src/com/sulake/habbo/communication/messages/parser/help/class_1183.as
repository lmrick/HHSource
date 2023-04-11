package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1183 implements IMessageParser
   {
       
      
      private var var_1202:String;
      
      public function class_1183()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return false;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1202 = param1.readString();
         return true;
      }
      
      public function get infoUrl() : String
      {
         return var_1202;
      }
   }
}
