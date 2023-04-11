package com.sulake.habbo.notifications.singular
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.utils.class_3307;
   import com.sulake.habbo.notifications.HabboNotifications;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.room.utils.RoomEnterEffect;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class SingularNotificationController implements class_41
   {
      
      private static const MODERATION_DISCLAIMER_DELAY_MS:int = 5000;
       
      
      private var _notifications:HabboNotifications;
      
      private var var_3142:Array;
      
      private var _styleConfiguration:class_24;
      
      private var var_2154:com.sulake.habbo.notifications.singular.HabboNotificationViewManager;
      
      private var var_2764:com.sulake.habbo.notifications.singular.HabboAlertDialogManager;
      
      private var var_4228:Boolean;
      
      private var _clubGiftNotification:com.sulake.habbo.notifications.singular.ClubGiftNotification;
      
      private var _safetyLockedNotification:com.sulake.habbo.notifications.singular.SafetyLockedNotification;
      
      private var var_4275:Dictionary;
      
      private var var_1969:Timer;
      
      private var var_311:Boolean;
      
      public function SingularNotificationController(param1:HabboNotifications)
      {
         var _loc5_:int = 0;
         var _loc7_:class_24 = null;
         var _loc3_:BitmapDataAsset = null;
         var _loc4_:BitmapData = null;
         super();
         _notifications = param1;
         var_3142 = [];
         _styleConfiguration = new class_24();
         var_4275 = new Dictionary();
         var_2764 = new com.sulake.habbo.notifications.singular.HabboAlertDialogManager(_notifications.windowManager,_notifications.localization,_notifications.habboHelp);
         var _loc8_:IAsset = _notifications.assetLibrary.getAssetByName("habbo_notifications_config_xml");
         var _loc2_:XmlAsset = XmlAsset(_loc8_);
         if(_loc2_ != null)
         {
            class_3307.parseVariableList(XML(_loc2_.content).children(),_styleConfiguration);
         }
         var _loc6_:class_24;
         if((_loc6_ = _styleConfiguration["styles"]) != null)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc6_.length)
            {
               if((_loc7_ = _loc6_.getWithIndex(_loc5_))["icon"] != null)
               {
                  _loc3_ = _notifications.assetLibrary.getAssetByName(_loc7_["icon"]) as BitmapDataAsset;
                  _loc4_ = _loc3_.content as BitmapData;
                  _loc7_["icon"] = _loc4_;
               }
               _loc5_++;
            }
         }
         var_2154 = new com.sulake.habbo.notifications.singular.HabboNotificationViewManager(_notifications,_notifications.assetLibrary,_notifications.windowManager,_notifications.toolBar,_styleConfiguration["styles"],_styleConfiguration["view"]);
         _notifications.sessionDataManager.events.addEventListener("BIRE_BADGE_IMAGE_READY",onBadgeImage);
         _notifications.registerUpdateReceiver(this,2);
      }
      
      public function get alertDialogManager() : com.sulake.habbo.notifications.singular.HabboAlertDialogManager
      {
         return var_2764;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function dispose() : void
      {
         if(var_1969)
         {
            var_1969.removeEventListener("timerComplete",onShowModerationDisclaimer);
            var_1969 = null;
         }
         if(var_2154 != null)
         {
            var_2154.dispose();
            var_2154 = null;
         }
         if(var_2764 != null)
         {
            var_2764.dispose();
            var_2764 = null;
         }
         if(_clubGiftNotification != null)
         {
            _clubGiftNotification.dispose();
            _clubGiftNotification = null;
         }
         if(_safetyLockedNotification != null)
         {
            _safetyLockedNotification.dispose();
            _safetyLockedNotification = null;
         }
         if(_notifications != null)
         {
            _notifications.removeUpdateReceiver(this);
            _notifications = null;
         }
         var_311 = true;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:HabboNotificationItem = null;
         if(var_2154.isSpaceAvailable() && false)
         {
            _loc2_ = getNextItemFromQueue();
            if(!var_2154.showItem(_loc2_))
            {
               _loc2_.dispose();
            }
         }
      }
      
      public function addItem(param1:String, param2:String, param3:BitmapData, param4:String = null, param5:String = null, param6:String = null) : int
      {
         if(false)
         {
            return 0;
         }
         var _loc8_:class_24;
         if((_loc8_ = _styleConfiguration["styles"]) == null)
         {
            return 0;
         }
         var _loc10_:class_24;
         if((_loc10_ = _loc8_[param2]) == null)
         {
            return 0;
         }
         var _loc9_:HabboNotificationItemStyle = new HabboNotificationItemStyle(_loc10_,param3,param4,true,param5);
         if(param6)
         {
            _loc9_.internalLink = param6;
         }
         var _loc7_:HabboNotificationItem = new HabboNotificationItem(param1,_loc9_,this);
         var_3142.push(_loc7_);
         return var_3142.length;
      }
      
      private function getNextItemFromQueue() : HabboNotificationItem
      {
         var _loc1_:Array = var_3142.splice(0,1);
         return _loc1_[0] as HabboNotificationItem;
      }
      
      public function addSongPlayingNotification(param1:String, param2:String) : void
      {
         _notifications.localization.registerParameter("soundmachine.notification.playing","songname",param1);
         _notifications.localization.registerParameter("soundmachine.notification.playing","songauthor",param2);
         var _loc3_:ILocalization = _notifications.localization.getLocalizationRaw("soundmachine.notification.playing");
         if(_loc3_)
         {
            addItem(_loc3_.value,"soundmachine",null);
         }
      }
      
      public function onInternalLink(param1:String) : void
      {
         _notifications.createLinkEvent(param1);
      }
      
      private function onShowModerationDisclaimer(param1:TimerEvent) : void
      {
         var_1969.removeEventListener("timerComplete",onShowModerationDisclaimer);
         var_1969 = null;
         showModerationDisclaimer();
      }
      
      public function showModerationDisclaimer() : void
      {
         var _loc1_:String = null;
         if(RoomEnterEffect.isRunning())
         {
            if(var_1969 == null)
            {
               var_1969 = new Timer(NaN,1);
               var_1969.addEventListener("timerComplete",onShowModerationDisclaimer);
               var_1969.start();
            }
         }
         else if(!var_4228)
         {
            _loc1_ = String(_notifications.localization.getLocalization("mod.chatdisclaimer","NA"));
            this.addItem(_loc1_,"info",null);
            var_4228 = true;
            class_14.log("DISPLAYED MOD INFO: " + _loc1_);
         }
      }
      
      public function showClubGiftNotification(param1:int) : void
      {
         if(_clubGiftNotification && (false || false))
         {
            return;
         }
         _clubGiftNotification = new com.sulake.habbo.notifications.singular.ClubGiftNotification(param1,_notifications.assets,_notifications.windowManager,_notifications.catalog,_notifications.toolBar);
      }
      
      public function showSafetyLockedNotification(param1:int) : void
      {
         if(_safetyLockedNotification && false)
         {
            return;
         }
         _safetyLockedNotification = new com.sulake.habbo.notifications.singular.SafetyLockedNotification(param1,_notifications.assets,_notifications.windowManager,_notifications.catalog,_notifications.toolBar);
      }
      
      public function hideSafetyLockedNotification() : void
      {
         if(!_safetyLockedNotification)
         {
            return;
         }
         _safetyLockedNotification.dispose();
      }
      
      private function onBadgeImage(param1:BadgeImageReadyEvent) : void
      {
         if(param1 != null && this.var_2154 != null)
         {
            var_2154.replaceIcon(param1);
         }
      }
   }
}
