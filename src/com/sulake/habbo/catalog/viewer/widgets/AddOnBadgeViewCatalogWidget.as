package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.window.widgets.class_3366;
   
   public class AddOnBadgeViewCatalogWidget extends CatalogWidget implements class_3321
   {
       
      
      public function AddOnBadgeViewCatalogWidget(param1:class_3151)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            events.removeEventListener("SELECT_PRODUCT",onSelectProduct);
            super.dispose();
         }
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         attachWidgetView("addOnBadgeViewWidget");
         events.addEventListener("SELECT_PRODUCT",onSelectProduct);
         return true;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:class_3366 = null;
         if(!disposed && param1.offer.badgeCode)
         {
            _loc2_ = class_3217(_window.findChildByName("badge")).widget as class_3366;
            if(_loc2_ != null)
            {
               _loc2_.badgeId = param1.offer.badgeCode;
            }
         }
      }
   }
}
