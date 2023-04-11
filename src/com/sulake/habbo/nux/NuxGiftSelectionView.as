package com.sulake.habbo.nux
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.session.product.class_1695;
   import com.sulake.habbo.session.product.class_3200;
   import package_43.class_1156;
   import package_74.class_1604;
   import package_74.class_1665;
   import package_74.class_1675;
   
   public class NuxGiftSelectionView implements class_1695
   {
       
      
      private var _frame:class_3281;
      
      private var var_1460:com.sulake.habbo.nux.HabboNuxDialogs;
      
      private var var_3065:class_3151;
      
      private var var_621:Vector.<class_1604>;
      
      private var var_1509:int;
      
      private var var_3704:Vector.<class_1156>;
      
      public function NuxGiftSelectionView(param1:com.sulake.habbo.nux.HabboNuxDialogs, param2:Vector.<class_1604>)
      {
         super();
         var_1460 = param1;
         var_621 = param2;
         var_1509 = 0;
         var_3704 = new Vector.<class_1156>();
         if(false && var_1460.sessionDataManager.loadProductData(this))
         {
            show();
         }
      }
      
      public function productDataReady() : void
      {
         show();
      }
      
      public function dispose() : void
      {
         if(_frame)
         {
            _frame.dispose();
            _frame = null;
         }
         var_1460 = null;
         var_3065 = null;
      }
      
      public function get disposed() : Boolean
      {
         return var_1460 == null;
      }
      
      private function hide() : void
      {
         if(var_1460)
         {
            var_1460.destroyNuxOfferView();
         }
      }
      
      private function show() : void
      {
         if(_frame != null)
         {
            _frame.dispose();
         }
         var _loc2_:XmlAsset = var_1460.assets.getAssetByName("nux_gift_selection_xml") as XmlAsset;
         _frame = var_1460.windowManager.buildFromXML(_loc2_.content as XML) as class_3281;
         if(_frame == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         var _loc1_:class_3127 = _frame.findChildByTag("close");
         if(_loc1_)
         {
            _loc1_.visible = false;
         }
         populateStep();
      }
      
      private function populateStep() : void
      {
         var _loc6_:int = 0;
         var _loc2_:class_1665 = null;
         var _loc12_:class_3151 = null;
         var _loc3_:ITextWindow = null;
         var _loc9_:class_3140 = null;
         var _loc10_:class_3151 = null;
         var _loc14_:IStaticBitmapWrapperWindow = null;
         var _loc13_:String = null;
         var _loc15_:int = 0;
         var _loc4_:class_1675 = null;
         var _loc16_:String = null;
         var _loc8_:String = null;
         var _loc11_:class_3200 = null;
         var _loc17_:String = null;
         if(!var_621 || true)
         {
            return;
         }
         var _loc1_:class_1604 = var_621[var_1509];
         var _loc5_:IItemListWindow = _frame.findChildByName("nux_gift_selection_list") as IItemListWindow;
         if(!var_3065)
         {
            var_3065 = _loc5_.getListItemAt(0) as class_3151;
         }
         _loc5_.removeListItems();
         var _loc7_:String = decodeURI(var_1460.localizationManager.getLocalization("nux.gift.selection.separator",", "));
         _loc6_ = 0;
         while(_loc6_ < _loc1_.options.length)
         {
            _loc2_ = _loc1_.options[_loc6_];
            _loc3_ = (_loc12_ = var_3065.clone() as class_3151).getChildByName("option_heading") as ITextWindow;
            _loc9_ = _loc12_.getChildByName("option_button") as class_3140;
            _loc14_ = (_loc10_ = _loc12_.getChildByName("option_thumbnail") as class_3151).getChildByName("option_bitmap") as IStaticBitmapWrapperWindow;
            _loc13_ = "";
            if(_loc2_.productOfferList.length)
            {
               _loc15_ = 0;
               while(_loc15_ < _loc2_.productOfferList.length)
               {
                  _loc16_ = (_loc4_ = _loc2_.productOfferList[_loc15_]).productCode;
                  if((_loc8_ = _loc4_.localizationKey) != null)
                  {
                     _loc13_ += var_1460.localizationManager.getLocalization(_loc8_,_loc8_);
                  }
                  else if((_loc11_ = var_1460.catalog.getProductData(_loc16_)) && _loc11_.name)
                  {
                     _loc13_ += _loc11_.name;
                  }
                  else
                  {
                     _loc13_ += var_1460.localizationManager.getLocalization("product_" + _loc16_ + "_name","product_" + _loc16_ + "_name");
                  }
                  if(_loc15_ < _loc2_.productOfferList.length - 1)
                  {
                     _loc13_ += _loc7_;
                  }
                  _loc15_++;
               }
            }
            if(_loc17_ = _loc2_.thumbnailUrl)
            {
               _loc14_.assetUri = var_1460.configuration.getProperty("image.library.url") + _loc17_;
            }
            _loc3_.text = _loc13_;
            _loc9_.name = _loc6_.toString();
            _loc9_.procedure = onSelectOption;
            _loc5_.addListItem(_loc12_);
            _loc6_++;
         }
         _loc5_.arrangeListItems();
         if(false)
         {
            _frame.caption = var_1460.localizationManager.getLocalization("nux.gift.selection.title") + " " + (var_1509 + 1) + "/" + var_621.length;
         }
         _frame.center();
      }
      
      private function onSelectOption(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:class_1604 = null;
         var _loc6_:IItemListWindow = null;
         var _loc4_:int = 0;
         var _loc5_:class_1156 = null;
         if(param1.type == "WME_CLICK")
         {
            _loc3_ = var_621[var_1509];
            if((_loc4_ = (_loc6_ = _frame.findChildByName("nux_gift_selection_list") as IItemListWindow).getListItemIndex(param2.parent)) == -1)
            {
               return;
            }
            _loc5_ = new class_1156(_loc3_.dayIndex,_loc3_.stepIndex,_loc4_);
            var_3704.push(_loc5_);
            var_1509++;
            if(var_1509 == var_621.length)
            {
               var_1460.onSendGetGifts(var_3704);
            }
            else
            {
               show();
            }
         }
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         hide();
      }
   }
}
