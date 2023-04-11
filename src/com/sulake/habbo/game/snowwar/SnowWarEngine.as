package com.sulake.habbo.game.snowwar
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.runtime.class_19;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.avatar.class_1690;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.*;
   import com.sulake.habbo.friendlist.class_1869;
   import com.sulake.habbo.game.HabboGameManager;
   import com.sulake.habbo.game.events.GameChatEvent;
   import com.sulake.habbo.game.snowwar.arena.ISynchronizedGameEvent;
   import com.sulake.habbo.game.snowwar.arena.SynchronizedGameArena;
   import com.sulake.habbo.game.snowwar.arena.class_3327;
   import com.sulake.habbo.game.snowwar.events.NewMoveTargetEvent;
   import com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject;
   import com.sulake.habbo.game.snowwar.leaderboard.LeaderboardViewController;
   import com.sulake.habbo.game.snowwar.ui.GameArenaView;
   import com.sulake.habbo.game.snowwar.ui.GameEndingViewController;
   import com.sulake.habbo.game.snowwar.ui.GameLoadingViewController;
   import com.sulake.habbo.game.snowwar.ui.GameLobbyWindowCtrl;
   import com.sulake.habbo.game.snowwar.ui.GamesMainViewController;
   import com.sulake.habbo.game.snowwar.utils.Location3D;
   import com.sulake.habbo.game.snowwar.utils.WindowUtils;
   import com.sulake.habbo.groups.class_1752;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.events.RoomEngineEvent;
   import com.sulake.habbo.room.events.RoomObjectTileMouseEvent;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.sound.class_2089;
   import com.sulake.habbo.ui.IRoomUI;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.habbo.window.utils.class_3132;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboFriendList;
   import com.sulake.iid.IIDHabboGroupsManager;
   import com.sulake.iid.IIDHabboHelp;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboRoomUI;
   import com.sulake.iid.IIDHabboSoundManager;
   import com.sulake.iid.IIDHabboWindowManager;
   import com.sulake.iid.IIDRoomEngine;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.events.Event;
   import package_29.*;
   import package_47.*;
   import package_49.class_898;
   import package_71.*;
   
   public class SnowWarEngine extends class_20 implements class_41
   {
      
      private static const GHOST_CHECKSUM_TURNS_TO_CHECK:int = 3;
      
      public static const GET_SNOWWAR_TOKENS:String = "GET_SNOWWAR_TOKENS";
      
      public static const GET_SNOWWAR_TOKENS2:String = "GET_SNOWWAR_TOKENS2";
      
      public static const GET_SNOWWAR_TOKENS3:String = "GET_SNOWWAR_TOKENS3";
      
      public static const STATE_INACTIVE:int = 0;
      
      public static const STATE_GAME_STARTING:int = 1;
      
      public static const STATE_STAGE_LOADING:int = 2;
      
      public static const STATE_STAGE_STARTING:int = 3;
      
      public static const STATE_STAGE_RUNNING:int = 4;
      
      public static const STATE_STAGE_ENDING:int = 5;
      
      public static const STATE_GAME_OVER:int = 6;
      
      public static const STATE_REJOIN_GAME:int = 7;
      
      private static var _soundManager:class_2089;
       
      
      private var _gameManager:HabboGameManager;
      
      private var _communication:class_25;
      
      private var _windowManager:class_1684;
      
      private var _configuration:class_19;
      
      private var _localization:class_18;
      
      private var _sessionDataManager:ISessionDataManager;
      
      private var _roomSessionManager:IRoomSessionManager;
      
      private var _avatarManager:class_1690;
      
      private var var_2870:class_1752;
      
      private var _roomEngine:IRoomEngine;
      
      private var _roomUI:IRoomUI;
      
      private var _catalog:IHabboCatalog;
      
      private var var_2619:com.sulake.habbo.game.snowwar.class_3136;
      
      private var _habboHelp:IHabboHelp;
      
      private var _friendList:class_1869;
      
      private var var_1488:SynchronizedGameArena;
      
      private var var_1507:GameArenaView;
      
      private var _timeSinceLastUpdate:int;
      
      private var var_1464:int = 0;
      
      private var var_1944:class_3132;
      
      private var var_2620:int;
      
      private var _players:class_24;
      
      private var var_1717:int = 0;
      
      private var var_2185:int = 0;
      
      private var var_2898:int = 0;
      
      private var _serverChecksums:class_24;
      
      private var var_3283:Boolean = false;
      
      private var var_2189:GameLoadingViewController;
      
      private var var_1472:GameEndingViewController;
      
      private var var_1721:GamesMainViewController;
      
      private var var_2551:LeaderboardViewController;
      
      private var var_2268:Boolean = false;
      
      private var var_3767:Boolean = false;
      
      private var var_4113:Boolean = false;
      
      private var var_3394:Boolean = false;
      
      private var _stageLength:int;
      
      private var var_1688:Boolean = false;
      
      private var var_3866:Boolean = false;
      
      private var var_607:int = 0;
      
      private var _roomBeforeGame:int = -1;
      
      private var var_816:int = -1;
      
      private var var_3883:Boolean = false;
      
      public function SnowWarEngine(param1:HabboGameManager, param2:class_31, param3:uint = 0, param4:class_21 = null)
      {
         super(param2,param3,param4);
         _gameManager = param1;
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),onHabboCommunicationReady);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationReady);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationReady);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
         queueInterface(new IIDSessionDataManager(),onSessionDataManagerReady);
         queueInterface(new IIDAvatarRenderManager(),onAvatarRenderedReady);
         queueInterface(new IIDRoomEngine(),onRoomEngineReady);
         queueInterface(new IIDHabboSoundManager(),onSoundManagerReady);
         queueInterface(new IIDHabboRoomUI(),onRoomUIReady);
         queueInterface(new IIDHabboCatalog(),onCatalogReady);
         queueInterface(new IIDHabboHelp(),onHabboHelpReady);
         queueInterface(new IIDHabboFriendList(),onFriendListReady);
         queueInterface(new IIDHabboGroupsManager(),onGroupsManagerReady);
         HabboGamesCom.log("SnowWarEngine initialized: " + param4);
         var_1721 = new GamesMainViewController(this);
      }
      
      public static function playSound(param1:String, param2:int = 0) : void
      {
         if(_soundManager != null)
         {
            _soundManager.playSound(param1,param2);
         }
      }
      
      public static function stopSound(param1:String) : void
      {
         if(_soundManager != null)
         {
            _soundManager.stopSound(param1);
         }
      }
      
      public function get gameCenterEnabled() : Boolean
      {
         return _gameManager.gameCenterEnabled;
      }
      
      public function get roomEngine() : IRoomEngine
      {
         return _roomEngine;
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
      
      public function get config() : class_19
      {
         return _configuration;
      }
      
      public function get avatarManager() : class_1690
      {
         return _avatarManager;
      }
      
      public function get groupsManager() : class_1752
      {
         return var_2870;
      }
      
      public function get roomUI() : IRoomUI
      {
         return _roomUI;
      }
      
      public function get catalog() : IHabboCatalog
      {
         return _catalog;
      }
      
      public function get friendList() : class_1869
      {
         return _friendList;
      }
      
      public function get gameArena() : SynchronizedGameArena
      {
         return var_1488;
      }
      
      public function get currentSubTurn() : int
      {
         return var_1717;
      }
      
      public function get stageLength() : int
      {
         return _stageLength;
      }
      
      public function get roomBeforeGame() : int
      {
         return _roomBeforeGame;
      }
      
      public function get isGhostEnabled() : Boolean
      {
         return var_2268;
      }
      
      public function get isGhostVisualizationEnabled() : Boolean
      {
         return var_3767;
      }
      
      public function getArenaName(param1:GameLobbyData) : String
      {
         var _loc2_:String = "snowwar.field.name." + param1.fieldType;
         return localization.getLocalization(_loc2_,_loc2_);
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
         if(_configuration)
         {
            _configuration.release(new IIDHabboConfigurationManager());
            _configuration = null;
         }
         if(_localization)
         {
            _localization.release(new IIDHabboLocalizationManager());
            _localization = null;
         }
         if(_roomSessionManager)
         {
            _roomSessionManager.release(new IIDHabboRoomSessionManager());
            _roomSessionManager = null;
         }
         if(_sessionDataManager != null)
         {
            _sessionDataManager.release(new IIDSessionDataManager());
            _sessionDataManager = null;
         }
         if(_roomEngine != null)
         {
            _roomEngine.events.removeEventListener("REE_OBJECTS_INITIALIZED",onRoomObjectsInitialized);
            _roomEngine.release(new IIDRoomEngine());
            _roomEngine = null;
         }
         if(_soundManager != null)
         {
            _soundManager.release(new IIDHabboSoundManager());
            _soundManager = null;
         }
         if(_habboHelp != null)
         {
            _habboHelp.release(new IIDHabboHelp());
            _habboHelp = null;
         }
         if(_avatarManager != null)
         {
            _avatarManager.release(new IIDAvatarRenderManager());
            _avatarManager = null;
         }
         if(var_2870 != null)
         {
            var_2870.release(new IIDHabboGroupsManager());
            var_2870 = null;
         }
         if(_roomUI != null)
         {
            _roomUI.release(new IIDHabboRoomUI());
            _roomUI = null;
         }
         if(_catalog != null)
         {
            _catalog.release(new IIDHabboCatalog());
            _catalog = null;
         }
         if(_friendList != null)
         {
            _friendList.release(new IIDHabboFriendList());
            _friendList = null;
         }
         if(var_1944 != null)
         {
            var_1944.dispose();
            var_1944 = null;
         }
         if(var_1472)
         {
            var_1472.dispose();
            var_1472 = null;
         }
         disposeLoadingView();
         if(var_1488 != null)
         {
            var_1488.dispose();
            var_1488 = null;
         }
         if(var_1507 != null)
         {
            var_1507.dispose();
            var_1507 = null;
         }
         if(var_1721)
         {
            var_1721.dispose();
            var_1721 = null;
         }
         if(var_2619)
         {
            var_2619.dispose();
            var_2619 = null;
         }
         if(var_2551)
         {
            var_2551.dispose();
            var_2551 = null;
         }
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
         var_2619 = new com.sulake.habbo.game.snowwar.class_3136(this);
      }
      
      private function onConfigurationReady(param1:IID, param2:IUnknown) : void
      {
         _configuration = param2 as class_19;
         var_2268 = _configuration.getBoolean("snowwar.ghost.enabled");
         if(var_2268)
         {
            var_3767 = _configuration.getBoolean("snowwar.ghost.visualization.enabled");
            var_4113 = _configuration.getBoolean("snowwar.ghost.immediate.enabled");
         }
         HabboGamesCom.logEnabled = _configuration.getBoolean("snowwar.log.enabled");
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
         _avatarManager.events.addEventListener("AVATAR_RENDER_READY",onAvatarReady);
      }
      
      private function onGroupsManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_2870 = param2 as class_1752;
      }
      
      private function onAvatarReady(param1:Event) : void
      {
         var _loc3_:XmlAsset = null;
         var _loc2_:Boolean = (context.assets as AssetLibraryCollection).hasAssetLibrary(assets.name);
         if(!_loc2_)
         {
            HabboGamesCom.log(assets.manifest);
            (context.assets as AssetLibraryCollection).addAssetLibrary(assets);
            _loc3_ = assets.getAssetByName("figure") as XmlAsset;
            _avatarManager.injectFigureData(_loc3_.content as XML);
            _avatarManager.resetAssetManager();
         }
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _roomEngine = param2 as IRoomEngine;
         _roomEngine.events.addEventListener("REE_OBJECTS_INITIALIZED",onRoomObjectsInitialized);
      }
      
      private function onRoomObjectsInitialized(param1:RoomEngineEvent) : void
      {
         if(var_1488)
         {
            send(new Game2LoadStageReadyMessageComposer(100));
         }
      }
      
      public function send(param1:IMessageComposer) : void
      {
         if(_communication)
         {
            _communication.connection.send(param1);
         }
      }
      
      private function onSoundManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _soundManager = class_2089(param2);
      }
      
      private function onRoomUIReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _roomUI = param2 as IRoomUI;
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _catalog = param2 as IHabboCatalog;
      }
      
      public function showGamesMainView() : void
      {
         var_1721.toggleVisibility();
      }
      
      private function onHabboHelpReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _habboHelp = param2 as IHabboHelp;
      }
      
      private function onFriendListReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _friendList = param2 as class_1869;
      }
      
      public function onGameDirectoryAvailable(param1:Boolean) : void
      {
         if(param1)
         {
            showGamesMainView();
         }
      }
      
      public function initArena(param1:int, param2:int, param3:int, param4:Array) : void
      {
         if(!var_1488)
         {
            var_1488 = new SynchronizedGameArena();
            var_1488.setExtension(new class_3369());
            var_1488.initialize(this,param3);
            var_1507 = new GameArenaView(this);
            _roomSessionManager.disposeSession(-1,false);
            _roomSessionManager.startGameSession();
            registerUpdateReceiver(this,1);
            _timeSinceLastUpdate = 0;
            var_1717 = 0;
            var_2185 = 0;
         }
      }
      
      public function startServerGame(param1:String) : void
      {
         initGameDirectoryConnection();
         send(new class_354(param1));
      }
      
      public function initGameDirectoryConnection() : void
      {
         send(new Game2CheckGameDirectoryStatusMessageComposer());
      }
      
      public function startQuickServerGame() : void
      {
         send(new class_456());
      }
      
      private function getCurrentStage() : class_3328
      {
         if(!var_1488)
         {
            return null;
         }
         return var_1488.getCurrentStage() as class_3328;
      }
      
      public function getCurrentPlayer() : HumanGameObject
      {
         return getPlayer(var_2620);
      }
      
      public function getPlayer(param1:int) : HumanGameObject
      {
         var _loc2_:class_3327 = getCurrentStage();
         if(!_loc2_)
         {
            return null;
         }
         return _loc2_.getGameObject(param1) as HumanGameObject;
      }
      
      public function handleClickOnTile(param1:RoomObjectTileMouseEvent) : void
      {
         if(var_1464 != 4)
         {
            return;
         }
         var _loc2_:int = class_3358.getClickTypeOnTile(param1.altKey,param1.shiftKey);
         if(_loc2_ == 0)
         {
            moveOwnAvatarTo(param1.tileXAsInt,param1.tileYAsInt);
         }
         else
         {
            throwSnowballAt(param1.tileXAsInt,param1.tileYAsInt,getTrajectoryFromClickType(_loc2_));
         }
      }
      
      public function handleClickOnHuman(param1:int, param2:Boolean, param3:Boolean) : void
      {
         var _loc7_:HumanGameObject = null;
         var _loc4_:HumanGameObject = null;
         var _loc6_:int = 0;
         if(var_1464 != 4)
         {
            return;
         }
         var _loc5_:HumanGameObject = getGhostPlayer();
         if(param1 == var_2620 || var_2268 && _loc5_ && param1 == _loc5_.gameObjectId)
         {
            if(makeSnowball() && var_1507)
            {
               var_1507.startWaitingForSnowball();
            }
         }
         else
         {
            _loc7_ = getCurrentPlayer();
            _loc4_ = getPlayer(param1);
            if(_loc7_ && _loc4_ && _loc7_.team != _loc4_.team)
            {
               _loc6_ = class_3358.getClickTypeOnOpponent(param2,param3);
               throwSnowballAtHuman(param1,getTrajectoryFromClickType(_loc6_));
            }
         }
      }
      
      public function handleMouseOverOnHuman(param1:int, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:HumanGameObject;
         if(!(_loc6_ = getPlayer(param1)))
         {
            return;
         }
         if(_configuration.getBoolean("snowstorm.settings.show_user_names"))
         {
            _loc4_ = _loc6_.team == 1 ? 4281310921 : 4290988872;
            _loc5_ = 500;
            _roomUI.showGamePlayerName(_loc6_.gameObjectId,_loc6_.name,_loc4_,_loc5_);
         }
         if(var_1464 == 4)
         {
            var_1507.updateTileCursor(_loc6_.team);
         }
      }
      
      public function moveOwnAvatarTo(param1:int, param2:int) : void
      {
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:class_3328 = null;
         if(var_1464 != 4)
         {
            return;
         }
         var _loc4_:HumanGameObject;
         if(_loc4_ = getCurrentPlayer())
         {
            _loc6_ = param1 * 3200;
            _loc5_ = param2 * 3200;
            _loc3_ = getCurrentStage();
            if(_loc3_)
            {
               send(new Game2SetUserMoveTargetMessageComposer(_loc6_,_loc5_,var_1488.getTurnNumber(),var_1488.subturn));
               walkGhost(_loc4_,_loc6_,_loc5_);
            }
         }
      }
      
      public function getGhostPlayer() : HumanGameObject
      {
         var _loc1_:HumanGameObject = getCurrentPlayer();
         if(_loc1_)
         {
            return getPlayer(_loc1_.ghostObjectId);
         }
         return null;
      }
      
      private function throwSnowballAtHuman(param1:int, param2:int) : void
      {
         var _loc3_:HumanGameObject = getCurrentPlayer();
         if(_loc3_ && _loc3_.canThrowSnowballs())
         {
            send(new Game2ThrowSnowballAtHumanMessageComposer(param1,param2,var_1488.getTurnNumber(),var_1488.subturn));
            stopGhost();
         }
      }
      
      private function throwSnowballAt(param1:int, param2:int, param3:int) : void
      {
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:HumanGameObject;
         if((_loc4_ = getCurrentPlayer()) && _loc4_.canThrowSnowballs())
         {
            _loc6_ = param1 * 3200;
            _loc5_ = param2 * 3200;
            send(new Game2ThrowSnowballAtPositionMessageComposer(_loc6_,_loc5_,param3,var_1488.getTurnNumber(),var_1488.subturn));
            stopGhost();
         }
      }
      
      private function getTrajectoryFromClickType(param1:int) : int
      {
         var _loc2_:int = 0;
         switch(param1 - 1)
         {
            case 0:
               _loc2_ = 0;
               break;
            case 1:
               _loc2_ = 2;
               break;
            case 2:
               _loc2_ = 1;
               break;
            default:
               _loc2_ = 3;
         }
         return _loc2_;
      }
      
      public function makeSnowball() : Boolean
      {
         if(var_1464 != 4)
         {
            return false;
         }
         var _loc1_:HumanGameObject = getCurrentPlayer();
         if(_loc1_ && _loc1_.canMakeSnowballs())
         {
            send(new Game2MakeSnowballMessageComposer(var_1488.getTurnNumber(),var_1488.subturn));
            stopGhost();
            return true;
         }
         return false;
      }
      
      private function walkGhost(param1:HumanGameObject, param2:int, param3:int) : void
      {
         var _loc6_:Boolean = false;
         var _loc4_:HumanGameObject = null;
         var _loc5_:ISynchronizedGameEvent = null;
         if(var_2268)
         {
            _loc6_ = param1 && param1.posture != "swdieback" && param1.posture != "swdiefront";
            if((_loc4_ = getGhostPlayer()) && _loc6_)
            {
               _loc5_ = new NewMoveTargetEvent(_loc4_,param2,param3);
               if(var_4113)
               {
                  _loc5_.apply(gameArena.getCurrentStage());
               }
               else
               {
                  gameArena.addGameEvent(gameArena.getTurnNumber(),gameArena.subturn,_loc5_);
               }
            }
         }
      }
      
      private function stopGhost() : void
      {
         var _loc1_:HumanGameObject = null;
         if(var_2268)
         {
            _loc1_ = getGhostPlayer();
            if(_loc1_)
            {
               _loc1_.stopMovement();
            }
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc9_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:* = false;
         var _loc10_:* = false;
         var _loc2_:int = 0;
         var _loc4_:* = 0;
         if(!var_1488 || !var_1464 == 4 || !var_1464 == 3)
         {
            return;
         }
         if(var_1507 && var_1464 == 3)
         {
            var_1507.update(param1,false);
         }
         _timeSinceLastUpdate += param1;
         var _loc8_:int = (var_1488.getExtension() as class_3369).getPulseInterval();
         if(!var_3283 && _timeSinceLastUpdate > _loc8_ && var_1717 < var_2185)
         {
            var_1488.pulse();
            _timeSinceLastUpdate -= _loc8_;
            var_1717++;
            if(_timeSinceLastUpdate > _loc8_)
            {
               _timeSinceLastUpdate = 0;
            }
            _loc9_ = var_2185 - currentSubTurn;
            while(_loc9_-- > 3)
            {
               var_1488.pulse();
               var_1717++;
            }
            if(var_1507 && var_1464 == 4)
            {
               var_1507.update(param1,false);
            }
            if(var_1717 % var_1488.getNumberOfSubTurns() == 0)
            {
               _loc5_ = gameArena.getTurnNumber() - 1;
               _loc6_ = gameArena.getCheckSum(_loc5_);
               _loc7_ = 0;
               checkGhostLocation(_loc5_);
               _loc3_ = _loc5_ < var_2898 - 3;
               _loc10_ = _loc7_ != _loc6_;
               if(_loc3_ || _loc10_ || var_3394)
               {
                  HabboGamesCom.log("Turn: " + [_loc5_,var_2898] + " currentSubTurn:" + var_1717 + " maxSubTurn:" + var_2185 + " serverChecksum:" + _loc7_ + " clientChecksum:" + _loc6_);
                  if(_loc3_)
                  {
                     _loc2_ = 0;
                     _loc4_ = 16711935;
                     HabboGamesCom.log("CLIENT TOO MUCH BEHIND, requesting full status!");
                  }
                  else if(_loc10_)
                  {
                     _loc2_ = 1;
                     _loc4_ = 16711680;
                     HabboGamesCom.log("CHECKSUM MISMATCH, requesting full status!");
                  }
                  else
                  {
                     _loc2_ = -1;
                     _loc4_ = 255;
                     HabboGamesCom.log("ERROR WAS GENERATED! Requesting full status!");
                  }
                  var_1507.showChecksumError(_loc4_);
                  requestFullStatus(_loc2_);
                  var_3394 = false;
                  var_3283 = true;
               }
            }
         }
      }
      
      private function checkGhostLocation(param1:int) : void
      {
         var _loc3_:HumanGameObject = null;
         var _loc6_:Location3D = null;
         var _loc2_:HumanGameObject = null;
         var _loc5_:Boolean = false;
         var _loc4_:int = 0;
         if(var_2268)
         {
            _loc3_ = getCurrentPlayer();
            _loc6_ = _loc3_.currentLocation;
            _loc2_ = getGhostPlayer();
            _loc5_ = false;
            _loc4_ = -3;
            while(_loc4_ < 3)
            {
               if(_loc5_ = _loc2_.isInGhostDistance(param1 + _loc4_,_loc6_))
               {
                  break;
               }
               _loc4_++;
            }
            _loc2_.removeGhostLocation(param1 - 3);
            if(!_loc5_ && param1 > 3)
            {
               HabboGamesCom.log("GHOST CHECKSUM MISMATCH, checksumTurn:" + param1 + " currentLocation:" + _loc6_);
               _loc2_.reinitGhost(_loc3_);
               _loc2_.addGhostLocation(param1);
               var_1507.showChecksumError(65280);
            }
         }
      }
      
      public function nextTurn(param1:int, param2:int, param3:Boolean = false) : void
      {
         var_2898 = param1;
         _serverChecksums[var_2898] = param2;
         var_2185 = (param1 + 1) * gameArena.getNumberOfSubTurns();
         if(param3)
         {
            var_1717 = var_2185 - gameArena.getNumberOfSubTurns();
            _timeSinceLastUpdate = (gameArena.getExtension() as class_3369).getPulseInterval();
            var_3283 = false;
            if(var_2268)
            {
               getGhostPlayer().addGhostLocation(var_2898);
            }
         }
      }
      
      public function requestFullStatus(param1:int) : void
      {
         send(new Game2RequestFullStatusUpdateMessageComposer(param1));
      }
      
      public function alert(param1:String) : void
      {
         removeOldAlert();
         if(!var_1944)
         {
            var_1944 = _windowManager.alert("SnowWar Alert",param1,0,onAlertClose);
         }
         else
         {
            var_1944.summary = param1;
         }
         HabboGamesCom.log("[HabboGameManager.alert] " + param1);
      }
      
      public function disposeLoadingView() : void
      {
         if(var_2189)
         {
            var_2189.dispose();
            var_2189 = null;
         }
      }
      
      public function removeOldAlert() : void
      {
         if(var_1944)
         {
            var_1944.dispose();
            var_1944 = null;
         }
      }
      
      public function generateChecksumMismatch() : void
      {
         if(var_1464 != 4)
         {
            return;
         }
         var_3394 = true;
      }
      
      private function onAlertClose(param1:class_3132, param2:class_3134) : void
      {
         removeOldAlert();
      }
      
      public function set ownId(param1:int) : void
      {
         var_2620 = param1;
      }
      
      public function get ownId() : int
      {
         return var_2620;
      }
      
      public function initView() : void
      {
         if(var_1507)
         {
            var_1507.init();
         }
      }
      
      public function get mainView() : GamesMainViewController
      {
         return var_1721;
      }
      
      public function get lobbyView() : GameLobbyWindowCtrl
      {
         if(var_1721)
         {
            return var_1721.lobbyView;
         }
         return null;
      }
      
      public function stageLoading(param1:int, param2:Array) : void
      {
         if(var_2189 != null)
         {
            var_1464 = 2;
            var_2189.showReadyPlayers(param2);
         }
      }
      
      public function startStage(param1:int) : void
      {
         if(var_1507)
         {
            _roomUI.visible = true;
            disposeLoadingView();
            playSound("HBSTG_ig_countdown");
            var_1507.initGameUI(param1);
            var_1464 = 3;
         }
      }
      
      public function stageRunning(param1:int) : void
      {
         if(param1 > 0)
         {
            _stageLength = param1;
            var_1464 = 4;
         }
         else
         {
            var_1464 = 5;
         }
         var_1717 = 0;
         var_2185 = 0;
      }
      
      public function resetGameSession() : void
      {
         _roomEngine.isGameMode = false;
         var_1464 = 5;
         removeUpdateReceiver(this);
         if(var_1488)
         {
            var_1488.dispose();
            var_1488 = null;
         }
         stopSound("HBSTG_snowwar_walk");
         send(new Game2GetAccountGameStatusMessageComposer(0));
      }
      
      public function resetRoomSession() : void
      {
         _roomSessionManager.disposeGameSession();
         if(var_1507)
         {
            var_1507.dispose();
            var_1507 = null;
         }
      }
      
      public function gameOver(param1:int, param2:Array, param3:Game2SnowWarGameStats, param4:Game2GameResult) : void
      {
         var_1464 = 6;
         var_1721.close(false);
         if(var_1472)
         {
            var_1472.dispose();
            var_1472 = null;
         }
         if(var_1507)
         {
            var_1507.removeGameUI();
         }
         var_1472 = new GameEndingViewController(this,param2,param3,param4,param1);
      }
      
      public function gameStarted(param1:GameLobbyData) : void
      {
         var_1464 = 1;
         var_1688 = false;
         _players = new class_24();
         _serverChecksums = new class_24();
         for each(var _loc2_ in param1.players)
         {
            _players.add(_loc2_.userId,_loc2_);
         }
         if(var_1472)
         {
            var_1472.dispose();
            var_1472 = null;
         }
         if(!var_2189)
         {
            var_2189 = new GameLoadingViewController(this);
         }
         var_2189.show(param1);
      }
      
      public function rejoinGame(param1:int) : void
      {
         var_1464 = var_1688 ? 7 : 6;
         _roomBeforeGame = param1;
         if(var_1472)
         {
            var_1472.changeToWaitState(var_1688);
            var_1688 = false;
         }
      }
      
      public function playerRematches(param1:int) : void
      {
         if(var_1472)
         {
            var_1472.playerRematches(param1);
         }
      }
      
      public function startLobbyCounter(param1:int) : void
      {
         if(var_1464 == 7 && var_1472 != null)
         {
            var_1472.startLobbyCountDown(param1);
         }
         else if(lobbyView)
         {
            lobbyView.startCountdown(param1);
         }
      }
      
      public function sendRejoinGame() : void
      {
         var_1688 = true;
         send(new Game2PlayAgainMessageComposer());
      }
      
      public function addChatMessage(param1:int, param2:String, param3:Boolean = false) : void
      {
         if(_players == null)
         {
            return;
         }
         var _loc6_:GameLobbyPlayerData;
         if((_loc6_ = _players.getValue(param1)) == null)
         {
            return;
         }
         var _loc5_:int = _loc6_.teamId == 1 ? -300 : 300;
         var _loc4_:uint = _loc6_.teamId == 1 ? 255 : 16711680;
         _gameManager.events.dispatchEvent(new GameChatEvent("gce_game_chat",param1,param2,_loc5_,_loc4_,_loc6_.figure,_loc6_.gender,_loc6_.name,_loc6_.teamId,param3));
      }
      
      public function stopLobbyCounter() : void
      {
         if(var_1464 == 7 && var_1472 != null)
         {
            var_1688 = true;
            var_1472.changeToWaitState(var_1688);
         }
         else if(lobbyView)
         {
            lobbyView.stopCountdown();
         }
      }
      
      public function createLobby(param1:GameLobbyData) : void
      {
         var _loc2_:* = null;
         if(var_1464 == 6)
         {
            var_1688 = true;
         }
         if(var_1472 != null && var_1464 != 7)
         {
            var_1472.changeToWaitState(var_1688);
            var_1464 = 7;
            var_1688 = false;
         }
         if(var_1464 == 7 && var_1472 != null)
         {
            var_1472.changeToLobbyState(param1);
            for each(_loc2_ in param1.players)
            {
               var_1472.playerJoined(_loc2_);
            }
         }
         else
         {
            var_1464 = 0;
            mainView.openGameLobbyWindow(getArenaName(param1),param1.numberOfTeams,param1.maximumPlayers);
            for each(_loc2_ in param1.players)
            {
               lobbyView.playerJoined(_loc2_);
            }
         }
      }
      
      public function userJoined(param1:GameLobbyPlayerData) : void
      {
         if(var_1464 == 7 && var_1472 != null)
         {
            var_1472.playerJoined(param1);
         }
         else
         {
            var_1464 = 0;
            if(lobbyView)
            {
               lobbyView.playerJoined(param1);
            }
         }
      }
      
      public function userLeft(param1:int) : void
      {
         if(var_1464 == 7 && var_1472 != null)
         {
            var_1472.playerLeft(param1);
         }
         else
         {
            var_1464 = 0;
            if(lobbyView)
            {
               lobbyView.playerLeft(param1);
            }
         }
      }
      
      public function gamesLeft(param1:int, param2:Boolean, param3:int) : void
      {
         if(param1 == 0)
         {
            var_3866 = param2;
            var_607 = param3;
            if(var_1472)
            {
               var_1472.updateGamesLeft();
            }
            if(var_1721)
            {
               var_1721.updateGameStartingStatus();
            }
         }
      }
      
      public function get isGameStarting() : Boolean
      {
         return var_1464 == 1 || var_1464 == 7;
      }
      
      public function resetSession() : void
      {
         resetGameSession();
         resetRoomSession();
         if(var_1472)
         {
            var_1472.dispose();
            var_1472 = null;
         }
         if(var_1721)
         {
            var_1721.openMainWindow(false);
         }
      }
      
      public function gameCancelled(param1:Boolean) : void
      {
         resetSession();
         if(param1)
         {
            _gameManager.onSnowWarArenaSessionEnded();
         }
      }
      
      public function get hasUnlimitedGames() : Boolean
      {
         return var_3866;
      }
      
      public function get freeGamesLeft() : int
      {
         return var_607;
      }
      
      public function stopWaitingForSnowball(param1:int) : void
      {
         if(var_1507 != null && param1 == var_2620)
         {
            var_1507.stopWaitingForSnowball();
         }
      }
      
      public function openGetMoreGames(param1:String) : void
      {
         _catalog.buySnowWarTokensOffer("GET_SNOWWAR_TOKENS");
         logGameEvent(param1);
      }
      
      public function openClubCenter(param1:String) : void
      {
         _catalog.openClubCenter();
         logGameEvent(param1);
      }
      
      public function logGameEvent(param1:String) : void
      {
         send(new class_898("GameFramework","SnowStorm",param1,"",freeGamesLeft));
      }
      
      public function registerHit(param1:HumanGameObject, param2:HumanGameObject) : void
      {
         if(var_2620 == param1.gameObjectId)
         {
            var_1507.flashOwnScore(false);
         }
         else if(var_2620 == param2.gameObjectId)
         {
            var_1507.flashOwnScore(true);
         }
      }
      
      public function set gamesPlayed(param1:int) : void
      {
         var_816 = param1;
      }
      
      public function promoteGame() : void
      {
         if(var_3883 || var_816 != 0)
         {
            return;
         }
         var_3883 = true;
         var _loc2_:* = _configuration.getInteger("new.identity",0) > 0;
         var _loc1_:String = String(_configuration.getProperty("new.user.wing"));
         if(_loc2_ && _loc1_ != "game")
         {
            return;
         }
         _habboHelp.showWelcomeScreen("HTIE_ICON_GAMES","snowwar.promotion",0,"GAMES");
      }
      
      public function showLeaderboard() : void
      {
         leaderboard.selectedGame = 0;
         leaderboard.showFriendsAllTime();
      }
      
      public function get leaderboard() : LeaderboardViewController
      {
         if(!var_2551 && !gameCenterEnabled)
         {
            var_2551 = new LeaderboardViewController(this);
         }
         return var_2551;
      }
   }
}
