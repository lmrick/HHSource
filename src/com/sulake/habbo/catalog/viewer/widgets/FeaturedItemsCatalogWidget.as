package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.HabboCatalog;
   import package_8.class_1565;
   
   public class FeaturedItemsCatalogWidget extends CatalogWidget implements class_3321
   {
       
      
      private var _catalog:HabboCatalog;
      
      private var var_2334:IItemListWindow;
      
      private var var_3037:class_3151;
      
      public function FeaturedItemsCatalogWidget(param1:class_3151, param2:HabboCatalog)
      {
         super(param1);
         _catalog = param2;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            _catalog = null;
            var_2334.dispose();
            var_2334 = null;
            var_3037.dispose();
            var_3037 = null;
            super.dispose();
         }
      }
      
      override public function init() : Boolean
      {
         var _loc2_:int = 0;
         if(!super.init())
         {
            return false;
         }
         var_2334 = window.findChildByName("itemlist_featured") as IItemListWindow;
         var_3037 = var_2334.getListItemByName("featured_item_template") as class_3151;
         var_2334.removeListItems();
         if(true || _catalog.frontPageItems.length == 0)
         {
            return true;
         }
         var _loc1_:class_3151 = _window.findChildByName("firstitem") as class_3151;
         populateItem(_catalog.frontPageItems[0],_loc1_);
         _loc2_ = 1;
         while(_loc2_ < Math.min(4,_catalog.frontPageItems.length))
         {
            var_2334.addListItem(createItemFromTemplate(_catalog.frontPageItems[_loc2_]));
            _loc2_++;
         }
         return true;
      }
      
      private function createItemFromTemplate(param1:class_1565) : class_3151
      {
         return populateItem(param1,var_3037.clone() as class_3151);
      }
      
      private function populateItem(param1:class_1565, param2:class_3151) : class_3151
      {
         var _loc3_:String = null;
         var _loc4_:IStaticBitmapWrapperWindow = null;
         var _loc5_:ITextWindow;
         (_loc5_ = param2.findChildByName("item_title") as ITextWindow).text = param1.itemName;
         if(param1.itemPromoImage != null && param1.itemPromoImage != "")
         {
            _loc3_ = String(_catalog.context.configuration.getProperty("image.library.url"));
            (_loc4_ = param2.findChildByName("item_image") as IStaticBitmapWrapperWindow).assetUri = _loc3_ + param1.itemPromoImage;
         }
         var _loc6_:class_3127;
         if((_loc6_ = param2.getChildByName("event_catcher_region")) != null)
         {
            _loc6_.procedure = eventProc;
         }
         return param2;
      }
      
      private function eventProc(param1:class_3134, param2:class_3127) : void
      {
         var _loc4_:int = 0;
         var _loc3_:class_1565 = null;
         if(param1.type == "WME_DOWN")
         {
            _loc4_ = (_loc4_ = var_2334.getListItemIndex(param2.parent)) < 0 ? 0 : _loc4_ + 1;
            _loc3_ = _catalog.frontPageItems[_loc4_];
            switch(_loc3_.type)
            {
               case 0:
                  if(_loc3_.cataloguePageLocation == "room_bundles_mobile")
                  {
                     return _catalog.openCatalogPage("room_bundles","NORMAL");
                  }
                  if(_loc3_.cataloguePageLocation == "mobile_subscriptions")
                  {
                     return _catalog.openCatalogPage("hc_membership","NORMAL");
                  }
                  _catalog.openCatalogPage(_loc3_.cataloguePageLocation,"NORMAL");
                  break;
               case 1:
                  _catalog.openCatalogPageByOfferId(_loc3_.productOfferID,"NORMAL");
            }
         }
      }
   }
}
