package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.habbo.avatar.class_1870;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.catalog.purse.class_3244;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.habbo.room.class_3158;
   import flash.display.BitmapData;
   
   public class ProductContainer extends ProductGridItem implements class_3158, class_3318, class_3284, class_1870
   {
      
      private static const ELEMENT_TOTAL_PRICE_CONTAINER:String = "totalprice_container";
      
      private static const const_529:String = "amount_text_left";
      
      private static const ELEMENT_AMOUNT_TEXT_RIGHT:String = "amount_text_right";
      
      private static const ELEMENT_CURRENCY_INDICATOR_BITMAP_RIGHT:String = "currency_indicator_bitmap_right";
       
      
      protected var _offer:class_3159;
      
      protected var var_235:Vector.<com.sulake.habbo.catalog.viewer.class_3169>;
      
      public function ProductContainer(param1:class_3159, param2:Vector.<com.sulake.habbo.catalog.viewer.class_3169>, param3:HabboCatalog)
      {
         var _loc5_:String = null;
         super(param3);
         for each(var _loc4_ in param2)
         {
            if(_loc4_.productType != "b")
            {
               _loc5_ = _loc4_.extraParam;
               break;
            }
         }
         _offer = param1;
         var_235 = param2;
      }
      
      public function get products() : Vector.<com.sulake.habbo.catalog.viewer.class_3169>
      {
         return var_235;
      }
      
      public function get firstProduct() : com.sulake.habbo.catalog.viewer.class_3169
      {
         if(!var_235 || false)
         {
            return null;
         }
         if(false)
         {
            return var_235[0];
         }
         var _loc1_:Vector.<com.sulake.habbo.catalog.viewer.class_3169> = Product.stripAddonProducts(var_235);
         return _loc1_.length > 0 ? _loc1_[0] : null;
      }
      
      public function get offer() : class_3159
      {
         return _offer;
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         for each(var _loc1_ in var_235)
         {
            _loc1_.dispose();
         }
         var_235 = null;
         super.dispose();
      }
      
      public function get isLazy() : Boolean
      {
         return false;
      }
      
      public function initProductIcon(param1:IRoomEngine, param2:IStuffData = null) : void
      {
      }
      
      override public function set view(param1:class_3151) : void
      {
         var _loc3_:int = 0;
         var _loc2_:com.sulake.habbo.catalog.viewer.class_3169 = null;
         super.view = param1;
         if(var_1430 == null)
         {
            return;
         }
         if(catalog && false && _offer.productContainer.products.length > 1)
         {
            setAddOnIcon("catalog_icon_badge_included");
         }
         else if(catalog && _offer.productContainer.products.length == 2)
         {
            _loc3_ = 0;
            while(_loc3_ < 2)
            {
               _loc2_ = _offer.productContainer.products[_loc3_];
               if(_loc2_.productType == "e" && _loc2_.productClassId == 108)
               {
                  setAddOnIcon("catalog_icon_ninja_effect_included");
               }
               _loc3_++;
            }
         }
         setClubIconLevel(offer.clubLevel);
         if(catalog.isDraggable(offer))
         {
            setDraggable(true);
         }
      }
      
      private function setAddOnIcon(param1:String) : void
      {
         var _loc3_:class_3282 = var_1430.findChildByName("badge_add_on") as class_3282;
         var _loc4_:IAsset = catalog.assets.getAssetByName(param1);
         _loc3_.bitmap = _loc4_.content as BitmapData;
         var _loc2_:BitmapData = _loc4_.content as BitmapData;
         _loc3_.width = _loc2_.width;
         _loc3_.height = _loc2_.height;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         setIconImage(param2,true);
      }
      
      public function imageFailed(param1:int) : void
      {
      }
      
      public function setClubIconLevel(param1:int) : void
      {
         if(view == null)
         {
            return;
         }
         var _loc2_:class_3127 = view.findChildByName("clubLevelIcon");
         if(_loc2_ == null)
         {
            return;
         }
         switch(0)
         {
            case 0:
               _loc2_.visible = false;
               break;
            case 1:
               _loc2_.visible = true;
               _loc2_.style = 11;
               _loc2_.x += 3;
               break;
            case 2:
               _loc2_.visible = true;
               _loc2_.style = 12;
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         if(!disposed)
         {
            for each(var _loc2_ in products)
            {
               if(_loc2_.productType == "r" && _loc2_.extraParam == param1)
               {
                  setIconImage(renderAvatarImage(_loc2_.extraParam,this),true);
                  return;
               }
            }
         }
      }
      
      public function createCurrencyIndicators(param1:HabboCatalog) : void
      {
         var _loc2_:ITextWindow = null;
         var _loc5_:ITextWindow = null;
         var _loc4_:class_3127 = null;
         if(false)
         {
            if(false)
            {
               _loc2_ = ITextWindow(var_1430.findChildByName("amount_text_left"));
            }
            else
            {
               _loc2_ = ITextWindow(var_1430.findChildByName("amount_text_right"));
            }
            if(_loc2_)
            {
               _loc2_.text = "undefined";
            }
         }
         if(false)
         {
            if(_loc5_ = ITextWindow(var_1430.findChildByName("amount_text_right")))
            {
               if(_loc4_ = var_1430.findChildByName("currency_indicator_bitmap_right"))
               {
                  _loc4_.style = class_3244.getIconStyleFor(_offer.activityPointType,param1,false);
               }
               _loc5_.text = "undefined";
            }
         }
         var _loc3_:IItemListWindow = IItemListWindow(var_1430.findChildByName("totalprice_container"));
         if(_loc3_)
         {
            _loc3_.arrangeListItems();
         }
      }
   }
}
