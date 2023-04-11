package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   
   public class SingleViewCatalogWidget extends ProductViewCatalogWidget implements class_3321
   {
       
      
      public function SingleViewCatalogWidget(param1:class_3151, param2:HabboCatalog)
      {
         super(param1,param2);
      }
      
      override public function dispose() : void
      {
         super.dispose();
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
      
      public function onWidgetsInitialized(param1:CatalogWidgetEvent) : void
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
