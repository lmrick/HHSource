package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1117 implements IMessageParser
   {
       
      
      private var var_418:Boolean;
      
      public function class_1117()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_418 = param1.readBoolean();
         return true;
      }
      
      public function get isTyping() : Boolean
      {
         return var_418;
      }
   }
}
