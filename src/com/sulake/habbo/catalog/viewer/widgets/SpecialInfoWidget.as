package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   
   public class SpecialInfoWidget extends CatalogWidget implements class_3321
   {
       
      
      public function SpecialInfoWidget(param1:class_3151)
      {
         super(param1);
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         attachWidgetView("specialInfoWidget");
         _window.findChildByName("ctlg_special_txt").caption = "";
         events.addEventListener("SELECT_PRODUCT",onPreviewProduct);
         return true;
      }
      
      private function onPreviewProduct(param1:SelectProductEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         _window.visible = false;
      }
   }
}
