package com.sulake.habbo.navigator
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.runtime.events.ILinkEventTracker;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.habbo.avatar.class_1690;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.navigator.domain.NavigatorData;
   import com.sulake.habbo.navigator.domain.Tabs;
   import com.sulake.habbo.navigator.inroom.*;
   import com.sulake.habbo.navigator.mainview.ITransitionalMainViewCtrl;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.OfficialRoomEntryManager;
   import com.sulake.habbo.navigator.roomsettings.EnforceCategoryCtrl;
   import com.sulake.habbo.navigator.roomsettings.RoomCreateViewCtrl;
   import com.sulake.habbo.navigator.roomsettings.RoomFilterCtrl;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.toolbar.ToolbarHoverCtrl;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.PerksUpdatedEvent;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.tracking.class_1693;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboHelp;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDHabboTracking;
   import com.sulake.iid.IIDHabboWindowManager;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.display.BitmapData;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import package_11.class_1559;
   import package_11.class_1569;
   import package_2.class_119;
   import package_2.class_373;
   import package_2.class_502;
   import package_2.class_527;
   
   public class HabboNavigator extends class_20 implements class_1685, class_1686, ILinkEventTracker
   {
       
      
      private var _communication:class_25;
      
      private var _roomSessionManager:IRoomSessionManager;
      
      private var _windowManager:class_1684;
      
      private var _localization:class_18;
      
      private var _sessionData:ISessionDataManager;
      
      private var _tracking:class_1693;
      
      private var _catalog:IHabboCatalog;
      
      private var _habboHelp:IHabboHelp;
      
      private var _avatarManager:class_1690;
      
      private var var_1499:MainViewCtrl;
      
      private var var_1987:RoomInfoViewCtrl;
      
      private var var_2129:RoomCreateViewCtrl;
      
      private var var_45:NavigatorData;
      
      private var var_1995:Tabs;
      
      private var var_2029:class_21;
      
      private var var_2619:com.sulake.habbo.navigator.class_3136;
      
      private var _toolbar:IHabboToolbar;
      
      private var var_2843:RoomSettingsCtrl;
      
      private var _passwordInput:com.sulake.habbo.navigator.GuestRoomPasswordInput;
      
      private var var_1799:com.sulake.habbo.navigator.GuestRoomDoorbell;
      
      private var _officialRoomEntryManager:OfficialRoomEntryManager;
      
      private var var_2743:RoomEventViewCtrl;
      
      private var var_3539:RoomEventInfoCtrl;
      
      private var var_2658:RoomFilterCtrl;
      
      private var var_2041:ToolbarHoverCtrl;
      
      private var var_3291:EnforceCategoryCtrl;
      
      private var var_4232:Boolean = true;
      
      private var _webRoomReportedName:String = null;
      
      public function HabboNavigator(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         super(param1,param2,param3);
         var_2029 = new AssetLibraryCollection("NavigatorComponent");
         var_45 = new NavigatorData(this);
         var_1499 = new MainViewCtrl(this);
         var_1987 = new RoomInfoViewCtrl(this);
         var_2129 = new RoomCreateViewCtrl(this);
         _passwordInput = new com.sulake.habbo.navigator.GuestRoomPasswordInput(this);
         var_1799 = new com.sulake.habbo.navigator.GuestRoomDoorbell(this);
         var_1995 = new Tabs(this);
         _officialRoomEntryManager = new OfficialRoomEntryManager(this);
         var_2743 = new RoomEventViewCtrl(this);
         var_3539 = new RoomEventInfoCtrl(this);
         var_2658 = new RoomFilterCtrl(this);
         var_3291 = new EnforceCategoryCtrl(this);
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get data() : NavigatorData
      {
         return var_45;
      }
      
      public function get mainViewCtrl() : ITransitionalMainViewCtrl
      {
         return var_1499;
      }
      
      public function get tabs() : Tabs
      {
         return var_1995;
      }
      
      public function get roomInfoViewCtrl() : RoomInfoViewCtrl
      {
         return var_1987;
      }
      
      public function get roomCreateViewCtrl() : RoomCreateViewCtrl
      {
         return var_2129;
      }
      
      public function get assetLibrary() : class_21
      {
         return var_2029;
      }
      
      public function get communication() : class_25
      {
         return _communication;
      }
      
      public function get roomSettingsCtrl() : RoomSettingsCtrl
      {
         return var_2843;
      }
      
      public function get sessionData() : ISessionDataManager
      {
         return _sessionData;
      }
      
      public function get passwordInput() : com.sulake.habbo.navigator.GuestRoomPasswordInput
      {
         return _passwordInput;
      }
      
      public function get doorbell() : com.sulake.habbo.navigator.GuestRoomDoorbell
      {
         return var_1799;
      }
      
      public function get roomEventViewCtrl() : RoomEventViewCtrl
      {
         return var_2743;
      }
      
      public function get officialRoomEntryManager() : OfficialRoomEntryManager
      {
         return _officialRoomEntryManager;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return _toolbar;
      }
      
      public function get habboHelp() : IHabboHelp
      {
         return _habboHelp;
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
         return _roomSessionManager;
      }
      
      public function get enforceCategoryCtrl() : EnforceCategoryCtrl
      {
         return var_3291;
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communication = param1;
         }),new ComponentDependency(new IIDHabboRoomSessionManager(),function(param1:IRoomSessionManager):void
         {
            _roomSessionManager = param1;
         }),new ComponentDependency(new IIDHabboToolbar(),function(param1:IHabboToolbar):void
         {
            _toolbar = param1;
         },false,[{
            "type":"HTE_TOOLBAR_CLICK",
            "callback":onHabboToolbarEvent
         }]),new ComponentDependency(new IIDHabboCatalog(),function(param1:IHabboCatalog):void
         {
            _catalog = param1;
         },false),new ComponentDependency(new IIDSessionDataManager(),function(param1:ISessionDataManager):void
         {
            _sessionData = param1;
         },true,[{
            "type":"PUE_perks_updated",
            "callback":onPerksUpdated
         }]),new ComponentDependency(new IIDHabboLocalizationManager(),function(param1:class_18):void
         {
            _localization = param1;
         }),new ComponentDependency(new IIDHabboWindowManager(),function(param1:class_1684):void
         {
            _windowManager = param1;
         }),new ComponentDependency(new IIDHabboTracking(),function(param1:class_1693):void
         {
            _tracking = param1;
         }),new ComponentDependency(new IIDAvatarRenderManager(),function(param1:class_1690):void
         {
            _avatarManager = param1;
         }),new ComponentDependency(new IIDHabboHelp(),function(param1:IHabboHelp):void
         {
            _habboHelp = param1;
         },false),new ComponentDependency(new IIDHabboLocalizationManager(),function(param1:class_18):void
         {
            _localization = param1;
         }),new ComponentDependency(new IIDHabboLocalizationManager(),function(param1:class_18):void
         {
            _localization = param1;
         })]);
      }
      
      override protected function initComponent() : void
      {
         var_2619 = new com.sulake.habbo.navigator.class_3136(this);
         _roomSessionManager.events.addEventListener("RSE_CREATED",onRoomSessionCreatedEvent);
         if(!_sessionData.isPerkAllowed("NAVIGATOR_PHASE_TWO_2014"))
         {
            context.addLinkEventTracker(this);
         }
         var _loc1_:String = getProperty("navigator.default_tab");
         if(getInteger("new.identity",0) > 0)
         {
            _loc1_ = getProperty("new.identity.navigator.default_tab");
         }
         tabs.setSelectedTab(Tabs.tabIdFromName(_loc1_,2));
         var_2843 = new RoomSettingsCtrl(this);
         if(false)
         {
            ExternalInterface.addCallback("openroom",enterRoomWebRequest);
         }
      }
      
      public function enterRoomWebRequest(param1:String, param2:Boolean = false, param3:String = null) : void
      {
         var_4232 = param2;
         _webRoomReportedName = param3;
         send(new class_119(param1));
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(var_1499)
         {
            var_1499.dispose();
            var_1499 = null;
         }
         if(_roomSessionManager != null)
         {
            _roomSessionManager.events.removeEventListener("RSE_CREATED",onRoomSessionCreatedEvent);
         }
         context.removeLinkEventTracker(this);
         if(_toolbar != null && false)
         {
            _toolbar.events.removeEventListener("HTE_TOOLBAR_CLICK",onHabboToolbarEvent);
         }
         if(var_1987)
         {
            var_1987.dispose();
            var_1987 = null;
         }
         if(var_2658)
         {
            var_2658.dispose();
            var_2658 = null;
         }
         if(var_2129)
         {
            var_2129.dispose();
            var_2129 = null;
         }
         if(_officialRoomEntryManager)
         {
            _officialRoomEntryManager.dispose();
            _officialRoomEntryManager = null;
         }
         if(var_2743)
         {
            var_2743.dispose();
            var_2743 = null;
         }
         if(var_2843)
         {
            var_2843.dispose();
            var_2843 = null;
         }
         if(var_2041)
         {
            var_2041.dispose();
            var_2041 = null;
         }
         super.dispose();
      }
      
      public function startRoomCreation() : void
      {
         var_2129.show();
      }
      
      public function goToPrivateRoom(param1:int) : void
      {
         send(new class_527(param1,false,true));
      }
      
      public function removeRoomRights(param1:int) : void
      {
         send(new class_502(param1));
      }
      
      public function hasRoomRightsButIsNotOwner(param1:int) : Boolean
      {
         var _loc2_:IRoomSession = null;
         if(_roomSessionManager)
         {
            _loc2_ = _roomSessionManager.getSession(param1);
            return _loc2_.roomControllerLevel == 1 && !_loc2_.isRoomOwner;
         }
         return false;
      }
      
      public function goToRoomNetwork(param1:int, param2:Boolean) : void
      {
         var _loc3_:int = 0;
         if(_roomSessionManager)
         {
            var_1987.close();
            _loc3_ = 0;
            if(param2 && false)
            {
               _loc3_ = 0;
            }
            _roomSessionManager.gotoRoomNetwork(param1,_loc3_);
         }
      }
      
      public function goToRoom(param1:int, param2:Boolean, param3:String = "", param4:int = -1) : void
      {
         var _loc5_:int = 0;
         if(_roomSessionManager)
         {
            class_14.log("[HabboNavigator] Go to room: " + param1);
            if(param2)
            {
               var_1499.close();
            }
            _roomSessionManager.gotoRoom(param1,param3);
            if(tabs.getSelected())
            {
               _loc5_ = param4 > -1 ? param4 + 1 : 0;
               switch(tabs.getSelected().id - 1)
               {
                  case 0:
                     trackNavigationDataPoint("Events","go.events",String(param1),_loc5_);
                     break;
                  case 1:
                     trackNavigationDataPoint(tabs.getSelected().tabPageDecorator.filterCategory,"go.rooms",String(param1),_loc5_);
                     break;
                  case 2:
                     trackNavigationDataPoint(tabs.getSelected().tabPageDecorator.filterCategory,"go.me",String(param1),_loc5_);
                     break;
                  case 3:
                     trackNavigationDataPoint(tabs.getSelected().tabPageDecorator.filterCategory,"go.official",String(param1),_loc5_);
                     break;
                  case 4:
                     trackNavigationDataPoint("Search","go.search",String(param1),_loc5_);
               }
            }
         }
         else
         {
            class_14.log("[HabboNavigator] Room Session Manager is not initialized. Can not enter: " + param1);
         }
      }
      
      public function goToHomeRoom() : Boolean
      {
         if(this.var_45.homeRoomId < 1)
         {
            class_14.log("No home room set while attempting to go to home room");
            return false;
         }
         this.goToRoom(this.var_45.homeRoomId,true);
         return true;
      }
      
      public function send(param1:IMessageComposer, param2:Boolean = false) : void
      {
         _communication.connection.send(param1);
      }
      
      public function getXmlWindow(param1:String, param2:uint = 1) : class_3127
      {
         var _loc5_:IAsset = null;
         var _loc3_:XmlAsset = null;
         var _loc4_:class_3127 = null;
         try
         {
            _loc5_ = assets.getAssetByName(param1 + "_xml");
            _loc3_ = XmlAsset(_loc5_);
            _loc4_ = _windowManager.buildFromXML(XML(_loc3_.content),param2);
         }
         catch(e:Error)
         {
            ErrorReportStorage.addDebugData("HabboNavigator","Failed to build window " + param1 + "_xml, " + _loc5_ + ", " + _windowManager + "!");
            throw e;
         }
         return _loc4_;
      }
      
      public function getText(param1:String) : String
      {
         var _loc2_:* = String(_localization.getLocalization(param1));
         if(_loc2_ == null || _loc2_ == "")
         {
            _loc2_ = param1;
         }
         return _loc2_;
      }
      
      public function registerParameter(param1:String, param2:String, param3:String) : String
      {
         return _localization.registerParameter(param1,param2,param3);
      }
      
      public function getButton(param1:String, param2:String, param3:Function, param4:int = 0, param5:int = 0, param6:int = 0) : class_3282
      {
         var _loc8_:BitmapData = getButtonImage(param2);
         var _loc7_:class_3282;
         (_loc7_ = class_3282(_windowManager.createWindow(param1,"",21,0,17,new Rectangle(param4,param5,_loc8_.width,_loc8_.height),param3,param6))).bitmap = _loc8_;
         _loc7_.disposesBitmap = false;
         return _loc7_;
      }
      
      public function refreshButton(param1:class_3151, param2:String, param3:Boolean, param4:Function, param5:int, param6:String = null) : void
      {
         if(!param6)
         {
            param6 = param2;
         }
         var _loc7_:class_3282;
         if(!(_loc7_ = param1.findChildByName(param2) as class_3282))
         {
            class_14.log("Could not locate button in navigator: " + param2);
         }
         if(!param3)
         {
            _loc7_.visible = false;
         }
         else
         {
            prepareButton(_loc7_,param6,param4,param5);
            _loc7_.visible = true;
         }
      }
      
      private function prepareButton(param1:class_3282, param2:String, param3:Function, param4:int) : void
      {
         param1.id = param4;
         param1.procedure = param3;
         if(param1.bitmap != null)
         {
            return;
         }
         param1.bitmap = getButtonImage(param2);
         param1.disposesBitmap = false;
         param1.width = param1.bitmap.width;
         param1.height = param1.bitmap.height;
      }
      
      public function getButtonImage(param1:String, param2:String = "_png") : BitmapData
      {
         var _loc4_:String = param1 + param2;
         var _loc7_:IAsset = assets.getAssetByName(_loc4_);
         var _loc5_:BitmapDataAsset = BitmapDataAsset(_loc7_);
         return BitmapData(_loc5_.content);
      }
      
      private function onRoomSessionCreatedEvent(param1:RoomSessionEvent) : void
      {
         if(_roomSessionManager && var_1987)
         {
            var_1987.close();
         }
      }
      
      public function openCatalogClubPage(param1:String) : void
      {
         if(_catalog == null)
         {
            return;
         }
         _catalog.openClubCenter();
      }
      
      public function openCatalogRoomAdsPage() : void
      {
         if(_catalog == null)
         {
            return;
         }
         _catalog.openCatalogPage("room_ad");
      }
      
      public function openCatalogRoomAdsExtendPage(param1:String, param2:String, param3:Date, param4:int) : void
      {
         if(_catalog == null)
         {
            return;
         }
         var _loc5_:String = var_45.enteredGuestRoom.roomName;
         _catalog.openRoomAdCatalogPageInExtendedMode("room_ad",param1,param2,_loc5_,param3,param4);
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == "HTE_TOOLBAR_CLICK")
         {
            switch(param1.iconId)
            {
               case "HTIE_ICON_ROOMINFO":
                  toggleRoomInfoVisibility();
                  break;
               case "HTIE_ICON_NAVIGATOR_ME_TAB":
                  showOwnRooms();
                  break;
               case "HTIE_ICON_GAMES":
                  if(getBoolean("game.center.enabled"))
                  {
                     closeNavigator();
                     break;
                  }
                  break;
               case "HTIE_ICON_HOME":
                  goToHomeRoom();
            }
         }
      }
      
      public function toggleRoomInfoVisibility() : void
      {
         if(var_2129)
         {
            var_1987.toggle();
         }
      }
      
      public function performTagSearch(param1:String) : void
      {
         if(var_1499 == null)
         {
            return;
         }
         if(param1.indexOf(" ") != -1)
         {
            param1 = "\"" + param1 + "\"";
         }
         var_1499.startSearch(5,9,param1);
         trackNavigationDataPoint("Search","search.tag",param1);
         var_1499.mainWindow.activate();
      }
      
      public function performTextSearch(param1:String) : void
      {
         if(var_1499 == null)
         {
            return;
         }
         var_1499.startSearch(5,8,param1);
         trackNavigationDataPoint("Search","search",param1);
         var_1499.mainWindow.activate();
         var_1499.searchInput.searchStr.setText(param1);
      }
      
      public function performCompetitionRoomsSearch(param1:int, param2:int) : void
      {
         if(var_1499 == null || var_45 != null && var_45.isLoading())
         {
            return;
         }
         var_45.competitionRoomsData = new class_1559(null,param1,param2);
         var_1499.startSearch(5,15,"");
         var_1499.mainWindow.activate();
         var_1499.searchInput.searchStr.setText("");
      }
      
      public function performGuildBaseSearch() : void
      {
         if(var_1499 == null)
         {
            return;
         }
         var_1499.startSearch(5,14,"");
         var_1499.mainWindow.activate();
         var_1499.searchInput.searchStr.setText("");
      }
      
      public function showOwnRooms() : void
      {
         if(var_1499 == null)
         {
            return;
         }
         var_1499.startSearch(3,5);
         var_1995.getTab(3).tabPageDecorator.tabSelected();
      }
      
      public function showFavouriteRooms() : void
      {
         showMeTab(6);
      }
      
      public function showHistoryRooms() : void
      {
         showMeTab(7);
      }
      
      public function showFrequentRooms() : void
      {
         showMeTab(23);
      }
      
      private function showMeTab(param1:int) : void
      {
         if(var_1499 == null)
         {
            return;
         }
         var_1499.startSearch(3,param1);
         var_1995.getTab(3).tabPageDecorator.setSubSelection(param1);
      }
      
      public function trackNavigationDataPoint(param1:String, param2:String, param3:String = "", param4:int = 0) : void
      {
         if(_tracking)
         {
            _tracking.trackEventLog("Navigation",param1,param2,param3,param4);
         }
      }
      
      public function trackGoogle(param1:String, param2:String, param3:int = -1) : void
      {
         if(_tracking)
         {
            _tracking.trackGoogle(param1,param2,param3);
         }
      }
      
      public function get tracking() : class_1693
      {
         return _tracking;
      }
      
      public function openNavigator(param1:Point = null) : void
      {
      }
      
      public function closeNavigator() : void
      {
         var_1499.close();
      }
      
      public function goToMainView() : void
      {
         var_2129.hide();
         var_1987.close();
      }
      
      public function get homeRoomId() : int
      {
         return !!var_45 ? var_45.homeRoomId : -1;
      }
      
      public function get webRoomReport() : Boolean
      {
         return var_4232;
      }
      
      public function get webRoomReportedName() : String
      {
         return _webRoomReportedName;
      }
      
      public function get enteredGuestRoomData() : class_1569
      {
         if(var_45)
         {
            return var_45.enteredGuestRoom;
         }
         return null;
      }
      
      public function get localization() : class_18
      {
         return _localization;
      }
      
      public function get linkPattern() : String
      {
         return "navigator/";
      }
      
      public function linkReceived(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Array = param1.split("/");
         if(_loc2_.length < 2)
         {
            return;
         }
         switch(_loc2_[1])
         {
            case "goto":
               if(_loc2_.length > 2)
               {
                  var _loc4_:* = _loc2_[2];
                  if("home" !== _loc4_)
                  {
                     _loc3_ = int(_loc2_[2]);
                     if(_loc3_ > 0)
                     {
                        goToPrivateRoom(_loc3_);
                        break;
                     }
                     send(new class_373(_loc2_[2]));
                     break;
                  }
                  goToHomeRoom();
                  break;
               }
               break;
            case "search":
               if(_loc2_.length > 2)
               {
                  performTextSearch(_loc2_[2]);
                  break;
               }
               break;
            case "tag":
               if(_loc2_.length > 2)
               {
                  performTagSearch(_loc2_[2]);
                  break;
               }
               break;
            case "tab":
               if(_loc2_.length > 2)
               {
                  tabs.setSelectedTab(Tabs.tabIdFromName(_loc2_[2],2));
                  openNavigator(null);
                  break;
               }
               break;
            case "report":
               if(_loc2_.length > 3)
               {
                  enterRoomWebRequest(_loc2_[2],true,_loc2_[3]);
                  break;
               }
               break;
            default:
               class_14.log("Navigator unknown link-type received: " + _loc2_[1]);
         }
      }
      
      private function onPerksUpdated(param1:PerksUpdatedEvent) : void
      {
         if(!_sessionData.isPerkAllowed("NAVIGATOR_PHASE_TWO_2014"))
         {
            if(var_1499 && var_1499.isPhaseOneNavigator != isPerkAllowed("NAVIGATOR_PHASE_ONE_2014"))
            {
               var_1499.close();
            }
            context.addLinkEventTracker(this);
         }
         else
         {
            context.removeLinkEventTracker(this);
         }
      }
      
      public function showToolbarHover(param1:Point) : void
      {
         if(!var_2041)
         {
            var_2041 = new ToolbarHoverCtrl(this);
         }
         var_2041.show(param1);
      }
      
      public function hideToolbarHover(param1:Boolean) : void
      {
         if(!var_2041)
         {
            return;
         }
         if(param1)
         {
            var_2041.hideDelayed();
         }
         else
         {
            var_2041.hide();
         }
      }
      
      public function get isDoorModeOverriddenInCurrentRoom() : Boolean
      {
         return _catalog.isDoorModeOverriddenInCurrentRoom;
      }
      
      public function isPerkAllowed(param1:String) : Boolean
      {
         if(_sessionData)
         {
            return _sessionData.isPerkAllowed(param1);
         }
         return false;
      }
      
      public function canRateRoom() : Boolean
      {
         if(!data)
         {
            return false;
         }
         return data.canRate;
      }
      
      public function isRoomFavorite(param1:int) : Boolean
      {
         if(!data)
         {
            return false;
         }
         return data.isRoomFavourite(param1);
      }
      
      public function isRoomHome(param1:int) : Boolean
      {
         if(!data)
         {
            return false;
         }
         return data.isRoomHome(param1);
      }
      
      public function get visibleEventCategories() : Array
      {
         if(!data)
         {
            return [];
         }
         return data.visibleEventCategories;
      }
   }
}
