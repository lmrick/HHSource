package com.sulake.habbo.navigator
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3178;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.navigator.domain.NavigatorData;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.transitional.LegacyNavigator;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import package_10.class_346;
   import package_10.class_606;
   import package_10.class_826;
   import package_11.class_128;
   import package_11.class_1569;
   import package_11.class_1617;
   import package_11.class_1630;
   import package_11.class_288;
   import package_11.class_434;
   import package_11.class_446;
   import package_11.class_465;
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
   import package_11.class_879;
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
   import package_132.class_1061;
   import package_132.class_1087;
   import package_132.class_1266;
   import package_132.class_1286;
   import package_132.class_1295;
   import package_132.class_1305;
   import package_132.class_1356;
   import package_132.class_1377;
   import package_132.class_1427;
   import package_132.class_1441;
   import package_132.class_1488;
   import package_132.class_1514;
   import package_133.class_1188;
   import package_150.class_1340;
   import package_150.class_1421;
   import package_164.class_1175;
   import package_18.class_150;
   import package_18.class_3215;
   import package_18.class_338;
   import package_18.class_353;
   import package_18.class_674;
   import package_18.class_719;
   import package_18.class_897;
   import package_2.class_527;
   import package_2.class_784;
   import package_2.class_937;
   import package_22.class_316;
   import package_24.class_374;
   import package_24.class_406;
   import package_39.class_553;
   import package_5.class_788;
   import package_6.class_142;
   import package_6.class_530;
   import package_73.class_285;
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
   import package_78.class_980;
   
   public class NewIncomingMessages
   {
       
      
      private var _navigator:com.sulake.habbo.navigator.HabboNewNavigator;
      
      private var _messageListeners:Array;
      
      public function NewIncomingMessages(param1:com.sulake.habbo.navigator.HabboNewNavigator)
      {
         _messageListeners = [];
         super();
         _navigator = param1;
         var _loc2_:class_25 = _navigator.communication;
         addMessageListeners();
      }
      
      public function addMessageListeners() : void
      {
         var _loc1_:class_25 = _navigator.communication;
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_709(onRoomEventCancel)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_446(onCategoriesWithUserCount)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_927(onRoomSettingsSaveError)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_406(onFriendListUpdate)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_879(onPopularRoomTagsResult)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_288(onOfficialRooms)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_868(onBannedUsersFromRoom)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_606(onRoomExit)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_573(onUserFlatCats)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_792(onFlatControllerRemoved)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_980(onFlatControllerAdded)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_679(onFlatControllers)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_705(onRoomRating)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_374(onFriendsListFragment)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_1016(onNoSuchFlat)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_727(onRoomSettingsData)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_311(onRoomSettingsError)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_975(onFlatAccessDenied)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_593(onRoomEventEvent)));
         _messageListeners.push(_loc1_.connection.addMessageEvent(new class_674(onSavedSearches)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_285(onNoOwnedRoomsAlert)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_683(onCanCreateRoomEventEvent)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_434(onGuestRoomSearchResult)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_906(onMuteAllEvent)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_501(onUserEventCats)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_553(onRoomFilterSettings)));
         _messageListeners.push(_loc1_.connection.addMessageEvent(new class_150(onNavigatorSearchResultBlocks)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_826(onCantConnect)));
         _messageListeners.push(_loc1_.connection.addMessageEvent(new class_338(onNavigatorLiftedRooms)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_128(onFavourites)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_465(onRoomInfoUpdated)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_790(onDoorbell)));
         _messageListeners.push(_loc1_.connection.addMessageEvent(new class_353(onNavigatorPreferences)));
         _messageListeners.push(_loc1_.connection.addMessageEvent(new class_788(onGroupDetails)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_1000(onUserUnbannedFromRoom)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_346(onDoorOpened)));
         _messageListeners.push(_loc1_.connection.addMessageEvent(new class_897(onCollapsedCategories)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_720(onFavouriteChanged)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_515(onRoomSettingsSaved)));
         _messageListeners.push(_loc1_.connection.addMessageEvent(new class_719(onNavigatorMetaData)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_509(onCompetitionData)));
         _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_751(onFlatCreated)));
      }
      
      public function removeLegacyMessageListeners() : void
      {
         var _loc1_:class_25 = _navigator.communication;
         for each(var _loc2_ in _messageListeners)
         {
            _loc1_.removeHabboConnectionMessageEvent(_loc2_);
         }
         _messageListeners = [];
      }
      
      private function onNavigatorMetaData(param1:class_719) : void
      {
         _navigator.initialize(param1.getParser());
      }
      
      private function onNavigatorSearchResultBlocks(param1:class_150) : void
      {
         _navigator.onSearchResult(new class_3215(param1.getParser().searchResult));
      }
      
      private function onNavigatorLiftedRooms(param1:class_338) : void
      {
         _navigator.onLiftedRooms(param1.getParser());
      }
      
      private function onNavigatorPreferences(param1:class_353) : void
      {
         _navigator.onPreferences(param1.getParser());
      }
      
      private function onSavedSearches(param1:class_674) : void
      {
         _navigator.onSavedSearches(param1.getParser());
      }
      
      private function onGroupDetails(param1:class_788) : void
      {
         _navigator.onGroupDetails(param1.data);
      }
      
      private function onCollapsedCategories(param1:class_897) : void
      {
         _navigator.onCollapsedCategories(param1.getParser().collapsedCategories);
      }
      
      private function get data() : NavigatorData
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
            if(LegacyNavigator(_navigator.legacyNavigator).roomInfoViewCtrl != null)
            {
               LegacyNavigator(_navigator.legacyNavigator).roomInfoViewCtrl.refreshButtons(_navigator.data.enteredGuestRoom);
            }
         }
      }
      
      private function onNoSuchFlat(param1:IMessageEvent) : void
      {
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         var _loc2_:class_1188 = class_530(param1).getParser();
         _navigator.data.avatarId = _loc2_.id;
         LegacyNavigator(_navigator.legacyNavigator).send(new class_784());
         LegacyNavigator(_navigator.legacyNavigator).send(new class_937());
      }
      
      private function onUserRights(param1:IMessageEvent) : void
      {
         var _loc2_:class_142 = null;
         if(_navigator)
         {
            _loc2_ = class_142(param1);
            if(_loc2_.securityLevel >= 5)
            {
               _navigator.data.eventMod = true;
            }
            if(_loc2_.securityLevel >= 7)
            {
               _navigator.data.roomPicker = true;
            }
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
         class_14.log("Received GuestRoomSearch: " + (!!data.guestRoomSearchResults.rooms ? data.guestRoomSearchResults.rooms.length : " no rooms"));
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
         LegacyNavigator(_navigator.legacyNavigator).roomEventInfoCtrl.refresh();
      }
      
      private function onRoomEventCancel(param1:IMessageEvent) : void
      {
         data.roomEventData = null;
         LegacyNavigator(_navigator.legacyNavigator).roomEventInfoCtrl.refresh();
      }
      
      private function onCanCreateRoomEventEvent(param1:IMessageEvent) : void
      {
         var _loc3_:SimpleAlertView = null;
         var _loc2_:class_1266 = class_683(param1).getParser();
         class_14.log("CAN CREATE EVENT: " + _loc2_.canCreateEvent);
         if(_loc2_.canCreateEvent)
         {
            LegacyNavigator(_navigator.legacyNavigator).roomEventViewCtrl.show();
         }
         else
         {
            _loc3_ = new SimpleAlertView(LegacyNavigator(_navigator.legacyNavigator),"${navigator.cannotcreateevent.title}","${navigator.cannotcreateevent.error." + _loc2_.errorCode + "}");
            _loc3_.show();
            class_14.log("Cannot create an event just now...");
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
         LegacyNavigator(_navigator.legacyNavigator).goToRoom(_loc2_.flatId,true);
         LegacyNavigator(_navigator.legacyNavigator).mainViewCtrl.reloadRoomList(5);
         LegacyNavigator(_navigator.legacyNavigator).goToMainView();
         LegacyNavigator(_navigator.legacyNavigator).closeNavigator();
      }
      
      private function onGameStarted(param1:IMessageEvent) : void
      {
         LegacyNavigator(_navigator.legacyNavigator).mainViewCtrl.close();
      }
      
      private function onRoomExit(param1:IMessageEvent) : void
      {
         class_14.log("Navigator: exiting room");
         data.onRoomExit();
         LegacyNavigator(_navigator.legacyNavigator).roomInfoViewCtrl.close();
         LegacyNavigator(_navigator.legacyNavigator).roomEventInfoCtrl.close();
         LegacyNavigator(_navigator.legacyNavigator).roomEventViewCtrl.close();
         LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.close();
         LegacyNavigator(_navigator.legacyNavigator).roomFilterCtrl.close();
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
         var _loc2_:RoomsTabPageDecorator = RoomsTabPageDecorator(LegacyNavigator(_navigator.legacyNavigator).tabs.getTab(2).tabPageDecorator);
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
            LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onRoomSettings(_loc2_.data);
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
         LegacyNavigator(_navigator.legacyNavigator).roomFilterCtrl.onRoomFilterSettings(_loc2_.badWords);
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
         LegacyNavigator(_navigator.legacyNavigator).mainViewCtrl.reloadRoomList(5);
      }
      
      private function onRoomSettingsSaveError(param1:IMessageEvent) : void
      {
         var _loc2_:class_1131 = (param1 as class_927).getParser();
         LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onRoomSettingsSaveError(_loc2_.roomId,_loc2_.errorCode,_loc2_.info);
      }
      
      private function onRoomInfoUpdated(param1:IMessageEvent) : void
      {
         var _loc2_:class_1377 = (param1 as class_465).getParser();
         LegacyNavigator(_navigator.legacyNavigator).send(new class_527(_loc2_.flatId,false,false));
      }
      
      private function onFavourites(param1:IMessageEvent) : void
      {
         var _loc2_:class_1488 = (param1 as class_128).getParser();
         _navigator.data.onFavourites(_loc2_);
      }
      
      private function onFavouriteChanged(param1:IMessageEvent) : void
      {
         var _loc2_:class_1356 = (param1 as class_720).getParser();
         data.favouriteChanged(_loc2_.flatId,_loc2_.added);
         LegacyNavigator(_navigator.legacyNavigator).roomInfoViewCtrl.reload();
         LegacyNavigator(_navigator.legacyNavigator).mainViewCtrl.refresh();
      }
      
      private function onFlatControllers(param1:IMessageEvent) : void
      {
         var _loc2_:class_1112 = (param1 as class_679).getParser();
         LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onFlatControllers(_loc2_.roomId,_loc2_.controllers);
      }
      
      private function onFlatControllerAdded(param1:IMessageEvent) : void
      {
         var _loc2_:class_1315 = (param1 as class_980).getParser();
         LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onFlatControllerAdded(_loc2_.flatId,_loc2_.data);
      }
      
      private function onFlatControllerRemoved(param1:IMessageEvent) : void
      {
         var _loc2_:class_1211 = (param1 as class_792).getParser();
         class_14.log("Flat controller removed: " + _loc2_.flatId + ", " + _loc2_.userId);
         LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onFlatControllerRemoved(_loc2_.flatId,_loc2_.userId);
      }
      
      private function onBannedUsersFromRoom(param1:IMessageEvent) : void
      {
         var _loc2_:class_1341 = (param1 as class_868).getParser();
         class_14.log("Got Banned users for room: " + _loc2_.roomId + ", " + _loc2_.bannedUsers.length);
         LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onBannedUsersFromRoom(_loc2_.roomId,_loc2_.bannedUsers);
      }
      
      private function onUserUnbannedFromRoom(param1:IMessageEvent) : void
      {
         var _loc2_:class_1331 = (param1 as class_1000).getParser();
         class_14.log("User was unbanned from room. User Id: " + _loc2_.userId + " Room Id: " + _loc2_.roomId);
         LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onUserUnbannedFromRoom(_loc2_.roomId,_loc2_.userId);
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
         LegacyNavigator(_navigator.legacyNavigator).doorbell.showWaiting();
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
            LegacyNavigator(_navigator.legacyNavigator).doorbell.hide();
         }
      }
      
      private function onRoomRating(param1:IMessageEvent) : void
      {
         var _loc2_:class_1427 = (param1 as class_705).getParser();
         data.currentRoomRating = _loc2_.rating;
         data.canRate = _loc2_.canRate;
         LegacyNavigator(_navigator.legacyNavigator).roomInfoViewCtrl.reload();
      }
      
      private function onFlatAccessDenied(param1:IMessageEvent) : void
      {
         var _loc2_:class_1441 = (param1 as class_975).getParser();
         if(_loc2_.userName == null || _loc2_.userName == "")
         {
            LegacyNavigator(_navigator.legacyNavigator).doorbell.showNoAnswer();
         }
      }
      
      private function onFriendsListFragment(param1:IMessageEvent) : void
      {
         data.friendList.onFriendsListFragment(param1);
      }
      
      private function onFriendListUpdate(param1:IMessageEvent) : void
      {
         data.friendList.onFriendListUpdate(param1);
         LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onFriendListUpdate();
      }
      
      private function onCompetitionData(param1:class_509) : void
      {
         data.competitionRoomsData = param1.getParser().data;
      }
      
      private function forwardToRoom(param1:int) : void
      {
         LegacyNavigator(_navigator.legacyNavigator).send(new class_527(param1,false,true));
         LegacyNavigator(_navigator.legacyNavigator).trackNavigationDataPoint("Room Forward","go.roomforward","",param1);
      }
      
      private function onNoOwnedRoomsAlert(param1:class_285) : void
      {
         LegacyNavigator(_navigator.legacyNavigator).startRoomCreation();
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
               _loc2_ = new SimpleAlertView(LegacyNavigator(_navigator.legacyNavigator),"${navigator.guestroomfull.title}","${navigator.guestroomfull.text}");
               _loc2_.show();
               break;
            case 2:
               _loc2_ = new SimpleAlertView(LegacyNavigator(_navigator.legacyNavigator),"${room.queue.error.title}","${room.queue.error." + _loc3_.parameter + "}");
               _loc2_.show();
               break;
            case 3:
               _loc2_ = new SimpleAlertView(LegacyNavigator(_navigator.legacyNavigator),"${navigator.banned.title}","${navigator.banned.text}");
               _loc2_.show();
               break;
            default:
               _loc2_ = new SimpleAlertView(LegacyNavigator(_navigator.legacyNavigator),"${room.queue.error.title}","${room.queue.error.title}");
               _loc2_.show();
         }
         LegacyNavigator(_navigator.legacyNavigator).send(new class_316());
         var _loc4_:HabboToolbarEvent;
         (_loc4_ = new HabboToolbarEvent("HTE_TOOLBAR_CLICK")).iconId = "HTIE_ICON_RECEPTION";
         LegacyNavigator(_navigator.legacyNavigator).toolbar.events.dispatchEvent(_loc4_);
      }
   }
}
