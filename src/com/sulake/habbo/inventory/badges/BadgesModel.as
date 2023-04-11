package com.sulake.habbo.inventory.badges
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.window.class_1684;
   import flash.events.Event;
   import package_88.class_1031;
   import package_88.class_601;
   
   public class BadgesModel implements IInventoryModel
   {
      
      public static const BADGES_ALL:int = -1;
      
      public static const BADGES_INACTIVE:int = 0;
      
      public static const BADGES_ACTIVE:int = 1;
       
      
      private var var_282:HabboInventory;
      
      private var var_1430:com.sulake.habbo.inventory.badges.BadgesView;
      
      private var var_110:Vector.<com.sulake.habbo.inventory.badges.Badge>;
      
      private var var_1787:Vector.<com.sulake.habbo.inventory.badges.Badge>;
      
      private var var_1777:class_24;
      
      private var _assets:class_21;
      
      private var _communication:class_25;
      
      private var _windowManager:class_1684;
      
      private var _disposed:Boolean = false;
      
      private const MAX_ACTIVE_BADGE_COUNT:int = 5;
      
      public function BadgesModel(param1:HabboInventory, param2:class_1684, param3:class_25, param4:class_21)
      {
         super();
         var_282 = param1;
         _windowManager = param2;
         var_110 = new Vector.<com.sulake.habbo.inventory.badges.Badge>(0);
         var_1787 = new Vector.<com.sulake.habbo.inventory.badges.Badge>(0);
         _assets = param4;
         _communication = param3;
         var_1430 = new com.sulake.habbo.inventory.badges.BadgesView(this,param2,param4);
         var_1777 = new class_24();
         initBadgeWindowAsset();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function initBadgeWindowAsset() : void
      {
         var _loc2_:IAsset = _assets.getAssetByName("inventory_thumb_xml");
         var _loc1_:XmlAsset = XmlAsset(_loc2_);
         if(true)
         {
            com.sulake.habbo.inventory.badges.Badge.var_3029 = _windowManager.buildFromXML(XML(_loc1_.content)) as class_3151;
         }
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         if(false)
         {
            com.sulake.habbo.inventory.badges.Badge.var_3029.dispose();
            com.sulake.habbo.inventory.badges.Badge.var_3029 = null;
         }
         _disposed = true;
         var_282 = null;
         _windowManager = null;
         var_110 = null;
         var_1787 = null;
         if(var_1777)
         {
            var_1777.dispose();
            var_1777 = null;
         }
         if(var_1430 != null)
         {
            var_1430.dispose();
            var_1430 = null;
         }
         _assets = null;
         _communication = null;
      }
      
      public function requestInitialization() : void
      {
         _communication.connection.send(new class_601());
      }
      
      public function getMaxActiveCount() : int
      {
         return 5;
      }
      
      public function updateView() : void
      {
         if(var_1430 != null)
         {
            var_1430.updateAll(null);
         }
      }
      
      public function updateActionView() : void
      {
         var_1430.updateActionView();
      }
      
      private function startWearingBadge(param1:com.sulake.habbo.inventory.badges.Badge) : void
      {
         var_1787.push(param1);
         param1.isInUse = true;
      }
      
      private function stopWearingBadge(param1:com.sulake.habbo.inventory.badges.Badge) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < var_1787.length)
         {
            if(var_1787[_loc2_] == param1)
            {
               var_1787.splice(_loc2_,1);
               param1.isInUse = false;
               return;
            }
            _loc2_++;
         }
      }
      
      private function resetBadges() : void
      {
         if(var_1777)
         {
            var_1777.dispose();
            var_1777 = null;
         }
         if(var_110 != null)
         {
            for each(var _loc1_ in var_110)
            {
               _loc1_.dispose();
            }
            var_110 = null;
         }
         if(var_1787 != null)
         {
            var_1787 = null;
         }
      }
      
      public function initBadges(param1:class_24) : void
      {
         var _loc3_:int = 0;
         var _loc6_:Boolean = false;
         var _loc5_:String = null;
         var _loc7_:String = null;
         var _loc2_:com.sulake.habbo.inventory.badges.Badge = null;
         resetBadges();
         var_110 = new Vector.<com.sulake.habbo.inventory.badges.Badge>(0);
         var_1787 = new Vector.<com.sulake.habbo.inventory.badges.Badge>(0);
         var_1777 = new class_24();
         for each(var _loc4_ in param1.getKeys())
         {
            _loc3_ = param1.getValue(_loc4_);
            if(_loc3_ > 0)
            {
               var_1777.add(_loc4_,_loc3_);
            }
            _loc6_ = var_282.unseenItemTracker.isUnseen(4,_loc3_);
            _loc5_ = String(controller.localization.getBadgeName(_loc4_));
            _loc7_ = String(controller.localization.getBadgeDesc(_loc4_));
            _loc2_ = new com.sulake.habbo.inventory.badges.Badge(this,_loc4_,_loc5_,_loc7_,_loc6_);
            if(_loc6_)
            {
               var_110.unshift(_loc2_);
            }
            else
            {
               var_110.push(_loc2_);
            }
         }
      }
      
      public function updateBadge(param1:String, param2:Boolean, param3:int = 0) : void
      {
         var _loc7_:Boolean = false;
         var _loc6_:String = null;
         var _loc8_:String = null;
         var _loc4_:com.sulake.habbo.inventory.badges.Badge = null;
         if(param3 > 0 && !var_1777.hasKey(param1))
         {
            var_1777.add(param1,param3);
         }
         var _loc5_:com.sulake.habbo.inventory.badges.Badge;
         if((_loc5_ = getBadge(param1)) != null)
         {
            if(_loc5_.isInUse != param2)
            {
               if(param2)
               {
                  startWearingBadge(_loc5_);
               }
               else
               {
                  stopWearingBadge(_loc5_);
               }
            }
         }
         else
         {
            _loc7_ = var_282.unseenItemTracker.isUnseen(4,param3);
            _loc6_ = String(controller.localization.getBadgeName(param1));
            _loc8_ = String(controller.localization.getBadgeDesc(param1));
            _loc4_ = new com.sulake.habbo.inventory.badges.Badge(this,param1,_loc6_,_loc8_,_loc7_);
            if(_loc7_)
            {
               var_110.unshift(_loc4_);
            }
            else
            {
               var_110.push(_loc4_);
            }
            if(param2)
            {
               startWearingBadge(_loc4_);
            }
         }
      }
      
      private function getBadge(param1:String) : com.sulake.habbo.inventory.badges.Badge
      {
         var _loc3_:int = 0;
         var _loc2_:com.sulake.habbo.inventory.badges.Badge = null;
         _loc3_ = 0;
         while(_loc3_ < var_110.length)
         {
            _loc2_ = var_110[_loc3_];
            if(_loc2_.badgeId == param1)
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function removeBadge(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc2_:com.sulake.habbo.inventory.badges.Badge = null;
         _loc3_ = 0;
         while(_loc3_ < var_110.length)
         {
            _loc2_ = var_110[_loc3_];
            if(_loc2_.badgeId == param1)
            {
               var_110.splice(_loc3_,1);
               stopWearingBadge(_loc2_);
               updateView();
               return;
            }
            _loc3_++;
         }
      }
      
      public function toggleBadgeWearing(param1:String) : void
      {
         var _loc2_:com.sulake.habbo.inventory.badges.Badge = getBadge(param1);
         if(_loc2_ != null)
         {
            if(_loc2_.isInUse)
            {
               stopWearingBadge(_loc2_);
            }
            else
            {
               startWearingBadge(_loc2_);
            }
            saveBadgeSelection();
         }
      }
      
      public function saveBadgeSelection() : void
      {
         var _loc4_:int = 0;
         var _loc2_:com.sulake.habbo.inventory.badges.Badge = null;
         var _loc1_:class_1031 = new class_1031();
         var _loc3_:Vector.<com.sulake.habbo.inventory.badges.Badge> = getBadges(1);
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc2_ = _loc3_[_loc4_];
            _loc1_.addActivatedBadge(_loc2_.badgeId);
            _loc4_++;
         }
         _communication.connection.send(_loc1_);
      }
      
      public function setBadgeSelected(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc2_:com.sulake.habbo.inventory.badges.Badge = null;
         _loc3_ = 0;
         while(_loc3_ < var_110.length)
         {
            _loc2_ = var_110[_loc3_] as com.sulake.habbo.inventory.badges.Badge;
            if(_loc2_ != null)
            {
               _loc2_.isSelected = _loc2_.badgeId == param1;
            }
            _loc3_++;
         }
         updateActionView();
      }
      
      public function forceSelection() : void
      {
         var _loc1_:com.sulake.habbo.inventory.badges.Badge = getSelectedBadge();
         if(_loc1_ != null)
         {
            return;
         }
         var _loc3_:Vector.<com.sulake.habbo.inventory.badges.Badge> = getBadges(0);
         if(_loc3_ != null && _loc3_.length > 0)
         {
            _loc1_ = _loc3_[0] as com.sulake.habbo.inventory.badges.Badge;
            _loc1_.isSelected = true;
            updateView();
            return;
         }
         var _loc2_:Vector.<com.sulake.habbo.inventory.badges.Badge> = getBadges(1);
         if(_loc2_ != null && _loc2_.length > 0)
         {
            _loc1_ = _loc2_[0] as com.sulake.habbo.inventory.badges.Badge;
            _loc1_.isSelected = true;
            updateView();
         }
      }
      
      public function getSelectedBadge(param1:int = -1) : com.sulake.habbo.inventory.badges.Badge
      {
         var _loc4_:int = 0;
         var _loc3_:com.sulake.habbo.inventory.badges.Badge = null;
         var _loc2_:Vector.<com.sulake.habbo.inventory.badges.Badge> = getBadges(param1);
         _loc4_ = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc3_ = _loc2_[_loc4_];
            if(_loc3_.isSelected)
            {
               return _loc3_;
            }
            _loc4_++;
         }
         return null;
      }
      
      public function getBadges(param1:int = -1) : Vector.<com.sulake.habbo.inventory.badges.Badge>
      {
         var _loc3_:* = undefined;
         switch(param1 - -1)
         {
            case 0:
               return var_110;
            case 1:
               _loc3_ = new Vector.<com.sulake.habbo.inventory.badges.Badge>(0);
               for each(var _loc2_ in var_110)
               {
                  if(!_loc2_.isInUse)
                  {
                     _loc3_.push(_loc2_);
                  }
               }
               return _loc3_;
            case 2:
               return var_1787;
            default:
               class_14.log("Unexpected filter. Returning an empty array to maintain backward compatibility");
               return new Vector.<com.sulake.habbo.inventory.badges.Badge>(0);
         }
      }
      
      public function getBadgeFromActive(param1:int) : com.sulake.habbo.inventory.badges.Badge
      {
         return getItemInIndex(param1,1);
      }
      
      public function getBadgeFromInactive(param1:int) : com.sulake.habbo.inventory.badges.Badge
      {
         return getItemInIndex(param1,0);
      }
      
      public function getItemInIndex(param1:int, param2:int = -1) : com.sulake.habbo.inventory.badges.Badge
      {
         var _loc3_:Vector.<com.sulake.habbo.inventory.badges.Badge> = getBadges(param2);
         if(param1 < 0 || param1 >= _loc3_.length)
         {
            return null;
         }
         return _loc3_[param1];
      }
      
      public function getWindowContainer() : class_3151
      {
         return var_1430.getWindowContainer();
      }
      
      public function closingInventoryView() : void
      {
         if(false)
         {
            resetUnseenItems();
         }
      }
      
      public function categorySwitch(param1:String) : void
      {
         if(param1 == "badges" && false)
         {
            var_282.events.dispatchEvent(new Event("HABBO_INVENTORY_TRACKING_EVENT_BADGES"));
         }
      }
      
      public function subCategorySwitch(param1:String) : void
      {
      }
      
      public function get controller() : HabboInventory
      {
         return var_282;
      }
      
      public function resetUnseenItems() : void
      {
         if(true)
         {
            return;
         }
         var_282.unseenItemTracker.resetCategory(4);
         for each(var _loc1_ in var_110)
         {
            _loc1_.isUnseen = false;
         }
         updateView();
         var_282.updateUnseenItemCounts();
      }
      
      public function selectItemById(param1:String) : void
      {
         setBadgeSelected(param1);
      }
      
      public function removeSelections() : void
      {
         for each(var _loc1_ in var_110)
         {
            _loc1_.isSelected = false;
         }
      }
   }
}
