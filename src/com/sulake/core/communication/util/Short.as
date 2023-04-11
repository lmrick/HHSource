package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_2492:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_2492 = new ByteArray();
         var_2492.writeShort(param1);
         var_2492.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_2492.position = 0;
         if(false)
         {
            _loc1_ = var_2492.readShort();
            var_2492.position = 0;
         }
         return _loc1_;
      }
   }
}
