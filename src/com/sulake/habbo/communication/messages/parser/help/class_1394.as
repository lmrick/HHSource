package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1394 implements IMessageParser
   {
       
      
      private var var_354:int = 0;
      
      private var _roomName:String = "";
      
      public function class_1394()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_354 = param1.readInteger();
         _roomName = param1.readString();
         return true;
      }
      
      public function getRoomId() : int
      {
         return var_354;
      }
      
      public function getRoomName() : String
      {
         return _roomName;
      }
   }
}
