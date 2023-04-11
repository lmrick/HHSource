package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1484 implements IMessageParser
   {
       
      
      private var var_533:int;
      
      private var var_568:int;
      
      private var var_253:Array;
      
      public function class_1484()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_533 = -1;
         var_568 = -1;
         var_253 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_533 = param1.readInteger();
         var_568 = param1.readInteger();
         var_253 = [];
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_253.push(param1.readInteger());
            _loc3_++;
         }
         return true;
      }
      
      public function get winningVoteCode() : int
      {
         return var_533;
      }
      
      public function get ownVoteCode() : int
      {
         return var_568;
      }
      
      public function get finalStatus() : Array
      {
         return var_253;
      }
   }
}
