package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.class_24;
   
   [SecureSWF(rename="true")]
   public class class_1104 implements IMessageParser
   {
       
      
      private var var_45:class_24;
      
      public function class_1104()
      {
         super();
      }
      
      public function get data() : class_24
      {
         return var_45;
      }
      
      public function flush() : Boolean
      {
         if(var_45 != null)
         {
            var_45.dispose();
         }
         var_45 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:class_24 = null;
         var _loc6_:int = 0;
         var _loc5_:String = null;
         var _loc7_:int = 0;
         var _loc4_:int = 0;
         var_45 = new class_24();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = new class_24();
            _loc6_ = param1.readInteger();
            _loc5_ = param1.readString();
            _loc7_ = param1.readInteger();
            _loc3_.add("name",_loc5_);
            _loc3_.add("count",_loc7_);
            var_45.add(_loc6_,_loc3_);
            _loc4_++;
         }
         return true;
      }
   }
}
