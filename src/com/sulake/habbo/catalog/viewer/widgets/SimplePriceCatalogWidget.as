package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   
   public class SimplePriceCatalogWidget extends CatalogWidget implements class_3321
   {
       
      
      private var _catalog:HabboCatalog;
      
      private var var_1936:class_3127;
      
      public function SimplePriceCatalogWidget(param1:class_3151, param2:HabboCatalog)
      {
         super(param1);
         _catalog = param2;
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         events.addEventListener("SELECT_PRODUCT",onSelectProduct);
         return true;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var_1936 = _catalog.utils.showPriceOnProduct(param1.offer,_window as class_3151,var_1936,_window.findChildByName("fake_productimage"),0,true,0);
      }
   }
}
