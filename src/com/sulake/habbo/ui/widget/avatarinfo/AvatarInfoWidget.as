package com.sulake.habbo.ui.widget.avatarinfo
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_19;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.friendlist.class_1869;
   import com.sulake.habbo.inventory.events.HabboInventoryEffectsEvent;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.class_3259;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.handler.AvatarInfoWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.avatarinfo.botskills.BotChangeNameConfiguration;
   import com.sulake.habbo.ui.widget.avatarinfo.botskills.BotChatterMarkovConfiguration;
   import com.sulake.habbo.ui.widget.avatarinfo.botskills.BotSkillConfigurationViewBase;
   import com.sulake.habbo.ui.widget.avatarinfo.botskills.class_3316;
   import com.sulake.habbo.ui.widget.contextmenu.ContextInfoView;
   import com.sulake.habbo.ui.widget.contextmenu.class_3167;
   import com.sulake.habbo.ui.widget.events.ConfirmPetBreedingPetData;
   import com.sulake.habbo.ui.widget.events.RoomWidgetAvatarInfoEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetConfirmPetBreedingEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetConfirmPetBreedingResultEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPetBreedingEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPetBreedingResultEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPetLevelUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPetStatusUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotForceOpenContextMenuEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotSkillListUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectNameEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUserLocationUpdateEvent;
   import com.sulake.habbo.ui.widget.events.UseProductItem;
   import com.sulake.habbo.ui.widget.memenu.class_3289;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetGetObjectLocationMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.habbo.window.utils.class_3132;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.utils.RoomEnterEffect;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import package_76.class_678;
   import package_98.class_425;
   import package_98.class_929;
   
   public class AvatarInfoWidget extends RoomWidgetBase implements class_41, class_3167
   {
      
      private static const EFFECT_TYPE_RIDE:int = 77;
      
      private static const EFFECT_TYPE_DEEP_WATER:int = 29;
      
      private static const EFFECT_TYPE_SHALLOW_WATER:int = 30;
      
      private static const const_852:int = 185;
      
      private static const AVATAR_HIGHLIGHT_DURATION_MSEC:int = 5000;
      
      private static const const_1090:String = "avatar";
      
      private static const const_1008:String = "use_minimized_own_avatar_menu";
       
      
      private var var_1460:class_20;
      
      private var _configuration:class_19;
      
      private var var_1430:com.sulake.habbo.ui.widget.avatarinfo.AvatarContextInfoButtonView;
      
      private var var_1638:com.sulake.habbo.ui.widget.avatarinfo.DecorateModeView;
      
      private var var_1420:Boolean = false;
      
      private var var_2775:Boolean = false;
      
      private var var_2368:Boolean = false;
      
      private var var_2606:Timer;
      
      private var var_3372:com.sulake.habbo.ui.widget.avatarinfo.class_3380;
      
      private var var_1588:com.sulake.habbo.ui.widget.avatarinfo.class_3361;
      
      private var var_1782:com.sulake.habbo.ui.widget.avatarinfo.PetInfoData;
      
      private var var_3403:int = -1;
      
      private var var_4325:Boolean = false;
      
      private var var_2153:com.sulake.habbo.ui.widget.avatarinfo.AvatarContextInfoButtonView;
      
      private var _cachedOwnAvatarMenu:com.sulake.habbo.ui.widget.avatarinfo.OwnAvatarMenuView;
      
      private var var_2207:com.sulake.habbo.ui.widget.avatarinfo.AvatarMenuView;
      
      private var var_2146:com.sulake.habbo.ui.widget.avatarinfo.RentableBotMenuView;
      
      private var var_3008:com.sulake.habbo.ui.widget.avatarinfo.OwnPetMenuView;
      
      private var var_2196:com.sulake.habbo.ui.widget.avatarinfo.PetMenuView;
      
      private var var_3122:com.sulake.habbo.ui.widget.avatarinfo.NewUserHelpView;
      
      private var var_1764:class_24;
      
      private var var_1907:class_24;
      
      private var var_1820:class_24;
      
      private var var_1674:com.sulake.habbo.ui.widget.avatarinfo.UseProductConfirmationView;
      
      private var var_1677:com.sulake.habbo.ui.widget.avatarinfo.BreedMonsterPlantsConfirmationView;
      
      private var var_1864:com.sulake.habbo.ui.widget.avatarinfo.ConfirmPetBreedingView;
      
      private var var_1632:com.sulake.habbo.ui.widget.avatarinfo.BreedPetsResultView;
      
      private var _breedingConfirmationAlert:class_3132;
      
      private var var_3251:int = -1;
      
      private var var_2773:int = -1;
      
      private var var_4034:Boolean = false;
      
      private var _handlePetInfo:Boolean = true;
      
      private var _catalog:IHabboCatalog;
      
      private var var_1925:class_24;
      
      private var var_2387:class_24;
      
      private var var_3579:com.sulake.habbo.ui.widget.avatarinfo.NestBreedingSuccessView;
      
      public function AvatarInfoWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21, param4:class_19, param5:class_18, param6:class_20, param7:IHabboCatalog)
      {
         var_1925 = new class_24();
         var_2387 = new class_24();
         super(param1,param2,param3,param5);
         var_1460 = param6;
         _catalog = param7;
         _configuration = param4;
         var_3372 = new com.sulake.habbo.ui.widget.avatarinfo.class_3380();
         var_1782 = new com.sulake.habbo.ui.widget.avatarinfo.PetInfoData();
         var_1588 = null;
         var_1764 = new class_24();
         var_1907 = new class_24();
         var_1820 = new class_24();
         this.handler.roomEngine.events.addEventListener("REOE_ADDED",onRoomObjectAdded);
         this.handler.roomEngine.events.addEventListener("REOE_REMOVED",onRoomObjectRemoved);
         this.handler.container.inventory.events.addEventListener("HIEE_EFFECTS_CHANGED",onEffectsChanged);
         this.handler.widget = this;
      }
      
      public function get component() : class_20
      {
         return var_1460;
      }
      
      public function get handler() : AvatarInfoWidgetHandler
      {
         return var_1453 as AvatarInfoWidgetHandler;
      }
      
      public function get configuration() : class_19
      {
         return _configuration;
      }
      
      public function get localization() : class_18
      {
         return var_44;
      }
      
      public function set handlePetInfo(param1:Boolean) : void
      {
         _handlePetInfo = param1;
      }
      
      private function onRoomObjectAdded(param1:RoomEngineObjectEvent) : void
      {
         var _loc2_:class_3259 = null;
         if(param1.category == 100)
         {
            _loc2_ = handler.roomSession.userDataManager.getUserDataByIndex(param1.objectId);
            if(_loc2_)
            {
               if(handler.friendList.getFriendNames().indexOf(_loc2_.name) > -1)
               {
                  showUserName(_loc2_,param1.objectId);
               }
            }
         }
      }
      
      private function onRoomObjectRemoved(param1:RoomEngineObjectEvent) : void
      {
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         if(param1.category == 100)
         {
            for each(var _loc2_ in var_1764)
            {
               if(_loc2_.objectId == param1.objectId)
               {
                  removeView(_loc2_,false);
               }
            }
            _loc4_ = [];
            for each(var _loc8_ in var_1820)
            {
               if((_loc6_ = int(_loc8_.requestRoomObjectId)) == _loc5_)
               {
                  _loc4_.push(_loc8_);
               }
            }
            for each(_loc8_ in _loc4_)
            {
               removeView(_loc8_,false);
            }
            if(var_1677 != null)
            {
               if(param1.objectId == var_1677.requestRoomObjectId || param1.objectId == var_1677.targetRoomObjectId)
               {
                  removeBreedMonsterPlantsConfirmationView();
               }
            }
            if(var_1864 != null)
            {
               if(param1.objectId == var_1864.requestRoomObjectId || param1.objectId == var_1864.targetRoomObjectId)
               {
                  removeConfirmPetBreedingView();
               }
            }
            if(var_1674 != null)
            {
               if(param1.objectId == var_1674.requestObjectId || param1.objectId == var_1674.targetRoomObjectId)
               {
                  removeUseProductConfirmationView();
               }
            }
         }
         if(param1.category == 10)
         {
            _loc5_ = param1.objectId;
            if(var_1674 != null)
            {
               if(var_1674.requestObjectId == _loc5_)
               {
                  removeUseProductConfirmationView();
               }
            }
            if(var_1632 != null)
            {
               var_1632.roomObjectRemoved(_loc5_);
            }
            _loc3_ = [];
            for each(var _loc7_ in var_1907)
            {
               if((_loc6_ = int(_loc7_.requestRoomObjectId)) == _loc5_)
               {
                  _loc3_.push(_loc7_);
               }
            }
            for each(_loc7_ in _loc3_)
            {
               removeView(_loc7_,false);
            }
         }
      }
      
      public function showUseProductMenuForItems(param1:Array) : void
      {
         var _loc3_:class_3259 = null;
         removeUseProductViews();
         removeUseProductConfirmationView();
         removeBreedMonsterPlantsConfirmationView();
         for each(var _loc2_ in param1)
         {
            _loc3_ = handler.roomSession.userDataManager.getUserDataByIndex(_loc2_.id);
            showUseProductMenu(_loc3_,_loc2_);
         }
      }
      
      public function showBreedPetMenuForItems(param1:Array) : void
      {
         var _loc3_:class_3259 = null;
         removeBreedPetViews();
         removeUseProductConfirmationView();
         removeBreedMonsterPlantsConfirmationView();
         for each(var _loc2_ in param1)
         {
            _loc3_ = handler.roomSession.userDataManager.getUserDataByIndex(_loc2_.id);
            showBreedPetMenu(_loc3_,_loc2_);
         }
      }
      
      private function onEffectsChanged(param1:HabboInventoryEffectsEvent) : void
      {
         if(var_1430 is com.sulake.habbo.ui.widget.avatarinfo.OwnAvatarMenuView)
         {
            (var_1430 as com.sulake.habbo.ui.widget.avatarinfo.OwnAvatarMenuView).updateButtons();
         }
      }
      
      private function getOwnCharacterInfo() : void
      {
         messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage("RWROM_GET_OWN_CHARACTER_INFO",0,0));
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         removeAvatarHighlightTimer();
         for each(var _loc1_ in var_1764)
         {
            _loc1_.dispose();
         }
         var_1764 = null;
         for each(var _loc2_ in var_1907)
         {
            _loc2_.dispose();
         }
         var_1907 = null;
         for each(var _loc4_ in var_1820)
         {
            _loc4_.dispose();
         }
         var_1820 = null;
         if(var_1460)
         {
            var_1460.removeUpdateReceiver(this);
            var_1460 = null;
         }
         if(var_2153)
         {
            var_2153.dispose();
            var_2153 = null;
         }
         if(var_2207)
         {
            var_2207.dispose();
            var_2207 = null;
         }
         if(_cachedOwnAvatarMenu)
         {
            _cachedOwnAvatarMenu.dispose();
            _cachedOwnAvatarMenu = null;
         }
         if(var_2146)
         {
            var_2146.dispose();
            var_2146 = null;
         }
         if(var_2196)
         {
            var_2196.dispose();
            var_2196 = null;
         }
         if(var_1430)
         {
            if(true)
            {
               var_1430.dispose();
               var_1430 = null;
            }
         }
         if(var_1638)
         {
            var_1638.dispose();
            var_1638 = null;
         }
         if(var_1674)
         {
            var_1674.dispose();
            var_1674 = null;
         }
         removeBreedMonsterPlantsConfirmationView();
         removeConfirmPetBreedingView();
         if(var_1632)
         {
            var_1632.dispose();
            var_1632 = null;
         }
         if(_breedingConfirmationAlert)
         {
            _breedingConfirmationAlert.dispose();
            _breedingConfirmationAlert = null;
         }
         if(var_1925)
         {
            for each(var _loc3_ in var_1925.getKeys())
            {
               BotSkillConfigurationViewBase(var_1925.getValue(_loc3_)).dispose();
            }
            var_1925.dispose();
            var_1925 = null;
         }
         if(var_2387 && false)
         {
            var_2387.dispose();
            var_2387 = null;
         }
         handler.roomEngine.events.removeEventListener("REOE_ADDED",onRoomObjectAdded);
         handler.roomEngine.events.removeEventListener("REOE_REMOVED",onRoomObjectRemoved);
         handler.container.inventory.events.removeEventListener("HIEE_EFFECTS_CHANGED",onEffectsChanged);
         var_1430 = null;
         _configuration = null;
         super.dispose();
      }
      
      public function close() : void
      {
         removeView(var_1430,false);
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener("RWRBFOCME_OPEN",updateEventHandler);
         param1.addEventListener("RWRBSLUE_SKILL_LIST",updateEventHandler);
         param1.addEventListener("RWRBIUE_RENTABLE_BOT",updateEventHandler);
         param1.addEventListener("RWAIE_AVATAR_INFO",updateEventHandler);
         param1.addEventListener("RWUIUE_OWN_USER",updateEventHandler);
         param1.addEventListener("RWUIUE_PEER",updateEventHandler);
         param1.addEventListener("RWROUE_FURNI_ADDED",updateEventHandler);
         param1.addEventListener("RWROUE_OBJECT_SELECTED",updateEventHandler);
         param1.addEventListener("RWROUE_OBJECT_DESELECTED",updateEventHandler);
         param1.addEventListener("RWFIUE_FURNI",updateEventHandler);
         param1.addEventListener("RWUIUE_BOT",updateEventHandler);
         param1.addEventListener("RWPIUE_PET_INFO",updateEventHandler);
         param1.addEventListener("rwudue_user_data_updated",updateEventHandler);
         param1.addEventListener("RWROUE_USER_REMOVED",updateEventHandler);
         param1.addEventListener("RWREUE_NORMAL_MODE",updateEventHandler);
         param1.addEventListener("RWREUE_GAME_MODE",updateEventHandler);
         param1.addEventListener("RWONE_TYPE",updateEventHandler);
         param1.addEventListener("RWROUE_OBJECT_ROLL_OVER",updateEventHandler);
         param1.addEventListener("RWROUE_OBJECT_ROLL_OUT",updateEventHandler);
         param1.addEventListener("RWPIUE_PET_STATUS_UPDATE",updateEventHandler);
         param1.addEventListener("RWPLUE_PET_LEVEL_UPDATE",updateEventHandler);
         param1.addEventListener("RWPBRE_PET_BREEDING_RESULT",updateEventHandler);
         param1.addEventListener("RWPPBE_PET_BREEDING_",updateEventHandler);
         param1.addEventListener("RWIUM_INVENTORY_UPDATED",updateEventHandler);
         param1.addEventListener("RWPPBE_CONFIRM_PET_BREEDING_",updateEventHandler);
         param1.addEventListener("RWPPBE_CONFIRM_PET_BREEDING_RESULT",updateEventHandler);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener("RWRBFOCME_OPEN",updateEventHandler);
         param1.removeEventListener("RWRBSLUE_SKILL_LIST",updateEventHandler);
         param1.removeEventListener("RWRBIUE_RENTABLE_BOT",updateEventHandler);
         param1.removeEventListener("RWAIE_AVATAR_INFO",updateEventHandler);
         param1.removeEventListener("RWUIUE_OWN_USER",updateEventHandler);
         param1.removeEventListener("RWUIUE_PEER",updateEventHandler);
         param1.removeEventListener("RWROUE_FURNI_ADDED",updateEventHandler);
         param1.removeEventListener("RWROUE_OBJECT_SELECTED",updateEventHandler);
         param1.removeEventListener("RWROUE_OBJECT_DESELECTED",updateEventHandler);
         param1.removeEventListener("RWFIUE_FURNI",updateEventHandler);
         param1.removeEventListener("RWUIUE_BOT",updateEventHandler);
         param1.removeEventListener("RWPIUE_PET_INFO",updateEventHandler);
         param1.removeEventListener("rwudue_user_data_updated",updateEventHandler);
         param1.removeEventListener("RWROUE_USER_REMOVED",updateEventHandler);
         param1.removeEventListener("RWREUE_NORMAL_MODE",updateEventHandler);
         param1.removeEventListener("RWREUE_GAME_MODE",updateEventHandler);
         param1.removeEventListener("RWONE_TYPE",updateEventHandler);
         param1.removeEventListener("RWROUE_OBJECT_ROLL_OUT",updateEventHandler);
         param1.removeEventListener("RWROUE_OBJECT_ROLL_OUT",updateEventHandler);
         param1.removeEventListener("RWPIUE_PET_STATUS_UPDATE",updateEventHandler);
         param1.removeEventListener("RWPLUE_PET_LEVEL_UPDATE",updateEventHandler);
         param1.removeEventListener("RWPBRE_PET_BREEDING_RESULT",updateEventHandler);
         param1.removeEventListener("RWPPBE_PET_BREEDING_",updateEventHandler);
         param1.removeEventListener("RWIUM_INVENTORY_UPDATED",updateEventHandler);
         param1.removeEventListener("RWPPBE_CONFIRM_PET_BREEDING_",updateEventHandler);
         param1.removeEventListener("RWPPBE_CONFIRM_PET_BREEDING_RESULT",updateEventHandler);
      }
      
      private function updateEventHandler(param1:RoomWidgetUpdateEvent) : void
      {
         var _loc12_:RoomWidgetAvatarInfoEvent = null;
         var _loc8_:RoomWidgetPetStatusUpdateEvent = null;
         var _loc3_:class_3259 = null;
         var _loc22_:RoomWidgetPetLevelUpdateEvent = null;
         var _loc27_:class_3259 = null;
         var _loc2_:RoomWidgetPetBreedingResultEvent = null;
         var _loc4_:BreedPetsResultData = null;
         var _loc14_:BreedPetsResultData = null;
         var _loc20_:RoomWidgetPetBreedingEvent = null;
         var _loc7_:int = 0;
         var _loc25_:int = 0;
         var _loc16_:RoomWidgetConfirmPetBreedingEvent = null;
         var _loc15_:RoomWidgetConfirmPetBreedingResultEvent = null;
         var _loc9_:RoomWidgetUserInfoUpdateEvent = null;
         var _loc11_:com.sulake.habbo.ui.widget.avatarinfo.class_3380 = null;
         var _loc13_:RoomWidgetRentableBotInfoUpdateEvent = null;
         var _loc5_:IRoomSession = null;
         var _loc26_:class_3259 = null;
         var _loc23_:RoomWidgetRentableBotSkillListUpdateEvent = null;
         var _loc18_:RoomWidgetRentableBotForceOpenContextMenuEvent = null;
         var _loc21_:int = 0;
         var _loc17_:class_3259 = null;
         var _loc6_:RoomWidgetUserInfoUpdateEvent = null;
         var _loc24_:RoomWidgetPetInfoUpdateEvent = null;
         var _loc19_:RoomWidgetRoomObjectUpdateEvent = null;
         loop1:
         switch(param1.type)
         {
            case "RWAIE_AVATAR_INFO":
               _loc12_ = param1 as RoomWidgetAvatarInfoEvent;
               var_2368 = !var_1420 && handler.container.roomSession != null && _loc12_.roomIndex == handler.container.roomSession.ownUserRoomId;
               if(_loc12_.allowNameChange)
               {
                  useMinimizedOwnAvatarMenu = true;
                  selectOwnAvatar();
               }
               else
               {
                  updateUserView(_loc12_.userId,_loc12_.userName,_loc12_.userType,_loc12_.roomIndex,_loc12_.allowNameChange,null);
               }
               var_1420 = true;
               break;
            case "RWONE_TYPE":
               if(RoomWidgetRoomObjectNameEvent(param1).category == 100)
               {
                  updateUserView(RoomWidgetRoomObjectNameEvent(param1).userId,RoomWidgetRoomObjectNameEvent(param1).userName,RoomWidgetRoomObjectNameEvent(param1).userType,RoomWidgetRoomObjectNameEvent(param1).roomIndex,false,null);
                  break;
               }
               break;
            case "RWROUE_FURNI_ADDED":
               if(RoomWidgetRoomObjectUpdateEvent(param1).category == 10)
               {
                  if(var_1632 != null)
                  {
                     var_1632.roomObjectAdded(RoomWidgetRoomObjectUpdateEvent(param1).id);
                     break;
                  }
                  break;
               }
               break;
            case "RWROUE_OBJECT_SELECTED":
               if(RoomWidgetRoomObjectUpdateEvent(param1).category == 100)
               {
                  _handlePetInfo = true;
               }
               removeBreedPetViews();
               break;
            case "RWROUE_OBJECT_DESELECTED":
               if(var_1430 && !(var_1430 is com.sulake.habbo.ui.widget.avatarinfo.NewUserHelpView))
               {
                  removeView(var_1430,false);
               }
               removeUseProductViews();
               removeBreedPetViews();
               break;
            case "RWFIUE_FURNI":
               if(var_1430)
               {
                  removeView(var_1430,false);
               }
               removeUseProductViews();
               removeBreedPetViews();
               break;
            case "RWROUE_OBJECT_ROLL_OVER":
               if(var_2368)
               {
                  return;
               }
               if(!(var_1430 is com.sulake.habbo.ui.widget.avatarinfo.AvatarMenuView || var_1430 is com.sulake.habbo.ui.widget.avatarinfo.OwnAvatarMenuView || var_1430 is com.sulake.habbo.ui.widget.avatarinfo.OwnPetMenuView || var_1430 is com.sulake.habbo.ui.widget.avatarinfo.NewUserHelpView || var_1430 is com.sulake.habbo.ui.widget.avatarinfo.RentableBotMenuView))
               {
                  var_3403 = RoomWidgetRoomObjectUpdateEvent(param1).id;
                  messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage("RWROM_GET_OBJECT_NAME",RoomWidgetRoomObjectUpdateEvent(param1).id,RoomWidgetRoomObjectUpdateEvent(param1).category));
                  break;
               }
               break;
            case "RWROUE_OBJECT_ROLL_OUT":
               if(var_2368)
               {
                  return;
               }
               if(!(var_1430 is com.sulake.habbo.ui.widget.avatarinfo.AvatarMenuView || var_1430 is com.sulake.habbo.ui.widget.avatarinfo.OwnAvatarMenuView || var_1430 is com.sulake.habbo.ui.widget.avatarinfo.OwnPetMenuView || var_1430 is com.sulake.habbo.ui.widget.avatarinfo.NewUserHelpView || var_1430 is com.sulake.habbo.ui.widget.avatarinfo.RentableBotMenuView))
               {
                  if(RoomWidgetRoomObjectUpdateEvent(param1).id == var_3403)
                  {
                     if(var_1430)
                     {
                        removeView(var_1430,false);
                        var_3403 = -1;
                        break;
                     }
                     break;
                  }
                  break;
               }
               break;
            case "RWPIUE_PET_STATUS_UPDATE":
               _loc8_ = param1 as RoomWidgetPetStatusUpdateEvent;
               if(var_1430 && var_1430 is com.sulake.habbo.ui.widget.avatarinfo.OwnPetMenuView)
               {
                  if(_loc8_ != null && var_1782 != null)
                  {
                     _loc3_ = handler.roomSession.userDataManager.getUserDataByIndex(_loc8_.petId);
                     if(_loc3_ != null && _loc3_.webID == var_1782.id)
                     {
                        removeView(var_1430,true);
                     }
                  }
               }
               if(_loc8_ != null)
               {
                  removeBreedPetViewsWithId(_loc8_.petId);
                  break;
               }
               break;
            case "RWPLUE_PET_LEVEL_UPDATE":
               _loc22_ = param1 as RoomWidgetPetLevelUpdateEvent;
               if(var_1430 && var_1430 is com.sulake.habbo.ui.widget.avatarinfo.OwnPetMenuView)
               {
                  if(_loc22_ != null && var_1782 != null)
                  {
                     if((_loc27_ = handler.roomSession.userDataManager.getUserDataByIndex(_loc22_.petId)) != null && _loc27_.webID == var_1782.id)
                     {
                        removeView(var_1430,true);
                     }
                  }
               }
               if(_loc22_ != null)
               {
                  removeBreedPetViewsWithId(_loc22_.petId);
                  break;
               }
               break;
            case "RWPBRE_PET_BREEDING_RESULT":
               _loc2_ = param1 as RoomWidgetPetBreedingResultEvent;
               (_loc4_ = new BreedPetsResultData()).stuffId = _loc2_.resultData.stuffId;
               _loc4_.classId = _loc2_.resultData.classId;
               _loc4_.productCode = _loc2_.resultData.productCode;
               _loc4_.userId = _loc2_.resultData.userId;
               _loc4_.userName = _loc2_.resultData.userName;
               _loc4_.rarityLevel = _loc2_.resultData.rarityLevel;
               _loc4_.hasMutation = _loc2_.resultData.hasMutation;
               (_loc14_ = new BreedPetsResultData()).stuffId = _loc2_.resultData2.stuffId;
               _loc14_.classId = _loc2_.resultData2.classId;
               _loc14_.productCode = _loc2_.resultData2.productCode;
               _loc14_.userId = _loc2_.resultData2.userId;
               _loc14_.userName = _loc2_.resultData2.userName;
               _loc14_.rarityLevel = _loc2_.resultData2.rarityLevel;
               _loc14_.hasMutation = _loc2_.resultData2.hasMutation;
               showBreedPetsResultView(_loc4_,_loc14_);
               break;
            case "RWPPBE_PET_BREEDING_":
               _loc20_ = param1 as RoomWidgetPetBreedingEvent;
               _loc7_ = findPetRoomObjectIdByWebId(_loc20_.ownPetId);
               _loc25_ = findPetRoomObjectIdByWebId(_loc20_.otherPetId);
               switch(_loc20_.state)
               {
                  case 0:
                     showBreedMonsterPlantsConfirmationView(_loc7_,_loc25_,false);
                     break loop1;
                  case 1:
                     cancelBreedingPets(_loc7_,_loc25_);
                     break loop1;
                  case 2:
                     acceptBreedingPets(_loc7_,_loc25_);
                     break loop1;
                  case 3:
                     showBreedMonsterPlantsConfirmationView(_loc7_,_loc25_,true);
               }
               break;
            case "RWIUM_INVENTORY_UPDATED":
               if(var_1632 != null)
               {
                  var_1632.updatePlacingButtons();
                  break;
               }
               break;
            case "RWPPBE_CONFIRM_PET_BREEDING_":
               _loc16_ = param1 as RoomWidgetConfirmPetBreedingEvent;
               showConfirmPetBreedingView(_loc16_.pet1,_loc16_.pet2,_loc16_.nestId,_loc16_.rarityCategories,_loc16_.resultPetTypeId);
               break;
            case "RWPPBE_CONFIRM_PET_BREEDING_RESULT":
               switch((_loc15_ = param1 as RoomWidgetConfirmPetBreedingResultEvent).result)
               {
                  case 0:
                     removeConfirmPetBreedingView();
                     break loop1;
                  case 1:
                     windowManager.simpleAlert("${breedpets.confirmation.alert.title}","${breedpets.confirmation.alert.nonest.head}","${breedpets.confirmation.alert.nonest.desc}");
                     removeConfirmPetBreedingView();
                     break loop1;
                  case 2:
                     windowManager.simpleAlert("${breedpets.confirmation.alert.title}","${breedpets.confirmation.alert.petsmissing.head}","${breedpets.confirmation.alert.petsmissing.desc}");
                     removeConfirmPetBreedingView();
                     break;
                  default:
                     break;
                  case 3:
                     windowManager.simpleAlert("${breedpets.confirmation.alert.title}","${breedpets.confirmation.alert.name.invalid.head}","${breedpets.confirmation.alert.name.invalid.desc}");
                     if(var_1864)
                     {
                        var_1864.enable();
                        break loop1;
                     }
               }
               break;
            case "RWUIUE_OWN_USER":
            case "RWUIUE_PEER":
               _loc9_ = param1 as RoomWidgetUserInfoUpdateEvent;
               var_3372.populate(_loc9_);
               _loc11_ = _loc9_.isSpectatorMode ? null : var_3372;
               updateUserView(_loc9_.webID,_loc9_.name,_loc9_.userType,_loc9_.userRoomId,var_3372.allowNameChange,_loc11_);
               break;
            case "RWRBIUE_RENTABLE_BOT":
               _loc13_ = param1 as RoomWidgetRentableBotInfoUpdateEvent;
               if(!var_1588)
               {
                  var_1588 = new com.sulake.habbo.ui.widget.avatarinfo.class_3361();
               }
               var_1588.populate(_loc13_);
               if(!(_loc5_ = handler.container.roomSessionManager.getSession(_loc21_)))
               {
                  return;
               }
               if(!(_loc26_ = _loc5_.userDataManager.getRentableBotUserData(_loc13_.webID)))
               {
                  return;
               }
               var_2387[_loc13_.webID.toString()] = _loc26_.botSkillData;
               if(var_1588 && _loc26_.botSkillData)
               {
                  var_1588.cloneAndSetSkillsWithCommands(_loc26_.botSkillData);
               }
               updateRentableBotView(_loc13_.webID,_loc13_.name,_loc13_.userRoomId,var_1588);
               break;
            case "RWRBSLUE_SKILL_LIST":
               _loc23_ = param1 as RoomWidgetRentableBotSkillListUpdateEvent;
               var_2387[_loc23_.botId.toString()] = _loc23_.botSkillsWithCommands;
               if(var_1588)
               {
                  var_1588.cloneAndSetSkillsWithCommands(_loc23_.botSkillsWithCommands);
                  updateRentableBotView(var_1588.id,var_1588.name,var_1588.roomIndex,var_1588,true);
                  break;
               }
               break;
            case "RWRBFOCME_OPEN":
               _loc18_ = param1 as RoomWidgetRentableBotForceOpenContextMenuEvent;
               if(var_1588)
               {
                  updateRentableBotView(var_1588.id,var_1588.name,var_1588.roomIndex,var_1588,false,true);
                  break;
               }
               _loc21_ = handler.container.roomEngine.activeRoomId;
               _loc17_ = handler.container.roomSessionManager.getSession(_loc21_).userDataManager.getUserDataByType(_loc18_.botId,4);
               messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage("RWROM_GET_OBJECT_INFO",_loc17_.roomObjectId,100));
               handler.container.roomEngine.selectAvatar(_loc21_,_loc17_.roomObjectId);
               break;
            case "RWUIUE_BOT":
               _loc6_ = param1 as RoomWidgetUserInfoUpdateEvent;
               updateUserView(_loc6_.webID,_loc6_.name,_loc6_.userType,_loc6_.userRoomId,false,null);
               break;
            case "RWPIUE_PET_INFO":
               if(_handlePetInfo)
               {
                  _loc24_ = param1 as RoomWidgetPetInfoUpdateEvent;
                  var_1782.populate(_loc24_);
                  updatePetView(_loc24_.id,_loc24_.name,_loc24_.roomIndex,var_1782);
                  break;
               }
               break;
            case "rwudue_user_data_updated":
               if(!var_1420)
               {
                  getOwnCharacterInfo();
                  break;
               }
               break;
            case "RWROUE_USER_REMOVED":
               _loc19_ = param1 as RoomWidgetRoomObjectUpdateEvent;
               if(var_1430 && var_1430.roomIndex == _loc19_.id)
               {
                  removeView(var_1430,false);
               }
               for each(var _loc10_ in var_1764)
               {
                  if(_loc10_.objectId == _loc19_.id)
                  {
                     removeView(_loc10_,false);
                     break;
                  }
               }
               removeBreedPetViewsWithId(_loc19_.id);
               break;
            case "RWREUE_NORMAL_MODE":
               var_2775 = false;
               break;
            case "RWREUE_GAME_MODE":
               var_2775 = true;
         }
         checkUpdateNeed();
      }
      
      private function findPetRoomObjectIdByWebId(param1:int) : int
      {
         var _loc4_:int = 0;
         var _loc2_:IRoomObject = null;
         var _loc6_:class_3259 = null;
         var _loc5_:int = handler.container.roomSession.roomId;
         var _loc3_:int = handler.container.roomEngine.getRoomObjectCount(_loc5_,100);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = handler.container.roomEngine.getRoomObjectWithIndex(_loc5_,_loc4_,100);
            if(!((_loc6_ = handler.container.roomSession.userDataManager.getUserDataByIndex(_loc2_.getId())) == null || _loc6_.type != 2))
            {
               if(_loc6_.webID == param1)
               {
                  return _loc2_.getId();
               }
            }
            _loc4_++;
         }
         return -1;
      }
      
      private function removeBreedPetViewsWithId(param1:int) : void
      {
         var _loc3_:* = [];
         for each(var _loc2_ in var_1820)
         {
            if(_loc2_.objectId == param1 || _loc2_.requestRoomObjectId == param1)
            {
               if(_loc3_.indexOf(_loc2_) == -1)
               {
                  _loc3_.push(_loc2_);
               }
            }
         }
         for each(var _loc4_ in _loc3_)
         {
            removeView(_loc4_,false);
         }
      }
      
      public function selectOwnAvatar() : void
      {
         var _loc2_:RoomWidgetRoomObjectMessage = null;
         if(!handler || true || true)
         {
            return;
         }
         var _loc3_:int = handler.container.sessionDataManager.userId;
         var _loc1_:class_3259 = handler.roomSession.userDataManager.getUserData(_loc3_);
         if(!_loc1_)
         {
            return;
         }
         _loc2_ = new RoomWidgetRoomObjectMessage("RWROM_SELECT_OBJECT",_loc1_.roomObjectId,100);
         handler.container.processWidgetMessage(_loc2_);
      }
      
      public function get ownAvatarPosture() : String
      {
         var _loc2_:IRoomObjectModel = null;
         var _loc1_:IRoomObject = findCurrentUserRoomObject();
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.getModel();
            if(_loc2_ != null)
            {
               return _loc2_.getString("figure_posture");
            }
         }
         return "std";
      }
      
      public function get canStandUp() : Boolean
      {
         var _loc2_:IRoomObjectModel = null;
         var _loc1_:IRoomObject = findCurrentUserRoomObject();
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.getModel();
            if(_loc2_ != null)
            {
               return _loc2_.getNumber("figure_can_stand_up") > 0;
            }
         }
         return false;
      }
      
      public function get isSwimming() : Boolean
      {
         var _loc3_:IRoomObjectModel = null;
         var _loc2_:Number = NaN;
         var _loc1_:IRoomObject = findCurrentUserRoomObject();
         if(_loc1_ != null)
         {
            _loc3_ = _loc1_.getModel();
            if(_loc3_ != null)
            {
               _loc2_ = Number(_loc3_.getNumber("figure_effect"));
               return _loc2_ == 29 || _loc2_ == 30 || _loc2_ == 185;
            }
         }
         return false;
      }
      
      private function updateRentableBotView(param1:int, param2:String, param3:int, param4:com.sulake.habbo.ui.widget.avatarinfo.class_3361, param5:Boolean = false, param6:Boolean = false) : void
      {
         if(!param4)
         {
            return;
         }
         var _loc8_:Boolean = Boolean(_configuration.getBoolean("menu.bot.enabled"));
         var _loc7_:Boolean = param5 && !var_1430;
         if(param6)
         {
            _loc7_ = false;
         }
         if(_loc8_ && var_1430 && !(var_1430 is com.sulake.habbo.ui.widget.avatarinfo.AvatarMenuView || var_1430 is com.sulake.habbo.ui.widget.avatarinfo.OwnAvatarMenuView || var_1430 is com.sulake.habbo.ui.widget.avatarinfo.PetMenuView || var_1430 is com.sulake.habbo.ui.widget.avatarinfo.OwnPetMenuView || var_1430 is com.sulake.habbo.ui.widget.avatarinfo.RentableBotMenuView))
         {
            removeView(var_1430,false);
         }
         removeUseProductViews();
         if(param6 || var_1430 != null && var_1430.userId == param1 && !param5 || var_1430 == null || var_1430.userId != param1 || var_1430.userName != param2 || var_1430.roomIndex != param3 || true)
         {
            if(var_1430)
            {
               removeView(var_1430,false);
            }
            if(!var_2775)
            {
               if(!var_2146)
               {
                  var_2146 = new com.sulake.habbo.ui.widget.avatarinfo.RentableBotMenuView(this);
               }
               if(!_loc7_)
               {
                  var_1430 = var_2146;
                  com.sulake.habbo.ui.widget.avatarinfo.RentableBotMenuView.setup(var_1430 as com.sulake.habbo.ui.widget.avatarinfo.RentableBotMenuView,param1,param2,param3,4,param4);
               }
            }
         }
         else if(var_1430 is com.sulake.habbo.ui.widget.avatarinfo.RentableBotMenuView)
         {
            if(var_1430.userName == param2)
            {
               removeView(var_1430,false);
            }
         }
      }
      
      private function updatePetView(param1:int, param2:String, param3:int, param4:com.sulake.habbo.ui.widget.avatarinfo.PetInfoData) : void
      {
         if(!param4)
         {
            return;
         }
         if(var_1430 && !(var_1430 is com.sulake.habbo.ui.widget.avatarinfo.AvatarMenuView || var_1430 is com.sulake.habbo.ui.widget.avatarinfo.OwnAvatarMenuView || var_1430 is com.sulake.habbo.ui.widget.avatarinfo.PetMenuView || var_1430 is com.sulake.habbo.ui.widget.avatarinfo.OwnPetMenuView || var_1430 is com.sulake.habbo.ui.widget.avatarinfo.RentableBotMenuView))
         {
            removeView(var_1430,false);
         }
         removeUseProductViews();
         if(var_1430 == null || var_1430.userId != param1 || var_1430.userName != param2 || var_1430.roomIndex != param3 || true)
         {
            if(var_1430)
            {
               removeView(var_1430,false);
            }
            if(!var_2775)
            {
               if(param4.isOwnPet)
               {
                  if(!var_3008)
                  {
                     var_3008 = new com.sulake.habbo.ui.widget.avatarinfo.OwnPetMenuView(this,_catalog);
                  }
                  var_1430 = var_3008;
                  com.sulake.habbo.ui.widget.avatarinfo.OwnPetMenuView.setup(var_1430 as com.sulake.habbo.ui.widget.avatarinfo.OwnPetMenuView,param1,param2,param3,2,param4);
               }
               else
               {
                  if(!var_2196)
                  {
                     var_2196 = new com.sulake.habbo.ui.widget.avatarinfo.PetMenuView(this);
                  }
                  var_1430 = var_2196;
                  com.sulake.habbo.ui.widget.avatarinfo.PetMenuView.setup(var_1430 as com.sulake.habbo.ui.widget.avatarinfo.PetMenuView,param1,param2,param3,2,param4);
               }
            }
         }
         else if(var_1430 is com.sulake.habbo.ui.widget.avatarinfo.AvatarMenuView || var_1430 is com.sulake.habbo.ui.widget.avatarinfo.OwnAvatarMenuView)
         {
            if(var_1430.userName == param2)
            {
               removeView(var_1430,false);
            }
         }
      }
      
      private function updateUserView(param1:int, param2:String, param3:int, param4:int, param5:Boolean, param6:com.sulake.habbo.ui.widget.avatarinfo.class_3380) : void
      {
         var _loc7_:* = param6 != null;
         if(param6 != null && var_1430 && !(var_1430 is com.sulake.habbo.ui.widget.avatarinfo.AvatarMenuView || var_1430 is com.sulake.habbo.ui.widget.avatarinfo.OwnAvatarMenuView || var_1430 is com.sulake.habbo.ui.widget.avatarinfo.PetMenuView || var_1430 is com.sulake.habbo.ui.widget.avatarinfo.OwnPetMenuView || var_1430 is com.sulake.habbo.ui.widget.avatarinfo.RentableBotMenuView))
         {
            removeView(var_1430,false);
         }
         removeUseProductViews();
         if(var_1430 == null || var_1430.userId != param1 || var_1430.userName != param2 || var_1430.roomIndex != param4 || true || param5)
         {
            if(var_1430)
            {
               removeView(var_1430,false);
            }
            if(!var_2775)
            {
               if(_loc7_)
               {
                  if(param6.isOwnUser)
                  {
                     if(isUserDecorating)
                     {
                        return;
                     }
                     if(RoomEnterEffect.isRunning())
                     {
                        if(!var_3122)
                        {
                           var_3122 = new com.sulake.habbo.ui.widget.avatarinfo.NewUserHelpView(this);
                        }
                        var_1430 = var_3122;
                        com.sulake.habbo.ui.widget.avatarinfo.NewUserHelpView.setup(var_1430 as com.sulake.habbo.ui.widget.avatarinfo.NewUserHelpView,param1,param2,param4,1);
                     }
                     else
                     {
                        if(!_cachedOwnAvatarMenu)
                        {
                           _cachedOwnAvatarMenu = new com.sulake.habbo.ui.widget.avatarinfo.OwnAvatarMenuView(this);
                        }
                        var_1430 = _cachedOwnAvatarMenu;
                        com.sulake.habbo.ui.widget.avatarinfo.OwnAvatarMenuView.setup(var_1430 as com.sulake.habbo.ui.widget.avatarinfo.OwnAvatarMenuView,param1,param2,param4,1,param6);
                     }
                  }
                  else
                  {
                     if(!var_2207)
                     {
                        var_2207 = new com.sulake.habbo.ui.widget.avatarinfo.AvatarMenuView(this);
                     }
                     var_1430 = var_2207;
                     com.sulake.habbo.ui.widget.avatarinfo.AvatarMenuView.setup(var_1430 as com.sulake.habbo.ui.widget.avatarinfo.AvatarMenuView,param1,param2,param4,param3,param6);
                     for each(var _loc8_ in var_1764)
                     {
                        if(_loc8_.userId == param1)
                        {
                           removeView(_loc8_,false);
                           break;
                        }
                     }
                  }
               }
               else if(!handler.roomEngine.isDecorateMode)
               {
                  if(!var_2153)
                  {
                     var_2153 = new com.sulake.habbo.ui.widget.avatarinfo.AvatarContextInfoButtonView(this);
                  }
                  var_1430 = var_2153;
                  if(handler.container.sessionDataManager.userId == param1)
                  {
                     com.sulake.habbo.ui.widget.avatarinfo.AvatarContextInfoButtonView.setup(var_1430,param1,param2,param4,param3,param5);
                     if(var_2368)
                     {
                        _catalog.windowManager.registerHintWindow("avatar",var_1430.window);
                        _catalog.windowManager.showHint("avatar");
                        if(!handler.container.sessionDataManager.isNoob)
                        {
                           setAvatarHightlightTimer();
                        }
                     }
                  }
                  else
                  {
                     com.sulake.habbo.ui.widget.avatarinfo.AvatarContextInfoButtonView.setup(var_1430,param1,param2,param4,param3,param5,true);
                  }
               }
            }
         }
         else if(var_1430 is com.sulake.habbo.ui.widget.avatarinfo.AvatarMenuView || var_1430 is com.sulake.habbo.ui.widget.avatarinfo.OwnAvatarMenuView)
         {
            if(var_1430.userName == param2)
            {
               removeView(var_1430,false);
            }
         }
      }
      
      public function removeView(param1:ContextInfoView, param2:Boolean) : void
      {
         var_2368 = false;
         removeAvatarHighlightTimer();
         if(param1)
         {
            if(var_4325)
            {
               param1.hide(param2);
            }
            else
            {
               param1.dispose();
               var_2153 = null;
               var_2207 = null;
               _cachedOwnAvatarMenu = null;
               var_3008 = null;
               var_2146 = null;
               var_2196 = null;
               var_3122 = null;
            }
            if(param1 == var_1430)
            {
               var_1430 = null;
            }
            if(param1 is UserNameView)
            {
               var_1764.remove((param1 as UserNameView).userName);
               param1.dispose();
               checkUpdateNeed();
            }
            if(param1 is UseProductView)
            {
               var_1907.remove((param1 as UseProductView).userId);
               param1.dispose();
               checkUpdateNeed();
            }
            if(param1 is BreedPetView)
            {
               var_1820.remove((param1 as BreedPetView).userId);
               param1.dispose();
               checkUpdateNeed();
            }
         }
      }
      
      public function removeUseProductViews() : void
      {
         for each(var _loc1_ in var_1907)
         {
            _loc1_.dispose();
         }
         var_1907.reset();
         checkUpdateNeed();
      }
      
      public function removeBreedPetViews() : void
      {
         for each(var _loc1_ in var_1820)
         {
            _loc1_.dispose();
         }
         var_1820.reset();
         checkUpdateNeed();
      }
      
      public function showUserName(param1:class_3259, param2:int) : void
      {
         var _loc3_:UserNameView = null;
         if(true)
         {
            _loc3_ = new UserNameView(this);
            UserNameView.setup(_loc3_,param1.webID,param1.name,-1,1,param2);
            var_1764[param1.name] = _loc3_;
            checkUpdateNeed();
         }
      }
      
      public function showGamePlayerName(param1:int, param2:String, param3:uint, param4:int) : void
      {
         var _loc5_:UserNameView = null;
         if(true)
         {
            _loc5_ = new UserNameView(this,true);
            UserNameView.setup(_loc5_,param1,param2,param1,1,param1,param3,param4);
            var_1764[param2] = _loc5_;
            checkUpdateNeed();
         }
      }
      
      private function showUseProductMenu(param1:class_3259, param2:UseProductItem) : void
      {
         var _loc3_:UseProductView = null;
         if(true)
         {
            _loc3_ = new UseProductView(this);
            UseProductView.setup(_loc3_,param1.webID,param1.name,-1,2,param2);
            var_1907[param1.webID.toString()] = _loc3_;
            checkUpdateNeed();
         }
      }
      
      private function showBreedPetMenu(param1:class_3259, param2:UseProductItem) : void
      {
         var _loc3_:BreedPetView = null;
         if(true)
         {
            _loc3_ = new BreedPetView(this);
            BreedPetView.setup(_loc3_,param1.webID,param1.name,-1,2,param2,param1.canBreed);
            var_1820[param1.webID.toString()] = _loc3_;
            checkUpdateNeed();
         }
      }
      
      private function setAvatarHightlightTimer() : void
      {
         var_2606 = new Timer(5000);
         var_2606.addEventListener("timer",onAvatarHighlightTimerEvent);
         var_2606.start();
      }
      
      private function removeAvatarHighlightTimer() : void
      {
         var_2368 = false;
         _catalog.windowManager.unregisterHintWindow("avatar");
         if(!var_2606)
         {
            return;
         }
         var_2606.stop();
         var_2606 = null;
      }
      
      private function onAvatarHighlightTimerEvent(param1:TimerEvent) : void
      {
         removeAvatarHighlightTimer();
      }
      
      public function checkUpdateNeed() : void
      {
         if(!var_1460)
         {
            return;
         }
         if(var_1430 || var_1638 && false)
         {
            var_1460.registerUpdateReceiver(this,10);
         }
         else
         {
            var_1460.removeUpdateReceiver(this);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:RoomWidgetUserLocationUpdateEvent = null;
         if(var_1430)
         {
            _loc3_ = messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage("RWGOI_MESSAGE_GET_OBJECT_LOCATION",var_1430.userId,var_1430.userType)) as RoomWidgetUserLocationUpdateEvent;
            if(!_loc3_)
            {
               return;
            }
            var_1430.update(_loc3_.rectangle,_loc3_.screenLocation,param1);
         }
         if(var_1638 && var_1638.isVisible())
         {
            _loc3_ = messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage("RWGOI_MESSAGE_GET_OBJECT_LOCATION",var_1638.userId,var_1638.userType)) as RoomWidgetUserLocationUpdateEvent;
            if(!_loc3_)
            {
               return;
            }
            var_1638.update(_loc3_.rectangle,_loc3_.screenLocation,param1);
         }
         for each(var _loc2_ in var_1764)
         {
            if(_loc2_.isGameRoomMode)
            {
               _loc3_ = messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage("RWGOI_MESSAGE_GET_GAME_OBJECT_LOCATION",_loc2_.userId,_loc2_.userType)) as RoomWidgetUserLocationUpdateEvent;
            }
            else
            {
               _loc3_ = messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage("RWGOI_MESSAGE_GET_OBJECT_LOCATION",_loc2_.userId,_loc2_.userType)) as RoomWidgetUserLocationUpdateEvent;
            }
            if(_loc3_)
            {
               _loc2_.update(_loc3_.rectangle,_loc3_.screenLocation,param1);
            }
         }
         for each(var _loc4_ in var_1907)
         {
            _loc3_ = messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage("RWGOI_MESSAGE_GET_OBJECT_LOCATION",_loc4_.userId,_loc4_.userType)) as RoomWidgetUserLocationUpdateEvent;
            if(_loc3_)
            {
               _loc4_.update(_loc3_.rectangle,_loc3_.screenLocation,param1);
            }
         }
         for each(var _loc5_ in var_1820)
         {
            _loc3_ = messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage("RWGOI_MESSAGE_GET_OBJECT_LOCATION",_loc5_.userId,_loc5_.userType)) as RoomWidgetUserLocationUpdateEvent;
            if(_loc3_)
            {
               _loc5_.update(_loc3_.rectangle,_loc3_.screenLocation,param1);
            }
         }
      }
      
      public function openAvatarEditor() : void
      {
         handler.container.avatarEditor.openEditor(0,null,null,true);
         handler.container.avatarEditor.loadOwnAvatarInEditor(0);
      }
      
      public function get hasClub() : Boolean
      {
         return handler.container.sessionDataManager.hasClub;
      }
      
      public function get hasVip() : Boolean
      {
         return handler.container.sessionDataManager.hasVip;
      }
      
      public function get hasEffectOn() : Boolean
      {
         var _loc1_:Array = handler.container.inventory.getActivatedAvatarEffects();
         for each(var _loc2_ in _loc1_)
         {
            if(_loc2_.isInUse)
            {
               return true;
            }
         }
         return false;
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         var_4034 = param1;
      }
      
      public function get isDancing() : Boolean
      {
         return var_4034;
      }
      
      public function get hasFreeSaddle() : Boolean
      {
         if(var_1782 != null)
         {
            return var_1782.hasFreeSaddle;
         }
         return false;
      }
      
      public function get isRiding() : Boolean
      {
         if(var_1782 != null)
         {
            return var_1782.isRiding;
         }
         return false;
      }
      
      public function get isCurrentUserRiding() : Boolean
      {
         var _loc3_:IRoomObjectModel = null;
         var _loc2_:Number = NaN;
         var _loc1_:IRoomObject = findCurrentUserRoomObject();
         if(_loc1_ != null)
         {
            _loc3_ = _loc1_.getModel();
            if(_loc3_ != null)
            {
               _loc2_ = Number(_loc3_.getNumber("figure_effect"));
               if(_loc2_ == 77)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function openTrainingView() : void
      {
         handler.container.events.dispatchEvent(new RoomWidgetUpdateEvent("RWPCUE_OPEN_PET_TRAINING"));
      }
      
      public function closeTrainingView() : void
      {
         handler.container.events.dispatchEvent(new RoomWidgetUpdateEvent("RWPCUE_CLOSE_PET_TRAINING"));
      }
      
      public function get useMinimizedOwnAvatarMenu() : Boolean
      {
         return handler.container.config.getBoolean("use_minimized_own_avatar_menu");
      }
      
      public function set useMinimizedOwnAvatarMenu(param1:Boolean) : void
      {
         handler.container.config.setProperty("use_minimized_own_avatar_menu",param1 ? "1" : "0");
      }
      
      public function sendSignRequest(param1:int) : void
      {
         handler.container.roomSession.sendSignMessage(param1);
      }
      
      public function showUseProductConfirmation(param1:int, param2:int, param3:int) : void
      {
         if(!var_1674)
         {
            var_1674 = new com.sulake.habbo.ui.widget.avatarinfo.UseProductConfirmationView(this);
         }
         var_1674.open(param1,param2,param3);
      }
      
      private function removeUseProductConfirmationView() : void
      {
         if(var_1674)
         {
            var_1674.dispose();
            var_1674 = null;
         }
      }
      
      public function showBreedingPetsWaitingConfirmationAlert(param1:int, param2:int) : void
      {
         removeBreedingPetsWaitingConfirmationAlert();
         _breedingConfirmationAlert = windowManager.confirm("${breedpets.confirmation.notification.title}","${breedpets.confirmation.notification.text}",0,onWaitingConfirmationAlert);
         var_3251 = param1;
         var_2773 = param2;
      }
      
      public function onWaitingConfirmationAlert(param1:class_3132, param2:class_3134) : void
      {
         if(param2.type == "WE_OK")
         {
         }
         if(param2.type == "WE_CANCEL")
         {
            if(var_2773 != -1 && var_2773 != -1)
            {
               cancelBreedPets(var_3251,var_2773);
            }
         }
         removeBreedingPetsWaitingConfirmationAlert();
      }
      
      private function removeBreedingPetsWaitingConfirmationAlert() : void
      {
         if(_breedingConfirmationAlert != null)
         {
            _breedingConfirmationAlert.dispose();
            _breedingConfirmationAlert = null;
            var_3251 = -1;
            var_2773 = -1;
         }
      }
      
      public function acceptBreedingPets(param1:int, param2:int) : void
      {
         if(var_1677 != null)
         {
            if(var_1677.requestRoomObjectId == param1 && var_1677.targetRoomObjectId == param2)
            {
               removeBreedMonsterPlantsConfirmationView();
            }
         }
         if(_breedingConfirmationAlert != null)
         {
            _breedingConfirmationAlert.dispose();
         }
      }
      
      public function cancelBreedingPets(param1:int, param2:int) : void
      {
         if(var_1677 != null)
         {
            if(var_1677.requestRoomObjectId == param1 && var_1677.targetRoomObjectId == param2)
            {
               removeBreedMonsterPlantsConfirmationView();
            }
         }
         removeBreedingPetsWaitingConfirmationAlert();
         windowManager.alert("${breedpets.cancel.notification.title}","${breedpets.cancel.notification.text}",0,onBreedingAlert);
      }
      
      public function onBreedingAlert(param1:class_3132, param2:class_3134) : void
      {
         if(param2.type == "WE_OK" || param2.type == "WE_CANCEL")
         {
            param1.dispose();
         }
      }
      
      public function showBreedMonsterPlantsConfirmationView(param1:int, param2:int, param3:Boolean) : void
      {
         if(!var_1677)
         {
            var_1677 = new com.sulake.habbo.ui.widget.avatarinfo.BreedMonsterPlantsConfirmationView(this);
         }
         var_1677.open(param1,param2,param3);
      }
      
      public function showConfirmPetBreedingView(param1:ConfirmPetBreedingPetData, param2:ConfirmPetBreedingPetData, param3:int, param4:Array, param5:int) : void
      {
         if(!var_1864)
         {
            var_1864 = new com.sulake.habbo.ui.widget.avatarinfo.ConfirmPetBreedingView(this);
         }
         var _loc6_:int = findPetRoomObjectIdByWebId(param1.webId);
         var _loc7_:int = findPetRoomObjectIdByWebId(param2.webId);
         var_1864.open(_loc6_,_loc7_,param3,param4,param5,param1.level,param2.level);
      }
      
      private function removeBreedMonsterPlantsConfirmationView() : void
      {
         if(var_1677)
         {
            var_1677.dispose();
            var_1677 = null;
         }
      }
      
      private function removeConfirmPetBreedingView() : void
      {
         if(var_1864)
         {
            var_1864.dispose();
            var_1864 = null;
         }
      }
      
      public function showBreedPetsResultView(param1:BreedPetsResultData, param2:BreedPetsResultData) : void
      {
         if(!var_1632)
         {
            var_1632 = new com.sulake.habbo.ui.widget.avatarinfo.BreedPetsResultView(this);
         }
         var_1632.open(param1,param2);
      }
      
      public function removeBreedPetsResultView(param1:com.sulake.habbo.ui.widget.avatarinfo.BreedPetsResultView) : void
      {
         if(param1 != null)
         {
            if(param1 == var_1632)
            {
               var_1632.dispose();
               var_1632 = null;
            }
            else
            {
               param1.dispose();
            }
         }
      }
      
      private function findCurrentUserRoomObject() : IRoomObject
      {
         var _loc4_:int = 0;
         var _loc2_:IRoomObject = null;
         var _loc1_:class_3259 = null;
         var _loc5_:int = handler.container.sessionDataManager.userId;
         var _loc6_:int = handler.roomEngine.activeRoomId;
         var _loc3_:int = handler.roomEngine.getRoomObjectCount(_loc6_,100);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = handler.roomEngine.getRoomObjectWithIndex(_loc6_,_loc4_,100);
            if(_loc2_ != null)
            {
               _loc1_ = handler.roomSession.userDataManager.getUserDataByIndex(_loc2_.getId());
               if(_loc1_ != null)
               {
                  if(_loc1_.webID == _loc5_)
                  {
                     return _loc2_;
                  }
               }
            }
            _loc4_++;
         }
         return null;
      }
      
      internal function get isUserDecorating() : Boolean
      {
         return handler.roomSession.isUserDecorating;
      }
      
      internal function set isUserDecorating(param1:Boolean) : void
      {
         var _loc5_:int = 0;
         var _loc4_:String = null;
         var _loc2_:int = 0;
         var _loc3_:RoomWidgetUserLocationUpdateEvent = null;
         handler.roomSession.isUserDecorating = param1;
         if(param1)
         {
            _loc5_ = handler.container.sessionDataManager.userId;
            if(!var_1638)
            {
               _loc4_ = handler.container.sessionDataManager.userName;
               _loc2_ = handler.container.roomSession.ownUserRoomId;
               var_1638 = new com.sulake.habbo.ui.widget.avatarinfo.DecorateModeView(this,_loc5_,_loc4_,_loc2_);
            }
            var_1638.show();
            _loc3_ = messageListener.processWidgetMessage(new RoomWidgetGetObjectLocationMessage("RWGOI_MESSAGE_GET_OBJECT_LOCATION",_loc5_,1)) as RoomWidgetUserLocationUpdateEvent;
            if(_loc3_)
            {
               var_1638.update(_loc3_.rectangle,_loc3_.screenLocation,0);
            }
         }
         else if(var_1638)
         {
            var_1638.hide(false);
         }
      }
      
      public function get catalog() : IHabboCatalog
      {
         return _catalog;
      }
      
      public function isMonsterPlant() : Boolean
      {
         if(var_1782 != null)
         {
            return false;
         }
         return false;
      }
      
      public function cancelBreedPets(param1:int, param2:int) : void
      {
         var _loc3_:class_3259 = handler.container.roomSession.userDataManager.getUserDataByIndex(param1);
         var _loc4_:class_3259 = handler.container.roomSession.userDataManager.getUserDataByIndex(param2);
         if(_loc3_ && _loc4_)
         {
            handler.container.connection.send(new class_678(1,_loc3_.webID,_loc4_.webID));
         }
      }
      
      public function acceptBreedPets(param1:int, param2:int) : void
      {
         var _loc3_:class_3259 = handler.container.roomSession.userDataManager.getUserDataByIndex(param1);
         var _loc4_:class_3259 = handler.container.roomSession.userDataManager.getUserDataByIndex(param2);
         if(_loc3_ && _loc4_)
         {
            handler.container.connection.send(new class_678(2,_loc3_.webID,_loc4_.webID));
         }
      }
      
      public function breedPets(param1:int, param2:int) : void
      {
         var _loc3_:class_3259 = handler.container.roomSession.userDataManager.getUserDataByIndex(param1);
         var _loc4_:class_3259 = handler.container.roomSession.userDataManager.getUserDataByIndex(param2);
         if(_loc3_ && _loc4_)
         {
            handler.container.connection.send(new class_678(0,_loc3_.webID,_loc4_.webID));
         }
      }
      
      public function openBotSkillConfigurationView(param1:int, param2:int, param3:Point = null) : void
      {
         if(!var_1925.hasKey(param2))
         {
            switch(param2 - 2)
            {
               case 0:
                  var_1925.add(2,new BotChatterMarkovConfiguration(this));
                  break;
               case 3:
                  var_1925.add(5,new BotChangeNameConfiguration(this));
                  break;
               default:
                  return;
            }
         }
         var _loc4_:class_3316;
         (_loc4_ = var_1925.getValue(param2)).open(param1,param3);
      }
      
      public function cancelPetBreeding(param1:int) : void
      {
         handler.container.connection.send(new class_929(param1));
      }
      
      public function confirmPetBreeding(param1:int, param2:String, param3:int, param4:int) : void
      {
         handler.container.connection.send(new class_425(param1,param2,param3,param4));
      }
      
      public function showNestBreedingSuccess(param1:int, param2:int) : void
      {
         if(var_3579 == null)
         {
            var_3579 = new com.sulake.habbo.ui.widget.avatarinfo.NestBreedingSuccessView(this);
         }
         var _loc3_:int = findPetRoomObjectIdByWebId(param1);
         var_3579.open(_loc3_,param2);
      }
      
      public function get friendList() : class_1869
      {
         return handler.friendList;
      }
   }
}
