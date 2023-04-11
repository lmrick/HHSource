package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1372 implements IMessageParser
   {
      
      public static const const_361:int = 0;
      
      public static const const_112:int = 1;
      
      public static const const_323:int = 2;
      
      public static const const_406:int = 3;
      
      public static const const_18:int = 4;
      
      public static const const_153:int = 5;
       
      
      private var _status:Array;
      
      public function class_1372()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         _status = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         _status = [];
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _status.push(param1.readInteger());
            _loc3_++;
         }
         return true;
      }
      
      public function get status() : Array
      {
         return _status;
      }
   }
}
