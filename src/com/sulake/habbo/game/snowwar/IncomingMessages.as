package com.sulake.habbo.game.snowwar
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.FullGameStatusData;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2PlayerData;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyData;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameObjectsData;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameStatusData;
   import com.sulake.habbo.game.snowwar.arena.ISynchronizedGameEvent;
   import com.sulake.habbo.game.snowwar.arena.SynchronizedGameArena;
   import com.sulake.habbo.game.snowwar.arena.class_3327;
   import com.sulake.habbo.game.snowwar.events.CreateSnowballEvent;
   import com.sulake.habbo.game.snowwar.events.HumanGetsSnowballsFromMachineEvent;
   import com.sulake.habbo.game.snowwar.events.HumanLeftGameEvent;
   import com.sulake.habbo.game.snowwar.events.HumanStartsToMakeASnowballEvent;
   import com.sulake.habbo.game.snowwar.events.HumanThrowsSnowballAtHumanEvent;
   import com.sulake.habbo.game.snowwar.events.HumanThrowsSnowballAtPositionEvent;
   import com.sulake.habbo.game.snowwar.events.MachineCreatesSnowballEvent;
   import com.sulake.habbo.game.snowwar.events.NewMoveTargetEvent;
   import com.sulake.habbo.game.snowwar.gameobjects.HumanGameObject;
   import com.sulake.habbo.game.snowwar.gameobjects.SnowBallGameObject;
   import com.sulake.habbo.game.snowwar.gameobjects.SnowballGivingGameObject;
   import com.sulake.habbo.game.snowwar.gameobjects.SnowballMachineGameObject;
   import com.sulake.habbo.game.snowwar.gameobjects.SnowballPileGameObject;
   import com.sulake.habbo.game.snowwar.gameobjects.TreeGameObject;
   import package_123.class_1050;
   import package_123.class_1161;
   import package_123.class_1164;
   import package_123.class_1242;
   import package_123.class_1299;
   import package_123.class_1317;
   import package_123.class_1323;
   import package_123.class_1389;
   import package_123.class_1405;
   import package_123.class_1437;
   import package_123.class_1474;
   import package_123.class_1507;
   import package_123.class_1520;
   import package_140.Game2AccountGameStatusMessageParser;
   import package_140.Game2GameDirectoryStatusMessageParser;
   import package_140.Game2InArenaQueueMessageParser;
   import package_140.Game2JoiningGameFailedMessageParser;
   import package_140.Game2StartCounterMessageParser;
   import package_140.Game2UserBlockedMessageParser;
   import package_140.Game2UserLeftGameMessageParser;
   import package_140.class_1118;
   import package_140.class_1190;
   import package_140.class_1430;
   import package_140.class_1489;
   import package_157.Game2GroupLeaderboardParser;
   import package_157.Game2LeaderboardParser;
   import package_157.Game2WeeklyGroupLeaderboardParser;
   import package_157.Game2WeeklyLeaderboardParser;
   import package_17.class_486;
   import package_182.class_1434;
   import package_182.class_1455;
   import package_184.CreateSnowballEventData;
   import package_184.HumanGetsSnowballsFromMachineEventData;
   import package_184.HumanLeftGameEventData;
   import package_184.HumanStartsToMakeASnowballEventData;
   import package_184.HumanThrowsSnowballAtHumanEventData;
   import package_184.HumanThrowsSnowballAtPositionEventData;
   import package_184.MachineCreatesSnowballEventData;
   import package_184.NewMoveTargetEventData;
   import package_184.SnowWarGameEventData;
   import package_185.HumanGameObjectData;
   import package_185.SnowWarGameObjectData;
   import package_185.SnowballGameObjectData;
   import package_185.SnowballMachineGameObjectData;
   import package_185.SnowballPileGameObjectData;
   import package_185.TreeGameObjectData;
   import package_29.Game2GetAccountGameStatusMessageComposer;
   import package_5.class_993;
   import package_51.Game2FriendsLeaderboardEvent;
   import package_51.Game2TotalGroupLeaderboardEvent;
   import package_51.Game2TotalLeaderboardEvent;
   import package_51.Game2WeeklyFriendsLeaderboardEvent;
   import package_51.Game2WeeklyGroupLeaderboardEvent;
   import package_51.Game2WeeklyLeaderboardEvent;
   import package_54.class_215;
   import package_54.class_240;
   import package_54.class_249;
   import package_54.class_263;
   import package_54.class_306;
   import package_54.class_308;
   import package_54.class_389;
   import package_54.class_594;
   import package_54.class_643;
   import package_54.class_703;
   import package_54.class_851;
   import package_54.class_901;
   import package_54.class_991;
   import package_75.Game2AccountGameStatusMessageEvent;
   import package_75.Game2GameCancelledMessageEvent;
   import package_75.Game2GameDirectoryStatusMessageEvent;
   import package_75.Game2InArenaQueueMessageEvent;
   import package_75.Game2JoiningGameFailedMessageEvent;
   import package_75.Game2StartCounterMessageEvent;
   import package_75.Game2StartingGameFailedMessageEvent;
   import package_75.Game2StopCounterMessageEvent;
   import package_75.Game2UserBlockedMessageEvent;
   import package_75.Game2UserLeftGameMessageEvent;
   import package_75.class_402;
   import package_75.class_407;
   import package_75.class_668;
   import package_75.class_840;
   import package_85.class_1002;
   import package_85.class_340;
   
   public class IncomingMessages implements class_13
   {
       
      
      private var var_1432:com.sulake.habbo.game.snowwar.SnowWarEngine;
      
      private var var_311:Boolean = false;
      
      public function IncomingMessages(param1:com.sulake.habbo.game.snowwar.SnowWarEngine)
      {
         super();
         var_1432 = param1;
         var _loc2_:class_25 = var_1432.communication;
         _loc2_.addHabboConnectionMessageEvent(new class_240(onArenaEntered));
         _loc2_.addHabboConnectionMessageEvent(new Game2UserLeftGameMessageEvent(onUserLeft));
         _loc2_.addHabboConnectionMessageEvent(new class_402(onGameStarted));
         _loc2_.addHabboConnectionMessageEvent(new Game2StopCounterMessageEvent(onLobbyCounterStop));
         _loc2_.addHabboConnectionMessageEvent(new Game2FriendsLeaderboardEvent(onFriendsLeaderboard));
         _loc2_.addHabboConnectionMessageEvent(new class_1002(onFullGameStatus));
         _loc2_.addHabboConnectionMessageEvent(new class_215(onGameEnding));
         _loc2_.addHabboConnectionMessageEvent(new Game2StartCounterMessageEvent(onLobbyCounterStart));
         _loc2_.addHabboConnectionMessageEvent(new Game2UserBlockedMessageEvent(onPlayerBlockStatusChange));
         _loc2_.addHabboConnectionMessageEvent(new Game2AccountGameStatusMessageEvent(onAccountGameStatus));
         _loc2_.addHabboConnectionMessageEvent(new Game2WeeklyFriendsLeaderboardEvent(onWeeklyFriendsLeaderboard));
         _loc2_.addHabboConnectionMessageEvent(new class_703(onRejoinGame));
         _loc2_.addHabboConnectionMessageEvent(new class_249(onPlayerRematches));
         _loc2_.addHabboConnectionMessageEvent(new class_340(onGameStatus));
         _loc2_.addHabboConnectionMessageEvent(new class_668(onGameLongData));
         _loc2_.addHabboConnectionMessageEvent(new class_840(onGameCreated));
         _loc2_.addHabboConnectionMessageEvent(new class_851(onStageLoad));
         _loc2_.addHabboConnectionMessageEvent(new class_389(onEnterArena));
         _loc2_.addHabboConnectionMessageEvent(new Game2GameCancelledMessageEvent(onGameCancelled));
         _loc2_.addHabboConnectionMessageEvent(new class_993(onSubscriptionStatus));
         _loc2_.addHabboConnectionMessageEvent(new Game2GameDirectoryStatusMessageEvent(onGameDirectoryStatus));
         _loc2_.addHabboConnectionMessageEvent(new class_306(onPlayerExitedArena));
         _loc2_.addHabboConnectionMessageEvent(new Game2WeeklyGroupLeaderboardEvent(onWeeklyGroupLeaderboard));
         _loc2_.addHabboConnectionMessageEvent(new class_486(onRoomEnter));
         _loc2_.addHabboConnectionMessageEvent(new class_308(onStageEnding));
         _loc2_.addHabboConnectionMessageEvent(new class_643(onStageStarting));
         _loc2_.addHabboConnectionMessageEvent(new Game2StartingGameFailedMessageEvent(onStartingGameFailed));
         _loc2_.addHabboConnectionMessageEvent(new class_991(onStageRunning));
         _loc2_.addHabboConnectionMessageEvent(new class_263(onEnterArenaFailed));
         _loc2_.addHabboConnectionMessageEvent(new class_407(onUserJoined));
         _loc2_.addHabboConnectionMessageEvent(new Game2TotalGroupLeaderboardEvent(onTotalGroupLeaderboard));
         _loc2_.addHabboConnectionMessageEvent(new class_901(onGameChat));
         _loc2_.addHabboConnectionMessageEvent(new class_594(onStageStillLoading));
         _loc2_.addHabboConnectionMessageEvent(new Game2WeeklyLeaderboardEvent(onWeeklyLeaderboard));
         _loc2_.addHabboConnectionMessageEvent(new Game2InArenaQueueMessageEvent(onInArenaQueue));
         _loc2_.addHabboConnectionMessageEvent(new Game2TotalLeaderboardEvent(onTotalLeaderboard));
         _loc2_.addHabboConnectionMessageEvent(new Game2JoiningGameFailedMessageEvent(onJoiningGameFailed));
      }
      
      public function dispose() : void
      {
         var_1432 = null;
         var_311 = true;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      private function onEnterArena(param1:class_389) : void
      {
         var _loc3_:class_1437 = param1.getParser();
         var_1432.initArena(_loc3_.gameType,_loc3_.fieldType,_loc3_.numberOfTeams,_loc3_.players);
         var _loc2_:SynchronizedGameArena = var_1432.gameArena;
         var _loc4_:class_3327;
         (_loc4_ = _loc2_.getCurrentStage()).initialize(var_1432.gameArena,_loc3_.gameLevel);
         var_1432.mainView.close(false);
      }
      
      private function onEnterArenaFailed(param1:class_263) : void
      {
         var _loc2_:class_1474 = param1.getParser();
         var _loc3_:String = "snowwar.error.generic";
         switch(_loc2_.reason - 1)
         {
            case 0:
               _loc3_ = "snowwar.error.game_already_started";
         }
         var_1432.alert("${" + _loc3_ + "}");
      }
      
      private function onArenaEntered(param1:class_240) : void
      {
         var _loc2_:class_1507 = param1.getParser();
         var _loc3_:Game2PlayerData = _loc2_.player;
      }
      
      private function onStageLoad(param1:class_851) : void
      {
         var _loc2_:class_1389 = param1.getParser();
         var_1432.initView();
      }
      
      private function onStageStillLoading(param1:class_594) : void
      {
         var _loc2_:class_1242 = param1.getParser();
         var_1432.stageLoading(_loc2_.percentage,_loc2_.finishedPlayers);
      }
      
      private function onStageStarting(param1:class_643) : void
      {
         var _loc3_:class_1323 = param1.getParser();
         HabboGamesCom.log("[HabbosnowWarEngine] On stage start: " + _loc3_.countDown);
         var _loc2_:GameObjectsData = _loc3_.gameObjects;
         initializeGameObjects(_loc2_);
         var_1432.startStage(_loc3_.countDown);
      }
      
      private function onStageRunning(param1:class_991) : void
      {
         var _loc2_:class_1317 = param1.getParser();
         HabboGamesCom.log("[HabbosnowWarEngine] On stage running: " + _loc2_.timeToStageEnd);
         var_1432.stageRunning(_loc2_.timeToStageEnd);
      }
      
      private function onStageEnding(param1:class_308) : void
      {
         var _loc2_:class_1405 = param1.getParser();
         HabboGamesCom.log("[HabbosnowWarEngine] On stage ending: " + _loc2_.timeToNextState);
         if(_loc2_.timeToNextState == 0)
         {
            var_1432.resetGameSession();
         }
      }
      
      private function onGameEnding(param1:class_215) : void
      {
         var _loc2_:class_1161 = param1.getParser();
         HabboGamesCom.log("[HabbosnowWarEngine] On game ending: " + _loc2_.timeToNextState);
         var_1432.gameOver(_loc2_.timeToNextState,_loc2_.teams,_loc2_.generalStats,_loc2_.gameResult);
      }
      
      private function onPlayerExitedArena(param1:class_306) : void
      {
         var _loc2_:class_1050 = param1.getParser();
         HabboGamesCom.log("[HabbosnowWarEngine] On player exited arena. userId:" + _loc2_.userId + " gameObjectId:" + _loc2_.playerGameObjectId);
      }
      
      private function onRejoinGame(param1:class_703) : void
      {
         var _loc2_:class_1164 = param1.getParser();
         HabboGamesCom.log("Rejoin game! Room Before game: " + _loc2_.roomBeforeGame);
         var_1432.rejoinGame(_loc2_.roomBeforeGame);
      }
      
      private function onPlayerRematches(param1:class_249) : void
      {
         var _loc2_:class_1520 = param1.getParser();
         HabboGamesCom.log("User " + _loc2_.userId + " rematches");
         var_1432.playerRematches(_loc2_.userId);
      }
      
      private function onGameDirectoryStatus(param1:Game2GameDirectoryStatusMessageEvent) : void
      {
         var _loc2_:Game2GameDirectoryStatusMessageParser = param1.getParser();
         if(_loc2_.status == 0)
         {
            var_1432.mainView.changeBlockStatus(_loc2_.blockLength);
            var_1432.gamesPlayed = _loc2_.gamesPlayed;
            var_1432.onGameDirectoryAvailable(true);
            var_1432.gamesLeft(0,_loc2_.freeGamesLeft == -1,_loc2_.freeGamesLeft);
         }
         else
         {
            var_1432.onGameDirectoryAvailable(false);
            HabboGamesCom.log("Game directory not available, status:" + _loc2_.status);
         }
      }
      
      private function onAccountGameStatus(param1:Game2AccountGameStatusMessageEvent) : void
      {
         var _loc2_:Game2AccountGameStatusMessageParser = param1.getParser();
         HabboGamesCom.log("FREE GAMES LEFT: " + _loc2_.freeGamesLeft + " OR HAS UNLIMITED GAMES: " + _loc2_.hasUnlimitedGames);
         var_1432.gamesLeft(_loc2_.gameTypeId,_loc2_.hasUnlimitedGames,_loc2_.freeGamesLeft);
      }
      
      private function onGameCreated(param1:class_840) : void
      {
         var _loc2_:class_1489 = param1.getParser();
         var _loc3_:GameLobbyData = _loc2_.gameLobbyData;
         var_1432.createLobby(_loc3_);
      }
      
      private function onGameStarted(param1:class_402) : void
      {
         var _loc2_:class_1430 = param1.getParser();
         HabboGamesCom.log("Game started!");
         var_1432.gameStarted(_loc2_.lobbyData);
      }
      
      private function onLobbyCounterStart(param1:Game2StartCounterMessageEvent) : void
      {
         var _loc2_:Game2StartCounterMessageParser = param1.getParser();
         HabboGamesCom.log("Start Lobby Counter: " + _loc2_.countDownLength);
         var_1432.startLobbyCounter(_loc2_.countDownLength);
      }
      
      private function onLobbyCounterStop(param1:Game2StopCounterMessageEvent) : void
      {
         var_1432.stopLobbyCounter();
      }
      
      private function onGameCancelled(param1:Game2GameCancelledMessageEvent) : void
      {
         var_1432.gameCancelled(false);
      }
      
      private function onInArenaQueue(param1:Game2InArenaQueueMessageEvent) : void
      {
         var _loc2_:Game2InArenaQueueMessageParser = param1.getParser();
         if(false)
         {
            var_1432.lobbyView.queuePosition = _loc2_.position;
         }
      }
      
      private function onUserJoined(param1:class_407) : void
      {
         var _loc2_:class_1118 = param1.getParser();
         var_1432.userJoined(_loc2_.user);
      }
      
      private function onUserLeft(param1:Game2UserLeftGameMessageEvent) : void
      {
         var _loc2_:Game2UserLeftGameMessageParser = param1.getParser();
         var_1432.userLeft(_loc2_.userId);
      }
      
      private function onGameLongData(param1:class_668) : void
      {
         var _loc2_:class_1190 = param1.getParser();
         var _loc3_:GameLobbyData = _loc2_.gameLobbyData;
         HabboGamesCom.log("Long data received: " + [_loc3_.fieldType,_loc3_.numberOfTeams,_loc3_.maximumPlayers]);
         var_1432.createLobby(_loc3_);
      }
      
      private function onJoiningGameFailed(param1:Game2JoiningGameFailedMessageEvent) : void
      {
         var _loc2_:Game2JoiningGameFailedMessageParser = param1.getParser();
         var _loc3_:String = "snowwar.error.generic";
         switch(_loc2_.reason - 2)
         {
            case 0:
               _loc3_ = "snowwar.error.duplicate_machineid";
               break;
            case 4:
            case 5:
               _loc3_ = "snowwar.error.has_active_instance";
               break;
            case 6:
               _loc3_ = "snowwar.error.no_free_games_left";
         }
         var_1432.alert("${" + _loc3_ + "}");
      }
      
      private function onStartingGameFailed(param1:Game2StartingGameFailedMessageEvent) : void
      {
         var_1432.alert("${snowwar.error.generic}");
      }
      
      private function onPlayerBlockStatusChange(param1:Game2UserBlockedMessageEvent) : void
      {
         var _loc2_:Game2UserBlockedMessageParser = param1.getParser();
         var_1432.mainView.changeBlockStatus(_loc2_.playerBlockLength);
      }
      
      private function onFullGameStatus(param1:class_1002) : void
      {
         var _loc4_:GameStatusData = null;
         var _loc3_:class_1434 = param1.getParser();
         var _loc2_:SynchronizedGameArena = var_1432.gameArena;
         HabboGamesCom.log("On full game status: ");
         var _loc5_:FullGameStatusData = _loc3_.fullStatus;
         (_loc2_.getCurrentStage() as class_3328).resetTiles();
         initializeGameObjects(_loc5_.gameObjects);
         if(_loc2_)
         {
            _loc4_ = _loc5_.gameStatus;
            _loc2_.seekToTurn(_loc4_.turn,_loc4_.checksum);
            handleGameStatus(_loc4_,true);
         }
      }
      
      private function onGameStatus(param1:class_340) : void
      {
         var _loc2_:class_1455 = param1.getParser();
         HabboGamesCom.log("[HabbosnowWarEngine] On game status: ");
         handleGameStatus(_loc2_.status);
      }
      
      private function initializeGameObjects(param1:GameObjectsData) : void
      {
         var _loc4_:HumanGameObjectData = null;
         var _loc8_:* = false;
         var _loc16_:HumanGameObject = null;
         var _loc12_:HumanGameObject = null;
         var _loc3_:SnowballGameObjectData = null;
         var _loc11_:SnowBallGameObject = null;
         var _loc13_:HumanGameObject = null;
         var _loc7_:SnowballMachineGameObjectData = null;
         var _loc15_:SnowballMachineGameObject = null;
         var _loc9_:SnowballPileGameObjectData = null;
         var _loc5_:SnowballPileGameObject = null;
         var _loc17_:TreeGameObjectData = null;
         var _loc6_:TreeGameObject = null;
         var _loc10_:SynchronizedGameArena;
         if(!(_loc10_ = var_1432.gameArena))
         {
            return;
         }
         var _loc14_:class_3328;
         (_loc14_ = _loc10_.getCurrentStage() as class_3328).removeAllGameObjects();
         for each(var _loc2_ in param1.gameObjects)
         {
            switch(_loc2_.type - 1)
            {
               case 0:
                  _loc3_ = _loc2_ as SnowballGameObjectData;
                  _loc11_ = new SnowBallGameObject(_loc3_.id);
                  _loc13_ = _loc14_.getGameObject(_loc3_.throwingHuman) as HumanGameObject;
                  _loc11_.initializeFromData(_loc3_,_loc13_);
                  _loc14_.addGameObject(_loc11_.gameObjectId,_loc11_);
                  HabboGamesCom.log("snowball x:" + _loc3_.locationX3D + " y:" + _loc3_.locationY3D);
                  break;
               case 1:
                  _loc17_ = _loc2_ as TreeGameObjectData;
                  _loc6_ = new TreeGameObject(_loc17_,_loc14_);
                  _loc14_.addGameObject(_loc6_.gameObjectId,_loc6_);
                  HabboGamesCom.log("tree id:" + _loc6_.gameObjectId);
                  break;
               case 2:
                  _loc9_ = _loc2_ as SnowballPileGameObjectData;
                  _loc5_ = new SnowballPileGameObject(_loc9_,_loc14_);
                  _loc14_.addGameObject(_loc9_.id,_loc5_);
                  HabboGamesCom.log("pile id:" + _loc9_.id);
                  break;
               case 3:
                  _loc7_ = _loc2_ as SnowballMachineGameObjectData;
                  _loc15_ = new SnowballMachineGameObject(_loc7_,_loc14_);
                  _loc14_.addGameObject(_loc7_.id,_loc15_);
                  HabboGamesCom.log("machine id:" + _loc7_.id);
                  break;
               case 4:
                  _loc8_ = (_loc4_ = _loc2_ as HumanGameObjectData).name == var_1432.sessionDataManager.userName;
                  if((_loc4_ = _loc2_ as HumanGameObjectData).name == var_1432.sessionDataManager.userName)
                  {
                     var_1432.ownId = _loc4_.id;
                  }
                  _loc16_ = new HumanGameObject(_loc14_,_loc4_,false,var_1432);
                  _loc14_.addGameObject(_loc16_.gameObjectId,_loc16_);
                  _loc16_.visualizationMode = 0;
                  if(_loc8_ && false)
                  {
                     if(false)
                     {
                        _loc16_.visualizationMode = 1;
                     }
                     else
                     {
                        _loc16_.visualizationMode = 2;
                     }
                     if(var_1432.gameArena.getCurrentStage().getGameObject(_loc16_.ghostObjectId) == null)
                     {
                        (_loc12_ = new HumanGameObject(_loc14_,_loc4_,true,var_1432)).gameObjectId = _loc16_.ghostObjectId;
                        _loc14_.addGameObject(_loc12_.gameObjectId,_loc12_);
                     }
                  }
                  HabboGamesCom.log("human id:" + _loc4_.id + " x:" + _loc4_.currentLocationX + " y:" + _loc4_.currentLocationY);
                  break;
               default:
                  HabboGamesCom.log("Unkonwn game-object:" + _loc2_.type);
                  break;
            }
         }
      }
      
      private function handleGameStatus(param1:GameStatusData, param2:Boolean = false) : void
      {
         var _loc11_:Array = null;
         var _loc7_:ISynchronizedGameEvent = null;
         var _loc6_:ISynchronizedGameEvent = null;
         var _loc3_:class_24 = param1.events as class_24;
         var _loc4_:SynchronizedGameArena;
         if(!(_loc4_ = var_1432.gameArena))
         {
            return;
         }
         var _loc10_:int = param1.turn;
         for each(var _loc5_ in _loc3_.getKeys())
         {
            _loc11_ = _loc3_.getValue(_loc5_) as Array;
            for each(var _loc9_ in _loc11_)
            {
               switch(int(_loc9_.id) - 1)
               {
                  case 0:
                     _loc7_ = handleHumanLeftGameEvent(_loc9_ as HumanLeftGameEventData);
                     break;
                  case 1:
                     _loc7_ = handleNewMoveTargetEvent(_loc9_ as NewMoveTargetEventData);
                     break;
                  case 2:
                     _loc7_ = handleThrowSnowballAtHuman(_loc9_ as HumanThrowsSnowballAtHumanEventData);
                     _loc6_ = handleGhostThrowSnowballAtHuman(_loc9_ as HumanThrowsSnowballAtHumanEventData);
                     break;
                  case 3:
                     _loc7_ = handleThrowSnowballAtPosition(_loc9_ as HumanThrowsSnowballAtPositionEventData);
                     _loc6_ = handleGhostThrowSnowballAtPosition(_loc9_ as HumanThrowsSnowballAtPositionEventData);
                     break;
                  case 6:
                     _loc7_ = handleHumanStartsToMakeASnowball(_loc9_ as HumanStartsToMakeASnowballEventData);
                     _loc6_ = handleGhostStartsToMakeASnowball(_loc9_ as HumanStartsToMakeASnowballEventData);
                     break;
                  case 7:
                     _loc7_ = handleCreateSnowballEvent(_loc9_ as CreateSnowballEventData);
                     break;
                  case 10:
                     _loc7_ = handleMachineCreatesSnowballEvent(_loc9_ as MachineCreatesSnowballEventData);
                     break;
                  case 11:
                     _loc7_ = handleHumanGetsSnowballFromMachineEvent(_loc9_ as HumanGetsSnowballsFromMachineEventData);
                     break;
                  default:
                     HabboGamesCom.log("Unknown event id " + _loc9_.id);
               }
               if(_loc7_)
               {
                  _loc4_.addGameEvent(_loc10_ + 1,_loc5_,_loc7_);
               }
               if(_loc6_)
               {
                  _loc4_.addGameEvent(_loc10_ + 1,_loc5_,_loc6_);
               }
            }
         }
         var _loc8_:int = param1.checksum;
         var_1432.nextTurn(_loc10_,_loc8_,param2);
      }
      
      private function handleHumanGetsSnowballFromMachineEvent(param1:HumanGetsSnowballsFromMachineEventData) : HumanGetsSnowballsFromMachineEvent
      {
         var _loc2_:SynchronizedGameArena = var_1432.gameArena;
         var _loc3_:class_3327 = _loc2_.getCurrentStage();
         var _loc4_:HumanGameObject = _loc3_.getGameObject(param1.humanGameObjectId) as HumanGameObject;
         var _loc5_:SnowballGivingGameObject = _loc3_.getGameObject(param1.snowBallMachineReference) as SnowballGivingGameObject;
         return new HumanGetsSnowballsFromMachineEvent(_loc4_,_loc5_);
      }
      
      private function handleMachineCreatesSnowballEvent(param1:MachineCreatesSnowballEventData) : MachineCreatesSnowballEvent
      {
         var _loc2_:SynchronizedGameArena = var_1432.gameArena;
         var _loc3_:class_3327 = _loc2_.getCurrentStage();
         var _loc4_:SnowballMachineGameObject = _loc3_.getGameObject(param1.snowBallMachineReference) as SnowballMachineGameObject;
         return new MachineCreatesSnowballEvent(_loc4_);
      }
      
      private function handleThrowSnowballAtPosition(param1:HumanThrowsSnowballAtPositionEventData) : HumanThrowsSnowballAtPositionEvent
      {
         var _loc2_:SynchronizedGameArena = var_1432.gameArena;
         var _loc3_:class_3327 = _loc2_.getCurrentStage();
         var _loc4_:HumanGameObject = _loc3_.getGameObject(param1.humanGameObjectId) as HumanGameObject;
         return new HumanThrowsSnowballAtPositionEvent(_loc4_,param1.targetX,param1.targetY,param1.trajectory);
      }
      
      private function handleThrowSnowballAtHuman(param1:HumanThrowsSnowballAtHumanEventData) : HumanThrowsSnowballAtHumanEvent
      {
         var _loc3_:SynchronizedGameArena = var_1432.gameArena;
         var _loc4_:class_3327;
         var _loc5_:HumanGameObject = (_loc4_ = _loc3_.getCurrentStage()).getGameObject(param1.humanGameObjectId) as HumanGameObject;
         var _loc2_:HumanGameObject = _loc4_.getGameObject(param1.targetHumanGameObjectId) as HumanGameObject;
         return new HumanThrowsSnowballAtHumanEvent(_loc5_,_loc2_,param1.trajectory);
      }
      
      private function handleHumanStartsToMakeASnowball(param1:HumanStartsToMakeASnowballEventData) : HumanStartsToMakeASnowballEvent
      {
         var _loc2_:SynchronizedGameArena = var_1432.gameArena;
         var _loc3_:class_3327 = _loc2_.getCurrentStage();
         var _loc4_:HumanGameObject = _loc3_.getGameObject(param1.humanGameObjectId) as HumanGameObject;
         return new HumanStartsToMakeASnowballEvent(_loc4_);
      }
      
      private function handleCreateSnowballEvent(param1:CreateSnowballEventData) : CreateSnowballEvent
      {
         var _loc2_:SynchronizedGameArena = var_1432.gameArena;
         var _loc3_:class_3327 = _loc2_.getCurrentStage();
         var _loc4_:HumanGameObject = _loc3_.getGameObject(param1.humanGameObjectId) as HumanGameObject;
         return new CreateSnowballEvent(param1.snowBallGameObjectId,_loc4_,param1.targetX,param1.targetY,param1.trajectory);
      }
      
      private function handleNewMoveTargetEvent(param1:NewMoveTargetEventData) : NewMoveTargetEvent
      {
         var _loc2_:SynchronizedGameArena = var_1432.gameArena;
         var _loc3_:class_3327 = _loc2_.getCurrentStage();
         var _loc4_:HumanGameObject = _loc3_.getGameObject(param1.humanGameObjectId) as HumanGameObject;
         return new NewMoveTargetEvent(_loc4_,param1.x,param1.y);
      }
      
      private function handleHumanLeftGameEvent(param1:HumanLeftGameEventData) : HumanLeftGameEvent
      {
         var _loc2_:SynchronizedGameArena = var_1432.gameArena;
         var _loc3_:class_3327 = _loc2_.getCurrentStage();
         var _loc4_:HumanGameObject = _loc3_.getGameObject(param1.humanGameObjectId) as HumanGameObject;
         return new HumanLeftGameEvent(_loc4_);
      }
      
      private function handleGhostThrowSnowballAtPosition(param1:HumanThrowsSnowballAtPositionEventData) : HumanThrowsSnowballAtPositionEvent
      {
         var _loc2_:SynchronizedGameArena = null;
         var _loc3_:class_3327 = null;
         if(false)
         {
            _loc2_ = var_1432.gameArena;
            _loc3_ = _loc2_.getCurrentStage();
            if(param1.humanGameObjectId == var_1432.ownId)
            {
               return new HumanThrowsSnowballAtPositionEvent(var_1432.getGhostPlayer(),param1.targetX,param1.targetY,param1.trajectory);
            }
         }
         return null;
      }
      
      private function handleGhostThrowSnowballAtHuman(param1:HumanThrowsSnowballAtHumanEventData) : HumanThrowsSnowballAtHumanEvent
      {
         var _loc3_:SynchronizedGameArena = null;
         var _loc4_:class_3327 = null;
         var _loc2_:HumanGameObject = null;
         if(false)
         {
            _loc3_ = var_1432.gameArena;
            _loc2_ = (_loc4_ = _loc3_.getCurrentStage()).getGameObject(param1.targetHumanGameObjectId) as HumanGameObject;
            if(param1.humanGameObjectId == var_1432.ownId)
            {
               return new HumanThrowsSnowballAtHumanEvent(var_1432.getGhostPlayer(),_loc2_,param1.trajectory);
            }
         }
         return null;
      }
      
      private function handleGhostStartsToMakeASnowball(param1:HumanStartsToMakeASnowballEventData) : HumanStartsToMakeASnowballEvent
      {
         var _loc2_:SynchronizedGameArena = null;
         var _loc3_:class_3327 = null;
         var _loc4_:HumanGameObject = null;
         if(false)
         {
            _loc2_ = var_1432.gameArena;
            _loc3_ = _loc2_.getCurrentStage();
            _loc4_ = _loc3_.getGameObject(param1.humanGameObjectId) as HumanGameObject;
            if(param1.humanGameObjectId == var_1432.ownId)
            {
               return new HumanStartsToMakeASnowballEvent(var_1432.getGhostPlayer());
            }
         }
         return null;
      }
      
      private function onGameChat(param1:class_901) : void
      {
         var _loc2_:class_1299 = param1.getParser();
         if(var_1432 != null)
         {
            var_1432.addChatMessage(_loc2_.userId,_loc2_.chatMessage);
         }
      }
      
      private function onSubscriptionStatus(param1:class_993) : void
      {
         if(var_1432 != null)
         {
            var_1432.send(new Game2GetAccountGameStatusMessageComposer(0));
            if(var_1432.mainView.gameLobbyWindowActive)
            {
               return;
            }
            if(true)
            {
               var_1432.mainView.openMainWindow(false);
            }
         }
      }
      
      private function onRoomEnter(param1:class_486) : void
      {
         var_1432.promoteGame();
      }
      
      private function onFriendsLeaderboard(param1:Game2FriendsLeaderboardEvent) : void
      {
         var _loc2_:Game2LeaderboardParser = param1.getParser();
         if(false)
         {
            var_1432.leaderboard.addFriendAllTimeData(_loc2_.leaderboard,_loc2_.totalListSize);
         }
      }
      
      private function onTotalLeaderboard(param1:Game2TotalLeaderboardEvent) : void
      {
         var _loc2_:Game2LeaderboardParser = param1.getParser();
         if(false)
         {
            var_1432.leaderboard.addAllTimeData(_loc2_.leaderboard,_loc2_.totalListSize);
         }
      }
      
      private function onTotalGroupLeaderboard(param1:Game2TotalGroupLeaderboardEvent) : void
      {
         var _loc2_:Game2GroupLeaderboardParser = param1.getParser();
         if(false)
         {
            var_1432.leaderboard.addAllTimeGroupData(_loc2_.leaderboard,_loc2_.totalListSize,_loc2_.favouriteGroupId);
         }
      }
      
      private function onWeeklyGroupLeaderboard(param1:Game2WeeklyGroupLeaderboardEvent) : void
      {
         var _loc2_:Game2WeeklyGroupLeaderboardParser = param1.getParser();
         if(false)
         {
            var_1432.leaderboard.addWeeklyGroupData(_loc2_.year,_loc2_.week,_loc2_.leaderboard,_loc2_.totalListSize,_loc2_.maxOffset,_loc2_.minutesUntilReset,_loc2_.favouriteGroupId);
         }
      }
      
      private function onWeeklyLeaderboard(param1:Game2WeeklyLeaderboardEvent) : void
      {
         var _loc2_:Game2WeeklyLeaderboardParser = param1.getParser();
         if(false)
         {
            var_1432.leaderboard.addWeeklyData(_loc2_.year,_loc2_.week,_loc2_.leaderboard,_loc2_.totalListSize,_loc2_.maxOffset,_loc2_.minutesUntilReset);
         }
      }
      
      private function onWeeklyFriendsLeaderboard(param1:Game2WeeklyFriendsLeaderboardEvent) : void
      {
         var _loc2_:Game2WeeklyLeaderboardParser = param1.getParser();
         if(false)
         {
            var_1432.leaderboard.addFriendWeeklyData(_loc2_.year,_loc2_.week,_loc2_.leaderboard,_loc2_.totalListSize,_loc2_.maxOffset,_loc2_.minutesUntilReset);
         }
      }
   }
}
