package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1503 implements IMessageParser
   {
       
      
      private var var_920:int;
      
      public function class_1503()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_920 = param1.readInteger();
         return true;
      }
      
      public function getRequesterRoomId() : int
      {
         return var_920;
      }
   }
}
