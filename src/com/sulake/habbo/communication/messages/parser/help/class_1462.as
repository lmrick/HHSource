package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.class_24;
   
   [SecureSWF(rename="true")]
   public class class_1462 implements IMessageParser
   {
       
      
      private var var_136:class_24;
      
      private var var_154:class_24;
      
      public function class_1462()
      {
         super();
      }
      
      public function get urgentData() : class_24
      {
         return var_136;
      }
      
      public function get normalData() : class_24
      {
         return var_154;
      }
      
      public function flush() : Boolean
      {
         if(var_136 != null)
         {
            var_136.dispose();
         }
         var_136 = null;
         if(var_154 != null)
         {
            var_154.dispose();
         }
         var_154 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         var _loc5_:String = null;
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var_136 = new class_24();
         var_154 = new class_24();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1.readInteger();
            _loc5_ = param1.readString();
            var_136.add(_loc2_,_loc5_);
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1.readInteger();
            _loc5_ = param1.readString();
            var_154.add(_loc2_,_loc5_);
            _loc4_++;
         }
         return true;
      }
   }
}
