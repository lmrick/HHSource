package com.sulake.habbo.notifications
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.notifications.feed.data.GenericNotificationItemData;
   import com.sulake.habbo.notifications.singular.MOTDNotification;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.utils.class_3132;
   import flash.display.BitmapData;
   import flash.utils.getTimer;
   import package_10.class_1038;
   import package_128.class_1442;
   import package_130.class_1485;
   import package_133.class_1188;
   import package_134.class_1361;
   import package_136.class_1068;
   import package_137.class_1221;
   import package_137.class_1241;
   import package_137.class_1478;
   import package_14.class_303;
   import package_144.class_1350;
   import package_144.class_1552;
   import package_144.class_1572;
   import package_147.class_1192;
   import package_147.class_1279;
   import package_147.class_1335;
   import package_147.class_1346;
   import package_147.class_1362;
   import package_147.class_1412;
   import package_161.class_1137;
   import package_161.class_1171;
   import package_161.class_1177;
   import package_161.class_1431;
   import package_17.class_486;
   import package_25.class_595;
   import package_28.class_161;
   import package_28.class_201;
   import package_28.class_261;
   import package_28.class_366;
   import package_28.class_448;
   import package_28.class_498;
   import package_28.class_759;
   import package_28.class_810;
   import package_28.class_902;
   import package_41.class_290;
   import package_42.class_1017;
   import package_42.class_1024;
   import package_42.class_649;
   import package_42.class_903;
   import package_5.class_212;
   import package_5.class_755;
   import package_50.class_207;
   import package_50.class_315;
   import package_50.class_644;
   import package_6.class_530;
   import package_8.class_1608;
   import package_8.class_887;
   
   public class IncomingMessages
   {
       
      
      private var _notifications:com.sulake.habbo.notifications.HabboNotifications;
      
      private var _communication:class_25;
      
      private var _messageEvents:Vector.<IMessageEvent>;
      
      private const CALL_FOR_HELP_NOTIFICATION_TYPE:String = "cfh.created";
      
      public function IncomingMessages(param1:com.sulake.habbo.notifications.HabboNotifications, param2:class_25)
      {
         super();
         _notifications = param1;
         _communication = param2;
         _messageEvents = new Vector.<IMessageEvent>(0);
         addMessageEvent(new class_759(onInfoFeedEnable));
         addMessageEvent(new class_486(onRoomEnter));
         addMessageEvent(new class_261(onBroadcastMessageEvent));
         addMessageEvent(new class_649(onHotelClosing));
         addMessageEvent(new class_530(onUserObject));
         addMessageEvent(new class_498(onNotificationDialogMessageEvent));
         addMessageEvent(new class_1024(onHotelMaintenance));
         addMessageEvent(new class_212(onAccountSafetyLockStatusChanged));
         addMessageEvent(new class_902(onRestoreClientMessageEvent));
         addMessageEvent(new class_161(onClubGiftNotification));
         addMessageEvent(new class_887(onClubGiftSelected));
         addMessageEvent(new class_595(onRoomMessagesNotification));
         addMessageEvent(new class_903(onHotelClosed));
         addMessageEvent(new class_448(onActivityPointNotification));
         addMessageEvent(new class_810(onPetLevelNotification));
         addMessageEvent(new class_1017(onLoginFailedHotelClosed));
         addMessageEvent(new class_290(onPetRespectFailed));
         addMessageEvent(new class_207(onUserBannedMessageEvent));
         addMessageEvent(new class_201(onLevelUp));
         addMessageEvent(new class_1038(onRoomEnter));
         addMessageEvent(new class_644(onModCautionEvent));
         addMessageEvent(new class_303(onPetReceived));
         addMessageEvent(new class_366(onMOTD));
         addMessageEvent(new class_315(onModMessageEvent));
         addMessageEvent(new class_755(onRespectNotification));
         _notifications.activate();
      }
      
      private function addMessageEvent(param1:IMessageEvent) : void
      {
         _messageEvents.push(_communication.addHabboConnectionMessageEvent(param1));
      }
      
      public function dispose() : void
      {
         if(_messageEvents != null && _communication != null)
         {
            for each(var _loc1_ in _messageEvents)
            {
               _communication.removeHabboConnectionMessageEvent(_loc1_);
            }
         }
         _messageEvents = null;
         _notifications = null;
         _communication = null;
      }
      
      private function useNotificationFeed() : Boolean
      {
         return _notifications.getBoolean("notification.feed.enabled");
      }
      
      private function useNotifications() : Boolean
      {
         return _notifications.getBoolean("notification.items.enabled");
      }
      
      internal function onMOTD(param1:IMessageEvent) : void
      {
         var _loc4_:GenericNotificationItemData = null;
         var _loc5_:class_366;
         var _loc3_:class_1279 = (_loc5_ = param1 as class_366).getParser() as class_1279;
         if(_loc3_.messages && _loc3_.messages.length > 0)
         {
            if(useNotifications())
            {
               new MOTDNotification(_loc3_.messages,_notifications.assetLibrary,_notifications.windowManager);
            }
            if(useNotificationFeed())
            {
               for each(var _loc2_ in _loc3_.messages)
               {
                  (_loc4_ = new GenericNotificationItemData()).title = _loc2_;
                  _loc4_.timeStamp = getTimer();
                  _notifications.feedController.addFeedItem(3,_loc4_);
               }
            }
         }
      }
      
      private function onLevelUp(param1:IMessageEvent) : void
      {
         var _loc2_:class_201 = param1 as class_201;
         var _loc3_:class_1192 = _loc2_.getParser();
         var _loc4_:String = String(_notifications.localization.getLocalization("achievements.levelup.desc",""));
         var _loc6_:String = String(_notifications.localization.getBadgeName(_loc3_.data.badgeCode));
         var _loc5_:BitmapData = _notifications.sessionDataManager.requestBadgeImage(_loc3_.data.badgeCode);
         _notifications.singularController.addItem(_loc4_ + " " + _loc6_,"achievement",_loc5_,null,_loc3_.data.badgeCode,"questengine/achievements/" + _loc3_.data.category);
      }
      
      internal function onRespectNotification(param1:IMessageEvent) : void
      {
         var _loc4_:ILocalization = null;
         var _loc2_:ILocalization = null;
         var _loc3_:class_755 = param1 as class_755;
         if(_notifications.sessionDataManager.userId == _loc3_.userId)
         {
            _notifications.localization.registerParameter("notifications.text.respect.2","count",String(_loc3_.respectTotal));
            _loc4_ = _notifications.localization.getLocalizationRaw("notifications.text.respect.1");
            _loc2_ = _notifications.localization.getLocalizationRaw("notifications.text.respect.2");
            if(_loc4_)
            {
               _notifications.singularController.addItem(_loc4_.value,"respect",null);
            }
            if(_loc2_)
            {
               _notifications.singularController.addItem(_loc2_.value,"respect",null);
            }
         }
      }
      
      private function onRoomMessagesNotification(param1:class_595) : void
      {
         var _loc2_:ILocalization = null;
         var _loc3_:class_1068 = param1.getParser();
         _notifications.localization.registerParameter("notifications.text.room.messages.posted","room_name",_loc3_.roomName);
         _notifications.localization.registerParameter("notifications.text.room.messages.posted","messages_count",_loc3_.messageCount.toString());
         _loc2_ = _notifications.localization.getLocalizationRaw("notifications.text.room.messages.posted");
         var _loc6_:BitmapDataAsset;
         var _loc4_:BitmapData = (_loc6_ = _notifications.assets.getAssetByName("if_icon_temp_png") as BitmapDataAsset).content as BitmapData;
         if(_loc2_)
         {
            _notifications.singularController.addItem(_loc2_.value,"roommessagesposted",_loc4_.clone());
         }
      }
      
      private function onInfoFeedEnable(param1:IMessageEvent) : void
      {
         var _loc2_:class_759 = param1 as class_759;
         if(_loc2_ != null)
         {
            _notifications.disabled = !_loc2_.enabled;
         }
      }
      
      private function onModCautionEvent(param1:IMessageEvent) : void
      {
         var _loc3_:GenericNotificationItemData = null;
         var _loc2_:class_1478 = (param1 as class_644).getParser();
         if(_loc2_ == null || _notifications.singularController.alertDialogManager == null)
         {
            return;
         }
         if(useNotifications())
         {
            _notifications.singularController.alertDialogManager.handleModeratorCaution(_loc2_.message,_loc2_.url);
         }
         if(useNotificationFeed())
         {
            _loc3_ = new GenericNotificationItemData();
            _loc3_.title = _loc2_.message;
            _loc3_.buttonAction = _loc2_.url;
            _loc3_.buttonCaption = _loc2_.url;
            _loc3_.timeStamp = getTimer();
            _notifications.feedController.addFeedItem(3,_loc3_);
         }
      }
      
      private function onModMessageEvent(param1:IMessageEvent) : void
      {
         var _loc3_:GenericNotificationItemData = null;
         var _loc2_:class_1241 = (param1 as class_315).getParser();
         if(_loc2_ == null || _notifications.singularController.alertDialogManager == null)
         {
            return;
         }
         if(useNotifications())
         {
            _notifications.singularController.alertDialogManager.handleModeratorMessage(_loc2_.message,_loc2_.url);
         }
         if(useNotificationFeed())
         {
            _loc3_ = new GenericNotificationItemData();
            _loc3_.title = _loc2_.message;
            _loc3_.buttonAction = _loc2_.url;
            _loc3_.buttonCaption = _loc2_.url;
            _loc3_.timeStamp = getTimer();
            _notifications.feedController.addFeedItem(3,_loc3_);
         }
      }
      
      private function onUserBannedMessageEvent(param1:IMessageEvent) : void
      {
         var _loc2_:class_1221 = (param1 as class_207).getParser();
         if(_loc2_ == null || _notifications.singularController.alertDialogManager == null)
         {
            return;
         }
         _notifications.singularController.alertDialogManager.handleUserBannedMessage(_loc2_.message);
      }
      
      private function onHotelClosing(param1:IMessageEvent) : void
      {
         var _loc2_:class_1177 = (param1 as class_649).getParser();
         if(_loc2_ == null || _notifications.singularController.alertDialogManager == null)
         {
            return;
         }
         _notifications.singularController.alertDialogManager.handleHotelClosingMessage(_loc2_.minutesUntilClosing);
      }
      
      private function onHotelMaintenance(param1:IMessageEvent) : void
      {
         var _loc2_:class_1137 = (param1 as class_1024).getParser();
         if(_loc2_ == null || _notifications.singularController.alertDialogManager == null)
         {
            return;
         }
         _notifications.singularController.alertDialogManager.handleHotelMaintenanceMessage(_loc2_.minutesUntilMaintenance,_loc2_.duration);
      }
      
      private function onHotelClosed(param1:IMessageEvent) : void
      {
         var _loc2_:class_1171 = (param1 as class_903).getParser();
         if(_loc2_ == null || _notifications.singularController.alertDialogManager == null)
         {
            return;
         }
         _notifications.singularController.alertDialogManager.handleHotelClosedMessage(_loc2_.openHour,_loc2_.openMinute,_loc2_.userThrownOutAtClose);
      }
      
      private function onLoginFailedHotelClosed(param1:IMessageEvent) : void
      {
         var _loc2_:class_1431 = (param1 as class_1017).getParser();
         if(_loc2_ == null || _notifications.singularController.alertDialogManager == null)
         {
            return;
         }
         _notifications.singularController.alertDialogManager.handleLoginFailedHotelClosedMessage(_loc2_.openHour,_loc2_.openMinute);
      }
      
      private function onRestoreClientMessageEvent(param1:IMessageEvent) : void
      {
         HabboWebTools.closeWebPageAndRestoreClient();
      }
      
      private function onPetLevelNotification(param1:class_810) : void
      {
         var _loc2_:class_1552 = null;
         var _loc5_:BitmapData = null;
         if(param1 == null)
         {
            return;
         }
         var _loc4_:class_1335 = param1.getParser();
         _notifications.localization.registerParameter("notifications.text.petlevel","pet_name",_loc4_.petName);
         _notifications.localization.registerParameter("notifications.text.petlevel","level",_loc4_.level.toString());
         var _loc3_:ILocalization = _notifications.localization.getLocalizationRaw("notifications.text.petlevel");
         if(_loc3_)
         {
            _loc2_ = _loc4_.figureData;
            _loc5_ = _notifications.petImageUtility.getPetImage(_loc2_.typeId,_loc2_.paletteId,_loc2_.color);
            _notifications.singularController.addItem(_loc3_.value,"petlevel",_loc5_);
         }
      }
      
      private function onPetReceived(param1:class_303) : void
      {
         var _loc2_:ILocalization = null;
         var _loc4_:class_1572 = null;
         var _loc5_:BitmapData = null;
         if(param1 == null)
         {
            return;
         }
         var _loc3_:class_1350 = param1.getParser();
         if(_loc3_.boughtAsGift)
         {
            _loc2_ = _notifications.localization.getLocalizationRaw("notifications.text.petbought");
         }
         else
         {
            _loc2_ = _notifications.localization.getLocalizationRaw("notifications.text.petreceived");
         }
         if(_loc2_)
         {
            _loc4_ = _loc3_.pet;
            _loc5_ = _notifications.petImageUtility.getPetImage(_loc4_.typeId,_loc4_.paletteId,_loc4_.color);
            _notifications.singularController.addItem(_loc2_.value,"petlevel",_loc5_);
         }
      }
      
      private function onRoomEnter(param1:IMessageEvent) : void
      {
         _notifications.singularController.showModerationDisclaimer();
      }
      
      private function onBroadcastMessageEvent(param1:IMessageEvent) : void
      {
         var _loc4_:class_1346;
         var _loc2_:String = (_loc4_ = (param1 as class_261).getParser()).messageText;
         var _loc3_:RegExp = /\\r/g;
         _loc2_ = _loc2_.replace(_loc3_,"\r");
         _notifications.windowManager.simpleAlert("${notifications.broadcast.title}","",_loc2_,"","",null,"illumina_alert_illustrations_frank_neutral_png");
      }
      
      private function onNotificationDialogMessageEvent(param1:class_498) : void
      {
         var _loc2_:class_1412 = param1.getParser();
         if("cfh.created" == _loc2_.type)
         {
            showCallCreatedNotification(_loc2_.parameters["message"],_loc2_.parameters["linkUrl"]);
         }
         else
         {
            _notifications.showNotification(_loc2_.type,_loc2_.parameters);
         }
      }
      
      private function showCallCreatedNotification(param1:String, param2:String) : void
      {
         var _loc3_:String = param1.replace(/\\r/g,"\r");
         if(param2 != null)
         {
            _notifications.windowManager.simpleAlert("${help.cfh.sent.title}","",_loc3_,"${help.main.faq.link.text}",param2,null,"illumina_alert_illustrations_frank_neutral_png");
         }
         else
         {
            _notifications.windowManager.simpleAlert("${help.cfh.sent.title}","",_loc3_,null,null,null,"illumina_alert_illustrations_frank_neutral_png");
         }
      }
      
      private function onPetRespectFailed(param1:IMessageEvent) : void
      {
         var _loc2_:class_1361 = (param1 as class_290).getParser();
         this._notifications.localization.registerParameter("room.error.pets.respectfailed","required_age","" + _loc2_.requiredDays);
         this._notifications.localization.registerParameter("room.error.pets.respectfailed","avatar_age","" + _loc2_.avatarAgeInDays);
         _notifications.windowManager.alert("${error.title}","${room.error.pets.respectfailed}",0,onAlert);
      }
      
      public function onAlert(param1:class_3132, param2:class_3134) : void
      {
         if(param2.type == "WE_OK" || param2.type == "WE_CANCEL")
         {
            param1.dispose();
         }
      }
      
      private function onClubGiftNotification(param1:class_161) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:class_1362 = param1.getParser();
         if(!_loc2_)
         {
            return;
         }
         if(_loc2_.numGifts < 1)
         {
            return;
         }
         _notifications.singularController.showClubGiftNotification(_loc2_.numGifts);
      }
      
      private function onUserObject(param1:class_530) : void
      {
         var _loc2_:class_1188 = param1.getParser();
         if(_loc2_.accountSafetyLocked)
         {
            _notifications.singularController.showSafetyLockedNotification(_loc2_.id);
         }
      }
      
      private function onAccountSafetyLockStatusChanged(param1:class_212) : void
      {
         var _loc2_:class_1485 = param1.getParser();
         if(_loc2_.status == 1)
         {
            _notifications.singularController.hideSafetyLockedNotification();
         }
      }
      
      private function onClubGiftSelected(param1:class_887) : void
      {
         if(!param1 || true)
         {
            return;
         }
         var _loc3_:class_1442 = param1.getParser();
         if(!_loc3_)
         {
            return;
         }
         var _loc6_:Array;
         if(!(_loc6_ = _loc3_.products) || _loc6_.length == 0)
         {
            return;
         }
         var _loc2_:class_1608 = _loc6_[0] as class_1608;
         if(!_loc2_)
         {
            return;
         }
         var _loc5_:String = String(_notifications.localization.getLocalization("notifications.text.club_gift.received"));
         var _loc4_:BitmapData = _notifications.productImageUtility.getProductImage(_loc2_.productType,_loc2_.furniClassId,_loc2_.extraParam);
         _notifications.singularController.addItem(_loc5_,"info",_loc4_);
      }
      
      private function onActivityPointNotification(param1:class_448) : void
      {
         var _loc3_:String = null;
         var _loc2_:BitmapData = null;
         if(param1.change <= 0)
         {
            return;
         }
         switch(param1.type - 5)
         {
            case 0:
               _loc3_ = String(_notifications.localization.getLocalizationWithParams("notifications.text.loyalty.received","","amount",param1.change));
               _loc2_ = _notifications.assets.getAssetByName("if_icon_diamond_png").content as BitmapData;
               _notifications.singularController.addItem(_loc3_,"info",_loc2_.clone());
               return;
            default:
               return;
         }
      }
   }
}
