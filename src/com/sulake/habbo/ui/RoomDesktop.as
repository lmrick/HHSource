package com.sulake.habbo.ui
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.class_19;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.events.EventDispatcherWrapper;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.components.class_3207;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.advertisement.class_1694;
   import com.sulake.habbo.avatar.class_1690;
   import com.sulake.habbo.avatar.class_1753;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.freeflowchat.class_1692;
   import com.sulake.habbo.friendlist.class_1869;
   import com.sulake.habbo.game.class_1688;
   import com.sulake.habbo.groups.class_1752;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.inventory.class_1697;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.messenger.class_1689;
   import com.sulake.habbo.moderation.IHabboModeration;
   import com.sulake.habbo.navigator.class_1685;
   import com.sulake.habbo.quest.class_2047;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.events.RoomEngineEvent;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.events.RoomEngineToWidgetEvent;
   import com.sulake.habbo.roomevents.IHabboUserDefinedRoomEvents;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.class_3259;
   import com.sulake.habbo.sound.class_2089;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.tracking.class_1693;
   import com.sulake.habbo.ui.handler.*;
   import com.sulake.habbo.ui.widget.IRoomWidget;
   import com.sulake.habbo.ui.widget.IRoomWidgetMessageListener;
   import com.sulake.habbo.ui.widget.avatarinfo.AvatarInfoWidget;
   import com.sulake.habbo.ui.widget.events.RoomWidgetLoadingBarUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotForceOpenContextMenuEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotSkillListUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomViewUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.room.events.RoomContentLoadedEvent;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.utils.ColorConverter;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.RoomGeometry;
   import com.sulake.room.utils.RoomId;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   import flash.filters.DisplacementMapFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import package_171.class_1353;
   import package_171.class_1401;
   import package_38.class_177;
   import package_38.class_580;
   
   public class RoomDesktop implements IRoomDesktop, IRoomWidgetMessageListener, IRoomWidgetHandlerContainer
   {
      
      public static const STATE_UNDEFINED:int = -1;
      
      private static const RESIZE_UPDATE_TIMEOUT_MS:int = 1000;
      
      private static const SCALE_UPDATE_TIMEOUT_MS:int = 1000;
       
      
      private var name_1:EventDispatcherWrapper;
      
      private var _windowManager:class_1684 = null;
      
      private var _roomEngine:IRoomEngine = null;
      
      private var var_2635:com.sulake.habbo.ui.IRoomWidgetFactory = null;
      
      private var _sessionDataManager:ISessionDataManager = null;
      
      private var _roomSessionManager:IRoomSessionManager = null;
      
      private var _communicationManager:class_25 = null;
      
      private var _avatarRenderManager:class_1690 = null;
      
      private var _friendList:class_1869 = null;
      
      private var _inventory:class_1697 = null;
      
      private var _toolbar:IHabboToolbar = null;
      
      private var _navigator:class_1685 = null;
      
      private var _messenger:class_1689 = null;
      
      private var _habboGroupsManager:class_1752 = null;
      
      private var _avatarEditor:class_1753 = null;
      
      private var _catalog:IHabboCatalog = null;
      
      private var _adManager:class_1694 = null;
      
      private var _localization:class_18 = null;
      
      private var _habboHelp:IHabboHelp = null;
      
      private var _connection:IConnection = null;
      
      private var _moderation:IHabboModeration;
      
      private var _config:class_19;
      
      private var _soundManager:class_2089;
      
      private var _habboTracking:class_1693;
      
      private var _userDefinedRoomEvents:IHabboUserDefinedRoomEvents;
      
      private var _gameManager:class_1688;
      
      private var _questEngine:class_2047;
      
      private var _freeFlowChat:class_1692;
      
      private var _assets:class_21 = null;
      
      private var _session:IRoomSession = null;
      
      private var var_1729:Array;
      
      private var var_1442:class_24;
      
      private var var_2335:class_24;
      
      private var var_2163:class_24;
      
      private var _updateListeners:Array;
      
      private var var_1671:com.sulake.habbo.ui.class_3360;
      
      private var var_1533:class_3207;
      
      private var var_3174:Boolean = true;
      
      private var var_2447:Array;
      
      private var var_1665:IToolTipWindow;
      
      private var _roomColor:uint = 16777215;
      
      private var var_4320:Boolean = false;
      
      private var _zoomChangedMillis:int = 0;
      
      private var _roomBackgroundColor:uint = 0;
      
      private var var_2004:Timer;
      
      private var var_3323:Rectangle;
      
      private var var_2441:IMessageEvent;
      
      private var var_2564:IMessageEvent;
      
      private var var_2489:Point;
      
      private var var_2774:Number = 0;
      
      private var var_2477:Number = 0;
      
      private var var_3312:Boolean;
      
      public function RoomDesktop(param1:IRoomSession, param2:class_21, param3:IConnection)
      {
         var_1729 = [];
         super();
         name_1 = new EventDispatcherWrapper();
         _session = param1;
         _assets = param2;
         _connection = param3;
         var_2441 = new class_580(onBotSkillListUpdateEvent);
         _connection.addMessageEvent(var_2441);
         var_2564 = new class_177(onBotForceOpenContextMenuEvent);
         _connection.addMessageEvent(var_2564);
         var_1442 = new class_24();
         var_2335 = new class_24();
         var_2163 = new class_24();
         var_1671 = new com.sulake.habbo.ui.class_3360();
         checkInterrupts();
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(var_1533)
         {
            var_1533.visible = param1;
         }
      }
      
      public function get roomSession() : IRoomSession
      {
         return _session;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return _sessionDataManager;
      }
      
      public function get events() : IEventDispatcher
      {
         return name_1;
      }
      
      public function get roomEngine() : IRoomEngine
      {
         return _roomEngine;
      }
      
      public function get roomSessionManager() : IRoomSessionManager
      {
         return _roomSessionManager;
      }
      
      public function get friendList() : class_1869
      {
         return _friendList;
      }
      
      public function get avatarRenderManager() : class_1690
      {
         return _avatarRenderManager;
      }
      
      public function get inventory() : class_1697
      {
         return !!_inventory ? _inventory : null;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return _toolbar;
      }
      
      public function get roomWidgetFactory() : com.sulake.habbo.ui.IRoomWidgetFactory
      {
         return var_2635;
      }
      
      public function get navigator() : class_1685
      {
         return _navigator;
      }
      
      public function get habboGroupsManager() : class_1752
      {
         return _habboGroupsManager;
      }
      
      public function get communicationManager() : class_25
      {
         return _communicationManager;
      }
      
      public function get avatarEditor() : class_1753
      {
         return _avatarEditor;
      }
      
      public function get catalog() : IHabboCatalog
      {
         return _catalog;
      }
      
      public function get localization() : class_18
      {
         return _localization;
      }
      
      public function get habboHelp() : IHabboHelp
      {
         return _habboHelp;
      }
      
      public function get config() : class_19
      {
         return _config;
      }
      
      public function get soundManager() : class_2089
      {
         return _soundManager;
      }
      
      public function get messenger() : class_1689
      {
         return _messenger;
      }
      
      public function get moderation() : IHabboModeration
      {
         return _moderation;
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get habboTracking() : class_1693
      {
         return _habboTracking;
      }
      
      public function get session() : IRoomSession
      {
         return _session;
      }
      
      public function get gameManager() : class_1688
      {
         return _gameManager;
      }
      
      public function get questEngine() : class_2047
      {
         return _questEngine;
      }
      
      public function get freeFlowChat() : class_1692
      {
         return _freeFlowChat;
      }
      
      public function get roomBackgroundColor() : uint
      {
         return _roomBackgroundColor;
      }
      
      public function set catalog(param1:IHabboCatalog) : void
      {
         _catalog = param1;
      }
      
      public function set avatarEditor(param1:class_1753) : void
      {
         _avatarEditor = param1;
      }
      
      public function set roomWidgetFactory(param1:com.sulake.habbo.ui.IRoomWidgetFactory) : void
      {
         var_2635 = param1;
      }
      
      public function set sessionDataManager(param1:ISessionDataManager) : void
      {
         _sessionDataManager = param1;
      }
      
      public function set roomSessionManager(param1:IRoomSessionManager) : void
      {
         _roomSessionManager = param1;
         checkInterrupts();
      }
      
      public function set communicationManager(param1:class_25) : void
      {
         _communicationManager = param1;
      }
      
      public function get userDefinedRoomEvents() : IHabboUserDefinedRoomEvents
      {
         return _userDefinedRoomEvents;
      }
      
      public function get connection() : IConnection
      {
         return _connection;
      }
      
      public function set friendList(param1:class_1869) : void
      {
         _friendList = param1;
         if(_friendList)
         {
            _friendList.events.addEventListener("FRE_ACCEPTED",processEvent);
            _friendList.events.addEventListener("FRE_DECLINED",processEvent);
         }
      }
      
      public function set avatarRenderManager(param1:class_1690) : void
      {
         _avatarRenderManager = param1;
      }
      
      public function set windowManager(param1:class_1684) : void
      {
         _windowManager = param1;
      }
      
      public function set inventory(param1:class_1697) : void
      {
         _inventory = param1;
      }
      
      public function set navigator(param1:class_1685) : void
      {
         _navigator = param1;
      }
      
      public function set adManager(param1:class_1694) : void
      {
         _adManager = param1;
      }
      
      public function set localization(param1:class_18) : void
      {
         _localization = param1;
      }
      
      public function set habboHelp(param1:IHabboHelp) : void
      {
         _habboHelp = param1;
      }
      
      public function set moderation(param1:IHabboModeration) : void
      {
         _moderation = param1;
      }
      
      public function set config(param1:class_19) : void
      {
         _config = param1;
      }
      
      public function set soundManager(param1:class_2089) : void
      {
         _soundManager = param1;
      }
      
      public function set habboTracking(param1:class_1693) : void
      {
         _habboTracking = param1;
      }
      
      public function set userDefinedRoomEvents(param1:IHabboUserDefinedRoomEvents) : void
      {
         _userDefinedRoomEvents = param1;
      }
      
      public function set gameManager(param1:class_1688) : void
      {
         _gameManager = param1;
      }
      
      public function set questEngine(param1:class_2047) : void
      {
         _questEngine = param1;
      }
      
      public function set freeFlowChat(param1:class_1692) : void
      {
         _freeFlowChat = param1;
      }
      
      public function set habboGroupsManager(param1:class_1752) : void
      {
         _habboGroupsManager = param1;
      }
      
      public function set roomEngine(param1:IRoomEngine) : void
      {
         _roomEngine = param1;
         if(_roomEngine != null && false)
         {
            _roomEngine.events.addEventListener("RCLE_SUCCESS",onRoomContentLoaded);
            _roomEngine.events.addEventListener("RCLE_FAILURE",onRoomContentLoaded);
            _roomEngine.events.addEventListener("RCLE_CANCEL",onRoomContentLoaded);
         }
      }
      
      public function set messenger(param1:class_1689) : void
      {
         _messenger = param1;
      }
      
      public function set toolbar(param1:IHabboToolbar) : void
      {
         _toolbar = param1;
         _toolbar.events.addEventListener("HTIE_ICON_ZOOM",onToolbarEvent);
      }
      
      public function set layout(param1:XML) : void
      {
         var_1671.setLayout(param1,_windowManager,_config);
      }
      
      public function dispose() : void
      {
         var _loc5_:IRoomGeometry = null;
         var _loc4_:int = 0;
         var _loc3_:String = null;
         var _loc1_:IRoomWidget = null;
         if(_roomEngine != null && _session != null)
         {
            if((_loc5_ = _roomEngine.getRoomCanvasGeometry(_session.roomId,getFirstCanvasId())) != null)
            {
               trackZooming(_loc5_.isZoomedIn(),false);
            }
         }
         var _loc2_:int = 0;
         if(var_1729 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < var_1729.length)
            {
               _loc4_ = 0;
               _loc3_ = getWindowName(_loc4_);
               if(_windowManager)
               {
                  _windowManager.removeWindow(_loc3_);
               }
               _loc2_++;
            }
         }
         _updateListeners = null;
         if(var_1442 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < var_1442.length)
            {
               _loc1_ = var_1442.getWithIndex(_loc2_) as IRoomWidget;
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
               _loc2_++;
            }
            var_1442.dispose();
            var_1442 = null;
         }
         if(var_2335 != null)
         {
            var_2335.dispose();
            var_2335 = null;
         }
         if(var_2163 != null)
         {
            var_2163.dispose();
            var_2163 = null;
         }
         if(_connection)
         {
            if(var_2441 != null)
            {
               _connection.removeMessageEvent(var_2441);
               var_2441.dispose();
               var_2441 = null;
            }
            if(var_2564 != null)
            {
               _connection.removeMessageEvent(var_2564);
               var_2564.dispose();
               var_2564 = null;
            }
            _connection = null;
         }
         _assets = null;
         _avatarRenderManager = null;
         var_1729 = null;
         name_1 = null;
         if(_friendList && false)
         {
            _friendList.events.removeEventListener("FRE_ACCEPTED",processEvent);
            _friendList.events.removeEventListener("FRE_DECLINED",processEvent);
         }
         _friendList = null;
         var_1671.dispose();
         var_1671 = null;
         if(_roomEngine != null && false)
         {
            _roomEngine.events.removeEventListener("RCLE_SUCCESS",onRoomContentLoaded);
            _roomEngine.events.removeEventListener("RCLE_FAILURE",onRoomContentLoaded);
            _roomEngine.events.removeEventListener("RCLE_CANCEL",onRoomContentLoaded);
         }
         _roomEngine = null;
         _roomSessionManager = null;
         var_2635 = null;
         _session = null;
         _sessionDataManager = null;
         _windowManager = null;
         _inventory = null;
         _localization = null;
         _config = null;
         _soundManager = null;
         _habboGroupsManager = null;
         if(_toolbar && false)
         {
            _toolbar.events.removeEventListener("HTIE_ICON_ZOOM",onToolbarEvent);
            _toolbar = null;
         }
         _navigator = null;
         if(var_1665 != null)
         {
            var_1665.dispose();
            var_1665 = null;
         }
         if(var_2004 != null)
         {
            var_2004.reset();
            var_2004.removeEventListener("timer",onResizeTimerEvent);
            var_2004 = null;
         }
         var_3323 = null;
      }
      
      private function onBotSkillListUpdateEvent(param1:class_580) : void
      {
         var _loc2_:class_3259 = null;
         var _loc3_:class_1353 = param1.getParser();
         if(_session != null)
         {
            _loc2_ = _session.userDataManager.getRentableBotUserData(_loc3_.botId);
            _loc2_.botSkillData = param1.getParser().skillList.concat();
         }
         events.dispatchEvent(new RoomWidgetRentableBotSkillListUpdateEvent(_loc3_.botId,_loc3_.skillList));
      }
      
      private function onBotForceOpenContextMenuEvent(param1:class_177) : void
      {
         var _loc2_:class_1401 = param1.getParser();
         events.dispatchEvent(new RoomWidgetRentableBotForceOpenContextMenuEvent(_loc2_.botId));
      }
      
      public function init() : void
      {
         if(_roomEngine != null && _session != null)
         {
            var_2447 = [];
            if(false)
            {
               var_3174 = false;
               processEvent(new RoomWidgetLoadingBarUpdateEvent("RWLBUE_SHOW_LOADING_BAR"));
            }
         }
      }
      
      public function requestInterstitial() : void
      {
         if(_adManager != null)
         {
            _adManager.showInterstitial();
         }
      }
      
      private function onRoomContentLoaded(param1:RoomContentLoadedEvent) : void
      {
         if(var_2447 == null || false)
         {
            return;
         }
         var _loc2_:int = var_2447.indexOf(param1.contentType);
         if(_loc2_ != -1)
         {
            var_2447.splice(_loc2_,1);
         }
         if(false)
         {
            var_3174 = true;
            checkInterrupts();
         }
      }
      
      public function createWidget(param1:String) : void
      {
         var _loc8_:Boolean = false;
         var _loc2_:IRoomWidgetHandler = null;
         var _loc6_:ChatWidgetHandler = null;
         var _loc15_:PlayListEditorWidgetHandler = null;
         var _loc3_:SpamWallPostItWidgetHandler = null;
         var _loc5_:FurnitureContextMenuWidgetHandler = null;
         var _loc10_:FurnitureRoomLinkHandler = null;
         var _loc7_:RoomToolsWidgetHandler = null;
         var _loc12_:* = null;
         var _loc13_:Array = null;
         var _loc16_:Array = null;
         var _loc11_:RoomWidgetRoomViewUpdateEvent = null;
         if(var_2635 == null)
         {
            return;
         }
         var _loc4_:IRoomWidget;
         if((_loc4_ = var_1442.getValue(param1) as IRoomWidget) != null)
         {
            return;
         }
         if(false && !isGameWidget(param1))
         {
            return;
         }
         switch(param1)
         {
            case "RWE_CHAT_WIDGET":
               (_loc6_ = new ChatWidgetHandler()).connection = _connection;
               _loc2_ = _loc6_;
               _loc8_ = true;
               break;
            case "RWE_INFOSTAND":
               _loc2_ = new InfoStandWidgetHandler(_soundManager.musicController);
               break;
            case "RWE_CHAT_INPUT_WIDGET":
               _loc8_ = true;
               _loc2_ = new ChatInputWidgetHandler();
               break;
            case "RWE_ME_MENU":
               _loc2_ = new MeMenuWidgetHandler();
               break;
            case "RWE_FURNI_PLACEHOLDER":
               _loc2_ = new PlaceholderWidgetHandler();
               break;
            case "RWE_FURNI_CREDIT_WIDGET":
               _loc2_ = new FurnitureCreditWidgetHandler();
               break;
            case "RWE_FURNI_STICKIE_WIDGET":
               _loc2_ = new FurnitureStickieWidgetHandler();
               break;
            case "RWE_FURNI_PRESENT_WIDGET":
               _loc2_ = new FurniturePresentWidgetHandler();
               break;
            case "RWE_FURNI_TROPHY_WIDGET":
               _loc2_ = new FurnitureTrophyWidgetHandler();
               break;
            case "RWE_FURNI_ECOTRONBOX_WIDGET":
               _loc2_ = new FurnitureEcotronBoxWidgetHandler();
               break;
            case "RWE_FURNI_PET_PACKAGE_WIDGET":
               _loc2_ = new PetPackageFurniWidgetHandler();
               break;
            case "RWE_DOORBELL":
               _loc2_ = new DoorbellWidgetHandler();
               break;
            case "RWE_ROOM_QUEUE":
               _loc2_ = new RoomQueueWidgetHandler();
               break;
            case "RWE_LOADINGBAR":
               _loc2_ = new LoadingBarWidgetHandler();
               break;
            case "RWE_ROOM_POLL":
               _loc2_ = new PollWidgetHandler();
               break;
            case "RWE_WORD_QUIZZ":
               _loc2_ = new WordQuizWidgetHandler();
               break;
            case "RWE_FURNI_CHOOSER":
               _loc2_ = new FurniChooserWidgetHandler();
               break;
            case "RWE_USER_CHOOSER":
               _loc2_ = new UserChooserWidgetHandler();
               break;
            case "RWE_ROOM_DIMMER":
               _loc2_ = new FurnitureDimmerWidgetHandler();
               break;
            case "RWE_FRIEND_REQUEST":
               _loc2_ = new FriendRequestWidgetHandler();
               break;
            case "RWE_CLOTHING_CHANGE":
               _loc2_ = new FurnitureClothingChangeWidgetHandler();
               break;
            case "RWE_CONVERSION_TRACKING":
               _loc2_ = new ConversionPointWidgetHandler();
               break;
            case "RWE_AVATAR_INFO":
               _loc2_ = new AvatarInfoWidgetHandler();
               break;
            case "RWE_PLAYLIST_EDITOR_WIDGET":
               (_loc15_ = new PlayListEditorWidgetHandler()).connection = _connection;
               _loc2_ = _loc15_ as IRoomWidgetHandler;
               break;
            case "RWE_SPAMWALL_POSTIT_WIDGET":
               _loc3_ = new SpamWallPostItWidgetHandler();
               _loc3_.connection = _connection;
               _loc2_ = _loc3_ as IRoomWidgetHandler;
               break;
            case "RWE_EFFECTS":
               _loc2_ = new class_3396();
               break;
            case "RWE_MANNEQUIN":
               _loc2_ = new MannequinWidgetHandler();
               break;
            case "RWE_FURNITURE_CONTEXT_MENU":
               (_loc5_ = new FurnitureContextMenuWidgetHandler()).connection = _connection;
               _loc2_ = _loc5_ as IRoomWidgetHandler;
               break;
            case "RWE_LOCATION_WIDGET":
               _loc2_ = new ObjectLocationRequestHandler();
               break;
            case "RWE_CAMERA":
               _loc2_ = new CameraWidgetHandler(this);
               break;
            case "RWE_ROOM_BACKGROUND_COLOR":
               _loc2_ = new FurnitureBackgroundColorWidgetHandler();
               break;
            case "RWE_CUSTOM_USER_NOTIFICATION":
               _loc2_ = new CustomUserNotificationWidgetHandler();
               break;
            case "RWE_FURNI_ACHIEVEMENT_RESOLUTION_ENGRAVING":
               _loc2_ = new class_3334();
               break;
            case "RWE_FRIEND_FURNI_CONFIRM":
               _loc2_ = new class_3391();
               class_3391(_loc2_).connection = connection;
               break;
            case "RWE_FRIEND_FURNI_ENGRAVING":
               _loc2_ = new class_3323();
               break;
            case "RWE_HIGH_SCORE_DISPLAY":
               _loc2_ = new class_3331();
               break;
            case "RWE_INTERNAL_LINK":
               _loc2_ = new class_3336();
               break;
            case "RWE_ROOM_LINK":
               (_loc10_ = new FurnitureRoomLinkHandler()).communicationManager = _communicationManager;
               _loc2_ = _loc10_;
               break;
            case "RWE_CUSTOM_STACK_HEIGHT":
               _loc2_ = new class_3345();
               break;
            case "RWE_YOUTUBE":
               _loc2_ = new class_3324();
               break;
            case "RWE_RENTABLESPACE":
               _loc2_ = new class_3322();
               break;
            case "RWE_VIMEO":
               _loc2_ = new class_3389();
               break;
            case "RWE_ROOM_TOOLS":
               (_loc7_ = new RoomToolsWidgetHandler()).communicationManager = _communicationManager;
               _loc7_.navigator = _navigator;
               _loc2_ = _loc7_;
               break;
            case "RWE_EXTERNAL_IMAGE":
               _loc2_ = new ExternalImageWidgetHandler();
               break;
            case "RWE_UI_HELP_BUBBLE":
               _loc2_ = new UiHelpBubbleWidgetHandler();
               break;
            case "RWE_ROOM_THUMBNAIL_CAMERA":
               _loc2_ = new RoomThumbnailCameraWidgetHandler(this);
               break;
            case "RWE_CRAFTING":
               _loc2_ = new CraftingWidgetHandler(this);
         }
         if(_loc2_ != null)
         {
            _loc2_.container = this;
            _loc12_ = null;
            if((_loc13_ = _loc2_.getWidgetMessages()) != null)
            {
               for each(var _loc9_ in _loc13_)
               {
                  if((_loc12_ = var_2335.getValue(_loc9_)) == null)
                  {
                     _loc12_ = [];
                     var_2335.add(_loc9_,_loc12_);
                  }
                  _loc12_.push(_loc2_);
               }
            }
            if((_loc16_ = _loc2_.getProcessedEvents()) != null)
            {
               _loc16_.push("RETWE_OPEN_WIDGET");
               _loc16_.push("RETWE_CLOSE_WIDGET");
               for each(var _loc14_ in _loc16_)
               {
                  if((_loc12_ = var_2163.getValue(_loc14_)) == null)
                  {
                     _loc12_ = [];
                     var_2163.add(_loc14_,_loc12_);
                  }
                  _loc12_.push(_loc2_);
               }
            }
         }
         if((_loc4_ = var_2635.createWidget(param1,_loc2_)) == null)
         {
            return;
         }
         _loc4_.messageListener = this;
         _loc4_.registerUpdateEvents(name_1);
         if(!var_1442.add(param1,_loc4_))
         {
            _loc4_.dispose();
         }
         else
         {
            var_1671.addWidgetWindow(param1,_loc4_.mainWindow);
         }
         if(_loc8_)
         {
            param1 = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
            _loc11_ = new RoomWidgetRoomViewUpdateEvent(param1,var_1671.roomViewRect);
            this.events.dispatchEvent(_loc11_);
         }
      }
      
      private function isGameWidget(param1:String) : Boolean
      {
         switch(param1)
         {
            case "RWE_CHAT_INPUT_WIDGET":
            case "RWE_CHAT_WIDGET":
            case "RWE_AVATAR_INFO":
            case "RWE_LOCATION_WIDGET":
               break;
            default:
               return false;
         }
         return true;
      }
      
      public function disposeWidget(param1:String) : void
      {
         var _loc2_:IRoomWidget = null;
         if(var_1442 != null)
         {
            _loc2_ = var_1442.remove(param1);
            if(_loc2_ != null)
            {
               if(var_1671 != null)
               {
                  var_1671.removeWidgetWindow(param1,_loc2_.mainWindow);
               }
               _loc2_.dispose();
            }
         }
      }
      
      public function getWidget(param1:String) : IRoomWidget
      {
         var _loc2_:IRoomWidget = null;
         if(var_1442 != null)
         {
            _loc2_ = var_1442[param1];
         }
         return _loc2_;
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc4_:RoomWidgetUpdateEvent = null;
         if(param1 == null)
         {
            return null;
         }
         if(param1.type == "RWZTM_ZOOM_TOGGLE")
         {
            toggleZoom();
         }
         var _loc3_:Array = var_2335.getValue(param1.type);
         if(_loc3_ != null)
         {
            for each(var _loc2_ in _loc3_)
            {
               if((_loc4_ = _loc2_.processWidgetMessage(param1)) != null)
               {
                  return _loc4_;
               }
            }
         }
         return null;
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc3_:Boolean = false;
         var _loc5_:RoomEngineToWidgetEvent = null;
         if(!param1 || !var_2163)
         {
            return;
         }
         if(var_1533 && param1.type == "RDMZEE_ENABLED")
         {
            checkAndEnableMouseZoomEvent(var_1533.getDisplayObject());
         }
         var _loc4_:Array;
         if((_loc4_ = var_2163.getValue(param1.type)) != null)
         {
            for each(var _loc2_ in _loc4_)
            {
               _loc3_ = true;
               if(param1.type == "RETWE_OPEN_WIDGET" || param1.type == "RETWE_CLOSE_WIDGET")
               {
                  _loc3_ = (_loc5_ = param1 as RoomEngineToWidgetEvent) != null && _loc2_.type == _loc5_.widget;
               }
               if(param1.type == "RWZTM_ZOOM_TOGGLE")
               {
                  toggleZoom();
               }
               if(_loc3_)
               {
                  _loc2_.processEvent(param1);
               }
            }
         }
      }
      
      private function isFurnitureSelectionDisabled(param1:RoomEngineObjectEvent) : Boolean
      {
         var _loc4_:IRoomObjectModel = null;
         var _loc3_:Boolean = false;
         var _loc2_:IRoomObject = roomEngine.getRoomObject(param1.roomId,param1.objectId,param1.category);
         if(_loc2_ != null)
         {
            if((_loc4_ = _loc2_.getModel()) != null)
            {
               if(_loc4_.getNumber("furniture_selection_disable") == 1)
               {
                  _loc3_ = true;
                  if(false)
                  {
                     _loc3_ = false;
                  }
               }
            }
         }
         return _loc3_;
      }
      
      public function roomObjectEventHandler(param1:RoomEngineObjectEvent) : void
      {
         var _loc7_:String = null;
         var _loc10_:class_3259 = null;
         var _loc12_:IRoomObject = null;
         var _loc8_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = false;
         var _loc11_:int = 0;
         if(param1 == null)
         {
            return;
         }
         var _loc5_:int = param1.objectId;
         var _loc6_:int = param1.category;
         var _loc3_:RoomWidgetRoomObjectUpdateEvent = null;
         var _loc9_:RoomWidgetFurniToWidgetMessage = null;
         switch(param1.type)
         {
            case "REOE_SELECTED":
               if(!isFurnitureSelectionDisabled(param1))
               {
                  _loc3_ = new RoomWidgetRoomObjectUpdateEvent("RWROUE_OBJECT_SELECTED",_loc5_,_loc6_,param1.roomId);
               }
               if(_moderation != null && _loc6_ == 100)
               {
                  if((_loc10_ = _session.userDataManager.getUserDataByIndex(_loc5_)) != null && _loc10_.type == 1)
                  {
                     _moderation.userSelected(_loc10_.webID,_loc10_.name);
                     break;
                  }
                  break;
               }
               break;
            case "REOE_ADDED":
               switch(_loc6_)
               {
                  case 10:
                  case 20:
                     _loc7_ = "RWROUE_FURNI_ADDED";
                     break;
                  case 100:
                     _loc7_ = "RWROUE_USER_ADDED";
               }
               if(_loc7_ != null)
               {
                  _loc3_ = new RoomWidgetRoomObjectUpdateEvent(_loc7_,_loc5_,_loc6_,param1.roomId);
                  break;
               }
               break;
            case "REOE_REMOVED":
               switch(_loc6_)
               {
                  case 10:
                  case 20:
                     _loc7_ = "RWROUE_FURNI_REMOVED";
                     break;
                  case 100:
                     _loc7_ = "RWROUE_USER_REMOVED";
               }
               if(_loc7_ != null)
               {
                  _loc3_ = new RoomWidgetRoomObjectUpdateEvent(_loc7_,_loc5_,_loc6_,param1.roomId);
                  break;
               }
               break;
            case "REOE_DESELECTED":
               _loc3_ = new RoomWidgetRoomObjectUpdateEvent("RWROUE_OBJECT_DESELECTED",_loc5_,_loc6_,param1.roomId);
               break;
            case "REOE_MOUSE_ENTER":
               _loc3_ = new RoomWidgetRoomObjectUpdateEvent("RWROUE_OBJECT_ROLL_OVER",_loc5_,_loc6_,param1.roomId);
               break;
            case "REOE_MOUSE_LEAVE":
               _loc3_ = new RoomWidgetRoomObjectUpdateEvent("RWROUE_OBJECT_ROLL_OUT",_loc5_,_loc6_,param1.roomId);
               break;
            case "REOE_REQUEST_MOVE":
               if(checkFurniManipulationRights(param1.roomId,param1.objectId,param1.category))
               {
                  _roomEngine.modifyRoomObject(param1.objectId,param1.category,"OBJECT_MOVE");
                  break;
               }
               break;
            case "REOE_REQUEST_ROTATE":
               if(checkFurniManipulationRights(param1.roomId,param1.objectId,param1.category))
               {
                  _roomEngine.modifyRoomObject(param1.objectId,param1.category,"OBJECT_ROTATE_POSITIVE");
                  break;
               }
               break;
            case "RETWE_REQUEST_CREDITFURNI":
               _loc9_ = new RoomWidgetFurniToWidgetMessage("RWFWM_MESSAGE_REQUEST_CREDITFURNI",_loc5_,_loc6_,param1.roomId);
               processWidgetMessage(_loc9_);
               break;
            case "RETWE_REQUEST_STICKIE":
               _loc9_ = new RoomWidgetFurniToWidgetMessage("RWFWM_MESSAGE_REQUEST_STICKIE",_loc5_,_loc6_,param1.roomId);
               processWidgetMessage(_loc9_);
               break;
            case "RETWE_REQUEST_PRESENT":
               _loc9_ = new RoomWidgetFurniToWidgetMessage("RWFWM_MESSAGE_REQUEST_PRESENT",_loc5_,_loc6_,param1.roomId);
               processWidgetMessage(_loc9_);
               break;
            case "RETWE_REQUEST_TROPHY":
               _loc9_ = new RoomWidgetFurniToWidgetMessage("RWFWM_MESSAGE_REQUEST_TROPHY",_loc5_,_loc6_,param1.roomId);
               processWidgetMessage(_loc9_);
               break;
            case "RETWE_REQUEST_TEASER":
               _loc9_ = new RoomWidgetFurniToWidgetMessage("RWFWM_MESSAGE_REQUEST_TEASER",_loc5_,_loc6_,param1.roomId);
               processWidgetMessage(_loc9_);
               break;
            case "RETWE_REQUEST_ECOTRONBOX":
               _loc9_ = new RoomWidgetFurniToWidgetMessage("RWFWM_MESSAGE_REQUEST_ECOTRONBOX",_loc5_,_loc6_,param1.roomId);
               processWidgetMessage(_loc9_);
               break;
            case "RETWE_REQUEST_DIMMER":
               _loc9_ = new RoomWidgetFurniToWidgetMessage("RWFWM_MESSAGE_REQUEST_DIMMER",_loc5_,_loc6_,param1.roomId);
               processWidgetMessage(_loc9_);
               break;
            case "RETWE_REQUEST_PLACEHOLDER":
               _loc9_ = new RoomWidgetFurniToWidgetMessage("RWFWM_MESSAGE_REQUEST_PLACEHOLDER",_loc5_,_loc6_,param1.roomId);
               processWidgetMessage(_loc9_);
               break;
            case "RERAE_FURNI_CLICK":
            case "RERAE_FURNI_DOUBLE_CLICK":
               handleRoomAdClick(param1);
               break;
            case "RERAE_TOOLTIP_SHOW":
            case "RERAE_TOOLTIP_HIDE":
               handleRoomAdTooltip(param1);
               break;
            case "RETWE_REQUEST_CLOTHING_CHANGE":
               _loc9_ = new RoomWidgetFurniToWidgetMessage("RWFWM_MESSAGE_REQUEST_CLOTHING_CHANGE",_loc5_,_loc6_,param1.roomId);
               processWidgetMessage(_loc9_);
               break;
            case "RETWE_REQUEST_PLAYLIST_EDITOR":
               _loc9_ = new RoomWidgetFurniToWidgetMessage("RWFWM_MESSAGE_REQUEST_PLAYLIST_EDITOR",_loc5_,_loc6_,param1.roomId);
               processWidgetMessage(_loc9_);
               break;
            case "RETWE_REQUEST_ACHIEVEMENT_RESOLUTION_ENGRAVING":
               _loc9_ = new RoomWidgetFurniToWidgetMessage("RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_ENGRAVING",_loc5_,_loc6_,param1.roomId);
               processWidgetMessage(_loc9_);
               break;
            case "RETWE_REQUEST_BADGE_DISPLAY_ENGRAVING":
               _loc9_ = new RoomWidgetFurniToWidgetMessage("RWFWM_WIDGET_MESSAGE_REQUEST_BADGE_DISPLAY_ENGRAVING",_loc5_,_loc6_,param1.roomId);
               processWidgetMessage(_loc9_);
               break;
            case "RETWE_REQUEST_ACHIEVEMENT_RESOLUTION_FAILED":
               if((_loc12_ = _roomEngine.getRoomObject(param1.roomId,param1.objectId,param1.category)) != null)
               {
                  _loc8_ = int(_loc12_.getModel().getNumber("furniture_owner_id"));
                  _loc4_ = 0;
                  if(_loc8_ == _loc4_)
                  {
                     _loc9_ = new RoomWidgetFurniToWidgetMessage("RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_FAILED",_loc5_,_loc6_,param1.roomId);
                     processWidgetMessage(_loc9_);
                     break;
                  }
                  break;
               }
               break;
            case "RETWE_OPEN_WIDGET":
            case "RETWE_CLOSE_WIDGET":
            case "RETWE_OPEN_FURNI_CONTEXT_MENU":
            case "RETWE_CLOSE_FURNI_CONTEXT_MENU":
            case "RETWE_REMOVE_DIMMER":
            case "ROSM_JUKEBOX_DISPOSE":
            case "RETWE_REQUEST_MANNEQUIN":
            case "ROSM_USE_PRODUCT_FROM_INVENTORY":
            case "ROSM_USE_PRODUCT_FROM_ROOM":
            case "RETWE_REQUEST_BACKGROUND_COLOR":
            case "RETWE_REQUEST_FRIEND_FURNITURE_ENGRAVING":
            case "RETWE_REQUEST_HIGH_SCORE_DISPLAY":
            case "RETWE_REQUEST_HIDE_HIGH_SCORE_DISPLAY":
            case "RETWE_REQUEST_INTERNAL_LINK":
            case "RETWE_REQUEST_ROOM_LINK":
               processEvent(param1);
         }
         if(_loc3_ != null)
         {
            _loc2_ = true;
            if(_loc3_ is RoomWidgetRoomObjectUpdateEvent)
            {
               _loc11_ = (_loc3_ as RoomWidgetRoomObjectUpdateEvent).roomId;
               _loc2_ = !RoomId.isRoomPreviewerId(_loc11_);
            }
            else if(_loc3_ is RoomWidgetRoomEngineUpdateEvent)
            {
               _loc11_ = (_loc3_ as RoomWidgetRoomEngineUpdateEvent).roomId;
               _loc2_ = !RoomId.isRoomPreviewerId(_loc11_);
            }
            if(_loc2_)
            {
               events.dispatchEvent(_loc3_);
            }
         }
      }
      
      private function checkFurniManipulationRights(param1:int, param2:int, param3:int) : Boolean
      {
         return isOwnerOfFurniture(_roomEngine.getRoomObject(param1,param2,param3));
      }
      
      public function roomEngineEventHandler(param1:RoomEngineEvent) : void
      {
         var _loc2_:RoomWidgetUpdateEvent = null;
         switch(param1.type)
         {
            case "REE_NORMAL_MODE":
               _loc2_ = new RoomWidgetRoomEngineUpdateEvent("RWREUE_NORMAL_MODE",param1.roomId);
               break;
            case "REE_GAME_MODE":
               _loc2_ = new RoomWidgetRoomEngineUpdateEvent("RWREUE_GAME_MODE",param1.roomId);
         }
         if(_loc2_ != null)
         {
            events.dispatchEvent(_loc2_);
         }
      }
      
      public function createRoomView(param1:int) : void
      {
         var _loc15_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc6_:class_3127 = null;
         var _loc3_:Rectangle = var_1671.roomViewRect;
         var _loc16_:int = _loc3_.width;
         var _loc22_:int = _loc3_.height;
         var _loc7_:int = _session.isGameSession ? 32 : 64;
         if(var_1729.indexOf(param1) >= 0)
         {
            return;
         }
         if(_session == null || _windowManager == null || _roomEngine == null)
         {
            return;
         }
         var _loc17_:DisplayObject;
         if((_loc17_ = _roomEngine.createRoomCanvas(_session.roomId,param1,_loc16_,_loc22_,_loc7_)) == null)
         {
            return;
         }
         var _loc18_:RoomGeometry;
         if((_loc18_ = _roomEngine.getRoomCanvasGeometry(_session.roomId,param1) as RoomGeometry) != null)
         {
            _loc15_ = _roomEngine.getRoomNumberValue(_session.roomId,"room_min_x");
            _loc5_ = _roomEngine.getRoomNumberValue(_session.roomId,"room_max_x");
            _loc14_ = _roomEngine.getRoomNumberValue(_session.roomId,"room_min_y");
            _loc4_ = _roomEngine.getRoomNumberValue(_session.roomId,"room_max_y");
            _loc13_ = (_loc15_ + _loc5_) / 2;
            _loc10_ = (_loc14_ + _loc4_) / 2;
            _loc8_ = 20;
            _loc13_ += _loc8_ - 1;
            _loc10_ += _loc8_ - 1;
            _loc11_ = Math.sqrt(_loc8_ * _loc8_ + _loc8_ * _loc8_) * Math.tan(0.5235987755982988);
            _loc18_.location = new Vector3d(_loc13_,_loc10_,_loc11_);
         }
         var _loc20_:XmlAsset;
         if((_loc20_ = _assets.getAssetByName("room_view_container_xml") as XmlAsset) == null)
         {
            return;
         }
         var _loc9_:class_3151;
         if((_loc9_ = _windowManager.buildFromXML(_loc20_.content as XML) as class_3151) == null)
         {
            return;
         }
         _loc9_.width = _loc16_;
         _loc9_.height = _loc22_;
         var_1533 = _loc9_.findChildByName("room_canvas_wrapper") as class_3207;
         if(var_1533 == null)
         {
            return;
         }
         var_1533.setDisplayObject(_loc17_);
         if(false)
         {
            _loc17_.addEventListener("click",mouseEventHandler);
         }
         checkAndEnableMouseZoomEvent(_loc17_);
         var_1533.addEventListener("WME_CLICK",canvasMouseHandler);
         var_1533.addEventListener("WME_DOUBLE_CLICK",canvasMouseHandler);
         var_1533.addEventListener("WME_MOVE",canvasMouseHandler);
         var_1533.addEventListener("WME_DOWN",canvasMouseHandler);
         var_1533.addEventListener("WME_UP",canvasMouseHandler);
         var_1533.addEventListener("WME_UP_OUTSIDE",canvasMouseHandler);
         var_1533.addEventListener("WE_RESIZED",onRoomViewResized);
         var _loc19_:Sprite;
         (_loc19_ = new Sprite()).mouseEnabled = false;
         _loc19_.blendMode = "multiply";
         var _loc21_:class_3207;
         if((_loc21_ = _loc9_.findChildByName("colorizer_wrapper") as class_3207) == null)
         {
            return;
         }
         _loc21_.setDisplayObject(_loc19_);
         _loc21_.addEventListener("WE_RESIZED",resizeColorizer);
         var _loc2_:Sprite = new Sprite();
         _loc2_.mouseEnabled = false;
         var _loc12_:class_3207;
         if((_loc12_ = _loc9_.findChildByName("background_wrapper") as class_3207) == null)
         {
            return;
         }
         _loc12_.setDisplayObject(_loc2_);
         _loc12_.addEventListener("WE_RESIZED",resizeBackgroundColorizer);
         if(false)
         {
            if((_loc6_ = getSpectatorModeVisualization()) != null)
            {
               _loc6_.width = _loc9_.width;
               _loc6_.height = _loc9_.height;
               _loc9_.addChild(_loc6_);
            }
         }
         var_1671.addRoomView(_loc9_);
         var_1729.push(param1);
      }
      
      private function checkAndEnableMouseZoomEvent(param1:DisplayObject) : void
      {
         param1.removeEventListener("mouseWheel",mouseWheelHandler);
         if(_sessionDataManager.isPerkAllowed("MOUSE_ZOOM"))
         {
            param1.addEventListener("mouseWheel",mouseWheelHandler);
         }
      }
      
      private function mouseWheelHandler(param1:MouseEvent) : void
      {
         var _loc3_:Point = null;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         if(param1.ctrlKey && !param1.altKey && !param1.shiftKey)
         {
            var_2477 += param1.delta == 0 ? 0 : (param1.delta < 0 ? -20 : 20);
            _loc3_ = new Point();
            var_1533.getGlobalPosition(_loc3_);
            _loc2_ = param1.stageX - _loc3_.x;
            _loc4_ = param1.stageY - _loc3_.y;
            var_2489 = new Point(_loc2_,_loc4_);
         }
      }
      
      private function resizeColorizer(param1:class_3134) : void
      {
         var _loc2_:class_3207 = param1.target as class_3207;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:Sprite = _loc2_.getDisplayObject() as Sprite;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.graphics.clear();
         _loc3_.graphics.beginFill(_roomColor);
         _loc3_.graphics.drawRect(0,0,_loc2_.width,_loc2_.height);
         _loc3_.graphics.endFill();
      }
      
      private function resizeBackgroundColorizer(param1:class_3134) : void
      {
         var _loc2_:class_3207 = param1.target as class_3207;
         if(_loc2_ == null)
         {
            return;
         }
         fillBackgroundColorizer(_loc2_);
      }
      
      private function fillBackgroundColorizer(param1:class_3207) : void
      {
         var _loc2_:Sprite = param1.getDisplayObject() as Sprite;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.graphics.clear();
         _loc2_.graphics.beginFill(_roomBackgroundColor);
         _loc2_.graphics.drawRect(0,0,param1.width,param1.height);
         _loc2_.graphics.endFill();
      }
      
      public function setRoomViewColor(param1:uint, param2:int) : void
      {
         var _loc5_:class_3151;
         if((_loc5_ = var_1671.getRoomView() as class_3151) == null)
         {
            return;
         }
         var _loc6_:class_3207;
         if((_loc6_ = _loc5_.getChildByName("colorizer_wrapper") as class_3207) == null)
         {
            return;
         }
         var _loc4_:Sprite;
         if((_loc4_ = _loc6_.getDisplayObject() as Sprite) == null)
         {
            return;
         }
         var _loc3_:int = ColorConverter.rgbToHSL(param1);
         _loc3_ = (_loc3_ & 16776960) + param2;
         param1 = uint(ColorConverter.hslToRGB(_loc3_));
         _roomColor = param1;
         _loc4_.graphics.clear();
         _loc4_.graphics.beginFill(param1);
         _loc4_.graphics.drawRect(0,0,_loc6_.width,_loc6_.height);
         _loc4_.graphics.endFill();
      }
      
      public function setRoomBackgroundColor(param1:int, param2:int, param3:int) : void
      {
         _roomBackgroundColor = ColorConverter.hslToRGB(((param1 & 255) << 16) + ((param2 & 255) << 8) + (param3 & 255));
         var _loc4_:class_3151;
         if((_loc4_ = var_1671.getRoomView() as class_3151) == null)
         {
            return;
         }
         var _loc5_:class_3207;
         if((_loc5_ = _loc4_.getChildByName("background_wrapper") as class_3207) == null)
         {
            return;
         }
         if(param1 == 0 && param2 == 0 && param3 == 0)
         {
            _loc5_.visible = false;
         }
         else
         {
            _loc5_.visible = true;
            fillBackgroundColorizer(_loc5_);
         }
      }
      
      public function getFirstCanvasId() : int
      {
         if(var_1729 != null)
         {
            if(false)
            {
               return var_1729[0];
            }
         }
         return 0;
      }
      
      public function getRoomViewRect() : Rectangle
      {
         if(!var_1671)
         {
            return null;
         }
         return var_1671.roomViewRect;
      }
      
      public function addListenerToStage(param1:String, param2:Function) : void
      {
         if(!var_1533 || !var_1533.getDisplayObject() || !var_1533.getDisplayObject().stage)
         {
            return;
         }
         var_1533.getDisplayObject().stage.addEventListener(param1,param2,false,0,true);
      }
      
      public function removeListenerFromStage(param1:String, param2:Function) : void
      {
         if(!var_1533 || !var_1533.getDisplayObject() || !var_1533.getDisplayObject().stage)
         {
            return;
         }
         var_1533.getDisplayObject().stage.removeEventListener(param1,param2);
      }
      
      public function canvasMouseHandler(param1:class_3134) : void
      {
         var _loc5_:Point = null;
         var _loc3_:int = 0;
         var _loc7_:int = 0;
         var _loc6_:Point = null;
         if(_roomEngine == null || _session == null)
         {
            return;
         }
         var _loc4_:WindowMouseEvent;
         if((_loc4_ = param1 as WindowMouseEvent) == null)
         {
            return;
         }
         var _loc8_:String = "";
         switch(_loc4_.type)
         {
            case "WME_CLICK":
               _loc8_ = "click";
               break;
            case "WME_DOUBLE_CLICK":
               _loc8_ = "doubleClick";
               break;
            case "WME_DOWN":
               _loc8_ = "mouseDown";
               break;
            case "WME_UP":
            case "WME_UP_OUTSIDE":
               _loc8_ = "mouseUp";
               break;
            case "WME_MOVE":
               _loc8_ = "mouseMove";
               break;
            default:
               return;
         }
         var _loc2_:class_3207 = _loc4_.target as class_3207;
         if(_loc2_ == _loc4_.target)
         {
            _loc5_ = new Point();
            _loc2_.getGlobalPosition(_loc5_);
            _loc3_ = _loc4_.stageX - _loc5_.x;
            _loc7_ = _loc4_.stageY - _loc5_.y;
            _roomEngine.setActiveRoom(_session.roomId);
            _roomEngine.handleRoomCanvasMouseEvent(var_1729[0],_loc3_,_loc7_,_loc8_,_loc4_.altKey,_loc4_.ctrlKey,_loc4_.shiftKey,_loc4_.buttonDown);
         }
         if(_loc8_ == "mouseMove" && var_1665 != null)
         {
            (_loc6_ = new Point(_loc4_.stageX,_loc4_.stageY)).offset(0,15);
            var_1665.setGlobalPosition(_loc6_);
         }
      }
      
      private function mouseEventHandler(param1:MouseEvent) : void
      {
         var _loc3_:Point = new Point();
         var_1533.getGlobalPosition(_loc3_);
         var _loc2_:int = param1.stageX - _loc3_.x;
         var _loc4_:int = param1.stageY - _loc3_.y;
         _roomEngine.setActiveRoom(_session.roomId);
         param1.stopImmediatePropagation();
         _roomEngine.handleRoomCanvasMouseEvent(var_1729[0],_loc2_,_loc4_,param1.type,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
      }
      
      private function onRoomViewResized(param1:class_3134) : void
      {
         var _loc2_:class_3127 = param1.window;
         var_3323 = _loc2_.rectangle;
         _roomEngine.modifyRoomCanvas(_session.roomId,var_1729[0],_loc2_.width,_loc2_.height);
         if(var_2004 == null)
         {
            var_2004 = new Timer(1000,1);
            var_2004.addEventListener("timer",onResizeTimerEvent);
         }
         else
         {
            var_2004.reset();
         }
         var_2004.start();
      }
      
      private function onResizeTimerEvent(param1:TimerEvent) : void
      {
         events.dispatchEvent(new RoomWidgetRoomViewUpdateEvent("RWRVUE_ROOM_VIEW_SIZE_CHANGED",var_3323));
      }
      
      private function trackZooming(param1:Boolean, param2:Boolean) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(var_4320)
         {
            _loc3_ = getTimer();
            _loc4_ = Math.round((_loc3_ - _zoomChangedMillis) / 1000);
            if(_habboTracking != null)
            {
               if(param1)
               {
                  if(param2)
                  {
                     _habboTracking.trackGoogle("zoomEvent","out");
                  }
                  _habboTracking.trackGoogle("zoomEnded","in",_loc4_);
               }
               else
               {
                  if(param2)
                  {
                     _habboTracking.trackGoogle("zoomEvent","in");
                  }
                  _habboTracking.trackGoogle("zoomEnded","out",_loc4_);
               }
            }
            _zoomChangedMillis = _loc3_;
         }
      }
      
      private function onToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == "HTIE_ICON_ZOOM")
         {
            toggleZoom();
         }
      }
      
      private function toggleZoom() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:IRoomGeometry = null;
         if(_session != null)
         {
            if((_roomEngine as class_20).getBoolean("zoom.enabled"))
            {
               _loc1_ = _roomEngine.getRoomCanvasScale(_roomEngine.activeRoomId);
               _loc2_ = _loc1_ == 1 ? 0.5 : 1;
               _roomEngine.setRoomCanvasScale(_roomEngine.activeRoomId,getFirstCanvasId(),_loc2_);
            }
            else
            {
               _loc3_ = _roomEngine.getRoomCanvasGeometry(_session.roomId,getFirstCanvasId());
               if(_loc3_ != null)
               {
                  trackZooming(_loc3_.isZoomedIn(),true);
                  _loc3_.performZoom();
               }
            }
         }
      }
      
      public function update() : void
      {
         var _loc6_:Number = NaN;
         var _loc4_:int = 0;
         var _loc2_:IRoomWidgetHandler = null;
         var _loc1_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc5_:Number = NaN;
         if(_updateListeners == null)
         {
            return;
         }
         var _loc3_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = _updateListeners[_loc4_] as IRoomWidgetHandler;
            if(_loc2_ != null)
            {
               _loc2_.update();
            }
            _loc4_++;
         }
         if(Math.abs(var_2477) > 0.01)
         {
            _loc6_ = _roomEngine.getRoomCanvasScale(_roomEngine.activeRoomId);
            _loc1_ = hibit(_loc6_);
            _loc7_ = (_loc1_ > 1 ? _loc1_ << 1 : 1) / 10;
            _loc5_ = var_2477 > 0 ? _loc6_ - _loc7_ : _loc6_ + _loc7_;
            _loc5_ = Math.max(0.5,_loc5_);
            var_3312 = true;
            var_2477 *= 0.05;
            _roomEngine.setRoomCanvasScale(_session.roomId,getFirstCanvasId(),_loc5_,var_2489,null,false,true);
         }
         else if(var_3312)
         {
            var_3312 = false;
            if((_loc6_ = _roomEngine.getRoomCanvasScale(_roomEngine.activeRoomId)) < 0.75)
            {
               _roomEngine.setRoomCanvasScale(_session.roomId,getFirstCanvasId(),0.5,var_2489,null,false,true);
            }
            else
            {
               _roomEngine.setRoomCanvasScale(_session.roomId,getFirstCanvasId(),Math.round(_loc6_),var_2489,null,false,true);
            }
         }
      }
      
      private function hibit(param1:int) : int
      {
         param1 |= param1 >> 1;
         param1 |= param1 >> 2;
         param1 |= param1 >> 4;
         param1 |= param1 >> 8;
         param1 |= param1 >> 16;
         return param1 - (param1 >> 1);
      }
      
      private function getWindowName(param1:int) : String
      {
         return "Room_Engine_Window_" + param1;
      }
      
      private function createFilter(param1:int, param2:int) : Array
      {
         var _loc3_:BlurFilter = new BlurFilter(2,2);
         return [];
      }
      
      private function getBitmapFilter(param1:int, param2:int) : BitmapFilter
      {
         var _loc9_:BitmapData;
         (_loc9_ = new BitmapData(param1,param2)).perlinNoise(param1,param2,5,Math.random() * 2000000000,true,false);
         var _loc6_:Point = new Point(0,0);
         var _loc3_:Number = param1 / 20;
         var _loc5_:Number = -param1 / 25;
         return new DisplacementMapFilter(_loc9_,_loc6_,1,1,_loc3_,_loc5_,"color",0,0);
      }
      
      private function checkInterrupts() : Boolean
      {
         if(_roomSessionManager != null && _session != null && var_3174)
         {
            _roomSessionManager.startSession(_session);
            processEvent(new RoomWidgetLoadingBarUpdateEvent("RWLBUW_HIDE_LOADING_BAR"));
            return true;
         }
         return false;
      }
      
      private function handleRoomAdClick(param1:RoomEngineObjectEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc4_:IRoomObject;
         if((_loc4_ = _roomEngine.getRoomObject(param1.roomId,param1.objectId,param1.category)) == null)
         {
            return;
         }
         var _loc3_:IRoomObjectModel = _loc4_.getModel() as IRoomObjectModel;
         var _loc2_:String = String(_loc3_.getString("furniture_ad_url"));
         if(_loc2_ == null || _loc2_.indexOf("http") != 0)
         {
            return;
         }
         switch(param1.type)
         {
            case "RERAE_FURNI_CLICK":
               if(false)
               {
                  return;
               }
               HabboWebTools.openWebPage(_loc2_);
               break;
            case "RERAE_FURNI_DOUBLE_CLICK":
               if(true)
               {
                  return;
               }
               HabboWebTools.openWebPage(_loc2_);
               break;
         }
      }
      
      private function handleRoomAdTooltip(param1:RoomEngineObjectEvent) : void
      {
         var _loc3_:IRoomObject = null;
         var _loc4_:* = null;
         var _loc5_:IRoomObjectModel = null;
         var _loc2_:String = null;
         if(param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case "RERAE_TOOLTIP_SHOW":
               if(var_1665 != null)
               {
                  return;
               }
               _loc3_ = _roomEngine.getRoomObject(param1.roomId,param1.objectId,param1.category);
               if(_loc3_ == null)
               {
                  return;
               }
               if((_loc4_ = String(_localization.getLocalization(_loc3_.getType() + ".tooltip","${ads.roomad.tooltip}"))) == null)
               {
                  _loc2_ = String((_loc5_ = _loc3_.getModel() as IRoomObjectModel).getString("furniture_ad_url"));
                  if(_loc2_ != null && _loc2_.indexOf("http") == 0)
                  {
                     _loc4_ = _loc2_;
                  }
               }
               if(_loc4_ == null)
               {
                  return;
               }
               var_1665 = _windowManager.createWindow("room_ad_tooltip",_loc4_,8,0,32) as IToolTipWindow;
               var_1665.setParamFlag(1,false);
               var_1665.visible = true;
               var_1665.center();
               break;
            case "RERAE_TOOLTIP_HIDE":
               if(var_1665 == null)
               {
                  return;
               }
               var_1665.dispose();
               var_1665 = null;
               break;
         }
      }
      
      private function getSpectatorModeVisualization() : class_3127
      {
         var _loc2_:XmlAsset = _assets.getAssetByName("spectator_mode_xml") as XmlAsset;
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc1_:class_3151 = _windowManager.buildFromXML(_loc2_.content as XML) as class_3151;
         if(_loc1_ == null)
         {
            return null;
         }
         setBitmap(_loc1_.findChildByName("top_left"),"spec_top_left_png");
         setBitmap(_loc1_.findChildByName("top_middle"),"spec_top_middle_png");
         setBitmap(_loc1_.findChildByName("top_right"),"spec_top_right_png");
         setBitmap(_loc1_.findChildByName("middle_left"),"spec_middle_left_png");
         setBitmap(_loc1_.findChildByName("middle_right"),"spec_middle_right_png");
         setBitmap(_loc1_.findChildByName("bottom_left"),"spec_bottom_left_png");
         setBitmap(_loc1_.findChildByName("bottom_middle"),"spec_bottom_middle_png");
         setBitmap(_loc1_.findChildByName("bottom_right"),"spec_bottom_right_png");
         return _loc1_;
      }
      
      private function setBitmap(param1:class_3127, param2:String) : void
      {
         var _loc4_:class_3282;
         if((_loc4_ = param1 as class_3282) == null || _assets == null)
         {
            return;
         }
         var _loc5_:BitmapDataAsset;
         if((_loc5_ = _assets.getAssetByName(param2) as BitmapDataAsset) == null)
         {
            return;
         }
         var _loc3_:BitmapData = _loc5_.content as BitmapData;
         if(_loc3_ == null)
         {
            return;
         }
         _loc4_.bitmap = _loc3_.clone();
      }
      
      public function initializeWidget(param1:String, param2:int = 0) : void
      {
         var _loc3_:IRoomWidget = var_1442[param1];
         if(_loc3_ == null)
         {
            class_14.log("Tried to initialize an unknown widget " + param1);
            return;
         }
         _loc3_.initialize(param2);
      }
      
      public function getWidgetState(param1:String) : int
      {
         var _loc2_:IRoomWidget = var_1442[param1];
         if(_loc2_ == null)
         {
            class_14.log("Requested the state of an unknown widget " + param1);
            return -1;
         }
         return _loc2_.state;
      }
      
      public function addUpdateListener(param1:IRoomWidgetHandler) : void
      {
         if(_updateListeners == null)
         {
            _updateListeners = [];
         }
         if(_updateListeners.indexOf(param1) == -1)
         {
            _updateListeners.push(param1);
         }
      }
      
      public function removeUpdateListener(param1:IRoomWidgetHandler) : void
      {
         if(_updateListeners == null)
         {
            return;
         }
         var _loc2_:int = _updateListeners.indexOf(param1);
         if(_loc2_ != -1)
         {
            _updateListeners.splice(_loc2_,1);
         }
      }
      
      public function isOwnerOfFurniture(param1:IRoomObject) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:IRoomObjectModel = param1.getModel();
         if(_loc3_ == null)
         {
            return false;
         }
         var _loc2_:Number = Number(_loc3_.getNumber("furniture_owner_id"));
         return _loc2_ == _loc4_;
      }
      
      public function getFurnitureOwnerId(param1:IRoomObject) : int
      {
         var _loc2_:Number = NaN;
         var _loc3_:IRoomObjectModel = param1.getModel();
         if(_loc3_ != null)
         {
            _loc2_ = Number(_loc3_.getNumber("furniture_owner_id"));
            if(!isNaN(_loc2_))
            {
               return _loc2_;
            }
         }
         return -1;
      }
      
      public function isOwnerOfPet(param1:class_3259) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:int = 0;
         return _loc2_ == param1.ownerId;
      }
      
      public function showGamePlayerName(param1:int, param2:String, param3:uint, param4:int) : void
      {
         var _loc5_:AvatarInfoWidget;
         if(!(_loc5_ = var_1442["RWE_AVATAR_INFO"] as AvatarInfoWidget))
         {
            return;
         }
         _loc5_.showGamePlayerName(param1,param2,param3,param4);
      }
      
      public function get layoutManager() : com.sulake.habbo.ui.class_3360
      {
         return var_1671;
      }
      
      public function mouseEventPositionHasInputEventWindow(param1:MouseEvent, param2:int) : Boolean
      {
         var _loc3_:Array = new Array(0);
         var _loc4_:Point = new Point(param1.stageX,param1.stageY);
         _windowManager.getDesktop(param2).groupParameterFilteredChildrenUnderPoint(_loc4_,_loc3_,1);
         return _loc3_.length > 1;
      }
   }
}
