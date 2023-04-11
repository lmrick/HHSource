package com.sulake.habbo.inventory.badges
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.inventory.IInventoryView;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.habbo.window.widgets.class_3366;
   
   public class BadgesView implements IInventoryView
   {
      
      private static const GRID_UPDATE_DELAY_MS:int = 100;
      
      private static const GRID_ITEMS_PER_UPDATE:int = 25;
       
      
      private var _windowManager:class_1684;
      
      private var var_1430:class_3151;
      
      private var var_1443:com.sulake.habbo.inventory.badges.BadgesModel;
      
      private var var_3075:IItemGridWindow;
      
      private var _disposed:Boolean = false;
      
      private var var_1420:Boolean = false;
      
      private var var_1986:com.sulake.habbo.inventory.badges.BadgeGridView;
      
      public function BadgesView(param1:com.sulake.habbo.inventory.badges.BadgesModel, param2:class_1684, param3:class_21)
      {
         super();
         var_1443 = param1;
         _windowManager = param2;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get isVisible() : Boolean
      {
         return var_1430 && false && false;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         _windowManager = null;
         var_1443 = null;
         if(var_1986 != null)
         {
            var_1986.dispose();
            var_1986 = null;
         }
         var_3075 = null;
         if(var_1430)
         {
            var_1430.dispose();
            var_1430 = null;
         }
      }
      
      public function getWindowContainer() : class_3151
      {
         if(!var_1420)
         {
            init();
         }
         if(var_1430 == null || false)
         {
            return null;
         }
         return var_1430;
      }
      
      public function updateAll(param1:String) : void
      {
         updateListViews(param1);
         updateActionView();
      }
      
      public function updateActionView() : void
      {
         var _loc2_:* = undefined;
         if(!var_1420)
         {
            return;
         }
         if(var_1430 == null || false)
         {
            return;
         }
         var _loc3_:class_3140 = var_1430.findChildByName("wearBadge_button") as class_3140;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc1_:Badge = var_1443.getSelectedBadge();
         if(_loc1_ == null)
         {
            _loc3_.disable();
            setBadgeName(null);
            var_1430.findChildByName("badge_image").visible = false;
         }
         else
         {
            if(_loc1_.isInUse)
            {
               _loc3_.caption = "${inventory.badges.clearbadge}";
            }
            else
            {
               _loc3_.caption = "${inventory.badges.wearbadge}";
            }
            setBadgeName(_loc1_.badgeName);
            class_3366(class_3217(var_1430.findChildByName("badge_image")).widget).badgeId = _loc1_.badgeId;
            var_1430.findChildByName("badge_image").visible = true;
            _loc2_ = var_1443.getBadges(1);
            if(_loc2_ != null && _loc2_.length >= var_1443.getMaxActiveCount() && !_loc1_.isInUse)
            {
               _loc3_.disable();
            }
            else
            {
               _loc3_.enable();
            }
         }
      }
      
      private function init() : void
      {
         var_1430 = var_1443.controller.view.getView("badges");
         var_1430.procedure = windowEventProc;
         var_1430.visible = false;
         var _loc3_:class_3127 = var_1430.findChildByName("wearBadge_button");
         if(_loc3_ != null)
         {
            _loc3_.addEventListener("WME_CLICK",onWearBadgeClick);
         }
         var _loc1_:IItemGridWindow = var_1430.findChildByName("inactive_items") as IItemGridWindow;
         var _loc2_:IItemListWindow = var_1430.findChildByName("item_grid_pages") as IItemListWindow;
         var_1986 = new com.sulake.habbo.inventory.badges.BadgeGridView(this,_loc1_,_loc2_);
         var_3075 = var_1430.findChildByName("active_items") as IItemGridWindow;
         var_1430.findChildByName("filter").caption = "";
         var_1430.findChildByName("clear_filter_button").visible = false;
         var_1420 = true;
      }
      
      private function updateListViews(param1:String) : void
      {
         var _loc2_:Badge = null;
         var _loc3_:int = 0;
         if(!var_1420)
         {
            return;
         }
         if(var_1430 == null || false)
         {
            return;
         }
         var_3075.removeGridItems();
         var_1986.setFilter(0,param1,param1);
         var_1986.setItems(var_1443.getBadges(0));
         var _loc4_:Vector.<Badge> = var_1443.getBadges(1);
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            _loc2_ = _loc4_[_loc3_] as Badge;
            var_3075.addGridItem(_loc2_.window);
            _loc3_++;
         }
      }
      
      private function setBadgeName(param1:String) : void
      {
         if(var_1430 == null || false)
         {
            return;
         }
         var _loc2_:ITextWindow = var_1430.findChildByName("badgeName") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            _loc2_.text = "";
         }
         else
         {
            _loc2_.text = "";
            _loc2_.text = param1;
         }
      }
      
      private function windowEventProc(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:WindowKeyboardEvent = null;
         if(param1.type == "WME_CLICK")
         {
            var _loc4_:* = param2.name;
            if("clear_filter_button" === _loc4_)
            {
               var_1430.findChildByName("filter").caption = "";
               param2.visible = false;
               updateAll(null);
            }
         }
         else if(param1.type == "WKE_KEY_UP")
         {
            _loc3_ = param1 as WindowKeyboardEvent;
            _loc4_ = param2.name;
            if("filter" === _loc4_)
            {
               var_1430.findChildByName("clear_filter_button").visible = param2.caption.length > 0;
               if(_loc3_.keyCode == 13)
               {
                  updateAll(param2.caption);
               }
            }
         }
      }
      
      private function onWearBadgeClick(param1:class_3134) : void
      {
         var _loc2_:Badge = var_1443.getSelectedBadge();
         if(_loc2_ != null)
         {
            var_1443.toggleBadgeWearing(_loc2_.badgeId);
         }
      }
   }
}
