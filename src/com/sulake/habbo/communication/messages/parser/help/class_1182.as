package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1182 implements IMessageParser
   {
       
      
      private var var_1019:Boolean;
      
      private var var_1194:int;
      
      private var var_1209:String;
      
      private var var_888:int;
      
      public function class_1182()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1019 = param1.readBoolean();
         var_1194 = param1.readInteger();
         var_1209 = param1.readString();
         var_888 = param1.readInteger();
         return true;
      }
      
      public function get asGuide() : Boolean
      {
         return var_1019;
      }
      
      public function get helpRequestType() : int
      {
         return var_1194;
      }
      
      public function get helpRequestDescription() : String
      {
         return var_1209;
      }
      
      public function get roleSpecificWaitTime() : int
      {
         return var_888;
      }
   }
}
