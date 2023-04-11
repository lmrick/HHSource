package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.widgets.BundlePurchaseExtraInfoWidget;
   import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem.ExtraInfoBonusAchievementItem;
   import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem.ExtraInfoBonusBadgeItem;
   import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem.ExtraInfoBundlesInfoItem;
   import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem.ExtraInfoDiscountValueItem;
   import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem.ExtraInfoPromoItem;
   
   public class ExtraInfoViewManager implements class_13, class_41
   {
      
      private static const SLIDE_ANIMATION_LENGTH:Number = 0.5;
      
      private static const MAX_ANIM_Y_OFFSET:int = 28;
       
      
      private var var_1429:BundlePurchaseExtraInfoWidget;
      
      private var _catalog:HabboCatalog;
      
      private var _items:class_24;
      
      private var var_4039:int = 0;
      
      private var _disposed:Boolean = false;
      
      private var var_2383:Number = 0;
      
      public function ExtraInfoViewManager(param1:BundlePurchaseExtraInfoWidget, param2:HabboCatalog)
      {
         super();
         var_1429 = param1;
         _catalog = param2;
         _items = new class_24();
         _catalog.registerUpdateReceiver(this,10);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set disposed(param1:Boolean) : void
      {
         _disposed = param1;
      }
      
      public function dispose() : void
      {
         if(!disposed)
         {
            _catalog.removeUpdateReceiver(this);
            var_1429 = null;
            _catalog = null;
            for each(var _loc1_ in _items)
            {
               _loc1_.dispose();
            }
            _items = null;
            disposed = true;
         }
      }
      
      public function clear() : void
      {
         while(var_1429.window.numChildren > 0)
         {
            var_1429.window.removeChildAt(0);
         }
         for each(var _loc1_ in _items)
         {
            _loc1_.dispose();
         }
         _items = new class_24();
         render();
      }
      
      public function addItem(param1:ExtraInfoItemData) : int
      {
         var _loc2_:ExtraInfoListItem = null;
         var _loc3_:int = var_4039++;
         switch(param1.type)
         {
            case 0:
               _loc2_ = new ExtraInfoPromoItem(var_1429,_loc3_,param1,_catalog);
               break;
            case 1:
               _loc2_ = new ExtraInfoBundlesInfoItem(var_1429,_loc3_,param1,_catalog);
               break;
            case 2:
               _loc2_ = new ExtraInfoDiscountValueItem(_loc3_,param1,_catalog);
               break;
            case 3:
               _loc2_ = new ExtraInfoBonusBadgeItem(_loc3_,param1,_catalog);
               break;
            case 4:
               _loc2_ = new ExtraInfoBonusAchievementItem(_loc3_,param1);
         }
         _loc2_.creationSeconds = var_2383;
         _items.add(_loc3_,_loc2_);
         var _loc4_:class_3127;
         (_loc4_ = _loc2_.getRenderedWindow()).width = var_1429.window.width;
         var_1429.window.addChild(_loc4_);
         sortWindows();
         render();
         return _loc2_.id;
      }
      
      public function removeItem(param1:int) : void
      {
         var _loc2_:ExtraInfoListItem = getItem(param1);
         if(_loc2_)
         {
            _loc2_.removalSeconds = var_2383;
            if(_loc2_.alignment == 2)
            {
               reallyRemoveItem(_loc2_.id);
            }
            render();
         }
      }
      
      public function getItem(param1:int) : ExtraInfoListItem
      {
         return ExtraInfoListItem(_items.getValue(param1));
      }
      
      private function reallyRemoveItem(param1:int) : void
      {
         var _loc2_:ExtraInfoListItem = getItem(param1);
         var_1429.window.removeChild(_loc2_.getRenderedWindow());
         _items.remove(param1);
      }
      
      private function calculateBounce(param1:Number, param2:Boolean = false) : Number
      {
         if(param2)
         {
            return 1 - Math.abs(Math.cos((var_2383 - param1) / 0.5 * 1.5707963267948966));
         }
         return 1 - Math.abs(Math.sin((var_2383 - param1) / 0.5 * 1.5707963267948966));
      }
      
      private function render() : void
      {
         var _loc5_:class_3127 = null;
         var _loc4_:Number = NaN;
         var _loc1_:int = 0;
         var _loc3_:int = int(var_1429.window.height);
         var _loc6_:Array = _items.getValues();
         for each(var _loc2_ in _loc6_)
         {
            _loc5_ = _loc2_.getRenderedWindow();
            _loc4_ = 0;
            if(var_2383 - 0.5 <= _loc2_.creationSeconds)
            {
               _loc4_ = calculateBounce(_loc2_.creationSeconds);
            }
            if(_loc2_.isItemRemoved)
            {
               _loc4_ = calculateBounce(_loc2_.removalSeconds,true);
               if(var_2383 > _loc2_.removalSeconds + 0.5)
               {
                  reallyRemoveItem(_loc2_.id);
                  break;
               }
            }
            if(_loc2_.alignment == 0)
            {
               _loc5_.y = _loc1_;
               _loc5_.y -= _loc4_ * Math.min(_loc5_.height,28);
               _loc1_ += _loc5_.height;
            }
            else if(_loc2_.alignment == 1)
            {
               _loc5_.y = _loc3_ - _loc5_.height;
               _loc5_.y += _loc4_ * Math.min(_loc5_.height,28);
               _loc3_ -= _loc5_.height;
            }
            else if(_loc2_.alignment == 2)
            {
               _loc5_.y = 0;
            }
         }
      }
      
      private function sortWindows() : void
      {
         var _loc2_:int = var_1429.window.numChildren - 1;
         for each(var _loc1_ in _items)
         {
            if(_loc1_.alwaysOnTop)
            {
               var_1429.window.setChildIndex(_loc1_.getRenderedWindow(),_loc2_);
            }
         }
      }
      
      private function get isAnimationInProgress() : Boolean
      {
         return true;
      }
      
      public function update(param1:uint) : void
      {
         var_2383 += param1 / 1000;
         if(isAnimationInProgress)
         {
            render();
         }
      }
   }
}
