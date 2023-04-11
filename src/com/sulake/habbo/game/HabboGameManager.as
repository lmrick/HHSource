package com.sulake.habbo.game
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.habbo.avatar.class_1690;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.friendbar.IHabboLandingView;
   import com.sulake.habbo.game.snowwar.SnowWarEngine;
   import com.sulake.habbo.game.snowwar.utils.WindowUtils;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.inventory.class_1697;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.navigator.class_1685;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.events.RoomObjectTileMouseEvent;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboHelp;
   import com.sulake.iid.IIDHabboInventory;
   import com.sulake.iid.IIDHabboLandingView;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboNavigator;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDHabboWindowManager;
   import com.sulake.iid.IIDRoomEngine;
   import com.sulake.iid.IIDSessionDataManager;
   import package_23.GetSnowWarGameTokensOfferComposer;
   import package_29.Game2CheckGameDirectoryStatusMessageComposer;
   import package_29.class_354;
   import package_29.class_456;
   
   public class HabboGameManager extends class_20 implements class_1688
   {
       
      
      private var _communication:class_25;
      
      private var _windowManager:class_1684;
      
      private var _localization:class_18;
      
      private var _sessionDataManager:ISessionDataManager;
      
      private var _roomSessionManager:IRoomSessionManager;
      
      private var _toolbar:IHabboToolbar;
      
      private var _avatarManager:class_1690;
      
      private var _catalog:IHabboCatalog;
      
      private var _roomEngine:IRoomEngine;
      
      private var _habboHelp:IHabboHelp;
      
      private var _inventory:class_1697;
      
      private var _navigator:class_1685;
      
      private var var_1432:SnowWarEngine;
      
      private var var_2619:com.sulake.habbo.game.IncomingMessages;
      
      private var var_4215:Boolean = false;
      
      private var var_4103:Boolean = false;
      
      private var var_4219:Boolean = false;
      
      private var _landingView:IHabboLandingView;
      
      private var _activeGame:int = -1;
      
      public function HabboGameManager(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         super(param1,param2,param3);
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),onHabboCommunicationReady);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationReady);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationReady);
         queueInterface(new IIDSessionDataManager(),onSessionDataManagerReady);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
         queueInterface(new IIDAvatarRenderManager(),onAvatarRenderedReady);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
         queueInterface(new IIDHabboCatalog(),onCatalogReady);
         queueInterface(new IIDHabboLandingView(),onLandingViewReady);
         queueInterface(new IIDRoomEngine(),onRoomEngineReady);
         queueInterface(new IIDHabboHelp(),onHabboHelpReady);
         queueInterface(new IIDHabboInventory(),onHabboInventory);
         queueInterface(new IIDHabboNavigator(),onHabboNavigator);
         var_1432 = new SnowWarEngine(this,param1,0,param3);
         HabboGamesCom.log("HabboGameManager initialized: " + param3);
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return _sessionDataManager;
      }
      
      public function get communication() : class_25
      {
         return _communication;
      }
      
      public function get localization() : class_18
      {
         return _localization;
      }
      
      public function get avatarManager() : class_1690
      {
         return _avatarManager;
      }
      
      public function get roomEngine() : IRoomEngine
      {
         return _roomEngine;
      }
      
      public function get inventory() : class_1697
      {
         return _inventory;
      }
      
      public function get navigator() : class_1685
      {
         return _navigator;
      }
      
      public function get gameCenterEnabled() : Boolean
      {
         return var_4215 || var_4103 && sessionDataManager.hasSecurity(4);
      }
      
      public function get isHotelClosed() : Boolean
      {
         return var_4219;
      }
      
      public function set hotelClosed(param1:Boolean) : void
      {
         var_4219 = param1;
      }
      
      override public function dispose() : void
      {
         if(_communication)
         {
            _communication.release(new IIDHabboCommunicationManager());
            _communication = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         if(_localization)
         {
            _localization.release(new IIDHabboLocalizationManager());
            _localization = null;
         }
         if(_sessionDataManager != null)
         {
            _sessionDataManager.release(new IIDSessionDataManager());
            _sessionDataManager = null;
         }
         if(_habboHelp != null)
         {
            _habboHelp.release(new IIDHabboHelp());
            _habboHelp = null;
         }
         if(_toolbar)
         {
            if(false)
            {
               _toolbar.events.removeEventListener("HTE_TOOLBAR_CLICK",onToolbarClick);
            }
            _toolbar.release(new IIDHabboToolbar());
            _toolbar = null;
         }
         if(_avatarManager != null)
         {
            _avatarManager.release(new IIDAvatarRenderManager());
            _avatarManager = null;
         }
         if(_catalog != null)
         {
            _catalog.release(new IIDHabboCatalog());
            _catalog = null;
         }
         if(var_2619)
         {
            var_2619.dispose();
            var_2619 = null;
         }
         if(_landingView)
         {
            _landingView.release(new IIDHabboLandingView());
            _landingView = null;
         }
         if(_roomEngine)
         {
            _roomEngine.release(new IIDRoomEngine());
            _roomEngine = null;
         }
         if(_inventory)
         {
            _inventory.release(new IIDHabboInventory());
            _inventory = null;
         }
         if(_navigator)
         {
            _navigator.release(new IIDHabboNavigator());
            _navigator = null;
         }
         _activeGame = -1;
         super.dispose();
      }
      
      private function onWindowManagerReady(param1:IID, param2:IUnknown) : void
      {
         _windowManager = param2 as class_1684;
         WindowUtils.init(assets,_windowManager);
      }
      
      private function onHabboCommunicationReady(param1:IID, param2:IUnknown) : void
      {
         _communication = param2 as class_25;
         var_2619 = new com.sulake.habbo.game.IncomingMessages(this);
      }
      
      private function onConfigurationReady(param1:IID, param2:IUnknown) : void
      {
         var_4215 = getBoolean("game.center.enabled");
         var_4103 = getBoolean("game.center.enabled.forStaff");
      }
      
      private function onLocalizationReady(param1:IID, param2:IUnknown) : void
      {
         _localization = param2 as class_18;
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _sessionDataManager = param2 as ISessionDataManager;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _roomSessionManager = param2 as IRoomSessionManager;
      }
      
      private function onAvatarRenderedReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _avatarManager = param2 as class_1690;
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _toolbar = param2 as IHabboToolbar;
         _toolbar.events.addEventListener("HTE_TOOLBAR_CLICK",onToolbarClick);
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _catalog = param2 as IHabboCatalog;
      }
      
      private function onLandingViewReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _landingView = param2 as IHabboLandingView;
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _roomEngine = param2 as IRoomEngine;
      }
      
      private function onHabboHelpReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _habboHelp = param2 as IHabboHelp;
      }
      
      private function onHabboInventory(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _inventory = param2 as class_1697;
      }
      
      private function onHabboNavigator(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _navigator = param2 as class_1685;
      }
      
      public function initGameDirectoryConnection() : void
      {
         send(new Game2CheckGameDirectoryStatusMessageComposer());
      }
      
      public function startSnowWarGame(param1:String) : void
      {
         initGameDirectoryConnection();
         send(new class_354(param1));
      }
      
      public function startQuickSnowWarGame() : void
      {
         send(new class_456());
      }
      
      public function onSnowWarArenaSessionEnded() : void
      {
         if(true)
         {
            var_1432.resetSession();
            if(_landingView != null)
            {
               _landingView.activate();
            }
         }
      }
      
      public function generateChecksumMismatch() : void
      {
         if(var_1432)
         {
            var_1432.generateChecksumMismatch();
         }
      }
      
      public function handleClickOnTile(param1:RoomObjectTileMouseEvent) : void
      {
         if(var_1432)
         {
            var_1432.handleClickOnTile(param1);
         }
      }
      
      public function handleClickOnHuman(param1:int, param2:Boolean, param3:Boolean) : void
      {
         if(var_1432)
         {
            var_1432.handleClickOnHuman(param1,param2,param3);
         }
      }
      
      public function handleMouseOverOnHuman(param1:int, param2:Boolean, param3:Boolean) : void
      {
         if(var_1432)
         {
            var_1432.handleMouseOverOnHuman(param1,param2,param3);
         }
      }
      
      public function send(param1:IMessageComposer) : void
      {
         if(_communication)
         {
            _communication.connection.send(param1);
         }
      }
      
      private function onToolbarClick(param1:HabboToolbarEvent) : void
      {
         switch(param1.iconId)
         {
            case "HTIE_ICON_GAMES":
               initGameDirectoryConnection();
               send(new GetSnowWarGameTokensOfferComposer());
               break;
            case "HTIE_ICON_RECEPTION":
         }
      }
   }
}
