package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetInitPurchaseEvent extends Event
   {
       
      
      private var var_3998:Boolean = true;
      
      private var _userName:String;
      
      public function CatalogWidgetInitPurchaseEvent(param1:Boolean = true, param2:String = null, param3:Boolean = false, param4:Boolean = false)
      {
         super("INIT_PURCHASE",param3,param4);
         var_3998 = param1;
         _userName = param2;
      }
      
      public function get enableBuyAsGift() : Boolean
      {
         return var_3998;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
