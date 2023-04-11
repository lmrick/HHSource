package com.sulake.habbo.navigator
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.runtime.events.ILinkEventTracker;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.habbo.avatar.class_1690;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.navigator.cache.NavigatorCache;
   import com.sulake.habbo.navigator.context.ContextContainer;
   import com.sulake.habbo.navigator.context.SearchContext;
   import com.sulake.habbo.navigator.context.SearchContextHistoryManager;
   import com.sulake.habbo.navigator.domain.NavigatorData;
   import com.sulake.habbo.navigator.lift.LiftDataContainer;
   import com.sulake.habbo.navigator.transitional.LegacyNavigator;
   import com.sulake.habbo.navigator.view.NavigatorView;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.PerksUpdatedEvent;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.tracking.class_1693;
   import com.sulake.habbo.utils.Base64;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboHelp;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboNavigator;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDHabboTracking;
   import com.sulake.iid.IIDHabboWindowManager;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.geom.Point;
   import package_11.class_1569;
   import package_142.class_1075;
   import package_142.class_1185;
   import package_142.class_1240;
   import package_142.class_1433;
   import package_18.class_1548;
   import package_18.class_1597;
   import package_18.class_1656;
   import package_18.class_3215;
   import package_19.class_418;
   import package_2.class_373;
   import package_2.class_527;
   import package_37.class_175;
   import package_37.class_220;
   import package_37.class_650;
   import package_37.class_849;
   import package_37.class_930;
   import package_37.class_966;
   import package_37.class_967;
   import package_5.class_1126;
   import package_7.class_197;
   import package_7.class_313;
   
   public class HabboNewNavigator extends class_20 implements IHabboNewNavigator, ILinkEventTracker
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
      
      private var var_2619:com.sulake.habbo.navigator.class_3223;
      
      private var _toolbar:IHabboToolbar;
      
      private var var_1455:com.sulake.habbo.navigator.HabboNavigator;
      
      private var var_2056:LegacyNavigator;
      
      private var var_66:Boolean = false;
      
      private var var_1557:NavigatorView;
      
      private var var_2563:ContextContainer;
      
      private var var_3483:LiftDataContainer;
      
      private var var_3073:SearchContextHistoryManager;
      
      private var _currentResults:class_3215;
      
      private var _groupDetails:class_24;
      
      private var var_3135:class_24;
      
      private var var_650:Vector.<String>;
      
      private var _navigatorCache:NavigatorCache;
      
      private var var_3409:String = "official_view";
      
      private var var_3472:String = "";
      
      private var var_4018:String = "";
      
      private var var_3385:Boolean = false;
      
      private var _noPushToHistoryDueToNavigation:Boolean = false;
      
      public function HabboNewNavigator(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         _groupDetails = new class_24();
         var_3135 = new class_24();
         var_650 = new Vector.<String>(0);
         super(param1,param2,param3);
         var_2056 = new LegacyNavigator(this,var_1455);
      }
      
      public static function getEventLogExtraStringFromSearch(param1:String, param2:String) : String
      {
         return param1 + (param2 == "" ? "" : ":" + param2);
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get communication() : class_25
      {
         return _communication;
      }
      
      public function get sessionData() : ISessionDataManager
      {
         return _sessionData;
      }
      
      public function get roomSessionManager() : IRoomSessionManager
      {
         return _roomSessionManager;
      }
      
      public function get localization() : class_18
      {
         return _localization;
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
         }),new ComponentDependency(new IIDHabboNavigator(),function(param1:class_1685):void
         {
            var_1455 = com.sulake.habbo.navigator.HabboNavigator(param1);
            if(var_2056)
            {
               var_2056.oldNavigator = var_1455;
            }
         },true)]);
      }
      
      override protected function initComponent() : void
      {
         var_2619 = new com.sulake.habbo.navigator.class_3223(this);
         context.addLinkEventTracker(this);
         var_1557 = new NavigatorView(this);
         var_2563 = new ContextContainer(this);
         var_3073 = new SearchContextHistoryManager(this);
         var_3483 = new LiftDataContainer(this);
         _navigatorCache = new NavigatorCache();
         _communication.connection.send(new class_930());
         var_66 = true;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == "HTE_TOOLBAR_CLICK")
         {
            var _loc2_:* = param1.iconId;
            if("HTIE_ICON_NAVIGATOR" === _loc2_)
            {
               toggle();
            }
         }
      }
      
      public function initialize(param1:class_1075) : void
      {
         var_2563.initialize(param1);
      }
      
      public function onSearchResult(param1:class_3215) : void
      {
         var_3385 = false;
         _currentResults = param1;
         extractRoomNamesFromResults(param1.resultSet);
         if(!_noPushToHistoryDueToNavigation)
         {
            var_3073.addSearchContextAtCurrentOffset(new SearchContext(param1.searchCodeOriginal,param1.filteringData));
         }
         _navigatorCache.put(param1.searchCodeOriginal + "/" + param1.filteringData,param1);
         _noPushToHistoryDueToNavigation = false;
         if(false)
         {
            var_1557.onSearchResults(param1,var_4018);
         }
      }
      
      private function extractRoomNamesFromResults(param1:class_1548) : void
      {
         var_3135 = new class_24();
         for each(var _loc2_ in param1.blocks)
         {
            for each(var _loc3_ in _loc2_.guestRooms)
            {
               var_3135.add(_loc3_.flatId,_loc3_.roomName);
            }
         }
      }
      
      public function get newResultsRendered() : Boolean
      {
         return var_3385;
      }
      
      public function set newResultsRendered(param1:Boolean) : void
      {
         var_3385 = param1;
      }
      
      public function onLiftedRooms(param1:class_1433) : void
      {
         var_3483.setLiftedRooms(param1.liftedRooms);
         var_1557.refreshLiftedRooms();
      }
      
      public function onPreferences(param1:class_1240) : void
      {
         var_1557.setInitialWindowDimensions(param1.windowX,param1.windowY,param1.windowHeight,param1.leftPaneHidden,param1.resultsMode);
      }
      
      public function onSavedSearches(param1:class_1185) : void
      {
         var_2563.savedSearches = param1.savedSearches.concat(new Vector.<class_1597>(0));
         var_1557.onSavedSearches(var_2563.savedSearches);
      }
      
      public function onGroupDetails(param1:class_1126) : void
      {
         if(_groupDetails.hasKey(param1.groupId))
         {
            _groupDetails.remove(param1.groupId);
         }
         _groupDetails.add(param1.groupId,param1);
         var_1557.onGroupDetailsArrived(param1.groupId);
      }
      
      public function onCollapsedCategories(param1:Vector.<String>) : void
      {
         var_650 = param1.concat();
      }
      
      public function get collapsedCategories() : Vector.<String>
      {
         return var_650;
      }
      
      public function getCachedGroupDetails(param1:int) : class_1126
      {
         return _groupDetails.getValue(param1);
      }
      
      public function goBack() : void
      {
         if(false)
         {
            _noPushToHistoryDueToNavigation = true;
            performSearchByContext(var_3073.getPreviousSearchContextAndGoBack());
         }
         trackEventLog("browse.back","Results");
      }
      
      public function performLastSearch() : void
      {
         if(var_3409 != null && var_3472 != null)
         {
            _navigatorCache.removeEntry(var_3409 + "/" + var_3472);
            performSearch(var_3409,var_3472);
         }
      }
      
      public function performSearch(param1:String, param2:String = "", param3:String = "") : void
      {
         var_1557.isBusy = true;
         var_4018 = param3;
         var _loc4_:class_3215;
         if((_loc4_ = _navigatorCache.getEntry(param1 + "/" + param2)) != null)
         {
            onSearchResult(_loc4_);
         }
         else
         {
            var_3409 = param1;
            var_3472 = param2;
            _communication.connection.send(new class_849(param1,param2));
            trackEventLog("search","Search",getEventLogExtraStringFromSearch(param1,param2));
         }
         open();
      }
      
      public function performSearchByContext(param1:SearchContext) : void
      {
         performSearch(param1.searchCode,param1.filtering);
      }
      
      public function addSavedSearch(param1:String, param2:String) : void
      {
         if(_currentResults != null)
         {
            _communication.connection.send(new class_175(param1,param2));
         }
         trackEventLog("savedsearch.add","SavedSearch",getEventLogExtraStringFromSearch(param1,param2));
         var_1557.setLeftPaneVisibility(true);
      }
      
      public function deleteSavedSearch(param1:int) : void
      {
         _communication.connection.send(new class_220(param1));
         trackEventLog("savedsearch.delete","SavedSearch");
      }
      
      private function onPerksUpdated(param1:PerksUpdatedEvent) : void
      {
         if(!_sessionData.isPerkAllowed("NAVIGATOR_PHASE_TWO_2014"))
         {
            context.removeLinkEventTracker(this);
            if(var_66)
            {
               var_2619.removeLegacyMessageListeners();
               close();
            }
            return;
         }
         if(!var_66)
         {
            initComponent();
         }
         else if(_sessionData.isPerkAllowed("NAVIGATOR_PHASE_TWO_2014"))
         {
            var_2619.addMessageListeners();
         }
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
                        var_2056.goToPrivateRoom(_loc3_);
                        break;
                     }
                     communication.connection.send(new class_373(_loc2_[2]));
                     break;
                  }
                  var_2056.goToHomeRoom();
                  break;
               }
               break;
            case "search":
               if(_loc2_.length > 2)
               {
                  performSearch("hotel_view",_loc2_[2]);
                  break;
               }
               break;
            case "tag":
               if(_loc2_.length > 2)
               {
                  performSearch("hotel_view",_loc2_[2]);
                  break;
               }
               break;
            case "tab":
               if(_loc2_.length > 2)
               {
                  performSearch(_loc2_[2]);
                  break;
               }
               break;
            case "report":
               if(_loc2_.length > 3)
               {
                  var_2056.reportRoomFromWeb(_loc2_[2],Base64.decode(_loc2_[3]));
                  break;
               }
               break;
            default:
               class_14.log("Navigator unknown link-type received: " + _loc2_[1]);
         }
      }
      
      public function showOwnRooms() : void
      {
      }
      
      public function showToolbarHover(param1:Point) : void
      {
      }
      
      public function hideToolbarHover(param1:Boolean) : void
      {
      }
      
      public function get isReady() : Boolean
      {
         return var_2563 != null && var_2563.isReady();
      }
      
      public function get contextContainer() : ContextContainer
      {
         return var_2563;
      }
      
      public function get searchContextHistoryManager() : SearchContextHistoryManager
      {
         return var_3073;
      }
      
      public function get liftDataContainer() : LiftDataContainer
      {
         return var_3483;
      }
      
      public function get currentResults() : class_3215
      {
         return _currentResults;
      }
      
      public function goToRoom(param1:int, param2:String = "mainview") : void
      {
         communication.connection.send(new class_527(param1,false,true));
         var_1557.visible = false;
         var _loc3_:String = var_3135.getValue(param1);
         trackEventLog("go",param2,!_loc3_ ? "" : _loc3_,param1);
      }
      
      public function getExtendedProfile(param1:int) : void
      {
         communication.connection.send(new class_313(param1));
      }
      
      public function get imageLibraryBaseUrl() : String
      {
         return context.configuration.getProperty("image.library.url");
      }
      
      public function performTagSearch(param1:String) : void
      {
         performSearch("hotel_view","tag:" + param1);
      }
      
      public function createRoom() : void
      {
         var_2056.roomCreateViewCtrl.show();
      }
      
      public function open() : void
      {
         if(var_1557 == null)
         {
            return;
         }
         if(true)
         {
            var_1557.visible = true;
         }
      }
      
      public function close() : void
      {
         if(false)
         {
            var_1557.visible = false;
         }
      }
      
      public function toggle() : void
      {
         if(var_1557 == null)
         {
            return;
         }
         var_1557.visible = true;
         if(false)
         {
            performLastSearch();
         }
      }
      
      public function get mainWindow() : class_3281
      {
         return var_1557.mainWindow;
      }
      
      public function refresh() : void
      {
         if(_currentResults)
         {
            var_1557.onSearchResults(_currentResults);
         }
      }
      
      public function get legacyNavigator() : class_1685
      {
         return var_2056;
      }
      
      public function get data() : NavigatorData
      {
         return var_2056.data;
      }
      
      public function sendWindowPreferences(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int) : void
      {
         _communication.connection.send(new class_418(param1,param2,param3,param4,param5,param6));
      }
      
      public function getGuildInfo(param1:int, param2:Boolean = true) : void
      {
         _communication.connection.send(new class_197(param1,param2));
      }
      
      public function sendAddCollapsedCategory(param1:String) : void
      {
         _communication.connection.send(new class_650(param1));
      }
      
      public function sendRemoveCollapsedCategory(param1:String) : void
      {
         _communication.connection.send(new class_966(param1));
      }
      
      public function goToHomeRoom() : void
      {
         goToRoom(var_2056.data.homeRoomId,"external");
      }
      
      public function trackEventLog(param1:String, param2:String, param3:String = "", param4:int = 0) : void
      {
         if(_tracking)
         {
            _tracking.trackEventLog("NewNavigator",param2,param1,param3,param4);
         }
      }
      
      public function get view() : NavigatorView
      {
         return var_1557;
      }
      
      public function toggleSearchCodeViewMode(param1:String, param2:int) : void
      {
         _communication.connection.send(new class_967(param1,param2));
         trackEventLog("browse.toggleviewmode","ViewMode","",param2);
      }
      
      public function get habboHelp() : IHabboHelp
      {
         return _habboHelp;
      }
      
      public function performTextSearch(param1:String) : void
      {
      }
      
      public function performGuildBaseSearch() : void
      {
      }
      
      public function performCompetitionRoomsSearch(param1:int, param2:int) : void
      {
      }
   }
}
