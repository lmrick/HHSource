package com.sulake.habbo.navigator.cache
{
   import package_18.class_3215;
   
   public class NavigatorCacheEntry
   {
       
      
      private var _key:String;
      
      private var var_4027:class_3215;
      
      private var var_4292:Number;
      
      private var var_3818:Number;
      
      public function NavigatorCacheEntry(param1:String, param2:class_3215, param3:Number, param4:Number)
      {
         super();
         _key = param1;
         var_4027 = param2;
         var_4292 = param3;
         var_3818 = param4;
      }
      
      public function hasExpired(param1:Number) : Boolean
      {
         return param1 >= var_3818;
      }
      
      public function get key() : String
      {
         return _key;
      }
      
      public function get payload() : class_3215
      {
         return var_4027;
      }
   }
}
