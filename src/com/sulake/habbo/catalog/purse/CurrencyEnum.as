package com.sulake.habbo.catalog.purse
{
   import com.sulake.core.runtime.class_19;
   
   public class CurrencyEnum
   {
      
      public static const DUCKET:int = 0;
      
      public static const const_1187:int = 3;
      
      public static const const_1027:int = 5;
      
      public static const SEASONAL_1:int = 101;
      
      public static const SEASONAL_2:int = 102;
      
      public static const SEASONAL_3:int = 103;
      
      public static const SEASONAL_4:int = 104;
      
      public static const SEASONAL_5:int = 105;
      
      public static const NO_OP_1:int = 1;
      
      public static const NO_OP_2:int = 2;
      
      public static const NO_OP_4:int = 4;
       
      
      public function CurrencyEnum()
      {
         super();
      }
      
      public static function values() : Array
      {
         return [0,101,102,103,104,105,1,2,4];
      }
      
      public static function getIconStyleFor(param1:int, param2:class_19, param3:Boolean, param4:Boolean = false) : int
      {
         var _loc5_:String = null;
         if(param1 == -1)
         {
            return param3 ? 34 : 35;
         }
         if(param1 == 0)
         {
            return param3 ? 32 : 33;
         }
         if(param1 == 3)
         {
            return param3 ? 36 : 37;
         }
         if(param1 == 5)
         {
            if(param2.getBoolean("diamonds.enabled"))
            {
               return param3 ? 41 : 42;
            }
            return param3 ? 53 : 54;
         }
         _loc5_ = "currencyiconstyle." + (param3 ? "big" : "small") + "." + param1 + (param4 ? ".combo" : "");
         return param2.getInteger(_loc5_,0);
      }
      
      public static function isVisible(param1:int) : Boolean
      {
         if([1,2,4].indexOf(param1) != 1)
         {
            return false;
         }
         return true;
      }
   }
}
