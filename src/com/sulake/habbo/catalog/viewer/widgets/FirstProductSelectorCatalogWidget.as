package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   
   public class FirstProductSelectorCatalogWidget extends CatalogWidget implements class_3321
   {
       
      
      public function FirstProductSelectorCatalogWidget(param1:class_3151)
      {
         super(param1);
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         events.addEventListener("WIDGETS_INITIALIZED",onWidgetsInitialized);
         return true;
      }
      
      private function onWidgetsInitialized(param1:CatalogWidgetEvent) : void
      {
         if(page.offers.length == 0)
         {
            return;
         }
         var _loc2_:class_3159 = page.offers[0];
         events.dispatchEvent(new SelectProductEvent(_loc2_));
      }
   }
}
