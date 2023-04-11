package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1378 implements IMessageParser
   {
       
      
      private var var_327:int;
      
      private var var_482:String;
      
      public function class_1378()
      {
         super();
      }
      
      public function get questionId() : int
      {
         return var_327;
      }
      
      public function get answerText() : String
      {
         return var_482;
      }
      
      public function flush() : Boolean
      {
         var_327 = -1;
         var_482 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_327 = param1.readInteger();
         var_482 = param1.readString();
         return true;
      }
   }
}
