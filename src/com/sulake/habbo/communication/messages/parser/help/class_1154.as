package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1154 implements IMessageParser
   {
       
      
      private var var_121:Array;
      
      public function class_1154()
      {
         var_121 = [];
         super();
      }
      
      public function get callArray() : Array
      {
         return var_121;
      }
      
      public function get callCount() : int
      {
         return var_121.length;
      }
      
      public function flush() : Boolean
      {
         var_121 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var_121 = [];
         var _loc3_:int = param1.readInteger();
         while(_loc4_ < _loc3_)
         {
            _loc2_ = {};
            _loc2_.callId = param1.readString();
            _loc2_.timeStamp = param1.readString();
            _loc2_.message = param1.readString();
            var_121.push(_loc2_);
            _loc4_++;
         }
         return true;
      }
   }
}
