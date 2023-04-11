package com.sulake.habbo.catalog.viewer.widgets.utils
{
   import com.sulake.core.window.class_3127;
   import com.sulake.habbo.catalog.class_3159;
   
   public class RentUtils
   {
       
      
      public function RentUtils()
      {
         super();
      }
      
      public static function updateBuyCaption(param1:class_3159, param2:class_3127) : void
      {
         if(param1 == null || param2 == null)
         {
            return;
         }
         param2.caption = param1.isRentOffer ? "${catalog.purchase_confirmation.rent}" : "${catalog.purchase_confirmation.buy}";
      }
   }
}
