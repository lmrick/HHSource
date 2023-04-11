package com.sulake.habbo.communication.messages.parser.landingview
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import package_26.class_1627;
   
   [SecureSWF(rename="true")]
   public class class_1367 implements IMessageParser
   {
       
      
      private var var_637:Array;
      
      public function class_1367()
      {
         super();
      }
      
      public function get articles() : Array
      {
         return var_637;
      }
      
      public function flush() : Boolean
      {
         var_637 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_637.push(new class_1627(param1));
            _loc3_++;
         }
         return true;
      }
   }
}
