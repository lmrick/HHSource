package com.sulake.habbo.navigator
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3178;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.configuration.enum.HabboComponentFlags;
   import com.sulake.habbo.navigator.domain.NavigatorData;
   import com.sulake.habbo.navigator.domain.RoomSessionTags;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.utils.class_3132;
   import package_10.class_127;
   import package_10.class_346;
   import package_10.class_606;
   import package_10.class_826;
   import package_11.class_1013;
   import package_11.class_128;
   import package_11.class_1569;
   import package_11.class_1617;
   import package_11.class_1630;
   import package_11.class_288;
   import package_11.class_434;
   import package_11.class_446;
   import package_11.class_465;
   import package_11.class_468;
   import package_11.class_501;
   import package_11.class_509;
   import package_11.class_573;
   import package_11.class_593;
   import package_11.class_683;
   import package_11.class_705;
   import package_11.class_709;
   import package_11.class_720;
   import package_11.class_751;
   import package_11.class_790;
   import package_11.class_846;
   import package_11.class_879;
   import package_11.class_921;
   import package_11.class_975;
   import package_126.class_1053;
   import package_126.class_1112;
   import package_126.class_1131;
   import package_126.class_1211;
   import package_126.class_1214;
   import package_126.class_1292;
   import package_126.class_1315;
   import package_126.class_1331;
   import package_126.class_1341;
   import package_126.class_1420;
   import package_126.class_1487;
   import package_130.class_1276;
   import package_132.class_1061;
   import package_132.class_1084;
   import package_132.class_1087;
   import package_132.class_1107;
   import package_132.class_1187;
   import package_132.class_1266;
   import package_132.class_1286;
   import package_132.class_1295;
   import package_132.class_1305;
   import package_132.class_1356;
   import package_132.class_1377;
   import package_132.class_1392;
   import package_132.class_1427;
   import package_132.class_1441;
   import package_132.class_1488;
   import package_132.class_1514;
   import package_133.class_1188;
   import package_150.class_1135;
   import package_150.class_1340;
   import package_150.class_1421;
   import package_154.class_1256;
   import package_164.class_1175;
   import package_17.class_486;
   import package_2.class_527;
   import package_2.class_784;
   import package_2.class_937;
   import package_22.class_316;
   import package_24.class_374;
   import package_24.class_406;
   import package_33.class_430;
   import package_39.class_553;
   import package_5.class_993;
   import package_6.class_142;
   import package_6.class_463;
   import package_6.class_530;
   import package_73.class_285;
   import package_75.class_402;
   import package_78.class_1000;
   import package_78.class_1016;
   import package_78.class_311;
   import package_78.class_515;
   import package_78.class_679;
   import package_78.class_727;
   import package_78.class_792;
   import package_78.class_868;
   import package_78.class_906;
   import package_78.class_927;
   import package_78.class_969;
   import package_78.class_980;
   
   public class IncomingMessages
   {
       
      
      private var _navigator:com.sulake.habbo.navigator.HabboNavigator;
      
      public function IncomingMessages(param1:com.sulake.habbo.navigator.HabboNavigator)
      {
         super();
         _navigator = param1;
         var _loc2_:class_25 = _navigator.communication;
         _loc2_.addHabboConnectionMessageEvent(new class_346(onDoorOpened));
         _loc2_.addHabboConnectionMessageEvent(new class_868(onBannedUsersFromRoom));
         _loc2_.addHabboConnectionMessageEvent(new class_509(onCompetitionData));
         _loc2_.addHabboConnectionMessageEvent(new class_927(onRoomSettingsSaveError));
         _loc2_.addHabboConnectionMessageEvent(new class_751(onFlatCreated));
         _loc2_.addHabboConnectionMessageEvent(new class_127(onRoomForward));
         _loc2_.addHabboConnectionMessageEvent(new class_709(onRoomEventCancel));
         _loc2_.addHabboConnectionMessageEvent(new class_606(onRoomExit));
         _loc2_.addHabboConnectionMessageEvent(new class_465(onRoomInfoUpdated));
         _loc2_.addHabboConnectionMessageEvent(new class_285(onNoOwnedRoomsAlert));
         _loc2_.addHabboConnectionMessageEvent(new class_515(onRoomSettingsSaved));
         _loc2_.addHabboConnectionMessageEvent(new class_593(onRoomEventEvent));
         _loc2_.addHabboConnectionMessageEvent(new class_826(onCantConnect));
         _loc2_.addHabboConnectionMessageEvent(new class_486(onRoomEnter));
         _loc2_.addHabboConnectionMessageEvent(new class_679(onFlatControllers));
         _loc2_.addHabboConnectionMessageEvent(new class_906(onMuteAllEvent));
         _loc2_.addHabboConnectionMessageEvent(new class_1016(onNoSuchFlat));
         _loc2_.addHabboConnectionMessageEvent(new class_434(onGuestRoomSearchResult));
         _loc2_.addHabboConnectionMessageEvent(new class_1013(onConvertedRoomId));
         _loc2_.addHabboConnectionMessageEvent(new class_128(onFavourites));
         _loc2_.addHabboConnectionMessageEvent(new class_446(onCategoriesWithUserCount));
         _loc2_.addHabboConnectionMessageEvent(new class_993(onSubscriptionInfo));
         _loc2_.addHabboConnectionMessageEvent(new class_683(onCanCreateRoomEventEvent));
         _loc2_.addHabboConnectionMessageEvent(new class_790(onDoorbell));
         _loc2_.addHabboConnectionMessageEvent(new class_288(onOfficialRooms));
         _loc2_.addHabboConnectionMessageEvent(new class_969(onEnforceRoomCategorySelection));
         _loc2_.addHabboConnectionMessageEvent(new class_879(onPopularRoomTagsResult));
         _loc2_.addHabboConnectionMessageEvent(new class_975(onFlatAccessDenied));
         _loc2_.addHabboConnectionMessageEvent(new class_142(onUserRights));
         _loc2_.addHabboConnectionMessageEvent(new class_705(onRoomRating));
         _loc2_.addHabboConnectionMessageEvent(new class_792(onFlatControllerRemoved));
         _loc2_.addHabboConnectionMessageEvent(new class_311(onRoomSettingsError));
         _loc2_.addHabboConnectionMessageEvent(new class_1000(onUserUnbannedFromRoom));
         _loc2_.addHabboConnectionMessageEvent(new class_727(onRoomSettingsData));
         _loc2_.addHabboConnectionMessageEvent(new class_530(onUserObject));
         _loc2_.addHabboConnectionMessageEvent(new class_846(onRoomInfo));
         _loc2_.addHabboConnectionMessageEvent(new class_980(onFlatControllerAdded));
         _loc2_.addHabboConnectionMessageEvent(new class_573(onUserFlatCats));
         _loc2_.addHabboConnectionMessageEvent(new class_463(onError));
         _loc2_.addHabboConnectionMessageEvent(new class_402(onGameStarted));
         _loc2_.addHabboConnectionMessageEvent(new class_921(onCanCreateRoom));
         _loc2_.addHabboConnectionMessageEvent(new class_501(onUserEventCats));
         _loc2_.addHabboConnectionMessageEvent(new class_553(onRoomFilterSettings));
         _loc2_.addHabboConnectionMessageEvent(new class_406(onFriendListUpdate));
         _loc2_.addHabboConnectionMessageEvent(new class_374(onFriendsListFragment));
         _loc2_.addHabboConnectionMessageEvent(new class_720(onFavouriteChanged));
         _loc2_.addHabboConnectionMessageEvent(new class_468(onNavigatorSettings));
      }
      
      public function get data() : NavigatorData
      {
         return _navigator.data;
      }
      
      private function onMuteAllEvent(param1:IMessageEvent) : void
      {
         var _loc4_:class_906;
         var _loc3_:class_1292 = (_loc4_ = param1 as class_906).getParser();
         var _loc2_:class_1569 = _navigator.data.enteredGuestRoom;
         if(_loc2_ != null)
         {
            _loc2_.allInRoomMuted = _loc3_.allMuted;
            if(false)
            {
               _navigator.roomInfoViewCtrl.refreshButtons(_navigator.data.enteredGuestRoom);
            }
         }
      }
      
      private function onNoSuchFlat(param1:IMessageEvent) : void
      {
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         var _loc2_:class_1188 = class_530(param1).getParser();
         data.avatarId = _loc2_.id;
         _navigator.send(new class_784());
         _navigator.send(new class_937());
      }
      
      private function onUserRights(param1:IMessageEvent) : void
      {
         var _loc2_:class_142 = class_142(param1);
         if(_loc2_.securityLevel >= 5)
         {
            _navigator.data.eventMod = true;
         }
         if(_loc2_.securityLevel >= 7)
         {
            _navigator.data.roomPicker = true;
         }
      }
      
      private function onCategoriesWithUserCount(param1:IMessageEvent) : void
      {
         var _loc2_:class_1305 = class_446(param1).getParser();
         data.categoriesWithVisitorData = _loc2_.data;
         class_14.log("Received Categories with user count: " + data.categoriesWithVisitorData.categoryToCurrentUserCountMap.length);
      }
      
      private function onOfficialRooms(param1:IMessageEvent) : void
      {
         var _loc2_:class_1286 = class_288(param1).getParser();
         data.officialRooms = _loc2_.data;
         data.adRoom = _loc2_.adRoom;
         data.promotedRooms = _loc2_.promotedRooms;
         class_14.log("Received Official rooms: " + data.officialRooms.entries.length);
      }
      
      private function onGuestRoomSearchResult(param1:IMessageEvent) : void
      {
         var _loc2_:class_1630 = class_434(param1).getParser().data;
         data.guestRoomSearchResults = _loc2_;
         class_14.log("Received GuestRoomSearch: " + data.guestRoomSearchResults.rooms.length);
      }
      
      private function onPopularRoomTagsResult(param1:IMessageEvent) : void
      {
         var _loc2_:class_1617 = class_879(param1).getParser().data;
         data.popularTags = _loc2_;
         class_14.log("Received popular room tags: " + data.popularTags.tags.length);
      }
      
      private function onRoomEventEvent(param1:IMessageEvent) : void
      {
         var _loc2_:class_1087 = class_593(param1).getParser();
         class_14.log("Got room event: " + _loc2_.data.ownerAvatarId + ", " + _loc2_.data.eventName);
         data.roomEventData = _loc2_.data.ownerAvatarId > 0 ? _loc2_.data : null;
         _navigator.roomEventInfoCtrl.refresh();
      }
      
      private function onRoomEventCancel(param1:IMessageEvent) : void
      {
         data.roomEventData = null;
         _navigator.roomEventInfoCtrl.refresh();
      }
      
      private function onCanCreateRoomEventEvent(param1:IMessageEvent) : void
      {
         var _loc3_:SimpleAlertView = null;
         var _loc2_:class_1266 = class_683(param1).getParser();
         class_14.log("CAN CREATE EVENT: " + _loc2_.canCreateEvent);
         if(_loc2_.canCreateEvent)
         {
            _navigator.roomEventViewCtrl.show();
         }
         else
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.cannotcreateevent.title}","${navigator.cannotcreateevent.error." + _loc2_.errorCode + "}");
            _loc3_.show();
            class_14.log("Cannot create an event just now...");
         }
      }
      
      private function onRoomEnter(param1:IMessageEvent) : void
      {
         var _loc2_:class_1256 = class_486(param1).getParser();
         class_14.log("Navigator: entering room");
         data.onRoomEnter(_loc2_);
         closeOpenCantConnectAlerts();
         _navigator.roomInfoViewCtrl.close();
         _navigator.send(new class_527(_loc2_.guestRoomId,true,false));
         class_14.log("Sent get guest room...");
         _navigator.roomEventInfoCtrl.refresh();
         _navigator.roomEventViewCtrl.close();
         _navigator.roomSettingsCtrl.close();
         _navigator.roomFilterCtrl.close();
         HabboWebTools.closeNews();
      }
      
      private function onRoomInfo(param1:IMessageEvent) : void
      {
         var _loc3_:* = false;
         var _loc4_:RoomSessionTags = null;
         var _loc2_:class_1084 = class_846(param1).getParser();
         class_14.log("Got room info: " + _loc2_.enterRoom + ", " + _loc2_.roomForward);
         if(_loc2_.enterRoom)
         {
            data.enteredRoom = _loc2_.data;
            data.currentRoomIsStaffPick = _loc2_.staffPick;
            _loc3_ = data.createdFlatId == _loc2_.data.flatId;
            if(!_loc3_ && _loc2_.data.displayRoomEntryAd)
            {
               requestRoomEnterAd();
            }
            data.createdFlatId = 0;
            if(false && data.enteredGuestRoom.habboGroupId > 0)
            {
               _navigator.roomEventInfoCtrl.expanded = false;
               _navigator.roomEventInfoCtrl.refresh();
            }
            if((_loc4_ = _navigator.data.getAndResetSessionTags()) != null)
            {
               _navigator.send(_loc4_.getMsg());
            }
         }
         else if(_loc2_.roomForward)
         {
            if(_loc2_.data.doorMode == 1 && (_navigator.sessionData.userName != _loc2_.data.ownerName && _loc2_.isGroupMember == false))
            {
               _navigator.doorbell.show(_loc2_.data);
            }
            else if(_loc2_.data.doorMode == 2 && (_navigator.sessionData.userName != _loc2_.data.ownerName && _loc2_.isGroupMember == false))
            {
               _navigator.passwordInput.show(_loc2_.data);
            }
            else
            {
               if(_loc2_.data.doorMode == 4 && !_navigator.sessionData.isAmbassador && !_navigator.sessionData.isRealNoob && !_navigator.sessionData.isAnyRoomController)
               {
                  return;
               }
               _navigator.goToRoom(_loc2_.data.flatId,false);
            }
         }
         else
         {
            data.enteredRoom = _loc2_.data;
            data.currentRoomIsStaffPick = _loc2_.staffPick;
            _navigator.roomInfoViewCtrl.reload();
         }
      }
      
      private function requestRoomEnterAd() : void
      {
         if(_navigator.getProperty("roomenterad.habblet.enabled") == "true")
         {
            HabboWebTools.openRoomEnterAd();
         }
      }
      
      private function onFlatCreated(param1:IMessageEvent) : void
      {
         var _loc2_:class_1514 = class_751(param1).getParser();
         ErrorReportStorage.addDebugData("IncomingEvent","Flat created: " + _loc2_.flatId + ", " + _loc2_.flatName);
         data.createdFlatId = _loc2_.flatId;
         _navigator.goToRoom(_loc2_.flatId,true);
         _navigator.mainViewCtrl.reloadRoomList(5);
         _navigator.goToMainView();
         _navigator.closeNavigator();
      }
      
      private function onGameStarted(param1:IMessageEvent) : void
      {
         _navigator.mainViewCtrl.close();
      }
      
      private function onSubscriptionInfo(param1:IMessageEvent) : void
      {
         var _loc2_:class_1276 = class_993(param1).getParser();
         class_14.log("Got subscription info: " + _loc2_.productName + ", " + _loc2_.daysToPeriodEnd + ", " + _loc2_.memberPeriods + ", " + _loc2_.periodsSubscribedAhead + ", " + _loc2_.responseType);
         data.hcMember = _loc2_.daysToPeriodEnd > 0;
      }
      
      private function onRoomForward(param1:IMessageEvent) : void
      {
         var _loc2_:class_1135 = class_127(param1).getParser();
         class_14.log("Got room forward: " + _loc2_.roomId);
         forwardToRoom(_loc2_.roomId);
      }
      
      private function onConvertedRoomId(param1:IMessageEvent) : void
      {
         var _loc2_:class_1107 = class_1013(param1).getParser();
         if(false)
         {
            _navigator.habboHelp.reportRoom(_loc2_.convertedId,_navigator.webRoomReportedName,"");
         }
         else
         {
            class_14.log("Got converted room ID for " + _loc2_.globalId + ", forward to room " + _loc2_.convertedId);
            forwardToRoom(_loc2_.convertedId);
         }
      }
      
      private function onNavigatorSettings(param1:IMessageEvent) : void
      {
         var _loc6_:Boolean = false;
         var _loc4_:* = false;
         var _loc7_:int = 0;
         var _loc5_:Boolean = false;
         var _loc2_:class_1187 = class_468(param1).getParser();
         class_14.log("Got navigator settings: " + _loc2_.homeRoomId);
         var _loc3_:* = !_navigator.data.settingsReceived;
         _navigator.data.homeRoomId = _loc2_.homeRoomId;
         _navigator.data.settingsReceived = true;
         _navigator.mainViewCtrl.refresh();
         var _loc8_:int = -1;
         var _loc9_:int = -1;
         if(_loc3_ && !HabboComponentFlags.isRoomViewerMode(_navigator.flags))
         {
            _loc6_ = false;
            _loc4_ = false;
            if(_navigator.propertyExists("friend.id"))
            {
               _loc8_ = 0;
               _navigator.send(new class_430(int(_navigator.getProperty("friend.id"))));
            }
            if(_navigator.propertyExists("forward.type") && _navigator.propertyExists("forward.id"))
            {
               _loc8_ = int(_navigator.getProperty("forward.type"));
               _loc9_ = int(_navigator.getProperty("forward.id"));
            }
            _loc4_ = _loc2_.roomIdToEnter <= 0;
            if(_loc8_ == 2)
            {
               class_14.log("Guest room forward on enter: " + _loc9_);
               forwardToRoom(_loc9_);
            }
            else if(_loc8_ == -1)
            {
               if(!_loc4_)
               {
                  if((_loc7_ = _loc2_.roomIdToEnter) != _navigator.data.homeRoomId)
                  {
                     this._navigator.goToRoom(_loc7_,true);
                  }
                  else if(!(_loc5_ = this._navigator.goToHomeRoom()))
                  {
                     _loc6_ = true;
                  }
               }
            }
            if(_loc6_ && !_navigator.mainViewCtrl.isOpen())
            {
               _navigator.mainViewCtrl.onNavigatorToolBarIconClick();
            }
         }
         else
         {
            _navigator.roomInfoViewCtrl.reload();
         }
      }
      
      private function onRoomExit(param1:IMessageEvent) : void
      {
         class_14.log("Navigator: exiting room");
         data.onRoomExit();
         _navigator.roomInfoViewCtrl.close();
         _navigator.roomEventInfoCtrl.close();
         _navigator.roomEventViewCtrl.close();
         _navigator.roomSettingsCtrl.close();
         _navigator.roomFilterCtrl.close();
         var _loc2_:Boolean = _navigator.getBoolean("news.auto_popup.enabled");
         if(_loc2_)
         {
            HabboWebTools.openNews();
         }
      }
      
      private function onUserFlatCats(param1:IMessageEvent) : void
      {
         var _loc3_:class_1295 = (param1 as class_573).getParser();
         _navigator.data.categories = _loc3_.nodes;
         var _loc2_:RoomsTabPageDecorator = RoomsTabPageDecorator(_navigator.tabs.getTab(2).tabPageDecorator);
         _loc2_.prepareRoomCategories();
      }
      
      private function onUserEventCats(param1:IMessageEvent) : void
      {
         var _loc2_:class_1061 = (param1 as class_501).getParser();
         _navigator.data.eventCategories = _loc2_.eventCategories;
      }
      
      private function onRoomSettingsData(param1:IMessageEvent) : void
      {
         var _loc2_:class_1053 = null;
         try
         {
            _loc2_ = (param1 as class_727).getParser();
            _navigator.roomSettingsCtrl.onRoomSettings(_loc2_.data);
            class_14.log("GOT ROOM SETTINGS DATA: " + _loc2_.data.name + ", " + _loc2_.data.maximumVisitors + ", " + _loc2_.data.maximumVisitorsLimit);
         }
         catch(e:Error)
         {
            class_14.log("CRASHED WHILE PROCESSING ROOM SETTINGS DATA!");
         }
      }
      
      private function onRoomFilterSettings(param1:IMessageEvent) : void
      {
         var _loc2_:class_1175 = (param1 as class_553).getParser();
         _navigator.roomFilterCtrl.onRoomFilterSettings(_loc2_.badWords);
         class_14.log("GOT ROOM FILTER SETTINGS: " + _loc2_.badWords);
      }
      
      private function onRoomSettingsError(param1:IMessageEvent) : void
      {
         var _loc2_:class_1214 = (param1 as class_311).getParser();
      }
      
      private function onRoomSettingsSaved(param1:IMessageEvent) : void
      {
         var _loc2_:class_1420 = (param1 as class_515).getParser();
         ErrorReportStorage.addDebugData("IncomingEvent","Room settings saved: " + _loc2_.roomId);
         _navigator.mainViewCtrl.reloadRoomList(5);
      }
      
      private function onRoomSettingsSaveError(param1:IMessageEvent) : void
      {
         var _loc2_:class_1131 = (param1 as class_927).getParser();
         _navigator.roomSettingsCtrl.onRoomSettingsSaveError(_loc2_.roomId,_loc2_.errorCode,_loc2_.info);
      }
      
      private function onRoomInfoUpdated(param1:IMessageEvent) : void
      {
         var _loc2_:class_1377 = (param1 as class_465).getParser();
         class_14.log("ROOM UPDATED: " + _loc2_.flatId);
         _navigator.send(new class_527(_loc2_.flatId,false,false));
      }
      
      private function onFavourites(param1:IMessageEvent) : void
      {
         var _loc2_:class_1488 = (param1 as class_128).getParser();
         _navigator.data.onFavourites(_loc2_);
      }
      
      private function onFavouriteChanged(param1:IMessageEvent) : void
      {
         var _loc2_:class_1356 = (param1 as class_720).getParser();
         class_14.log("Received favourite changed: " + _loc2_.flatId + ", " + _loc2_.added);
         _navigator.data.favouriteChanged(_loc2_.flatId,_loc2_.added);
         _navigator.roomInfoViewCtrl.reload();
         _navigator.mainViewCtrl.refresh();
      }
      
      private function onCanCreateRoom(param1:IMessageEvent) : void
      {
         var _loc2_:AlertView = null;
         var _loc3_:class_1392 = (param1 as class_921).getParser();
         class_14.log("Can create room: " + _loc3_.resultCode + ", " + _loc3_.roomLimit);
         if(_loc3_.resultCode == 0)
         {
            _navigator.roomCreateViewCtrl.show();
         }
         else
         {
            _navigator.registerParameter("navigator.createroom.limitreached","limit","" + _loc3_.roomLimit);
            if(_navigator.sessionData.hasVip)
            {
               _loc2_ = new SimpleAlertView(_navigator,"${navigator.createroom.error}","${navigator.createroom.limitreached}");
            }
            else
            {
               _loc2_ = new ClubPromoAlertView(_navigator,"${navigator.createroom.error}","${navigator.createroom.limitreached}","${navigator.createroom.vippromo}");
            }
            _loc2_.show();
         }
      }
      
      private function onFlatControllers(param1:IMessageEvent) : void
      {
         var _loc2_:class_1112 = (param1 as class_679).getParser();
         class_14.log("Got flat controllers: " + _loc2_.roomId + ", " + _loc2_.controllers.length);
         _navigator.roomSettingsCtrl.onFlatControllers(_loc2_.roomId,_loc2_.controllers);
      }
      
      private function onFlatControllerAdded(param1:IMessageEvent) : void
      {
         var _loc2_:class_1315 = (param1 as class_980).getParser();
         class_14.log("Flat controller added: " + _loc2_.flatId + ", " + _loc2_.data.userId + ", " + _loc2_.data.userName);
         _navigator.roomSettingsCtrl.onFlatControllerAdded(_loc2_.flatId,_loc2_.data);
      }
      
      private function onFlatControllerRemoved(param1:IMessageEvent) : void
      {
         var _loc2_:class_1211 = (param1 as class_792).getParser();
         class_14.log("Flat controller removed: " + _loc2_.flatId + ", " + _loc2_.userId);
         _navigator.roomSettingsCtrl.onFlatControllerRemoved(_loc2_.flatId,_loc2_.userId);
      }
      
      private function onBannedUsersFromRoom(param1:IMessageEvent) : void
      {
         var _loc2_:class_1341 = (param1 as class_868).getParser();
         class_14.log("Got Banned users for room: " + _loc2_.roomId + ", " + _loc2_.bannedUsers.length);
         _navigator.roomSettingsCtrl.onBannedUsersFromRoom(_loc2_.roomId,_loc2_.bannedUsers);
      }
      
      private function onUserUnbannedFromRoom(param1:IMessageEvent) : void
      {
         var _loc2_:class_1331 = (param1 as class_1000).getParser();
         class_14.log("User was unbanned from room. User Id: " + _loc2_.userId + " Room Id: " + _loc2_.roomId);
         _navigator.roomSettingsCtrl.onUserUnbannedFromRoom(_loc2_.roomId,_loc2_.userId);
      }
      
      private function onError(param1:IMessageEvent) : void
      {
         var event:IMessageEvent = param1;
         var error:class_463 = event as class_463;
         if(error == null)
         {
            return;
         }
         switch(error.getParser().errorCode)
         {
            case -100002:
               _navigator.passwordInput.showRetry();
               break;
            case 4009:
               _navigator.windowManager.alert("${generic.alert.title}","${navigator.alert.need.to.be.vip}",0,function(param1:class_3132, param2:class_3134):void
               {
                  param1.dispose();
               });
               break;
            case 4010:
               _navigator.windowManager.alert("${generic.alert.title}","${navigator.alert.invalid_room_name}",0,function(param1:class_3132, param2:class_3134):void
               {
                  param1.dispose();
               });
               break;
            case 4011:
               _navigator.windowManager.alert("${generic.alert.title}","${navigator.alert.cannot_perm_ban}",0,function(param1:class_3132, param2:class_3134):void
               {
                  param1.dispose();
               });
               break;
            case 4013:
               _navigator.windowManager.alert("${generic.alert.title}","${navigator.alert.room_in_maintenance}",0,function(param1:class_3132, param2:class_3134):void
               {
                  param1.dispose();
               });
               break;
            case -100005:
               _navigator.windowManager.alert("${generic.alert.title}","${notification.nft_token_required}",0,function(param1:class_3132, param2:class_3134):void
               {
                  param1.dispose();
               });
         }
      }
      
      private function onDoorbell(param1:IMessageEvent) : void
      {
         var _loc2_:class_790 = param1 as class_790;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.userName != "")
         {
            return;
         }
         _navigator.doorbell.showWaiting();
      }
      
      private function onDoorOpened(param1:IMessageEvent) : void
      {
         var _loc3_:class_346 = param1 as class_346;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc2_:class_1421 = _loc3_.getParser();
         if(_loc2_ != null && (_loc2_.userName == null || _loc2_.userName.length == 0))
         {
            _navigator.doorbell.hide();
         }
      }
      
      private function onRoomRating(param1:IMessageEvent) : void
      {
         var _loc2_:class_1427 = (param1 as class_705).getParser();
         _navigator.data.currentRoomRating = _loc2_.rating;
         _navigator.data.canRate = _loc2_.canRate;
         this._navigator.roomInfoViewCtrl.reload();
      }
      
      private function onFlatAccessDenied(param1:IMessageEvent) : void
      {
         var _loc2_:class_1441 = (param1 as class_975).getParser();
         if(_loc2_.userName == null || _loc2_.userName == "")
         {
            _navigator.doorbell.showNoAnswer();
         }
      }
      
      private function onFriendsListFragment(param1:IMessageEvent) : void
      {
         _navigator.data.friendList.onFriendsListFragment(param1);
      }
      
      private function onFriendListUpdate(param1:IMessageEvent) : void
      {
         _navigator.data.friendList.onFriendListUpdate(param1);
         _navigator.roomSettingsCtrl.onFriendListUpdate();
      }
      
      private function onCompetitionData(param1:class_509) : void
      {
         _navigator.data.competitionRoomsData = param1.getParser().data;
      }
      
      private function forwardToRoom(param1:int) : void
      {
         _navigator.send(new class_527(param1,false,true));
         _navigator.trackNavigationDataPoint("Room Forward","go.roomforward","",param1);
      }
      
      private function onNoOwnedRoomsAlert(param1:class_285) : void
      {
         _navigator.startRoomCreation();
      }
      
      private function closeOpenCantConnectAlerts() : void
      {
         var _loc1_:* = null;
         var _loc7_:class_3178 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:class_3127 = null;
         var _loc3_:AlertView = null;
         if(_navigator != null)
         {
            _loc1_ = [];
            _loc4_ = int((_loc7_ = _navigator.windowManager.getWindowContext(2)).getDesktopWindow().numChildren);
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               if((_loc6_ = _loc7_.getDesktopWindow().getChildAt(_loc5_)).tags.indexOf("SimpleAlertView") > -1)
               {
                  _loc1_.push(_loc6_);
               }
               _loc5_++;
            }
            if(_loc1_.length > 0)
            {
               for each(var _loc2_ in _loc1_)
               {
                  _loc3_ = AlertView.findAlertView(_loc2_);
                  if(_loc3_ != null)
                  {
                     _loc3_.dispose();
                  }
               }
            }
         }
      }
      
      private function onCantConnect(param1:IMessageEvent) : void
      {
         var _loc2_:SimpleAlertView = null;
         var _loc3_:class_1340 = (param1 as class_826).getParser();
         class_14.log("FAILED TO CONNECT: REASON: " + _loc3_.reason);
         switch(_loc3_.reason - 1)
         {
            case 0:
               _loc2_ = new SimpleAlertView(_navigator,"${navigator.guestroomfull.title}","${navigator.guestroomfull.text}");
               _loc2_.show();
               break;
            case 2:
               _loc2_ = new SimpleAlertView(_navigator,"${room.queue.error.title}","${room.queue.error." + _loc3_.parameter + "}");
               _loc2_.show();
               break;
            case 3:
               _loc2_ = new SimpleAlertView(_navigator,"${navigator.banned.title}","${navigator.banned.text}");
               _loc2_.show();
               break;
            default:
               _loc2_ = new SimpleAlertView(_navigator,"${room.queue.error.title}","${room.queue.error.title}");
               _loc2_.show();
         }
         _navigator.send(new class_316());
         var _loc4_:HabboToolbarEvent;
         (_loc4_ = new HabboToolbarEvent("HTE_TOOLBAR_CLICK")).iconId = "HTIE_ICON_RECEPTION";
         _navigator.toolbar.events.dispatchEvent(_loc4_);
      }
      
      private function onEnforceRoomCategorySelection(param1:IMessageEvent) : void
      {
         var _loc2_:class_1487 = (param1 as class_969).getParser();
         _navigator.enforceCategoryCtrl.show(_loc2_.selectionType);
      }
   }
}
