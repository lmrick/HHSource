package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.utils.class_24;
   
   [SecureSWF(rename="true")]
   public class class_1321 implements IMessageParser
   {
       
      
      private var var_45:class_24;
      
      public function class_1321()
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
         var _loc2_:int = 0;
         var _loc5_:String = null;
         var _loc4_:int = 0;
         var_45 = new class_24();
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1.readInteger();
            _loc5_ = param1.readString();
            var_45.add(_loc2_,_loc5_);
            _loc4_++;
         }
         return true;
      }
   }
}
