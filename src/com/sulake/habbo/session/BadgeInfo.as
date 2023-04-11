package com.sulake.habbo.session
{
   import flash.display.BitmapData;
   
   public class BadgeInfo
   {
       
      
      private var var_973:BitmapData;
      
      private var var_3909:Boolean;
      
      public function BadgeInfo(param1:BitmapData, param2:Boolean)
      {
         super();
         var_973 = param1;
         var_3909 = param2;
      }
      
      public function get image() : BitmapData
      {
         return var_973;
      }
      
      public function get placeHolder() : Boolean
      {
         return var_3909;
      }
   }
}
