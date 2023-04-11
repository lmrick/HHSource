package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   [SecureSWF(rename="true")]
   public class class_1180 implements IMessageParser
   {
       
      
      private var _onDuty:Boolean;
      
      private var var_1040:int;
      
      private var var_707:int;
      
      private var var_1247:int;
      
      public function class_1180()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _onDuty = param1.readBoolean();
         var_1040 = param1.readInteger();
         var_707 = param1.readInteger();
         var_1247 = param1.readInteger();
         return true;
      }
      
      public function get onDuty() : Boolean
      {
         return _onDuty;
      }
      
      public function get helpersOnDuty() : int
      {
         return var_707;
      }
      
      public function get guardiansOnDuty() : int
      {
         return var_1247;
      }
      
      public function get guidesOnDuty() : int
      {
         return var_1040;
      }
   }
}
