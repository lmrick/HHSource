package com.sulake.habbo.game.snowwar.ui
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.avatar.class_1870;
   import com.sulake.habbo.avatar.class_3156;
   import com.sulake.habbo.avatar.class_3182;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyData;
   import com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLobbyPlayerData;
   import com.sulake.habbo.game.snowwar.SnowWarEngine;
   import com.sulake.habbo.game.snowwar.utils.SnowWarAnimatedWindowElement;
   import com.sulake.habbo.game.snowwar.utils.WindowUtils;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import package_2.class_527;
   import package_47.Game2ExitGameMessageComposer;
   
   public class GameLoadingViewController implements class_13, class_1870
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1451:SnowWarEngine;
      
      private var _window:class_3151;
      
      private var var_1951:class_24;
      
      private var var_491:GameLobbyData;
      
      private var var_2778:com.sulake.habbo.game.snowwar.ui.BackgroundViewController;
      
      private var var_3000:Array;
      
      public function GameLoadingViewController(param1:SnowWarEngine)
      {
         var_3000 = [];
         super();
         var_1451 = param1;
         var_1951 = new class_24();
         createMainWindow();
         var_2778 = new com.sulake.habbo.game.snowwar.ui.BackgroundViewController(var_1451);
         var_2778.background.visible = true;
         var_1451.windowManager.getDesktop(1).visible = false;
         var_1451.roomUI.visible = false;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         var_1451.windowManager.getDesktop(1).visible = true;
         var_1451 = null;
         if(var_1951)
         {
            for each(var _loc1_ in var_1951)
            {
               _loc1_.dispose();
            }
            var_1951.dispose();
            var_1951 = null;
         }
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         if(var_2778)
         {
            var_2778.dispose();
            var_2778 = null;
         }
         _disposed = true;
         var_3000 = [];
      }
      
      private function createMainWindow() : void
      {
         _window = WindowUtils.createWindow("snowwar_ending") as class_3151;
         _window.x = (_window.desktop.width - 0) / 2;
         _window.y = _window.desktop.height > 685 ? 115 : 10;
         WindowUtils.setCaption(_window.findChildByName("endingInformation"),"${snowwar.loading.title}");
         WindowUtils.hideElement(_window,"buttonsContainer");
         WindowUtils.hideElement(_window,"mostKillsContainer");
         WindowUtils.hideElement(_window,"mostHitsContainer");
         WindowUtils.hideElement(_window,"team1Score");
         WindowUtils.hideElement(_window,"team2Score");
         WindowUtils.hideElement(_window,"statusContainer");
         _window.findChildByName("loadingContainer").visible = true;
         _window.findChildByName("leave_link_region").procedure = onCancel;
      }
      
      private function onCancel(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         onClose();
      }
      
      private function onClose() : void
      {
         if(var_1451 != null)
         {
            var_1451.gameCancelled(true);
            var_1451.send(new Game2ExitGameMessageComposer());
            if(true)
            {
               var_1451.send(new class_527(var_1451.roomBeforeGame,false,true));
            }
            var_1451.disposeLoadingView();
         }
      }
      
      public function show(param1:GameLobbyData) : void
      {
         var_491 = param1;
         var _loc2_:class_3282 = _window.findChildByName("arenaPreview") as class_3282;
         var _loc3_:IAsset = var_1451.assets.getAssetByName("arena_" + param1.fieldType + "_preview");
         if(_loc3_)
         {
            _loc2_.bitmap = _loc3_.content as BitmapData;
            _loc2_.disposesBitmap = false;
         }
         WindowUtils.setCaption(_window.findChildByName("arenaName"),var_1451.getArenaName(param1));
         renderPlayers();
      }
      
      private function renderPlayers() : void
      {
         clearPlayers();
         for each(var _loc1_ in var_491.players.sort(GameLobbyPlayerData.var_1370))
         {
            addPlayer(_loc1_);
         }
      }
      
      private function clearPlayers() : void
      {
         var _loc2_:IItemListWindow = null;
         var _loc1_:int = 1;
         while(true)
         {
            _loc2_ = _window.findChildByName("team" + _loc1_++ + "PlayersList") as IItemListWindow;
            if(_window.findChildByName("team" + _loc1_++ + "PlayersList") as IItemListWindow == null)
            {
               break;
            }
            _loc2_.destroyListItems();
         }
      }
      
      private function addPlayer(param1:GameLobbyPlayerData) : void
      {
         var _loc12_:int = 0;
         var _loc5_:int = param1.teamId;
         var _loc8_:IItemListWindow = _window.findChildByName("team" + _loc5_ + "PlayersList") as IItemListWindow;
         var _loc7_:IItemListWindow;
         var _loc9_:class_3151 = (_loc7_ = WindowUtils.createWindow("snowwar_results_player_team_" + _loc5_) as IItemListWindow).getListItemByName("playerImageContainer") as class_3151;
         var _loc6_:class_3151 = _loc7_.getListItemByName("playerDataContainer") as class_3151;
         var _loc2_:class_3151 = _loc7_.getListItemByName("playerScoreContainer") as class_3151;
         if(param1.userId == var_1451.sessionDataManager.userId)
         {
            WindowUtils.setElementImage(_loc9_.findChildByName("playerImageBackground"),getBitmap("green_square"));
         }
         switch(_loc5_ - 1)
         {
            case 1:
               _loc12_ = 4;
               break;
            default:
               _loc12_ = 2;
         }
         WindowUtils.setElementImage(getElement(_loc9_,"playerImage"),getAvatarFigure(param1.teamId,param1.figure,param1.gender,_loc12_));
         WindowUtils.setCaption(getElement(_loc6_,"playerName"),param1.name);
         WindowUtils.hideElement(_loc6_,"playerStats");
         WindowUtils.hideElement(_loc2_,"playerScore");
         WindowUtils.hideElement(_loc6_,"playerTotalStats");
         var _loc10_:class_3282;
         if((_loc10_ = _loc6_.findChildByName("skillLevel") as class_3282).bitmap)
         {
            _loc10_.bitmap.dispose();
         }
         _loc10_.bitmap = getSkillLevelImage(param1.skillLevel,param1.teamId);
         var _loc3_:IRegionWindow = _loc6_.findChildByName("scoreTooltip") as IRegionWindow;
         _loc3_.toolTipCaption = param1.totalScore.toString() + "/" + param1.scoreToNextLevel.toString();
         _loc3_.visible = true;
         _loc8_.addListItem(_loc7_);
         var _loc4_:class_3282 = _loc2_.findChildByName("loadingIcon") as class_3282;
         var _loc11_:SnowWarAnimatedWindowElement;
         if(_loc11_ = var_1951.remove(param1.userId))
         {
            _loc11_.dispose();
         }
         _loc11_ = new SnowWarAnimatedWindowElement(var_1451.assets,_loc4_,"load_",8);
         var_1951.add(param1.userId,_loc11_);
         _loc4_.visible = true;
      }
      
      private function getSkillLevelImage(param1:int, param2:int) : BitmapData
      {
         var _loc6_:BitmapData = null;
         var _loc8_:int = 0;
         var _loc7_:Point = null;
         param1 = Math.min(param1,30);
         var _loc3_:BitmapData = var_1451.assets.getAssetByName("star_empty").content as BitmapData;
         var _loc11_:BitmapData = var_1451.assets.getAssetByName("star_filled_bronze").content as BitmapData;
         var _loc9_:BitmapData = var_1451.assets.getAssetByName("star_filled_silver").content as BitmapData;
         var _loc10_:BitmapData = var_1451.assets.getAssetByName("star_filled_gold").content as BitmapData;
         var _loc5_:int = param1 > 0 ? (param1 - 1) % 10 + 1 : 0;
         var _loc4_:BitmapData = new BitmapData(150,13,true,0);
         _loc8_ = 0;
         while(_loc8_ < 10)
         {
            _loc7_ = param2 == 1 ? new Point(_loc8_ * 15,0) : new Point((9 - _loc8_) * 15,0);
            _loc6_ = param1 > 20 ? (_loc5_-- > 0 ? _loc10_ : _loc3_) : (param1 > 10 ? (_loc5_-- > 0 ? _loc9_ : _loc3_) : (_loc5_-- > 0 ? _loc11_ : _loc3_));
            _loc4_.copyPixels(_loc6_,_loc6_.rect,_loc7_);
            _loc8_++;
         }
         return _loc4_;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         if(var_3000.indexOf(param1) == -1)
         {
            renderPlayers();
            var_3000.push(param1);
         }
      }
      
      private function getElement(param1:class_3151, param2:String) : class_3127
      {
         return param1.findChildByName(param2);
      }
      
      private function getBitmap(param1:String) : BitmapData
      {
         return var_1451.assets.getAssetByName(param1).content as BitmapData;
      }
      
      private function getAvatarFigure(param1:int, param2:String, param3:String, param4:int) : BitmapData
      {
         var _loc5_:class_3182 = var_1451.avatarManager.createFigureContainer(param2);
         switch(param1 - 1)
         {
            case 0:
               _loc5_.updatePart("ch",20000,[1]);
               break;
            case 1:
               _loc5_.updatePart("ch",20001,[1]);
               break;
            default:
               _loc5_.updatePart("ch",20000,[1]);
         }
         _loc5_.removePart("cc");
         var _loc6_:class_3156;
         if(_loc6_ = var_1451.avatarManager.createAvatarImage(_loc5_.getFigureString(),"h_50",param3,this))
         {
            _loc6_.setDirection("full",param4);
            return _loc6_.getCroppedImage("full");
         }
         return null;
      }
      
      public function showReadyPlayers(param1:Array) : void
      {
         var _loc3_:SnowWarAnimatedWindowElement = null;
         for each(var _loc2_ in param1)
         {
            _loc3_ = var_1951.remove(_loc2_);
            if(_loc3_)
            {
               _loc3_.dispose();
            }
         }
         if(false)
         {
            var_1951.add(-1,new SnowWarAnimatedWindowElement(var_1451.assets,_window.findChildByName("mainLoadingIcon") as class_3282,"load_",8));
            WindowUtils.setCaption(_window.findChildByName("loadingText"),"${snowwar.loading_arena}");
         }
      }
   }
}
