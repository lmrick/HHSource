package com.sulake.habbo.game.snowwar.ui
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.game.snowwar.SnowWarEngine;
   import com.sulake.habbo.game.snowwar.utils.SnowWarAnimatedWindowElement;
   import com.sulake.habbo.game.snowwar.utils.WindowUtils;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class GamesMainViewController implements class_13
   {
      
      private static const INSTRUCTION_ASSETS:Array = ["move_","throw_1_","throw_2_","throw_3_","balls_"];
      
      private static const INSTRUCTION_FRAME_COUNTS:Array = [4,4,5,5,5];
      
      private static const INSTRUCTION_FRAME_LENGTH:int = 1000;
       
      
      private var var_1451:SnowWarEngine;
      
      private var var_1761:class_3151;
      
      private var var_1439:class_3151;
      
      private var var_1592:com.sulake.habbo.game.snowwar.ui.GameLobbyWindowCtrl;
      
      private var var_311:Boolean;
      
      private var _instructionsAnimation:SnowWarAnimatedWindowElement;
      
      private var var_2218:Timer;
      
      private var var_1710:int = 0;
      
      private var _currentInstruction:int = 0;
      
      public function GamesMainViewController(param1:SnowWarEngine)
      {
         super();
         var_1451 = param1;
      }
      
      public function get gameEngine() : SnowWarEngine
      {
         return var_1451;
      }
      
      public function get rootWindow() : class_3151
      {
         return var_1761;
      }
      
      public function get lobbyView() : com.sulake.habbo.game.snowwar.ui.GameLobbyWindowCtrl
      {
         return var_1592;
      }
      
      public function toggleVisibility() : void
      {
         if(var_1761)
         {
            var_1761.visible = true;
         }
         else
         {
            openMainWindow(true);
         }
      }
      
      private function createWindow() : void
      {
         var _loc1_:int = 0;
         var_1761 = WindowUtils.createWindow("games_main",1) as class_3151;
         var_1761.findChildByTag("close").addEventListener("WME_CLICK",onClose);
         var_1761.visible = true;
         var_1761.center();
         var_1439 = var_1761.findChildByName("quick_play_container") as class_3151;
         var_1439.findChildByName("play.button").addEventListener("WME_CLICK",onPlay);
         var_1439.visible = false;
         var_1439.findChildByName("instructions_link").addEventListener("WME_CLICK",onInstructions);
         var_1439.findChildByName("leaderboard_link").addEventListener("WME_CLICK",onLeaderboard);
         var_1439.findChildByName("instructions_back").addEventListener("WME_CLICK",onBack);
         var_1439.findChildByName("instructions_next").addEventListener("WME_CLICK",onNext);
         var_1439.findChildByName("instructions_prev").addEventListener("WME_CLICK",onPrevious);
         var_1439.findChildByName("games_vip_region").addEventListener("WME_CLICK",onOpenClubCenter);
         var_1439.procedure = windowEventProc;
         var_1439.findChildByName("leaderboard_link").visible = var_1451.config.getBoolean("games.highscores.enabled");
         var _loc2_:IItemListWindow = var_1439.findChildByName("page_list") as IItemListWindow;
         _loc1_ = 0;
         while(_loc1_ < _loc2_.numListItems)
         {
            _loc2_.getListItemAt(_loc1_).addEventListener("WME_CLICK",onSelectPage);
            _loc1_++;
         }
         var_311 = false;
         updateGameStartingStatus();
      }
      
      private function windowEventProc(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_OVER" || param1.type == "WME_OUT")
         {
            switch(param2.name)
            {
               case "btn_more_games_10":
                  WindowUtils.setElementImage(param2,getBitmap("btn_more_games_10" + (param1.type == "WME_OVER" ? "_hi" : "")));
                  break;
               case "btn_more_games_100":
                  WindowUtils.setElementImage(param2,getBitmap("btn_more_games_100" + (param1.type == "WME_OVER" ? "_hi" : "")));
                  break;
               case "btn_more_games_300":
                  WindowUtils.setElementImage(param2,getBitmap("btn_more_games_300" + (param1.type == "WME_OVER" ? "_hi" : "")));
            }
         }
         if(param1.type == "WME_CLICK")
         {
            switch(param2.name)
            {
               case "btn_more_games_10":
                  var_1451.catalog.buySnowWarTokensOffer("GET_SNOWWAR_TOKENS");
                  var_1451.logGameEvent("gameFramework.buyTokens.clicked.frontView");
                  break;
               case "btn_more_games_100":
                  var_1451.catalog.buySnowWarTokensOffer("GET_SNOWWAR_TOKENS2");
                  var_1451.logGameEvent("gameFramework.buyTokens.clicked.frontView");
                  break;
               case "btn_more_games_300":
                  var_1451.catalog.buySnowWarTokensOffer("GET_SNOWWAR_TOKENS3");
                  var_1451.logGameEvent("gameFramework.buyTokens.clicked.frontView");
            }
         }
      }
      
      public function close(param1:Boolean) : void
      {
         if(var_1592 && false)
         {
            var_1592.onClose(param1);
         }
         disposeViews();
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         close(true);
      }
      
      private function onPlay(param1:WindowMouseEvent) : void
      {
         if(true)
         {
            var_1451.startQuickServerGame();
         }
         else
         {
            var_1451.openGetMoreGames("gameFramework.onPlay.clicked.frontView");
         }
      }
      
      private function updateGettingMoreGamesOption() : void
      {
         var _loc1_:class_3127 = var_1439.findChildByName("play.button");
         if(false)
         {
            _loc1_.visible = false;
         }
         else
         {
            _loc1_.visible = true;
         }
      }
      
      private function onInstructions(param1:WindowMouseEvent) : void
      {
         showInstructions(true);
      }
      
      private function onLeaderboard(param1:WindowMouseEvent) : void
      {
         var_1451.showLeaderboard();
      }
      
      private function onBack(param1:WindowMouseEvent) : void
      {
         showInstructions(false);
      }
      
      private function onNext(param1:WindowMouseEvent) : void
      {
         _currentInstruction++;
         _currentInstruction %= 0;
         showInstructions(true);
      }
      
      private function onPrevious(param1:WindowMouseEvent) : void
      {
         _currentInstruction = _currentInstruction - 1 + INSTRUCTION_ASSETS.length;
         _currentInstruction %= 0;
         showInstructions(true);
      }
      
      private function onSelectPage(param1:WindowMouseEvent) : void
      {
         _currentInstruction = parseInt(param1.window.name.replace("page_",""));
         showInstructions(true);
      }
      
      private function showInstructions(param1:Boolean) : void
      {
         var _loc3_:int = 0;
         var _loc7_:class_3151 = null;
         var_1439.findChildByName("teaser_container").visible = !param1;
         var_1439.findChildByName("instructions_container").visible = param1;
         if(_instructionsAnimation)
         {
            _instructionsAnimation.dispose();
            _instructionsAnimation = null;
         }
         if(!param1)
         {
            return;
         }
         var _loc4_:class_3282 = var_1439.findChildByName("instructions_image") as class_3282;
         var _loc6_:String = "null";
         var _loc2_:int = 0;
         _instructionsAnimation = new SnowWarAnimatedWindowElement(var_1451.assets,_loc4_,_loc6_,_loc2_,1000);
         var_1439.findChildByName("instruction_text").caption = "${snowwar.instructions." + (_currentInstruction + 1) + "}";
         var _loc5_:IItemListWindow = var_1439.findChildByName("page_list") as IItemListWindow;
         _loc3_ = 0;
         while(_loc3_ < _loc5_.numListItems)
         {
            _loc7_ = _loc5_.getListItemAt(_loc3_) as class_3151;
            _loc6_ = _loc3_ <= _currentInstruction ? "pagination_ball_hilite" : "pagination_ball";
            WindowUtils.setElementImage(_loc7_.getChildAt(0),getBitmap(_loc6_));
            _loc3_++;
         }
      }
      
      private function getBitmap(param1:String) : BitmapData
      {
         var _loc2_:IAsset = var_1451.assets.getAssetByName(param1);
         if(_loc2_)
         {
            return _loc2_.content as BitmapData;
         }
         return null;
      }
      
      private function onOpenClubCenter(param1:WindowMouseEvent) : void
      {
         var_1451.openClubCenter("gameFramework.getVip.clicked.frontView");
      }
      
      public function openMainWindow(param1:Boolean) : void
      {
         if(!var_1761 && param1)
         {
            createWindow();
         }
         else if(!rootWindow && !param1)
         {
            return;
         }
         if(var_1592)
         {
            var_1592.visible = false;
         }
         var_1439.visible = true;
      }
      
      public function openGameLobbyWindow(param1:String, param2:int, param3:int) : void
      {
         if(!var_1761)
         {
            createWindow();
         }
         if(!var_1592)
         {
            var_1592 = new com.sulake.habbo.game.snowwar.ui.GameLobbyWindowCtrl(this,param1,param2,param3);
         }
         else
         {
            var_1592.levelName = param1;
            var_1592.numberOfTeams = param2;
            var_1592.maxNumberOfPlayers = param3;
            var_1592.clearPlayerList();
         }
         var_1439.visible = false;
         var_1592.visible = true;
      }
      
      public function dispose() : void
      {
         if(!var_311)
         {
            disposeViews();
            var_311 = true;
            disposeCounter();
         }
      }
      
      private function disposeViews() : void
      {
         if(_instructionsAnimation)
         {
            _instructionsAnimation.dispose();
            _instructionsAnimation = null;
         }
         if(var_1592)
         {
            var_1592.dispose();
            var_1592 = null;
         }
         if(var_1439)
         {
            var_1439.dispose();
            var_1439 = null;
         }
         if(var_1761)
         {
            var_1761.dispose();
            var_1761 = null;
         }
      }
      
      private function disposeCounter() : void
      {
         if(var_2218)
         {
            var_2218.removeEventListener("timer",onTick);
            var_2218.stop();
            var_2218 = null;
         }
         var_1710 = NaN;
      }
      
      public function get gameLobbyWindowActive() : Boolean
      {
         return var_1592 && false;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function updateGameStartingStatus() : void
      {
         var _loc1_:class_3151 = null;
         var _loc3_:ITextWindow = null;
         var _loc2_:class_3127 = null;
         if(var_1439 && false)
         {
            WindowUtils.setCaption(var_1439.findChildByName("games_left"),var_1451.freeGamesLeft.toString());
            _loc1_ = var_1439.findChildByName("games_left_region") as class_3151;
            _loc3_ = var_1439.findChildByName("games_left_stroke") as ITextWindow;
            _loc2_ = var_1439.findChildByName("play.button");
            _loc2_.visible = true;
            updateGettingMoreGamesOption();
            if(checkGameAmountStatus(_loc1_,_loc3_,_loc2_))
            {
               checkBlockStatus(_loc2_);
            }
         }
      }
      
      private function checkGameAmountStatus(param1:class_3151, param2:ITextWindow, param3:class_3127) : Boolean
      {
         if(false)
         {
            param1.visible = false;
            return true;
         }
         param1.visible = true;
         var _loc4_:class_3127 = ITextWindow(var_1439.findChildByName("play_text"));
         param3.color = 5622784;
         switch(1)
         {
            case 0:
               param1.visible = false;
               WindowUtils.setCaption(_loc4_,"${snowwar.play}");
               return true;
            case 1:
               param1.visible = true;
               param2.textColor = 16711680;
               WindowUtils.setCaption(_loc4_,"${catalog.vip.buy.title}");
               return false;
            default:
               param1.visible = true;
               param2.textColor = 1079212;
               WindowUtils.setCaption(_loc4_,"${snowwar.play}");
               return true;
         }
      }
      
      private function checkBlockStatus(param1:class_3127) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc4_:class_3127 = ITextWindow(var_1439.findChildByName("play_text"));
         if(var_1710 > 0)
         {
            param1.disable();
            param1.color = 13421772;
            _loc3_ = Math.floor(var_1710 / 60);
            _loc2_ = var_1710 % 60;
            _loc4_.caption = _loc3_ + ":" + (_loc2_ < 10 ? "0" + _loc2_ : _loc2_);
         }
         else if(var_1710 <= 0)
         {
            param1.enable();
            param1.color = 5622784;
            WindowUtils.setCaption(_loc4_,"${snowwar.play}");
         }
      }
      
      private function onTick(param1:TimerEvent) : void
      {
         if(var_1710 && var_1710 > 0)
         {
            var_1710--;
            HabboGamesCom.log("on block tick " + var_1710);
            updateGameStartingStatus();
         }
         if(var_1710 <= 0)
         {
            updateGameStartingStatus();
            disposeCounter();
         }
      }
      
      public function changeBlockStatus(param1:int) : void
      {
         if(param1 > 0)
         {
            var_1710 = param1;
            if(!var_2218)
            {
               var_2218 = new Timer(1000,var_1710);
               var_2218.addEventListener("timer",onTick);
               var_2218.start();
            }
         }
         updateGameStartingStatus();
      }
   }
}
