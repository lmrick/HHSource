package com.sulake.habbo.navigator.transitional
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.navigator.GuestRoomDoorbell;
   import com.sulake.habbo.navigator.GuestRoomPasswordInput;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.HabboNewNavigator;
   import com.sulake.habbo.navigator.class_1686;
   import com.sulake.habbo.navigator.domain.NavigatorData;
   import com.sulake.habbo.navigator.domain.Tabs;
   import com.sulake.habbo.navigator.inroom.RoomEventInfoCtrl;
   import com.sulake.habbo.navigator.inroom.RoomEventViewCtrl;
   import com.sulake.habbo.navigator.inroom.RoomInfoViewCtrl;
   import com.sulake.habbo.navigator.mainview.ITransitionalMainViewCtrl;
   import com.sulake.habbo.navigator.mainview.OfficialRoomEntryManager;
   import com.sulake.habbo.navigator.roomsettings.EnforceCategoryCtrl;
   import com.sulake.habbo.navigator.roomsettings.RoomCreateViewCtrl;
   import com.sulake.habbo.navigator.roomsettings.RoomFilterCtrl;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.tracking.class_1693;
   import com.sulake.habbo.window.class_1684;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import package_11.class_1569;
   
   public class LegacyNavigator implements class_1686
   {
       
      
      private var _newNavigator:HabboNewNavigator;
      
      private var var_1455:HabboNavigator;
      
      private var var_3784:com.sulake.habbo.navigator.transitional.FakeMainViewCtrl;
      
      private var var_2843:RoomSettingsCtrl;
      
      private var var_1987:RoomInfoViewCtrl;
      
      private var var_2129:RoomCreateViewCtrl;
      
      private var _passwordInput:GuestRoomPasswordInput;
      
      private var var_1799:GuestRoomDoorbell;
      
      private var _officialRoomEntryManager:OfficialRoomEntryManager;
      
      private var var_2743:RoomEventViewCtrl;
      
      private var var_3539:RoomEventInfoCtrl;
      
      private var var_2658:RoomFilterCtrl;
      
      private var var_3291:EnforceCategoryCtrl;
      
      public function LegacyNavigator(param1:HabboNewNavigator, param2:HabboNavigator)
      {
         super();
         _newNavigator = param1;
         var_1455 = param2;
         var_3784 = new com.sulake.habbo.navigator.transitional.FakeMainViewCtrl(_newNavigator,var_1455);
         var_2843 = new RoomSettingsCtrl(this);
         var_1987 = new RoomInfoViewCtrl(this);
         var_2129 = new RoomCreateViewCtrl(this);
         _passwordInput = new GuestRoomPasswordInput(this);
         var_1799 = new GuestRoomDoorbell(this);
         _officialRoomEntryManager = new OfficialRoomEntryManager(this);
         var_2743 = new RoomEventViewCtrl(this);
         var_3539 = new RoomEventInfoCtrl(this);
         var_2658 = new RoomFilterCtrl(this);
         var_3291 = new EnforceCategoryCtrl(this);
      }
      
      public function set oldNavigator(param1:HabboNavigator) : void
      {
         var_1455 = param1;
      }
      
      public function get assets() : class_21
      {
         return var_1455.assets;
      }
      
      public function get windowManager() : class_1684
      {
         return _newNavigator.windowManager;
      }
      
      public function get data() : NavigatorData
      {
         return var_1455.data;
      }
      
      public function get mainViewCtrl() : ITransitionalMainViewCtrl
      {
         return var_3784;
      }
      
      public function get tabs() : Tabs
      {
         return var_1455.tabs;
      }
      
      public function get roomInfoViewCtrl() : RoomInfoViewCtrl
      {
         return var_1987;
      }
      
      public function get roomCreateViewCtrl() : RoomCreateViewCtrl
      {
         return var_2129;
      }
      
      public function get communication() : class_25
      {
         return var_1455.communication;
      }
      
      public function get roomSettingsCtrl() : RoomSettingsCtrl
      {
         return var_2843;
      }
      
      public function get sessionData() : ISessionDataManager
      {
         return var_1455.sessionData;
      }
      
      public function get passwordInput() : GuestRoomPasswordInput
      {
         return var_1455.passwordInput;
      }
      
      public function get doorbell() : GuestRoomDoorbell
      {
         return var_1799;
      }
      
      public function get roomEventViewCtrl() : RoomEventViewCtrl
      {
         return var_2743;
      }
      
      public function get localization() : class_18
      {
         return var_1455.localization;
      }
      
      public function get officialRoomEntryManager() : OfficialRoomEntryManager
      {
         return var_1455.officialRoomEntryManager;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return var_1455.toolbar;
      }
      
      public function get habboHelp() : IHabboHelp
      {
         return var_1455.habboHelp;
      }
      
      public function get roomEventInfoCtrl() : RoomEventInfoCtrl
      {
         return var_3539;
      }
      
      public function get roomFilterCtrl() : RoomFilterCtrl
      {
         return var_2658;
      }
      
      public function get roomSessionManager() : IRoomSessionManager
      {
         return var_1455.roomSessionManager;
      }
      
      public function get enforceCategoryCtrl() : EnforceCategoryCtrl
      {
         return var_3291;
      }
      
      public function send(param1:IMessageComposer, param2:Boolean = false) : void
      {
         return var_1455.send(param1,param2);
      }
      
      public function getXmlWindow(param1:String, param2:uint = 1) : class_3127
      {
         return var_1455.getXmlWindow(param1,param2);
      }
      
      public function getText(param1:String) : String
      {
         return var_1455.getText(param1);
      }
      
      public function registerParameter(param1:String, param2:String, param3:String) : String
      {
         return var_1455.registerParameter(param1,param2,param3);
      }
      
      public function getButton(param1:String, param2:String, param3:Function, param4:int = 0, param5:int = 0, param6:int = 0) : class_3282
      {
         return var_1455.getButton(param1,param2,param3,param4,param5,param6);
      }
      
      public function refreshButton(param1:class_3151, param2:String, param3:Boolean, param4:Function, param5:int, param6:String = null) : void
      {
         return var_1455.refreshButton(param1,param2,param3,param4,param5,param6);
      }
      
      public function getButtonImage(param1:String, param2:String = "_png") : BitmapData
      {
         return var_1455.getButtonImage(param1,param2);
      }
      
      public function openCatalogClubPage(param1:String) : void
      {
         return var_1455.openCatalogClubPage(param1);
      }
      
      public function openCatalogRoomAdsPage() : void
      {
         return var_1455.openCatalogRoomAdsPage();
      }
      
      public function showFavouriteRooms() : void
      {
         return _newNavigator.performSearch("favorites");
      }
      
      public function showHistoryRooms() : void
      {
         return _newNavigator.performSearch("history");
      }
      
      public function showFrequentRooms() : void
      {
         return _newNavigator.performSearch("history_freq");
      }
      
      public function get tracking() : class_1693
      {
         return var_1455.tracking;
      }
      
      public function goToMainView() : void
      {
         var_2129.hide();
      }
      
      public function reportRoomFromWeb(param1:String, param2:String = null) : void
      {
         var_1455.enterRoomWebRequest(param1,true,param2);
      }
      
      public function goToRoom(param1:int, param2:Boolean, param3:String = "", param4:int = -1) : void
      {
         var_1455.goToRoom(param1,false,param3,param4);
      }
      
      public function isPerkAllowed(param1:String) : Boolean
      {
         return var_1455.isPerkAllowed(param1);
      }
      
      public function trackGoogle(param1:String, param2:String, param3:int = -1) : void
      {
         return var_1455.trackGoogle(param1,param2,param3);
      }
      
      public function getBoolean(param1:String) : Boolean
      {
         return var_1455.getBoolean(param1);
      }
      
      public function getInteger(param1:String, param2:int) : int
      {
         return var_1455.getInteger(param1,param2);
      }
      
      public function get events() : IEventDispatcher
      {
         return _newNavigator.events;
      }
      
      public function goToHomeRoom() : Boolean
      {
         _newNavigator.goToHomeRoom();
         return true;
      }
      
      public function performTagSearch(param1:String) : void
      {
         return _newNavigator.performTagSearch(param1);
      }
      
      public function performTextSearch(param1:String) : void
      {
         return _newNavigator.performTextSearch(param1);
      }
      
      public function performGuildBaseSearch() : void
      {
         return _newNavigator.performSearch("groups");
      }
      
      public function performCompetitionRoomsSearch(param1:int, param2:int) : void
      {
         return _newNavigator.performSearch("competition");
      }
      
      public function showOwnRooms() : void
      {
         return _newNavigator.performSearch("myworld_view");
      }
      
      public function goToPrivateRoom(param1:int) : void
      {
         _newNavigator.goToRoom(param1);
      }
      
      public function hasRoomRightsButIsNotOwner(param1:int) : Boolean
      {
         return var_1455.hasRoomRightsButIsNotOwner(param1);
      }
      
      public function removeRoomRights(param1:int) : void
      {
         return var_1455.removeRoomRights(param1);
      }
      
      public function goToRoomNetwork(param1:int, param2:Boolean) : void
      {
         return goToRoomNetwork(param1,param2);
      }
      
      public function startRoomCreation() : void
      {
         return _newNavigator.createRoom();
      }
      
      public function openNavigator(param1:Point = null) : void
      {
         return _newNavigator.open();
      }
      
      public function closeNavigator() : void
      {
         return _newNavigator.close();
      }
      
      public function get homeRoomId() : int
      {
         return var_1455.homeRoomId;
      }
      
      public function get enteredGuestRoomData() : class_1569
      {
         return var_1455.enteredGuestRoomData;
      }
      
      public function showToolbarHover(param1:Point) : void
      {
      }
      
      public function hideToolbarHover(param1:Boolean) : void
      {
      }
      
      public function toggleRoomInfoVisibility() : void
      {
         if(var_1987)
         {
            var_1987.toggle();
         }
      }
      
      public function canRateRoom() : Boolean
      {
         return var_1455.canRateRoom();
      }
      
      public function queueInterface(param1:IID, param2:Function = null) : IUnknown
      {
         return _newNavigator.queueInterface(param1,param2);
      }
      
      public function release(param1:IID) : uint
      {
         return _newNavigator.release(param1);
      }
      
      public function dispose() : void
      {
         var_2843.dispose();
         var_1987.dispose();
         var_2129.dispose();
         _passwordInput.dispose();
         var_1799.dispose();
         _officialRoomEntryManager.dispose();
         var_2743.dispose();
         var_3539.dispose();
         var_2658.dispose();
         var_3291 = null;
         var_1455 = null;
         _newNavigator = null;
      }
      
      public function get disposed() : Boolean
      {
         return var_1455 == null;
      }
      
      public function openCatalogRoomAdsExtendPage(param1:String, param2:String, param3:Date, param4:int) : void
      {
         return var_1455.openCatalogRoomAdsExtendPage(param1,param2,param3,param4);
      }
      
      public function getProperty(param1:String, param2:Dictionary = null) : String
      {
         return var_1455.getProperty(param1,param2);
      }
      
      public function get isDoorModeOverriddenInCurrentRoom() : Boolean
      {
         return var_1455.isDoorModeOverriddenInCurrentRoom;
      }
      
      public function trackNavigationDataPoint(param1:String, param2:String, param3:String = "", param4:int = 0) : void
      {
         return var_1455.trackNavigationDataPoint(param1,param2,param3,param4);
      }
      
      public function isRoomFavorite(param1:int) : Boolean
      {
         return var_1455.isRoomFavorite(param1);
      }
      
      public function isRoomHome(param1:int) : Boolean
      {
         return var_1455.isRoomHome(param1);
      }
      
      public function get visibleEventCategories() : Array
      {
         return var_1455.data.visibleEventCategories;
      }
      
      public function get roomSettingsControl() : RoomSettingsCtrl
      {
         return var_1455.roomSettingsCtrl;
      }
   }
}
