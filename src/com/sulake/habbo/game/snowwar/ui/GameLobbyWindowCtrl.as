package com.sulake.habbo.game.snowwar.ui
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.avatar.class_1870;
   import com.sulake.habbo.avatar.class_3156;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyPlayerData;
   import com.sulake.habbo.game.snowwar.SnowWarEngine;
   import com.sulake.habbo.game.snowwar.utils.SnowWarAnimatedWindowElement;
   import com.sulake.habbo.game.snowwar.utils.WindowUtils;
   import com.sulake.habbo.localization.class_18;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import package_29.class_612;
   
   public class GameLobbyWindowCtrl implements class_13, class_1870
   {
       
      
      private var var_1534:com.sulake.habbo.game.snowwar.ui.GamesMainViewController;
      
      private var var_1451:SnowWarEngine;
      
      private var _levelName:String;
      
      private var _numberOfTeams:int;
      
      private var _numberOfPlayers:int;
      
      private var _maxNumberOfPlayers:int;
      
      private var var_1680:class_3151;
      
      private var var_2369:Timer;
      
      private var var_1186:int = -1;
      
      private var _queuePosition:int = -1;
      
      private var var_311:Boolean = false;
      
      private var var_2155:class_24;
      
      private var var_1951:class_24;
      
      public function GameLobbyWindowCtrl(param1:com.sulake.habbo.game.snowwar.ui.GamesMainViewController, param2:String, param3:int, param4:int)
      {
         super();
         var_1534 = param1;
         var_1451 = param1.gameEngine;
         var_2155 = new class_24();
         var_1951 = new class_24();
         _levelName = param2;
         _numberOfTeams = param3;
         _numberOfPlayers = numberOfPlayers;
         _maxNumberOfPlayers = param4;
      }
      
      private function createLobbyView() : void
      {
         var _loc3_:int = 0;
         var_1680 = var_1534.rootWindow.findChildByName("snowwar_lobby_cont") as class_3151;
         var_1680.center();
         var_1680.findChildByName("cancel_link_region").procedure = onCancel;
         var _loc2_:IItemGridWindow = var_1680.findChildByName("players_grid") as IItemGridWindow;
         var _loc4_:class_3151 = WindowUtils.createWindow("snowwar_lobby_player") as class_3151;
         _loc3_ = 0;
         while(_loc3_ < _maxNumberOfPlayers)
         {
            _loc2_.addGridItem(_loc4_.clone());
            _loc3_++;
         }
         _loc4_.dispose();
         var_1680.visible = false;
      }
      
      private function createWindow(param1:String) : class_3151
      {
         var _loc2_:XmlAsset = var_1451.assets.getAssetByName(param1) as XmlAsset;
         return var_1451.windowManager.buildFromXML(_loc2_.content as XML) as class_3151;
      }
      
      private function onCancel(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         onClose(true);
         if(true)
         {
            var_1534.openMainWindow(true);
         }
         else
         {
            var_1534.close(true);
         }
      }
      
      public function onClose(param1:Boolean) : void
      {
         if(param1)
         {
            var_1451.communication.connection.send(new class_612());
         }
         disposeCountdownTimer();
         _queuePosition = -1;
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(!var_1680)
         {
            createLobbyView();
         }
         var_1680.visible = param1;
      }
      
      public function get visible() : Boolean
      {
         if(var_1680)
         {
            return var_1680.visible;
         }
         return false;
      }
      
      public function dispose() : void
      {
         var_311 = true;
         if(var_1951)
         {
            for each(var _loc1_ in var_1951)
            {
               _loc1_.dispose();
            }
            var_1951.dispose();
            var_1951 = null;
         }
         if(var_1680 != null)
         {
            var_1680.dispose();
            var_1680 = null;
         }
         disposeCountdownTimer();
         if(var_2155)
         {
            var_2155.dispose();
            var_2155 = null;
         }
         _queuePosition = -1;
      }
      
      private function disposeCountdownTimer() : void
      {
         if(var_2369 != null)
         {
            var_2369.removeEventListener("timer",onTick);
            var_2369.stop();
            var_2369 = null;
         }
         var_1186 = -1;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function playerLeft(param1:int) : void
      {
         var_2155.remove(param1);
         updateDialog(true);
      }
      
      public function playerJoined(param1:GameLobbyPlayerData) : void
      {
         if(param1)
         {
            var_2155.add(param1.userId,param1);
            updateDialog(true,param1.figure);
         }
      }
      
      public function clearPlayerList() : void
      {
         var_2155.reset();
      }
      
      public function startCountdown(param1:int) : void
      {
         disposeCountdownTimer();
         var_1186 = param1;
         var_2369 = new Timer(1000,param1);
         var_2369.addEventListener("timer",onTick);
         var_2369.start();
         updateDialog(false);
      }
      
      private function onTick(param1:TimerEvent) : void
      {
         if(var_311)
         {
            return;
         }
         if(var_1186 && var_1186 > 0)
         {
            var_1186--;
            HabboGamesCom.log("on tick " + var_1186);
            updateDialog(false);
         }
      }
      
      public function stopCountdown() : void
      {
         disposeCountdownTimer();
         updateDialog(false);
      }
      
      public function set queuePosition(param1:int) : void
      {
         _queuePosition = param1;
      }
      
      private function updateDialog(param1:Boolean, param2:String = null) : void
      {
         var _loc16_:String = null;
         var _loc13_:* = null;
         var _loc9_:IRegionWindow = null;
         var _loc8_:class_3282 = null;
         var _loc15_:SnowWarAnimatedWindowElement = null;
         var _loc10_:class_3156 = null;
         var _loc4_:BitmapData = null;
         var _loc6_:Point = null;
         var _loc14_:class_3127 = var_1680.findChildByName("wait_text") as ITextWindow;
         var _loc5_:class_3127 = var_1680.findChildByName("wait_text_stroke") as ITextWindow;
         var _loc3_:class_18 = var_1451.localization;
         if(var_1186 >= 0)
         {
            _loc16_ = "snowwar.lobby_game_start_countdown";
            _loc3_.registerParameter(_loc16_,"seconds",String(var_1186));
            _loc13_ = _loc16_ + " " + "%seconds%" + " " + var_1186;
         }
         else if(_queuePosition >= 0)
         {
            _loc16_ = "snowwar.lobby_arena_queue_position";
            _loc3_.registerParameter(_loc16_,"position",String(_queuePosition));
            _loc13_ = _loc16_ + " " + "%position%" + " " + _queuePosition;
         }
         else
         {
            _loc13_ = _loc16_ = "snowwar.lobby_waiting_for_more_players";
         }
         var _loc11_:String;
         if(_loc11_ = String(_loc3_.getLocalization(_loc16_)))
         {
            _loc14_.caption = _loc11_;
            _loc5_.caption = _loc11_;
         }
         else
         {
            _loc14_.caption = _loc13_;
            _loc5_.caption = _loc13_;
         }
         var _loc7_:int = 0;
         var _loc12_:IItemGridWindow = var_1680.findChildByName("players_grid") as IItemGridWindow;
         if(param1)
         {
            for each(var _loc17_ in var_2155.getValues())
            {
               _loc10_ = null;
               if(_loc17_.figure == param2 || !param2)
               {
                  _loc10_ = var_1451.avatarManager.createAvatarImage(_loc17_.figure,"h",_loc17_.gender,this);
               }
               if(_loc10_)
               {
                  _loc10_.setDirection("head",2);
                  _loc4_ = _loc10_.getCroppedImage("head");
                  if(_loc9_ = _loc12_.getGridItemAt(_loc7_) as IRegionWindow)
                  {
                     _loc9_.toolTipCaption = _loc17_.name;
                     _loc9_.mouseThreshold = 0;
                     _loc8_ = _loc9_.findChildByName("image") as class_3282;
                     if(_loc15_ = var_1951.remove(_loc8_))
                     {
                        _loc15_.dispose();
                     }
                     if(_loc8_.bitmap)
                     {
                        _loc8_.bitmap.dispose();
                     }
                     _loc8_.bitmap = new BitmapData(_loc8_.width,_loc8_.height,true,0);
                     _loc6_ = new Point((_loc8_.width - _loc4_.width) / 2,(_loc8_.height - _loc4_.height) / 2);
                     _loc8_.bitmap.copyPixels(_loc4_,_loc4_.rect,_loc6_);
                  }
                  _loc4_.dispose();
                  _loc10_.dispose();
               }
               _loc7_++;
            }
            while(_loc7_ < maxNumberOfPlayers)
            {
               _loc8_ = (_loc9_ = _loc12_.getGridItemAt(_loc7_) as IRegionWindow).findChildByName("image") as class_3282;
               if(!var_1951.hasKey(_loc8_))
               {
                  _loc15_ = new SnowWarAnimatedWindowElement(var_1451.assets,_loc8_,"load_",8);
                  var_1951.add(_loc8_,_loc15_);
               }
               _loc7_++;
            }
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         updateDialog(true,param1);
      }
      
      public function get levelName() : String
      {
         return _levelName;
      }
      
      public function get numberOfTeams() : int
      {
         return _numberOfTeams;
      }
      
      public function get numberOfPlayers() : int
      {
         return _numberOfPlayers;
      }
      
      public function get maxNumberOfPlayers() : int
      {
         return _maxNumberOfPlayers;
      }
      
      public function set levelName(param1:String) : void
      {
         _levelName = param1;
      }
      
      public function set maxNumberOfPlayers(param1:int) : void
      {
         _maxNumberOfPlayers = param1;
      }
      
      public function set numberOfTeams(param1:int) : void
      {
         _numberOfTeams = param1;
      }
      
      public function set numberOfPlayers(param1:int) : void
      {
         _numberOfPlayers = param1;
      }
      
      public function set counter(param1:int) : void
      {
         var_1186 = param1;
      }
   }
}
