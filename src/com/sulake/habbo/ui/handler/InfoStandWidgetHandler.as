package com.sulake.habbo.ui.handler
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.avatar.pets.PetFigureData;
   import com.sulake.habbo.friendlist.class_3191;
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.room.object.data.class_1588;
   import com.sulake.habbo.session.IPetInfo;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.class_3259;
   import com.sulake.habbo.session.events.RoomSessionConfirmPetBreedingEvent;
   import com.sulake.habbo.session.events.RoomSessionConfirmPetBreedingResultEvent;
   import com.sulake.habbo.session.events.RoomSessionFavouriteGroupUpdateEvent;
   import com.sulake.habbo.session.events.RoomSessionPetBreedingEvent;
   import com.sulake.habbo.session.events.RoomSessionPetBreedingResultEvent;
   import com.sulake.habbo.session.events.RoomSessionPetCommandsUpdateEvent;
   import com.sulake.habbo.session.events.RoomSessionPetFigureUpdateEvent;
   import com.sulake.habbo.session.events.RoomSessionPetInfoUpdateEvent;
   import com.sulake.habbo.session.events.RoomSessionUserBadgesEvent;
   import com.sulake.habbo.session.events.RoomSessionUserFigureUpdateEvent;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.sound.ISongInfo;
   import com.sulake.habbo.sound.class_3187;
   import com.sulake.habbo.sound.class_3365;
   import com.sulake.habbo.sound.events.NowPlayingEvent;
   import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.events.BreedingRarityCategoryData;
   import com.sulake.habbo.ui.widget.events.ConfirmPetBreedingPetData;
   import com.sulake.habbo.ui.widget.events.PetBreedingResultEventData;
   import com.sulake.habbo.ui.widget.events.RoomWidgetChatInputContentUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetConfirmPetBreedingEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetConfirmPetBreedingResultEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPetBreedingEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPetBreedingResultEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPetCommandsUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPetFigureUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectNameEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetSongUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.infostand.InfoStandFurniData;
   import com.sulake.habbo.ui.widget.infostand.InfoStandWidget;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetChangeMottoMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniActionMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetGetBadgeDetailsMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetGetBadgeImageMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenProfileMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetPetCommandMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetPresentOpenMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomTagSearchMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.habbo.utils.class_3288;
   import com.sulake.habbo.window.utils.class_3216;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.utils.getTimer;
   import package_13.class_625;
   import package_13.class_699;
   import package_34.class_321;
   import package_34.class_421;
   import package_34.class_701;
   import package_41.class_1596;
   import package_5.class_1126;
   import package_5.class_420;
   import package_5.class_788;
   import package_7.class_197;
   import package_7.class_313;
   import package_7.class_692;
   import package_76.class_300;
   import package_76.class_804;
   import package_78.class_1621;
   
   public class InfoStandWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var var_311:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_1983:class_24;
      
      private var var_1711:class_3187;
      
      private var var_1429:InfoStandWidget;
      
      private var var_2515:IMessageEvent;
      
      private var var_2479:IMessageEvent;
      
      public function InfoStandWidgetHandler(param1:class_3187)
      {
         var_1983 = new class_24();
         super();
         var_1711 = param1;
         if(var_1711 != null)
         {
            var_1711.events.addEventListener("NPE_SONG_CHANGED",onNowPlayingChanged);
            var_1711.events.addEventListener("SIR_TRAX_SONG_INFO_RECEIVED",onSongInfoReceivedEvent);
         }
      }
      
      public function set widget(param1:InfoStandWidget) : void
      {
         var_1429 = param1;
      }
      
      public function get container() : IRoomWidgetHandlerContainer
      {
         return _container;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function get type() : String
      {
         return "RWE_INFOSTAND";
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         if(_container != null)
         {
            if(false)
            {
               _container.roomSessionManager.events.removeEventListener("RSUBE_FIGURE",onFigureUpdate);
               _container.roomSessionManager.events.removeEventListener("RSPIUE_PET_INFO",onPetInfo);
               _container.roomSessionManager.events.removeEventListener("RSPIUE_ENABLED_PET_COMMANDS",onPetCommands);
               _container.roomSessionManager.events.removeEventListener("rsfgue_favourite_group_update",onFavouriteGroupUpdated);
               _container.roomSessionManager.events.removeEventListener("RSPFUE_PET_FIGURE_UPDATE",onPetFigureUpdate);
               _container.roomSessionManager.events.removeEventListener("RSPFUE_PET_BREEDING_RESULT",onPetBreedingResult);
               _container.roomSessionManager.events.removeEventListener("RSPFUE_PET_BREEDING",onPetBreedingEvent);
               _container.roomSessionManager.events.removeEventListener("RSPFUE_CONFIRM_PET_BREEDING",onConfirmPetBreedingEvent);
               _container.roomSessionManager.events.removeEventListener("RSPFUE_CONFIRM_PET_BREEDING_RESULT",onConfirmPetBreedingResultEvent);
            }
            if(false)
            {
               if(var_2515 != null)
               {
                  _container.connection.removeMessageEvent(var_2515);
                  var_2515.dispose();
                  var_2515 = null;
               }
               if(var_2479 != null)
               {
                  _container.connection.removeMessageEvent(var_2479);
                  var_2479.dispose();
                  var_2479 = null;
               }
            }
         }
         _container = param1;
         if(param1 == null)
         {
            return;
         }
         if(false)
         {
            _container.roomSessionManager.events.addEventListener("RSUBE_FIGURE",onFigureUpdate);
            _container.roomSessionManager.events.addEventListener("RSPIUE_PET_INFO",onPetInfo);
            _container.roomSessionManager.events.addEventListener("RSPIUE_ENABLED_PET_COMMANDS",onPetCommands);
            _container.roomSessionManager.events.addEventListener("rsfgue_favourite_group_update",onFavouriteGroupUpdated);
            _container.roomSessionManager.events.addEventListener("RSPFUE_PET_FIGURE_UPDATE",onPetFigureUpdate);
            _container.roomSessionManager.events.addEventListener("RSPFUE_PET_BREEDING_RESULT",onPetBreedingResult);
            _container.roomSessionManager.events.addEventListener("RSPFUE_PET_BREEDING",onPetBreedingEvent);
            _container.roomSessionManager.events.addEventListener("RSPFUE_CONFIRM_PET_BREEDING",onConfirmPetBreedingEvent);
            _container.roomSessionManager.events.addEventListener("RSPFUE_CONFIRM_PET_BREEDING_RESULT",onConfirmPetBreedingResultEvent);
         }
         if(false)
         {
            var_2515 = new class_788(onGroupDetails);
            _container.connection.addMessageEvent(var_2515);
            var_2479 = new class_420(onRelationshipStatusEvent);
            _container.connection.addMessageEvent(var_2479);
         }
      }
      
      private function onGroupDetails(param1:class_788) : void
      {
         var _loc2_:class_1126 = param1.data;
         if(var_1429.furniData.groupId == _loc2_.groupId)
         {
            var_1429.furniView.groupBadgeId = _loc2_.badgeCode;
            var_1429.furniView.groupName = _loc2_.groupName;
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(var_1983 != null)
         {
            _loc1_ = -1;
            while(_loc1_ >= 0)
            {
               _loc2_ = var_1983.getWithIndex(_loc1_);
               if(_loc2_)
               {
                  _loc2_.dispose();
               }
               _loc2_ = null;
               _loc1_--;
            }
            var_1983.dispose();
            var_1983 = null;
         }
         if(var_1711 != null)
         {
            var_1711.events.removeEventListener("NPE_SONG_CHANGED",onNowPlayingChanged);
            var_1711.events.removeEventListener("SIR_TRAX_SONG_INFO_RECEIVED",onSongInfoReceivedEvent);
            var_1711 = null;
         }
         var_311 = true;
         container = null;
      }
      
      public function getWidgetMessages() : Array
      {
         var _loc1_:* = [];
         _loc1_.push("RWROM_GET_OBJECT_INFO");
         _loc1_.push("RWROM_GET_OBJECT_NAME");
         _loc1_.push("RWUAM_SEND_FRIEND_REQUEST");
         _loc1_.push("RWUAM_GIVE_STAR_GEM_TO_USER");
         _loc1_.push("RWUAM_WHISPER_USER");
         _loc1_.push("RWUAM_IGNORE_USER");
         _loc1_.push("RWUAM_UNIGNORE_USER");
         _loc1_.push("RWUAM_KICK_USER");
         _loc1_.push("RWUAM_BAN_USER_DAY");
         _loc1_.push("RWUAM_BAN_USER_HOUR");
         _loc1_.push("RWUAM_BAN_USER_PERM");
         _loc1_.push("RWUAM_MUTE_USER_2MIN");
         _loc1_.push("RWUAM_MUTE_USER_5MIN");
         _loc1_.push("RWUAM_MUTE_USER_10MIN");
         _loc1_.push("RWUAM_GIVE_RIGHTS");
         _loc1_.push("RWUAM_TAKE_RIGHTS");
         _loc1_.push("RWUAM_START_TRADING");
         _loc1_.push("RWUAM_OPEN_HOME_PAGE");
         _loc1_.push("RWUAM_PASS_CARRY_ITEM");
         _loc1_.push("RWUAM_GIVE_CARRY_ITEM_TO_PET");
         _loc1_.push("RWUAM_DROP_CARRY_ITEM");
         _loc1_.push("RWFAM_MOVE");
         _loc1_.push("RWFUAM_ROTATE");
         _loc1_.push("RWFAM_PICKUP");
         _loc1_.push("RWFAM_EJECT");
         _loc1_.push("RWFAM_USE");
         _loc1_.push("RWFAM_SAVE_STUFF_DATA");
         _loc1_.push("RWRTSM_ROOM_TAG_SEARCH");
         _loc1_.push("RWGOI_MESSAGE_GET_BADGE_DETAILS");
         _loc1_.push("RWGOI_MESSAGE_GET_BADGE_IMAGE");
         _loc1_.push("RWUAM_REPORT");
         _loc1_.push("RWUAM_PICKUP_PET");
         _loc1_.push("RWUAM_MOUNT_PET");
         _loc1_.push("RWUAM_TOGGLE_PET_RIDING_PERMISSION");
         _loc1_.push("RWUAM_TOGGLE_PET_BREEDING_PERMISSION");
         _loc1_.push("RWUAM_DISMOUNT_PET");
         _loc1_.push("RWUAM_SADDLE_OFF");
         _loc1_.push("RWUAM_TRAIN_PET");
         _loc1_.push("RWPCM_PET_COMMAND");
         _loc1_.push("RWPCM_REQUEST_PET_COMMANDS");
         _loc1_.push(" RWUAM_RESPECT_PET");
         _loc1_.push("RWUAM_REQUEST_PET_UPDATE");
         _loc1_.push("RWVM_CHANGE_MOTTO_MESSAGE");
         _loc1_.push("RWOPEM_OPEN_USER_PROFILE");
         _loc1_.push("RWPOM_OPEN_PRESENT");
         _loc1_.push("RWUAM_GIVE_LIGHT_TO_PET");
         _loc1_.push("RWUAM_GIVE_WATER_TO_PET");
         _loc1_.push("RWUAM_TREAT_PET");
         _loc1_.push("RWUAM_REPORT_CFH_OTHER");
         _loc1_.push("RWUAM_AMBASSADOR_ALERT_USER");
         _loc1_.push("RWUAM_AMBASSADOR_KICK_USER");
         _loc1_.push("RWUAM_AMBASSADOR_MUTE_2MIN");
         _loc1_.push("RWUAM_AMBASSADOR_MUTE_10MIN");
         _loc1_.push("RWUAM_AMBASSADOR_MUTE_15MIN");
         _loc1_.push("RWUAM_AMBASSADOR_MUTE_60MIN");
         _loc1_.push("RWUAM_AMBASSADOR_MUTE_18HOUR");
         _loc1_.push("RWUAM_AMBASSADOR_MUTE_36HOUR");
         _loc1_.push("RWUAM_AMBASSADOR_MUTE_72HOUR");
         _loc1_.push("RWUAM_AMBASSADOR_UNMUTE");
         return _loc1_;
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:class_3259 = null;
         var _loc6_:RoomWidgetChatInputContentUpdateEvent = null;
         var _loc3_:class_3259 = null;
         var _loc7_:String = null;
         var _loc22_:class_24 = null;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc12_:String = null;
         var _loc11_:String = null;
         var _loc25_:RoomWidgetRoomTagSearchMessage = null;
         var _loc19_:RoomWidgetGetBadgeDetailsMessage = null;
         var _loc15_:RoomWidgetGetBadgeImageMessage = null;
         var _loc21_:RoomWidgetPetCommandMessage = null;
         var _loc8_:RoomWidgetPetCommandMessage = null;
         var _loc23_:RoomWidgetChangeMottoMessage = null;
         var _loc16_:RoomWidgetOpenProfileMessage = null;
         var _loc9_:RoomWidgetPresentOpenMessage = null;
         var _loc10_:InfoStandFurniData = null;
         if(param1 == null)
         {
            return null;
         }
         if(_container == null)
         {
            return null;
         }
         var _loc20_:int = 0;
         var _loc14_:RoomWidgetUserActionMessage;
         if((_loc14_ = param1 as RoomWidgetUserActionMessage) != null)
         {
            _loc20_ = _loc14_.userId;
            if(param1.type == "RWUAM_REQUEST_PET_UPDATE" || param1.type == " RWUAM_RESPECT_PET" || param1.type == "RWUAM_PICKUP_PET" || param1.type == "RWUAM_MOUNT_PET" || param1.type == "RWUAM_TOGGLE_PET_RIDING_PERMISSION" || param1.type == "RWUAM_TOGGLE_PET_BREEDING_PERMISSION" || param1.type == "RWUAM_DISMOUNT_PET" || param1.type == "RWUAM_SADDLE_OFF" || param1.type == "RWUAM_GIVE_CARRY_ITEM_TO_PET" || param1.type == "RWUAM_GIVE_WATER_TO_PET" || param1.type == "RWUAM_GIVE_LIGHT_TO_PET" || param1.type == "RWUAM_TREAT_PET")
            {
               _loc2_ = _container.roomSession.userDataManager.getPetUserData(_loc20_);
            }
            else
            {
               _loc2_ = _container.roomSession.userDataManager.getUserData(_loc20_);
            }
            if(_loc2_ == null)
            {
               return null;
            }
         }
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc24_:RoomWidgetFurniActionMessage;
         if((_loc24_ = param1 as RoomWidgetFurniActionMessage) != null)
         {
            _loc17_ = _loc24_.furniId;
            _loc18_ = _loc24_.furniCategory;
         }
         switch(param1.type)
         {
            case "RWROM_GET_OBJECT_INFO":
               return handleGetObjectInfoMessage(param1 as RoomWidgetRoomObjectMessage);
            case "RWROM_GET_OBJECT_NAME":
               return handleGetObjectNameMessage(param1 as RoomWidgetRoomObjectMessage);
            case "RWUAM_SEND_FRIEND_REQUEST":
               _container.friendList.askForAFriend(_loc20_,_loc2_.name);
               break;
            case "RWUAM_GIVE_STAR_GEM_TO_USER":
               _container.sessionDataManager.giveStarGem(_loc20_);
               break;
            case " RWUAM_RESPECT_PET":
               _container.sessionDataManager.givePetRespect(_loc20_);
               break;
            case "RWUAM_WHISPER_USER":
               _loc6_ = new RoomWidgetChatInputContentUpdateEvent("whisper",_loc2_.name);
               _container.events.dispatchEvent(_loc6_);
               break;
            case "RWUAM_IGNORE_USER":
               _container.sessionDataManager.ignoreUser(_loc2_.name);
               break;
            case "RWUAM_UNIGNORE_USER":
               _container.sessionDataManager.unignoreUser(_loc2_.name);
               break;
            case "RWUAM_KICK_USER":
               _container.roomSession.kickUser(_loc2_.webID);
               break;
            case "RWUAM_BAN_USER_DAY":
            case "RWUAM_BAN_USER_HOUR":
            case "RWUAM_BAN_USER_PERM":
               _container.roomSession.banUserWithDuration(_loc2_.webID,param1.type);
               break;
            case "RWUAM_MUTE_USER_2MIN":
               _container.roomSession.muteUser(_loc2_.webID,2);
               break;
            case "RWUAM_MUTE_USER_5MIN":
               _container.roomSession.muteUser(_loc2_.webID,5);
               break;
            case "RWUAM_MUTE_USER_10MIN":
               _container.roomSession.muteUser(_loc2_.webID,10);
               break;
            case "RWUAM_GIVE_RIGHTS":
               _container.roomSession.assignRights(_loc2_.webID);
               break;
            case "RWUAM_TAKE_RIGHTS":
               _container.roomSession.removeRights(_loc2_.webID);
               break;
            case "RWUAM_START_TRADING":
               _loc3_ = _container.roomSession.userDataManager.getUserData(_loc14_.userId);
               _container.inventory.setupTrading(_loc3_.roomObjectId,_loc3_.name);
               break;
            case "RWUAM_OPEN_HOME_PAGE":
               _container.sessionDataManager.openHabboHomePage(_loc2_.webID,_loc2_.name);
               break;
            case "RWUAM_PICKUP_PET":
               _container.roomSession.pickUpPet(_loc20_);
               break;
            case "RWUAM_MOUNT_PET":
               _container.roomSession.mountPet(_loc20_);
               break;
            case "RWUAM_TOGGLE_PET_RIDING_PERMISSION":
               _container.roomSession.togglePetRidingPermission(_loc20_);
               break;
            case "RWUAM_TOGGLE_PET_BREEDING_PERMISSION":
               _container.roomSession.togglePetBreedingPermission(_loc20_);
               break;
            case "RWUAM_DISMOUNT_PET":
               _container.roomSession.dismountPet(_loc20_);
               break;
            case "RWUAM_SADDLE_OFF":
               _container.roomSession.removeSaddleFromPet(_loc20_);
               break;
            case "RWUAM_PASS_CARRY_ITEM":
               _container.connection.send(new class_701(_loc20_));
               break;
            case "RWUAM_GIVE_CARRY_ITEM_TO_PET":
               _container.connection.send(new class_421(_loc20_));
               break;
            case "RWUAM_GIVE_WATER_TO_PET":
               _container.connection.send(new class_699(_loc20_,0));
               break;
            case "RWUAM_GIVE_LIGHT_TO_PET":
               _container.connection.send(new class_699(_loc20_,1));
               break;
            case "RWUAM_TREAT_PET":
               _container.connection.send(new class_804(_loc20_));
               break;
            case "RWUAM_DROP_CARRY_ITEM":
               _container.connection.send(new class_321());
               break;
            case "RWFUAM_ROTATE":
               _container.roomEngine.modifyRoomObject(_loc17_,_loc18_,"OBJECT_ROTATE_POSITIVE");
               break;
            case "RWFAM_MOVE":
               _container.roomEngine.modifyRoomObject(_loc17_,_loc18_,"OBJECT_MOVE");
               break;
            case "RWFAM_PICKUP":
               pickupObjectWithConfirmation(_loc17_,_loc18_);
               break;
            case "RWFAM_EJECT":
               _container.roomEngine.modifyRoomObject(_loc17_,_loc18_,"OBJECT_EJECT");
               break;
            case "RWFAM_USE":
               _container.roomEngine.useRoomObjectInActiveRoom(_loc17_,_loc18_);
               break;
            case "RWFAM_SAVE_STUFF_DATA":
               if((_loc7_ = _loc24_.objectData) != null)
               {
                  _loc22_ = new class_24();
                  if((_loc4_ = _loc7_.split("\t")) != null)
                  {
                     for each(var _loc13_ in _loc4_)
                     {
                        if((_loc5_ = _loc13_.split("=",2)) != null && _loc5_.length == 2)
                        {
                           _loc12_ = String(_loc5_[0]);
                           _loc11_ = String(_loc5_[1]);
                           _loc22_.add(_loc12_,_loc11_);
                        }
                     }
                  }
                  _container.roomEngine.modifyRoomObjectDataWithMap(_loc17_,_loc18_,"OBJECT_SAVE_STUFF_DATA",_loc22_);
                  if(!_loc22_.disposed)
                  {
                     _loc22_.dispose();
                     break;
                  }
                  break;
               }
               break;
            case "RWUAM_REQUEST_PET_UPDATE":
               if(false && _container.roomSession.userDataManager != null)
               {
                  _container.roomSession.userDataManager.requestPetInfo(_loc20_);
                  break;
               }
               break;
            case "RWRTSM_ROOM_TAG_SEARCH":
               if((_loc25_ = param1 as RoomWidgetRoomTagSearchMessage) == null)
               {
                  return null;
               }
               _container.navigator.performTagSearch(_loc25_.tag);
               break;
            case "RWGOI_MESSAGE_GET_BADGE_DETAILS":
               if((_loc19_ = param1 as RoomWidgetGetBadgeDetailsMessage) == null)
               {
                  return null;
               }
               _container.habboGroupsManager.showGroupBadgeInfo(_loc19_.own,_loc19_.groupId);
               break;
            case "RWGOI_MESSAGE_GET_BADGE_IMAGE":
               if((_loc15_ = param1 as RoomWidgetGetBadgeImageMessage) == null)
               {
                  return null;
               }
               if(var_1429 != null)
               {
                  var_1429.refreshBadge(_loc15_.badgeId);
                  break;
               }
               break;
            case "RWUAM_REPORT":
               if(!(_container == null || true))
               {
                  if(_loc2_ != null)
                  {
                     _container.habboHelp.reportUser(_loc20_,-1,null);
                     break;
                  }
                  break;
               }
               break;
            case "RWUAM_REPORT_CFH_OTHER":
               _container.habboHelp.reportUser(_loc20_,124,null);
               break;
            case "RWPCM_REQUEST_PET_COMMANDS":
               _loc21_ = param1 as RoomWidgetPetCommandMessage;
               _container.roomSession.requestPetCommands(_loc21_.petId);
               break;
            case "RWPCM_PET_COMMAND":
               _loc8_ = param1 as RoomWidgetPetCommandMessage;
               _container.roomSession.sendChatMessage(_loc8_.value);
               break;
            case "RWVM_CHANGE_MOTTO_MESSAGE":
               _loc23_ = param1 as RoomWidgetChangeMottoMessage;
               _container.roomSession.sendChangeMottoMessage(_loc23_.motto);
               break;
            case "RWOPEM_OPEN_USER_PROFILE":
               _loc16_ = param1 as RoomWidgetOpenProfileMessage;
               if(false)
               {
                  _container.habboTracking.trackGoogle("extendedProfile",_loc16_.trackingLocation);
               }
               _container.connection.send(new class_313(_loc16_.userId));
               break;
            case "RWPOM_OPEN_PRESENT":
               if((_loc9_ = param1 as RoomWidgetPresentOpenMessage) != null && var_1429 != null)
               {
                  if((_loc10_ = var_1429.furniData) != null && _loc10_.id == _loc9_.objectId)
                  {
                     if(var_1429.isFurniViewVisible())
                     {
                        var_1429.close();
                        break;
                     }
                     break;
                  }
                  break;
               }
               break;
            case "RWUAM_AMBASSADOR_ALERT_USER":
               _container.roomSession.ambassadorAlert(_loc2_.webID);
               break;
            case "RWUAM_AMBASSADOR_KICK_USER":
               _container.roomSession.kickUser(_loc2_.webID);
               break;
            case "RWUAM_AMBASSADOR_MUTE_2MIN":
               _container.roomSession.muteUser(_loc2_.webID,2);
               break;
            case "RWUAM_AMBASSADOR_MUTE_10MIN":
               _container.roomSession.muteUser(_loc2_.webID,10);
               break;
            case "RWUAM_AMBASSADOR_MUTE_15MIN":
               _container.roomSession.muteUser(_loc2_.webID,15);
               break;
            case "RWUAM_AMBASSADOR_MUTE_60MIN":
               _container.roomSession.muteUser(_loc2_.webID,60);
               break;
            case "RWUAM_AMBASSADOR_MUTE_18HOUR":
               _container.roomSession.muteUser(_loc2_.webID,1080);
               break;
            case "RWUAM_AMBASSADOR_MUTE_36HOUR":
               _container.roomSession.muteUser(_loc2_.webID,2160);
               break;
            case "RWUAM_AMBASSADOR_MUTE_72HOUR":
               _container.roomSession.muteUser(_loc2_.webID,4320);
               break;
            case "RWUAM_AMBASSADOR_UNMUTE":
               _container.roomSession.unmuteUser(_loc2_.webID);
         }
         return null;
      }
      
      private function pickupObjectWithConfirmation(param1:int, param2:int) : void
      {
         var furniId:int = param1;
         var furniCategory:int = param2;
         if(_container != null)
         {
            if(class_3288.isBuilderClubId(furniId) && _container.catalog.buildersClubEnabled)
            {
               if(var_1429.furniData.availableForBuildersClub)
               {
                  _container.roomEngine.modifyRoomObject(furniId,furniCategory,"OBJECT_PICKUP");
               }
               else
               {
                  _container.windowManager.confirm("${generic.alert.title}","${room.confirm.not_in_warehouse}",0,function(param1:class_3216, param2:class_3134):void
                  {
                     param1.dispose();
                     if(param2.type == "WE_OK")
                     {
                        _container.roomEngine.modifyRoomObject(furniId,furniCategory,"OBJECT_PICKUP");
                     }
                  });
               }
            }
            else
            {
               _container.roomEngine.modifyRoomObject(furniId,furniCategory,"OBJECT_PICKUP");
            }
         }
      }
      
      private function handleGetObjectNameMessage(param1:RoomWidgetRoomObjectMessage) : RoomWidgetUpdateEvent
      {
         var _loc8_:int = 0;
         var _loc6_:int = 0;
         var _loc9_:int = 0;
         var _loc3_:IRoomObject = null;
         var _loc4_:String = null;
         var _loc12_:int = 0;
         var _loc10_:int = 0;
         var _loc7_:class_3148 = null;
         var _loc2_:class_3259 = null;
         var _loc11_:int = _container.roomSession.roomId;
         var _loc5_:String = null;
         switch(param1.category)
         {
            case 10:
            case 20:
               if(true || true)
               {
                  return null;
               }
               _loc3_ = _container.roomEngine.getRoomObject(_loc11_,param1.id,param1.category);
               if((_loc4_ = _loc3_.getType()).indexOf("poster") == 0)
               {
                  _loc12_ = int(_loc4_.replace("poster",""));
                  _loc5_ = "${poster_" + _loc12_ + "_name}";
                  _loc6_ = _loc3_.getId();
                  _loc9_ = -1;
                  break;
               }
               _loc10_ = int(_loc3_.getModel().getNumber("furniture_type_id"));
               if(param1.category == 10)
               {
                  _loc7_ = _container.sessionDataManager.getFloorItemData(_loc10_);
               }
               else if(param1.category == 20)
               {
                  _loc7_ = _container.sessionDataManager.getWallItemData(_loc10_);
               }
               if(_loc7_ == null)
               {
                  return null;
               }
               _loc5_ = _loc7_.localizedName;
               _loc6_ = _loc3_.getId();
               _loc9_ = _loc7_.id;
               break;
            case 100:
               if(true || true || true || true || true)
               {
                  return null;
               }
               _loc2_ = _container.roomSession.userDataManager.getUserDataByIndex(param1.id);
               if(_loc2_ == null)
               {
                  return null;
               }
               _loc5_ = _loc2_.name;
               _loc8_ = _loc2_.type;
               _loc6_ = _loc2_.roomObjectId;
               _loc9_ = _loc2_.webID;
               break;
         }
         if(_loc5_ != null)
         {
            _container.events.dispatchEvent(new RoomWidgetRoomObjectNameEvent(_loc9_,param1.category,_loc5_,_loc8_,_loc6_));
         }
         return null;
      }
      
      private function handleGetObjectInfoMessage(param1:RoomWidgetRoomObjectMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:class_3259 = null;
         var _loc3_:int = _container.roomSession.roomId;
         loop0:
         switch(param1.category)
         {
            case 10:
            case 20:
               handleGetFurniInfoMessage(param1,_loc3_);
               break;
            case 100:
               if(true || true || true || true || true)
               {
                  return null;
               }
               _loc2_ = _container.roomSession.userDataManager.getUserDataByIndex(param1.id);
               if(_loc2_ == null)
               {
                  return null;
               }
               switch(_loc2_.type - 1)
               {
                  case 0:
                     handleGetUserInfoMessage(_loc3_,param1.id,param1.category,_loc2_);
                     break loop0;
                  case 1:
                     handleGetPetInfoMessage(_loc2_.webID);
                     break loop0;
                  case 2:
                     handleGetBotInfoMessage(_loc3_,param1.id,param1.category,_loc2_);
                     break loop0;
                  case 3:
                     handleGetRentableBotInfoMessage(_loc3_,param1.id,param1.category,_loc2_);
               }
               break;
         }
         return null;
      }
      
      private function handleGetPetInfoMessage(param1:int) : void
      {
         var _loc2_:Boolean = Boolean(container.config.getBoolean("petSelect.enabled"));
         if(_loc2_)
         {
            _container.connection.send(new class_300(param1));
         }
         _container.roomSession.userDataManager.requestPetInfo(param1);
      }
      
      private function handleGetBotInfoMessage(param1:int, param2:int, param3:int, param4:class_3259) : void
      {
         var _loc6_:RoomWidgetUserInfoUpdateEvent;
         (_loc6_ = new RoomWidgetUserInfoUpdateEvent("RWUIUE_BOT")).name = param4.name;
         _loc6_.motto = param4.custom;
         _loc6_.webID = param4.webID;
         _loc6_.userRoomId = param2;
         _loc6_.userType = param4.type;
         var _loc8_:IRoomObject;
         if((_loc8_ = _container.roomEngine.getRoomObject(param1,param2,param3)) != null)
         {
            _loc6_.carryItem = _loc8_.getModel().getNumber("figure_carry_object");
         }
         _loc6_.amIOwner = _container.roomSession.isRoomOwner;
         _loc6_.isGuildRoom = _container.roomSession.isGuildRoom;
         _loc6_.myRoomControllerLevel = _container.roomSession.roomControllerLevel;
         _loc6_.amIAnyRoomController = _container.sessionDataManager.isAnyRoomController;
         _loc6_.canBeKicked = _container.roomSession.isRoomOwner;
         var _loc5_:*;
         (_loc5_ = []).push("BOT");
         _loc6_.badges = _loc5_;
         _loc6_.figure = param4.figure;
         _container.events.dispatchEvent(_loc6_);
      }
      
      private function handleGetRentableBotInfoMessage(param1:int, param2:int, param3:int, param4:class_3259) : void
      {
         var _loc6_:RoomWidgetRentableBotInfoUpdateEvent;
         (_loc6_ = new RoomWidgetRentableBotInfoUpdateEvent()).name = param4.name;
         _loc6_.motto = param4.custom;
         _loc6_.webID = param4.webID;
         _loc6_.userRoomId = param2;
         _loc6_.ownerId = param4.ownerId;
         _loc6_.ownerName = param4.ownerName;
         _loc6_.botSkills = param4.botSkills;
         var _loc7_:IRoomObject;
         if((_loc7_ = _container.roomEngine.getRoomObject(param1,param2,param3)) != null)
         {
            _loc6_.carryItem = _loc7_.getModel().getNumber("figure_carry_object");
         }
         _loc6_.amIOwner = _container.roomSession.isRoomOwner;
         _loc6_.myRoomControllerLevel = _container.roomSession.roomControllerLevel;
         _loc6_.amIAnyRoomController = _container.sessionDataManager.isAnyRoomController;
         var _loc5_:*;
         (_loc5_ = []).push("BOT");
         _loc6_.badges = _loc5_;
         _loc6_.figure = param4.figure;
         _container.events.dispatchEvent(_loc6_);
      }
      
      private function handleGetUserInfoMessage(param1:int, param2:int, param3:int, param4:class_3259) : void
      {
         var _loc7_:String = null;
         var _loc5_:RoomWidgetUserInfoUpdateEvent = null;
         var _loc6_:class_3191 = null;
         var _loc10_:Number = NaN;
         var _loc11_:* = false;
         var _loc12_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         _loc7_ = "RWUIUE_OWN_USER";
         if(param4.webID != _container.sessionDataManager.userId)
         {
            _loc7_ = "RWUIUE_PEER";
         }
         (_loc5_ = new RoomWidgetUserInfoUpdateEvent(_loc7_)).isSpectatorMode = _container.roomSession.isSpectatorMode;
         _loc5_.name = param4.name;
         _loc5_.motto = param4.custom;
         if(isActivityDisplayEnabled)
         {
            _loc5_.achievementScore = param4.achievementScore;
         }
         _loc5_.webID = param4.webID;
         _loc5_.userRoomId = param2;
         _loc5_.userType = 1;
         var _loc13_:IRoomObject;
         if((_loc13_ = _container.roomEngine.getRoomObject(param1,param2,param3)) != null)
         {
            _loc5_.carryItem = _loc13_.getModel().getNumber("figure_carry_object");
         }
         if(_loc7_ == "RWUIUE_OWN_USER")
         {
            _loc5_.realName = _container.sessionDataManager.realName;
            _loc5_.allowNameChange = _container.sessionDataManager.nameChangeAllowed;
         }
         _loc5_.amIOwner = _container.roomSession.isRoomOwner;
         _loc5_.isGuildRoom = _container.roomSession.isGuildRoom;
         _loc5_.myRoomControllerLevel = _container.roomSession.roomControllerLevel;
         _loc5_.amIAnyRoomController = _container.sessionDataManager.isAnyRoomController;
         _loc5_.amIAnAmbassador = _container.sessionDataManager.isAmbassador;
         if(_loc7_ == "RWUIUE_PEER")
         {
            _loc5_.canBeAskedAsFriend = _container.friendList.canBeAskedForAFriend(param4.webID);
            if((_loc6_ = _container.friendList.getFriend(param4.webID)) != null)
            {
               _loc5_.realName = _loc6_.realName;
               _loc5_.isFriend = true;
            }
            if(_loc13_ != null)
            {
               _loc10_ = Number(_loc13_.getModel().getNumber("figure_flat_control"));
               if(!isNaN(_loc10_))
               {
                  _loc5_.targetRoomControllerLevel = _loc10_;
               }
               _loc5_.canBeMuted = determineCanBeMuted(_loc5_);
               _loc5_.canBeKicked = determineCanBeKicked(_loc5_);
               _loc5_.canBeBanned = determineCanBeBanned(_loc5_);
               class_14.log("Set moderation levels to " + _loc5_.name + "Muted: " + _loc5_.canBeMuted + ", Kicked: " + _loc5_.canBeKicked + ", Banned: " + _loc5_.canBeBanned);
            }
            _loc5_.isIgnored = _container.sessionDataManager.isIgnored(param4.name);
            _loc5_.respectLeft = _container.sessionDataManager.respectLeft;
            _loc11_ = !_container.sessionDataManager.systemShutDown;
            _loc12_ = _container.roomSession.tradeMode;
            if(!_loc11_)
            {
               _loc5_.canTrade = false;
            }
            else
            {
               switch(_loc12_ - 1)
               {
                  case 0:
                     _loc8_ = _loc5_.myRoomControllerLevel != 0 && _loc5_.myRoomControllerLevel != 2;
                     _loc9_ = _loc5_.targetRoomControllerLevel != 0 && _loc5_.targetRoomControllerLevel != 2;
                     _loc5_.canTrade = _loc8_ || _loc9_;
                     break;
                  case 1:
                     _loc5_.canTrade = true;
                     break;
                  default:
                     _loc5_.canTrade = false;
               }
            }
            _loc5_.canTradeReason = 0;
            if(!_loc11_)
            {
               _loc5_.canTradeReason = 2;
            }
            if(_loc12_ != 2)
            {
               _loc5_.canTradeReason = 3;
            }
         }
         _loc5_.groupId = int(param4.groupID);
         _loc5_.groupBadgeId = _container.sessionDataManager.getGroupBadgeId(int(param4.groupID));
         _loc5_.groupName = param4.groupName;
         _loc5_.badges = _container.roomSession.userDataManager.getUserBadges(param4.webID);
         _loc5_.figure = param4.figure;
         _container.events.dispatchEvent(_loc5_);
         _container.habboGroupsManager.updateVisibleExtendedProfile(param4.webID);
         _container.connection.send(new class_692(param4.webID));
      }
      
      private function determineCanBeMuted(param1:RoomWidgetUserInfoUpdateEvent) : Boolean
      {
         var userInfo:RoomWidgetUserInfoUpdateEvent = param1;
         var settingsFunction:Function = function(param1:RoomWidgetUserInfoUpdateEvent, param2:class_1621):Boolean
         {
            return checkUserWithRightsModerationLevel(param1,param2.whoCanMute);
         };
         return determineModerationLevel(userInfo,settingsFunction);
      }
      
      private function determineCanBeKicked(param1:RoomWidgetUserInfoUpdateEvent) : Boolean
      {
         var userInfo:RoomWidgetUserInfoUpdateEvent = param1;
         var settingsFunction:Function = function(param1:RoomWidgetUserInfoUpdateEvent, param2:class_1621):Boolean
         {
            if(param2.whoCanKick == 2)
            {
               return true;
            }
            return checkUserWithRightsModerationLevel(param1,param2.whoCanKick);
         };
         return determineModerationLevel(userInfo,settingsFunction);
      }
      
      private function determineCanBeBanned(param1:RoomWidgetUserInfoUpdateEvent) : Boolean
      {
         var userInfo:RoomWidgetUserInfoUpdateEvent = param1;
         var settingsFunction:Function = function(param1:RoomWidgetUserInfoUpdateEvent, param2:class_1621):Boolean
         {
            return checkUserWithRightsModerationLevel(param1,param2.whoCanBan);
         };
         return determineModerationLevel(userInfo,settingsFunction);
      }
      
      private function checkUserWithRightsModerationLevel(param1:RoomWidgetUserInfoUpdateEvent, param2:int) : Boolean
      {
         var _loc3_:Boolean = param1.myRoomControllerLevel == 1 || param1.myRoomControllerLevel >= 4;
         var _loc4_:Boolean = param1.isGuildRoom && param1.myRoomControllerLevel >= 3;
         switch(param2 - 1)
         {
            case 0:
               return _loc3_;
            case 3:
               return _loc4_;
            case 4:
               return _loc3_ || _loc4_;
            default:
               return param1.myRoomControllerLevel >= 4;
         }
      }
      
      private function determineModerationLevel(param1:RoomWidgetUserInfoUpdateEvent, param2:Function) : Boolean
      {
         if(!_container.roomSession.isPrivateRoom)
         {
            return false;
         }
         var _loc4_:Boolean = false;
         var _loc3_:class_1621 = _container.roomSession.roomModerationSettings;
         if(_loc3_ != null)
         {
            _loc4_ = param2(param1,_loc3_);
         }
         return _loc4_ && param1.targetRoomControllerLevel < 4;
      }
      
      private function handleGetFurniInfoMessage(param1:RoomWidgetRoomObjectMessage, param2:int) : void
      {
         var _loc8_:int = 0;
         var _loc15_:int = 0;
         var _loc12_:class_3148 = null;
         var _loc17_:int = 0;
         var _loc4_:String = null;
         var _loc22_:String = null;
         var _loc7_:String = null;
         var _loc5_:class_3365 = null;
         var _loc19_:String = null;
         var _loc18_:ISongInfo = null;
         if(true || true)
         {
            return;
         }
         if(param1.id < 0)
         {
            return;
         }
         var _loc20_:RoomWidgetFurniInfoUpdateEvent;
         (_loc20_ = new RoomWidgetFurniInfoUpdateEvent("RWFIUE_FURNI")).id = param1.id;
         _loc20_.category = param1.category;
         var _loc9_:IRoomObject;
         if(!(_loc9_ = _container.roomEngine.getRoomObject(param2,param1.id,param1.category)))
         {
            return;
         }
         var _loc14_:IRoomObjectModel;
         if((_loc14_ = _loc9_.getModel()).getString("RWEIEP_INFOSTAND_EXTRA_PARAM") != null)
         {
            _loc20_.extraParam = _loc14_.getString("RWEIEP_INFOSTAND_EXTRA_PARAM");
         }
         var _loc16_:int = int(_loc14_.getNumber("furniture_data_format"));
         var _loc10_:IStuffData;
         (_loc10_ = class_1588.getStuffDataWrapperForType(_loc16_)).initializeFromRoomObjectModel(_loc14_);
         _loc20_.stuffData = _loc10_;
         var _loc11_:String;
         if((_loc11_ = _loc9_.getType()).indexOf("poster") == 0)
         {
            _loc8_ = int(_loc11_.replace("poster",""));
            _loc20_.name = "${poster_" + _loc8_ + "_name}";
            _loc20_.description = "${poster_" + _loc8_ + "_desc}";
         }
         else
         {
            _loc15_ = int(_loc14_.getNumber("furniture_type_id"));
            if(param1.category == 10)
            {
               _loc12_ = _container.sessionDataManager.getFloorItemData(_loc15_);
            }
            else if(param1.category == 20)
            {
               _loc12_ = _container.sessionDataManager.getWallItemData(_loc15_);
            }
            if(_loc12_ != null)
            {
               _loc20_.name = _loc12_.localizedName;
               _loc20_.description = _loc12_.description;
               _loc20_.purchaseOfferId = _loc12_.purchaseOfferId;
               _loc20_.purchaseCouldBeUsedForBuyout = _loc12_.purchaseCouldBeUsedForBuyout;
               _loc20_.rentOfferId = _loc12_.rentOfferId;
               _loc20_.rentCouldBeUsedForBuyout = _loc12_.rentCouldBeUsedForBuyout;
               _loc20_.availableForBuildersClub = _loc12_.availableForBuildersClub;
               if(false && param1.category == 10)
               {
                  _container.userDefinedRoomEvents.stuffSelected(_loc9_.getId(),_loc12_.localizedName);
               }
            }
         }
         if(_loc11_.indexOf("post_it") > -1)
         {
            _loc20_.isStickie = true;
         }
         var _loc3_:int = int(_loc14_.getNumber("furniture_expiry_time"));
         var _loc21_:int = int(_loc14_.getNumber("furniture_expirty_timestamp"));
         _loc20_.expiration = _loc3_ < 0 ? _loc3_ : Math.max(0,_loc3_ - (getTimer() - _loc21_) / 1000);
         var _loc13_:class_3266;
         if((_loc13_ = _container.roomEngine.getRoomObjectImage(param2,param1.id,param1.category,new Vector3d(180),64,null)).data == null || _loc13_.data.width > 140 || _loc13_.data.height > 200)
         {
            _loc13_ = _container.roomEngine.getRoomObjectImage(param2,param1.id,param1.category,new Vector3d(180),1,null);
         }
         _loc20_.image = _loc13_.data;
         _loc20_.isWallItem = param1.category == 20;
         _loc20_.isRoomOwner = _container.roomSession.isRoomOwner;
         _loc20_.roomControllerLevel = _container.roomSession.roomControllerLevel;
         _loc20_.isAnyRoomController = _container.sessionDataManager.isAnyRoomController;
         _loc20_.ownerId = _loc14_.getNumber("furniture_owner_id");
         _loc20_.ownerName = _loc14_.getString("furniture_owner_name");
         _loc20_.usagePolicy = _loc14_.getNumber("furniture_usage_policy");
         var _loc6_:int;
         if((_loc6_ = int(_loc14_.getNumber("furniture_guild_customized_guild_id"))) != 0)
         {
            _loc20_.groupId = _loc6_;
            container.connection.send(new class_197(_loc6_,false));
         }
         if(_container.isOwnerOfFurniture(_loc9_))
         {
            _loc20_.isOwner = true;
         }
         _container.events.dispatchEvent(_loc20_);
         if(_loc20_.extraParam != null && _loc20_.extraParam.length > 0)
         {
            _loc17_ = -1;
            _loc4_ = "";
            _loc22_ = "";
            _loc7_ = "";
            if(_loc20_.extraParam == "RWEIEP_JUKEBOX")
            {
               if((_loc5_ = var_1711.getRoomItemPlaylist()) != null)
               {
                  _loc17_ = _loc5_.nowPlayingSongId;
                  _loc7_ = "RWSUE_PLAYING_CHANGED";
               }
            }
            else if(_loc20_.extraParam.indexOf("RWEIEP_SONGDISK") == 0)
            {
               _loc19_ = _loc20_.extraParam.substr(15);
               _loc17_ = parseInt(_loc19_);
               _loc7_ = "RWSUE_DATA_RECEIVED";
            }
            if(_loc17_ != -1)
            {
               if((_loc18_ = var_1711.getSongInfo(_loc17_)) != null)
               {
                  _loc4_ = _loc18_.name;
                  _loc22_ = _loc18_.creator;
               }
               _container.events.dispatchEvent(new RoomWidgetSongUpdateEvent(_loc7_,_loc17_,_loc4_,_loc22_));
            }
         }
      }
      
      public function getProcessedEvents() : Array
      {
         return ["RSUBE_BADGES"];
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc2_:RoomSessionUserBadgesEvent = null;
         var _loc3_:* = param1.type;
         if("RSUBE_BADGES" === _loc3_)
         {
            _loc2_ = param1 as RoomSessionUserBadgesEvent;
            if(_loc2_ != null && var_1429 != null)
            {
               var_1429.refreshBadges(_loc2_.userId,_loc2_.badges);
            }
         }
      }
      
      private function onFigureUpdate(param1:RoomSessionUserFigureUpdateEvent) : void
      {
         if(_container == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param1.userId < 0)
         {
            return;
         }
         var _loc2_:class_3259 = _container.roomSession.userDataManager.getUserDataByIndex(param1.userId);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc5_:int = _loc2_.webID;
         var _loc4_:* = _loc5_ == _container.sessionDataManager.userId;
         var_1429.updateUserData(_loc5_,param1.figure,param1.achievementScore,param1.customInfo,_loc4_);
      }
      
      private function onPetInfo(param1:RoomSessionPetInfoUpdateEvent) : void
      {
         var _loc4_:* = false;
         var _loc6_:RoomWidgetPetInfoUpdateEvent = null;
         var _loc12_:IRoomSession = null;
         var _loc5_:IPetInfo;
         if((_loc5_ = param1.petInfo) == null)
         {
            return;
         }
         var _loc10_:class_3259;
         if((_loc10_ = _container.roomSession.userDataManager.getPetUserData(_loc5_.petId)) == null)
         {
            return;
         }
         var _loc2_:String = _loc10_.figure;
         var _loc8_:int = getPetType(_loc2_);
         var _loc9_:int = getPetRace(_loc2_);
         var _loc7_:String = null;
         if(_loc8_ == 16)
         {
            if(_loc5_.level >= _loc5_.adultLevel)
            {
               _loc7_ = "std";
            }
            else
            {
               _loc7_ = "grw" + _loc5_.level;
            }
         }
         var _loc3_:String = _loc2_ + (_loc7_ != null ? "/posture=" + _loc7_ : "");
         var _loc11_:BitmapData;
         if((_loc11_ = var_1983.getValue(_loc3_) as BitmapData) == null)
         {
            _loc11_ = getPetImage(_loc2_,_loc7_);
            var_1983.add(_loc3_,_loc11_);
         }
         if(_container != null && false)
         {
            _loc4_ = _loc5_.ownerId == _container.sessionDataManager.userId;
            (_loc6_ = new RoomWidgetPetInfoUpdateEvent(_loc8_,_loc9_,_loc10_.name,_loc5_.petId,_loc11_,_loc4_,_loc5_.ownerId,_loc5_.ownerName,_loc10_.roomObjectId,_loc5_.breedId)).level = _loc5_.level;
            _loc6_.levelMax = _loc5_.levelMax;
            _loc6_.experience = _loc5_.experience;
            _loc6_.experienceMax = _loc5_.experienceMax;
            _loc6_.energy = _loc5_.energy;
            _loc6_.energyMax = _loc5_.energyMax;
            _loc6_.nutrition = _loc5_.nutrition;
            _loc6_.nutritionMax = _loc5_.nutritionMax;
            _loc6_.petRespect = _loc5_.respect;
            _loc6_.petRespectLeft = _container.sessionDataManager.petRespectLeft;
            _loc6_.age = _loc5_.age;
            _loc6_.hasFreeSaddle = _loc5_.hasFreeSaddle;
            _loc6_.isRiding = _loc5_.isRiding;
            _loc6_.canBreed = _loc5_.canBreed;
            _loc6_.canHarvest = _loc5_.canHarvest;
            _loc6_.canRevive = _loc5_.canRevive;
            _loc6_.rarityLevel = _loc5_.rarityLevel;
            _loc6_.skillTresholds = _loc5_.skillTresholds;
            _loc6_.canRemovePet = false;
            _loc6_.accessRights = _loc5_.accessRights;
            _loc6_.maxWellBeingSeconds = _loc5_.maxWellBeingSeconds;
            _loc6_.remainingWellBeingSeconds = _loc5_.remainingWellBeingSeconds;
            _loc6_.remainingGrowingSeconds = _loc5_.remainingGrowingSeconds;
            _loc6_.hasBreedingPermission = _loc5_.hasBreedingPermission;
            _loc12_ = _container.roomSession;
            if(_loc4_)
            {
               _loc6_.canRemovePet = true;
            }
            else if(_loc12_.isRoomOwner || _container.sessionDataManager.isAnyRoomController || _loc12_.roomControllerLevel >= 1)
            {
               _loc6_.canRemovePet = true;
            }
            _container.events.dispatchEvent(_loc6_);
         }
      }
      
      private function onPetFigureUpdate(param1:RoomSessionPetFigureUpdateEvent) : void
      {
         var _loc3_:RoomWidgetPetFigureUpdateEvent = null;
         var _loc2_:String = param1.figure;
         var _loc4_:BitmapData;
         if((_loc4_ = var_1983.getValue(_loc2_) as BitmapData) == null)
         {
            _loc4_ = getPetImage(_loc2_);
            var_1983.add(_loc2_,_loc4_);
         }
         if(_container != null && false)
         {
            _loc3_ = new RoomWidgetPetFigureUpdateEvent(param1.petId,_loc4_);
            _container.events.dispatchEvent(_loc3_);
         }
      }
      
      private function onPetBreedingResult(param1:RoomSessionPetBreedingResultEvent) : void
      {
         var _loc3_:PetBreedingResultEventData = null;
         var _loc4_:PetBreedingResultEventData = null;
         var _loc2_:RoomWidgetPetBreedingResultEvent = null;
         if(_container != null && false)
         {
            _loc3_ = new PetBreedingResultEventData();
            _loc3_.stuffId = param1.resultData.stuffId;
            _loc3_.classId = param1.resultData.classId;
            _loc3_.productCode = param1.resultData.productCode;
            _loc3_.userId = param1.resultData.userId;
            _loc3_.userName = param1.resultData.userName;
            _loc3_.rarityLevel = param1.resultData.rarityLevel;
            _loc3_.hasMutation = param1.resultData.hasMutation;
            (_loc4_ = new PetBreedingResultEventData()).stuffId = param1.otherResultData.stuffId;
            _loc4_.classId = param1.otherResultData.classId;
            _loc4_.productCode = param1.otherResultData.productCode;
            _loc4_.userId = param1.otherResultData.userId;
            _loc4_.userName = param1.otherResultData.userName;
            _loc4_.rarityLevel = param1.otherResultData.rarityLevel;
            _loc4_.hasMutation = param1.otherResultData.hasMutation;
            _loc2_ = new RoomWidgetPetBreedingResultEvent(_loc3_,_loc4_);
            _container.events.dispatchEvent(_loc2_);
         }
      }
      
      private function onPetBreedingEvent(param1:RoomSessionPetBreedingEvent) : void
      {
         var _loc2_:RoomWidgetPetBreedingEvent = null;
         if(_container != null && false)
         {
            _loc2_ = new RoomWidgetPetBreedingEvent();
            _loc2_.state = param1.state;
            _loc2_.ownPetId = param1.ownPetId;
            _loc2_.otherPetId = param1.otherPetId;
            _container.events.dispatchEvent(_loc2_);
         }
      }
      
      private function onConfirmPetBreedingEvent(param1:RoomSessionConfirmPetBreedingEvent) : void
      {
         var _loc4_:ConfirmPetBreedingPetData = null;
         var _loc3_:ConfirmPetBreedingPetData = null;
         var _loc6_:* = null;
         var _loc5_:BreedingRarityCategoryData = null;
         var _loc7_:RoomWidgetConfirmPetBreedingEvent = null;
         if(_container != null && false)
         {
            (_loc4_ = new ConfirmPetBreedingPetData()).webId = param1.pet1.webId;
            _loc4_.name = param1.pet1.name;
            _loc4_.level = param1.pet1.level;
            _loc4_.figure = param1.pet1.figure;
            _loc4_.owner = param1.pet1.owner;
            _loc3_ = new ConfirmPetBreedingPetData();
            _loc3_.webId = param1.pet2.webId;
            _loc3_.name = param1.pet2.name;
            _loc3_.level = param1.pet2.level;
            _loc3_.figure = param1.pet2.figure;
            _loc3_.owner = param1.pet2.owner;
            _loc6_ = [];
            for each(var _loc2_ in param1.rarityCategories)
            {
               (_loc5_ = new BreedingRarityCategoryData()).chance = _loc2_.chance;
               _loc5_.breeds = _loc2_.breeds.concat();
               _loc6_.push(_loc5_);
            }
            _loc7_ = new RoomWidgetConfirmPetBreedingEvent(param1.nestId,_loc4_,_loc3_,_loc6_,param1.resultPetTypeId);
            _container.events.dispatchEvent(_loc7_);
         }
      }
      
      private function onConfirmPetBreedingResultEvent(param1:RoomSessionConfirmPetBreedingResultEvent) : void
      {
         var _loc2_:RoomWidgetConfirmPetBreedingResultEvent = null;
         if(_container != null && false)
         {
            _loc2_ = new RoomWidgetConfirmPetBreedingResultEvent(param1.breedingNestStuffId,param1.result);
            _container.events.dispatchEvent(_loc2_);
         }
      }
      
      private function onPetCommands(param1:RoomSessionPetCommandsUpdateEvent) : void
      {
         var _loc2_:RoomWidgetPetCommandsUpdateEvent = null;
         if(_container != null && false)
         {
            _loc2_ = new RoomWidgetPetCommandsUpdateEvent(param1.petId,param1.allCommands,param1.enabledCommands);
            _container.events.dispatchEvent(_loc2_);
         }
      }
      
      private function onFavouriteGroupUpdated(param1:RoomSessionFavouriteGroupUpdateEvent) : void
      {
         if(var_1429)
         {
            var_1429.favouriteGroupUpdated(param1.roomIndex,param1.habboGroupId,param1.status,param1.habboGroupName);
         }
      }
      
      public function update() : void
      {
      }
      
      private function getPetImage(param1:String, param2:String = null) : BitmapData
      {
         var _loc4_:BitmapData = null;
         var _loc3_:PetFigureData = new PetFigureData(param1);
         var _loc6_:class_3266;
         if((_loc6_ = _container.roomEngine.getPetImage(_loc3_.typeId,_loc3_.paletteId,_loc3_.color,new Vector3d(90),64,null,true,0,_loc3_.customParts,param2)) != null)
         {
            _loc4_ = _loc6_.data;
         }
         if(_loc4_ == null)
         {
            _loc4_ = new BitmapData(30,30,false,4289374890);
         }
         return _loc4_;
      }
      
      private function getPetType(param1:String) : int
      {
         return getSpaceSeparatedInteger(param1,0);
      }
      
      private function getPetRace(param1:String) : int
      {
         return getSpaceSeparatedInteger(param1,1);
      }
      
      private function getPetColor(param1:String) : int
      {
         var _loc2_:Array = param1.split(" ");
         if(_loc2_.length > 2)
         {
            return parseInt(_loc2_[2],16);
         }
         return 16777215;
      }
      
      private function getSpaceSeparatedInteger(param1:String, param2:int) : int
      {
         var _loc3_:Array = null;
         if(param1 != null)
         {
            _loc3_ = param1.split(" ");
            if(_loc3_.length > param2)
            {
               return int(_loc3_[param2]);
            }
         }
         return -1;
      }
      
      private function onNowPlayingChanged(param1:NowPlayingEvent) : void
      {
         var _loc3_:int = 0;
         var _loc2_:String = null;
         var _loc5_:String = null;
         var _loc4_:ISongInfo = null;
         if(var_1711 != null)
         {
            _loc3_ = param1.id;
            _loc2_ = "";
            _loc5_ = "";
            if(_loc3_ != -1)
            {
               if((_loc4_ = var_1711.getSongInfo(_loc3_)) != null)
               {
                  _loc2_ = _loc4_.name;
                  _loc5_ = _loc4_.creator;
               }
            }
            _container.events.dispatchEvent(new RoomWidgetSongUpdateEvent("RWSUE_PLAYING_CHANGED",_loc3_,_loc2_,_loc5_));
         }
      }
      
      private function onSongInfoReceivedEvent(param1:SongInfoReceivedEvent) : void
      {
         var _loc2_:ISongInfo = null;
         if(var_1711 != null)
         {
            _loc2_ = var_1711.getSongInfo(param1.id);
            if(_loc2_ != null)
            {
               _container.events.dispatchEvent(new RoomWidgetSongUpdateEvent("RWSUE_DATA_RECEIVED",param1.id,_loc2_.name,_loc2_.creator));
            }
         }
      }
      
      private function onRelationshipStatusEvent(param1:class_420) : void
      {
         if(var_1429 && var_1429.mainWindow.visible)
         {
            var_1429.setRelationshipStatus(param1.userId,param1.relationshipStatusMap);
         }
      }
      
      public function get isActivityDisplayEnabled() : Boolean
      {
         return _container != null && false && _container.config.getBoolean("activity.point.display.enabled");
      }
      
      public function setObjectData(param1:class_24) : void
      {
         if(_container.sessionDataManager.hasSecurity(5))
         {
            _container.connection.send(new class_625(var_1429.furniData.id,param1));
         }
      }
   }
}
