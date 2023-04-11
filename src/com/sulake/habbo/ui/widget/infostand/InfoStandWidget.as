package com.sulake.habbo.ui.widget.infostand
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_19;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.handler.InfoStandWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPetCommandsUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPetFigureUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetSongUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.habbo.window.class_1684;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class InfoStandWidget extends RoomWidgetBase
   {
       
      
      private const USER_VIEW:String = "infostand_user_view";
      
      private const const_777:String = "infostand_furni_view";
      
      private const PET_VIEW:String = "infostand_pet_view";
      
      private const BOT_VIEW:String = "infostand_bot_view";
      
      private const RENTABLE_BOT_VIEW:String = "infostand_rentable_bot_view";
      
      private const const_932:String = "infostand_jukebox_view";
      
      private const CRACKABLE_FURNI_VIEW:String = "infostand_crackable_furni_view";
      
      private const SONGDISK_VIEW:String = "infostand_songdisk_view";
      
      private var var_2553:com.sulake.habbo.ui.widget.infostand.InfoStandFurniView;
      
      private var var_1615:com.sulake.habbo.ui.widget.infostand.InfoStandUserView;
      
      private var var_1718:com.sulake.habbo.ui.widget.infostand.InfoStandPetView;
      
      private var var_1892:com.sulake.habbo.ui.widget.infostand.InfoStandBotView;
      
      private var var_2130:com.sulake.habbo.ui.widget.infostand.InfoStandRentableBotView;
      
      private var var_2626:com.sulake.habbo.ui.widget.infostand.InfoStandJukeboxView;
      
      private var var_2887:com.sulake.habbo.ui.widget.infostand.InfoStandCrackableFurniView;
      
      private var var_2426:com.sulake.habbo.ui.widget.infostand.InfoStandSongDiskView;
      
      private var var_4347:Array;
      
      private var var_2947:com.sulake.habbo.ui.widget.infostand.InfoStandUserData;
      
      private var var_1489:com.sulake.habbo.ui.widget.infostand.InfoStandFurniData;
      
      private var var_296:com.sulake.habbo.ui.widget.infostand.InfoStandPetData;
      
      private var var_3715:com.sulake.habbo.ui.widget.infostand.InfoStandRentableBotData;
      
      private var var_1446:class_3151;
      
      private var var_1581:Timer;
      
      private var _config:class_19;
      
      private const UPDATE_INTERVAL_MS:int = 3000;
      
      public function InfoStandWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21, param4:class_18, param5:class_19, param6:IHabboCatalog)
      {
         super(param1,param2,param3,param4);
         _config = param5;
         var_2553 = new com.sulake.habbo.ui.widget.infostand.InfoStandFurniView(this,"infostand_furni_view",param6);
         var_1615 = new com.sulake.habbo.ui.widget.infostand.InfoStandUserView(this,"infostand_user_view");
         var_1718 = new com.sulake.habbo.ui.widget.infostand.InfoStandPetView(this,"infostand_pet_view",param6);
         var_1892 = new com.sulake.habbo.ui.widget.infostand.InfoStandBotView(this,"infostand_bot_view");
         var_2130 = new com.sulake.habbo.ui.widget.infostand.InfoStandRentableBotView(this,"infostand_rentable_bot_view",param6);
         var_2626 = new com.sulake.habbo.ui.widget.infostand.InfoStandJukeboxView(this,"infostand_jukebox_view",param6);
         var_2887 = new com.sulake.habbo.ui.widget.infostand.InfoStandCrackableFurniView(this,"infostand_crackable_furni_view",param6);
         var_2426 = new com.sulake.habbo.ui.widget.infostand.InfoStandSongDiskView(this,"infostand_songdisk_view",param6);
         var_2947 = new com.sulake.habbo.ui.widget.infostand.InfoStandUserData();
         var_1489 = new com.sulake.habbo.ui.widget.infostand.InfoStandFurniData();
         var_296 = new com.sulake.habbo.ui.widget.infostand.InfoStandPetData();
         var_3715 = new com.sulake.habbo.ui.widget.infostand.InfoStandRentableBotData();
         var_1581 = new Timer(3000);
         var_1581.addEventListener("timer",onUpdateTimer);
         mainContainer.visible = false;
         this.handler.widget = this;
      }
      
      public function get handler() : InfoStandWidgetHandler
      {
         return var_1453 as InfoStandWidgetHandler;
      }
      
      public function get furniView() : com.sulake.habbo.ui.widget.infostand.InfoStandFurniView
      {
         return var_2553;
      }
      
      override public function get mainWindow() : class_3127
      {
         return mainContainer;
      }
      
      public function get config() : class_19
      {
         return _config;
      }
      
      public function get mainContainer() : class_3151
      {
         if(var_1446 == null)
         {
            var_1446 = windowManager.createWindow("infostand_main_container","",4,0,0,new Rectangle(0,0,50,100)) as class_3151;
            var_1446.tags.push("room_widget_infostand");
            var_1446.background = true;
            var_1446.color = 0;
         }
         return var_1446;
      }
      
      public function favouriteGroupUpdated(param1:int, param2:int, param3:int, param4:String) : void
      {
         var _loc6_:String = null;
         if(!userData || userData.userRoomId != param1)
         {
            return;
         }
         if(!mainContainer)
         {
            return;
         }
         var _loc5_:class_3127;
         if(!(_loc5_ = mainContainer.findChildByName("infostand_user_view")) || !_loc5_.visible)
         {
            return;
         }
         var_1615.clearGroupBadge();
         if(param2 != -1)
         {
            _loc6_ = handler.container.sessionDataManager.getGroupBadgeId(param2);
            userData.groupId = param2;
            userData.groupBadgeId = _loc6_;
            userData.groupName = param4;
            var_1615.setGroupBadge(_loc6_);
         }
      }
      
      public function getXmlWindow(param1:String) : class_3127
      {
         var _loc4_:IAsset = null;
         var _loc2_:XmlAsset = null;
         var _loc3_:class_3127 = null;
         try
         {
            _loc4_ = assets.getAssetByName(param1);
            _loc2_ = XmlAsset(_loc4_);
            _loc3_ = windowManager.buildFromXML(XML(_loc2_.content));
         }
         catch(e:Error)
         {
            class_14.log("[InfoStandWidget] Missing window XML: " + param1);
         }
         return _loc3_;
      }
      
      public function setRelationshipStatus(param1:int, param2:class_24) : void
      {
         if(var_2947.userId == param1)
         {
            var_1615.setRelationshipStatuses(param2);
         }
      }
      
      override public function dispose() : void
      {
         if(var_1581)
         {
            var_1581.stop();
         }
         var_1581 = null;
         if(var_1615)
         {
            var_1615.dispose();
         }
         var_1615 = null;
         if(var_2553)
         {
            var_2553.dispose();
         }
         var_2553 = null;
         if(var_1892)
         {
            var_1892.dispose();
         }
         var_1892 = null;
         if(var_2130)
         {
            var_2130.dispose();
         }
         var_2130 = null;
         if(var_1718)
         {
            var_1718.dispose();
         }
         var_1718 = null;
         if(var_2626)
         {
            var_2626.dispose();
         }
         var_2626 = null;
         if(var_2887)
         {
            var_2887.dispose();
         }
         var_2887 = null;
         if(var_2426)
         {
            var_2426.dispose();
         }
         var_2426 = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener("RWROUE_OBJECT_SELECTED",onRoomObjectSelected);
         param1.addEventListener("RWROUE_OBJECT_DESELECTED",onClose);
         param1.addEventListener("RWROUE_USER_REMOVED",onRoomObjectRemoved);
         param1.addEventListener("RWROUE_FURNI_REMOVED",onRoomObjectRemoved);
         param1.addEventListener("RWUIUE_OWN_USER",onUserInfo);
         param1.addEventListener("RWUIUE_PEER",onUserInfo);
         param1.addEventListener("RWUIUE_BOT",onBotInfo);
         param1.addEventListener("RWFIUE_FURNI",onFurniInfo);
         param1.addEventListener("RWRBIUE_RENTABLE_BOT",onRentableBotInfo);
         param1.addEventListener("RWPIUE_PET_INFO",onPetInfo);
         param1.addEventListener("RWPCUE_PET_COMMANDS",onPetCommands);
         param1.addEventListener("RWPCUE_OPEN_PET_TRAINING",onOpenPetTraining);
         param1.addEventListener("RWPCUE_CLOSE_PET_TRAINING",onClosePetTraining);
         param1.addEventListener("RWSUE_PLAYING_CHANGED",onSongUpdate);
         param1.addEventListener("RWSUE_DATA_RECEIVED",onSongUpdate);
         param1.addEventListener("RWPIUE_PET_FIGURE_UPDATE",onPetFigureUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener("RWROUE_OBJECT_SELECTED",onRoomObjectSelected);
         param1.removeEventListener("RWROUE_OBJECT_DESELECTED",onClose);
         param1.removeEventListener("RWROUE_USER_REMOVED",onRoomObjectRemoved);
         param1.removeEventListener("RWROUE_FURNI_REMOVED",onRoomObjectRemoved);
         param1.removeEventListener("RWUIUE_OWN_USER",onUserInfo);
         param1.removeEventListener("RWUIUE_PEER",onUserInfo);
         param1.removeEventListener("RWUIUE_BOT",onBotInfo);
         param1.removeEventListener("RWFIUE_FURNI",onFurniInfo);
         param1.removeEventListener("RWPIUE_PET_INFO",onPetInfo);
         param1.removeEventListener("RWPCUE_PET_COMMANDS",onPetCommands);
         param1.removeEventListener("RWPCUE_OPEN_PET_TRAINING",onOpenPetTraining);
         param1.removeEventListener("RWPCUE_CLOSE_PET_TRAINING",onClosePetTraining);
         param1.removeEventListener("RWSUE_PLAYING_CHANGED",onSongUpdate);
         param1.removeEventListener("RWSUE_DATA_RECEIVED",onSongUpdate);
         param1.removeEventListener("RWPIUE_PET_FIGURE_UPDATE",onPetFigureUpdate);
      }
      
      public function get rentableBotData() : com.sulake.habbo.ui.widget.infostand.InfoStandRentableBotData
      {
         return var_3715;
      }
      
      public function get userData() : com.sulake.habbo.ui.widget.infostand.InfoStandUserData
      {
         return var_2947;
      }
      
      public function get furniData() : com.sulake.habbo.ui.widget.infostand.InfoStandFurniData
      {
         return var_1489;
      }
      
      public function get petData() : com.sulake.habbo.ui.widget.infostand.InfoStandPetData
      {
         return var_296;
      }
      
      private function onUpdateTimer(param1:TimerEvent) : void
      {
         if(var_1718 == null)
         {
            return;
         }
         messageListener.processWidgetMessage(new RoomWidgetUserActionMessage("RWUAM_REQUEST_PET_UPDATE",var_1718.getCurrentPetId()));
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         userData.setData(param1);
         var_1615.update(param1);
         selectView("infostand_user_view");
         if(var_1581)
         {
            var_1581.stop();
         }
      }
      
      private function onBotInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         userData.setData(param1);
         var_1892.update(param1);
         selectView("infostand_bot_view");
         if(var_1581)
         {
            var_1581.stop();
         }
      }
      
      private function onRentableBotInfo(param1:RoomWidgetRentableBotInfoUpdateEvent) : void
      {
         rentableBotData.setData(param1);
         var_2130.update(param1);
         selectView("infostand_rentable_bot_view");
         if(var_1581)
         {
            var_1581.stop();
         }
      }
      
      private function onFurniInfo(param1:RoomWidgetFurniInfoUpdateEvent) : void
      {
         furniData.setData(param1);
         if(param1.extraParam == "RWEIEP_JUKEBOX")
         {
            var_2626.update(param1);
            selectView("infostand_jukebox_view");
         }
         else if(param1.extraParam.indexOf("RWEIEP_SONGDISK") != -1)
         {
            var_2426.update(param1);
            selectView("infostand_songdisk_view");
         }
         else if(param1.extraParam.indexOf("RWEIEP_CRACKABLE_FURNI") != -1)
         {
            var_2887.update(param1);
            selectView("infostand_crackable_furni_view");
         }
         else
         {
            var_2553.update(param1);
            selectView("infostand_furni_view");
         }
         if(var_1581)
         {
            var_1581.stop();
         }
      }
      
      private function onPetInfo(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         petData.setData(param1);
         userData.petRespectLeft = param1.petRespectLeft;
         var_1718.update(petData);
         selectView("infostand_pet_view");
         if(var_1581)
         {
            var_1581.start();
         }
      }
      
      private function onPetFigureUpdate(param1:RoomWidgetPetFigureUpdateEvent) : void
      {
         var_1718.updateImage(param1.petId,param1.image);
      }
      
      private function onPetCommands(param1:RoomWidgetPetCommandsUpdateEvent) : void
      {
         var _loc2_:Array = param1.allCommands;
         var _loc3_:Array = param1.enabledCommands;
         if(false && !_config.getBoolean("nest.breeding.dog.enabled") || false && !_config.getBoolean("nest.breeding.cat.enabled") || false && !_config.getBoolean("nest.breeding.pig.enabled"))
         {
            if(_loc2_.indexOf(46) != -1)
            {
               _loc2_.splice(_loc2_.indexOf(46),1);
            }
            if(_loc3_.indexOf(46) != -1)
            {
               _loc3_.splice(_loc3_.indexOf(46),1);
            }
         }
         var_1718.updateEnabledTrainingCommands(param1.id,new CommandConfiguration(param1.allCommands,param1.enabledCommands));
      }
      
      private function onOpenPetTraining(param1:RoomWidgetUpdateEvent) : void
      {
         var_1718.openTrainView();
      }
      
      private function onClosePetTraining(param1:RoomWidgetUpdateEvent) : void
      {
         var_1718.closeTrainView();
      }
      
      public function updateUserData(param1:int, param2:String, param3:int, param4:String, param5:Boolean) : void
      {
         if(param1 != userData.userId)
         {
            return;
         }
         if(userData.isBot())
         {
            var_1892.setFigure(param2);
         }
         else
         {
            var_1615.setFigure(param2);
            var_1615.setMotto(param4,param5);
            if(false)
            {
               var_1615.achievementScore = param3;
            }
         }
      }
      
      public function refreshBadges(param1:int, param2:Array) : void
      {
         if(param1 != userData.userId)
         {
            return;
         }
         userData.badges = param2;
         if(userData.isBot())
         {
            var_1892.clearBadges();
         }
         else
         {
            var_1615.clearBadges();
         }
         for each(var _loc3_ in param2)
         {
            refreshBadge(_loc3_);
         }
      }
      
      public function refreshBadge(param1:String) : void
      {
         var _loc2_:int = userData.badges.indexOf(param1);
         if(_loc2_ >= 0)
         {
            if(userData.isBot())
            {
               var_1892.setBadge(_loc2_,param1);
            }
            else
            {
               var_1615.setBadge(_loc2_,param1);
            }
            return;
         }
         if(param1 == userData.groupBadgeId)
         {
            var_1615.setGroupBadge(param1);
         }
      }
      
      private function onRoomObjectSelected(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage("RWROM_GET_OBJECT_INFO",param1.id,param1.category);
         messageListener.processWidgetMessage(_loc2_);
      }
      
      private function onRoomObjectRemoved(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:* = false;
         switch(param1.type)
         {
            case "RWROUE_FURNI_REMOVED":
               _loc2_ = param1.id == var_1489.id;
               break;
            case "RWROUE_USER_REMOVED":
               if(var_1615 != null && false && Boolean(var_1615.window.visible))
               {
                  _loc2_ = param1.id == var_2947.userRoomId;
                  break;
               }
               if(var_1718 != null && false && Boolean(var_1718.window.visible))
               {
                  _loc2_ = param1.id == var_296.roomIndex;
                  break;
               }
               if(var_1892 != null && false && Boolean(var_1892.window.visible))
               {
                  _loc2_ = param1.id == var_2947.userRoomId;
                  break;
               }
               if(var_2130 != null && false && Boolean(var_2130.window.visible))
               {
                  _loc2_ = param1.id == var_3715.userRoomId;
                  break;
               }
               break;
         }
         if(_loc2_)
         {
            close();
         }
      }
      
      private function onSongUpdate(param1:RoomWidgetSongUpdateEvent) : void
      {
         var_2626.updateSongInfo(param1);
         var_2426.updateSongInfo(param1);
      }
      
      public function close() : void
      {
         hideChildren();
         if(var_1581)
         {
            var_1581.stop();
         }
      }
      
      private function onClose(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         close();
         if(var_1581)
         {
            var_1581.stop();
         }
      }
      
      private function hideChildren() : void
      {
         var _loc1_:int = 0;
         if(var_1446 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_1446.numChildren)
            {
               var_1446.getChildAt(_loc1_).visible = false;
               _loc1_++;
            }
         }
      }
      
      public function isFurniViewVisible() : Boolean
      {
         var _loc1_:class_3127 = null;
         if(var_1446 != null)
         {
            _loc1_ = var_1446.getChildByName("infostand_furni_view") as class_3127;
            if(_loc1_ != null)
            {
               return _loc1_.visible;
            }
         }
         return false;
      }
      
      private function selectView(param1:String) : void
      {
         hideChildren();
         var _loc2_:class_3127 = mainContainer.getChildByName(param1) as class_3127;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = true;
         mainContainer.visible = true;
         mainContainer.width = _loc2_.width;
         mainContainer.height = _loc2_.height;
      }
      
      public function refreshContainer() : void
      {
         var _loc2_:class_3127 = null;
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < mainContainer.numChildren)
         {
            _loc2_ = mainContainer.getChildAt(_loc1_);
            if(_loc2_.visible)
            {
               mainContainer.width = _loc2_.width;
               mainContainer.height = _loc2_.height;
            }
            _loc1_++;
         }
      }
   }
}
