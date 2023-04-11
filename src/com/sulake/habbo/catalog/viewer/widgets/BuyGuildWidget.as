package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.tracking.HabboTracking;
   import package_7.class_749;
   
   public class BuyGuildWidget extends CatalogWidget implements class_3321
   {
       
      
      private var _button:class_3140;
      
      public function BuyGuildWidget(param1:class_3151)
      {
         super(param1);
         if(_button)
         {
            _button.removeEventListener("WME_CLICK",onButtonClicked);
         }
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         _button = window.findChildByName("start_guild_purchase") as class_3140;
         _button.addEventListener("WME_CLICK",onButtonClicked);
         return true;
      }
      
      private function onButtonClicked(param1:WindowMouseEvent) : void
      {
         if(HabboTracking.getInstance() != null)
         {
            HabboTracking.getInstance().trackGoogle("groupPurchase","catalogBuyClicked");
         }
         page.viewer.catalog.connection.send(new class_749());
         page.viewer.catalog.toggleCatalog("NORMAL");
      }
   }
}
