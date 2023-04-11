package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1220 implements IMessageParser
   {
       
      
      private var var_369:int;
      
      public function class_1220()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_369 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_369 = param1.readInteger();
         return true;
      }
      
      public function get acceptanceTimeout() : int
      {
         return var_369;
      }
   }
}
