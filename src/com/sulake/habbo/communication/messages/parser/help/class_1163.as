package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1163 implements IMessageParser
   {
       
      
      private var var_509:String;
      
      private var var_263:Array;
      
      public function class_1163()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_509 = null;
         var_263 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var_509 = param1.readString();
         var_263 = [];
         var _loc2_:int = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_263.push(param1.readInteger());
            _loc3_++;
         }
         return true;
      }
      
      public function get quizCode() : String
      {
         return var_509;
      }
      
      public function get questionIds() : Array
      {
         return var_263;
      }
   }
}
