package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.class_3159;
   
   public class BuilderAddonsCatalogWidget extends CatalogWidget implements class_3321, class_13
   {
       
      
      private var _catalog:HabboCatalog;
      
      public function BuilderAddonsCatalogWidget(param1:class_3151, param2:HabboCatalog)
      {
         super(param1);
         _catalog = param2;
      }
      
      override public function init() : Boolean
      {
         var _loc3_:class_3151 = null;
         if(!super.init())
         {
            return false;
         }
         _window.procedure = windowProcedure;
         var _loc5_:IItemListWindow;
         var _loc2_:class_3127 = (_loc5_ = _window.findChildByName("addons_list") as IItemListWindow).removeListItemAt(0);
         var _loc6_:int = 0;
         var _loc4_:Boolean = false;
         _window.findChildByName("trial_warning").visible = !_loc4_;
         for each(var _loc1_ in page.offers)
         {
            _loc3_ = _loc2_.clone() as class_3151;
            _loc3_.findChildByName("item_header").caption = _loc1_.localizationName;
            _loc3_.findChildByName("item_price").caption = _loc1_.priceInCredits.toString();
            _loc3_.findChildByName("item_buy").id = _loc6_;
            if(_loc1_.priceInActivityPoints > 0)
            {
               _loc3_.findChildByName("diamonds_icon").visible = true;
               _loc3_.findChildByName("diamonds_price").visible = true;
               _loc3_.findChildByName("diamonds_price").caption = _loc1_.priceInActivityPoints.toString();
            }
            if(!_loc4_)
            {
               class_3140(_loc3_.findChildByName("item_buy")).disable();
            }
            _loc6_++;
            _loc5_.addListItem(_loc3_);
         }
         return true;
      }
      
      private function windowProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         if(param2.name == "item_buy")
         {
            _catalog.showPurchaseConfirmation(page.offers[param2.id],page.pageId);
         }
      }
   }
}
