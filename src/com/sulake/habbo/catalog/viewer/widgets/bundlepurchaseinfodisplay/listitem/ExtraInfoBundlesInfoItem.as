package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.widgets.BundlePurchaseExtraInfoWidget;
   import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData;
   import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoListItem;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetBundleDisplayExtraInfoEvent;
   
   public class ExtraInfoBundlesInfoItem extends ExtraInfoListItem
   {
       
      
      private var _catalog:HabboCatalog;
      
      private var _window:class_3151;
      
      private var var_1429:BundlePurchaseExtraInfoWidget;
      
      public function ExtraInfoBundlesInfoItem(param1:BundlePurchaseExtraInfoWidget, param2:int, param3:ExtraInfoItemData, param4:HabboCatalog)
      {
         super(param1,param2,param3,2,true);
         _catalog = param4;
         var_1429 = param1;
      }
      
      override public function getRenderedWindow() : class_3151
      {
         if(_window == null)
         {
            createWindow();
         }
         return _window;
      }
      
      private function createWindow() : void
      {
         _window = class_3151(_catalog.utils.createWindow("bundlesInfoItem"));
         _window.procedure = windowProcedure;
      }
      
      private function windowProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            var_1429.events.dispatchEvent(new CatalogWidgetBundleDisplayExtraInfoEvent("CWPPEIE_ITEM_CLICKED",data,id));
         }
      }
   }
}
