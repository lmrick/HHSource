package com.sulake.habbo.game.snowwar.ui
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.class_1870;
   import com.sulake.habbo.avatar.class_3156;
   import com.sulake.habbo.game.snowwar.SnowWarEngine;
   import com.sulake.habbo.game.snowwar.utils.SnowWarAnimatedWindowElement;
   import com.sulake.habbo.game.snowwar.utils.WindowUtils;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import package_47.Game2ExitGameMessageComposer;
   
   public class SnowWarUI implements class_13, class_1870
   {
      
      private static const EMPTY_AMMO_FLASH_FRAMES:int = 4;
      
      private static const EMPTY_AMMO_FRAME_LENGTH:int = 75;
      
      private static const SCORE_FLASH_FRAMES:int = 4;
      
      private static const SCORE_FRAME_LENGTH:int = 50;
      
      private static const MAX_SNOWBALLS:int = 5;
      
      private static const MAX_ENERGY:int = 5;
       
      
      private var var_1451:SnowWarEngine;
      
      private var var_2292:class_3151;
      
      private var _snowballs:class_3151;
      
      private var var_1780:class_3151;
      
      private var var_1635:class_3151;
      
      private var var_1335:class_3151;
      
      private var _exitConfirmation:class_3151;
      
      private var _checksumIndicatorColor:RGBColor;
      
      private var _tweenColor:RGBColor;
      
      private var var_1586:class_3282;
      
      private var var_311:Boolean = false;
      
      private var var_1149:int = 1;
      
      private var _timeSinceLastUpdate:uint;
      
      private var var_4032:int = -1;
      
      private var var_3421:int = 5;
      
      private var _makeSnowballButton:class_3282;
      
      private var _makingSnowballs:Boolean = false;
      
      private var var_3740:int = 5;
      
      private var _progressIcon:class_3282;
      
      private var _loadIcon:SnowWarAnimatedWindowElement;
      
      private var _emptyAmmoFlash:class_3282;
      
      private var _emptyAmmoAnimation:SnowWarAnimatedWindowElement;
      
      private var var_2813:class_3282;
      
      private var var_2340:int = 0;
      
      private var _scoreBackgroundAsset:String = "";
      
      private var var_2062:Timer;
      
      private var var_2932:Boolean;
      
      public function SnowWarUI(param1:SnowWarEngine)
      {
         super();
         var_1451 = param1;
         var_1451.windowManager.getDesktop(1).visible = false;
         var_2932 = var_1451.sessionDataManager.hasSecurity(4);
         if(var_2932)
         {
            _checksumIndicatorColor = new RGBColor();
            _tweenColor = new RGBColor(16777215);
         }
      }
      
      public function dispose() : void
      {
         var_1451.windowManager.getDesktop(1).visible = true;
         var_1451 = null;
         if(var_2292)
         {
            var_2292.dispose();
            var_2292 = null;
         }
         if(_snowballs)
         {
            _makeSnowballButton = null;
            _progressIcon = null;
            _emptyAmmoFlash = null;
            _snowballs.dispose();
            _snowballs = null;
         }
         if(var_1780)
         {
            var_2813 = null;
            var_1780.dispose();
            var_1780 = null;
         }
         if(var_1635)
         {
            var_1635.dispose();
            var_1635 = null;
         }
         if(var_1335)
         {
            var_1335.dispose();
            var_1335 = null;
         }
         if(var_1586)
         {
            var_1586.dispose();
            var_1586 = null;
         }
         if(_emptyAmmoAnimation != null)
         {
            _emptyAmmoAnimation.dispose();
            _emptyAmmoAnimation = null;
         }
         if(_exitConfirmation)
         {
            _exitConfirmation.dispose();
            _exitConfirmation = null;
         }
         if(var_2062)
         {
            var_2062.removeEventListener("timerComplete",onTimerHider);
            var_2062.stop();
            var_2062 = null;
         }
         disposeLoadIcon();
         var_311 = true;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function init() : void
      {
         var_2292 = WindowUtils.createWindow("snowwar_exit") as class_3151;
         var_2292.addEventListener("WME_CLICK",onExit);
         var_2292.x = 0;
         var_2292.y = 10;
         _snowballs = WindowUtils.createWindow("snowwar_snowballs") as class_3151;
         var _loc1_:class_3127 = _snowballs.findChildByName("make_snowball");
         _loc1_.addEventListener("WME_DOWN",onMakeSnowballDown);
         _loc1_.addEventListener("WME_UP",onMakeSnowballUp);
         _loc1_.addEventListener("WME_OUT",onMakeSnowballUp);
         _snowballs.center();
         _snowballs.x = 10;
         _makeSnowballButton = _snowballs.findChildByName("makeSnowballImage") as class_3282;
         _emptyAmmoFlash = _snowballs.findChildByName("emptyFlashImage") as class_3282;
         _emptyAmmoFlash.visible = false;
         _emptyAmmoAnimation = new SnowWarAnimatedWindowElement(var_1451.assets,_emptyAmmoFlash,"ui_no_balls_",4,75,true);
         _progressIcon = _snowballs.findChildByName("ballProgress") as class_3282;
         var_1780 = WindowUtils.createWindow("snowwar_own_stats") as class_3151;
         var_1780.x = 10;
         var_1780.y = var_1780.desktop.height - 0 - 10;
         var_2813 = var_1780.findChildByName("backgroundFlashImage") as class_3282;
         updateUserImage();
         var_1335 = WindowUtils.createWindow("snowwar_team_scores") as class_3151;
         var_1335.x = var_1335.desktop.width - 0 - 10;
         var_1335.y = 10;
         var_1635 = WindowUtils.createWindow("snowwar_timer") as class_3151;
         var_1635.x = var_1635.desktop.width - 0 - 50;
         var_1635.y = 105;
         timer = 0;
         var_1586 = WindowUtils.createWindow("counter") as class_3282;
         var_1586.center();
         if(var_2932)
         {
            var_1635.getChildByName("checksumIndicator").visible = true;
            _checksumIndicatorColor.fromInt(var_1635.color);
         }
         var_3421 = 5;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         updateUserImage();
      }
      
      private function updateUserImage() : void
      {
         var _loc1_:BitmapData = null;
         var _loc3_:String = var_1451.sessionDataManager.figure;
         var _loc2_:String = var_1451.sessionDataManager.gender;
         var _loc4_:class_3156;
         if((_loc4_ = var_1451.avatarManager.createAvatarImage(_loc3_,"h",_loc2_,this)) != null)
         {
            _loc4_.setDirection("full",2);
            _loc1_ = _loc4_.getCroppedImage("head");
            _loc4_.dispose();
            WindowUtils.setElementImage(var_1780.findChildByName("user_image"),_loc1_);
            _loc1_.dispose();
         }
      }
      
      private function getBitmap(param1:String) : BitmapData
      {
         return var_1451.assets.getAssetByName(param1).content as BitmapData;
      }
      
      private function getElement(param1:class_3151, param2:String) : class_3127
      {
         return param1.findChildByName(param2);
      }
      
      private function onMakeSnowballDown(param1:WindowMouseEvent) : void
      {
         makeSnowballButtonPressed(true);
         if(var_1451.makeSnowball())
         {
            startWaitingForSnowball();
         }
      }
      
      private function onMakeSnowballUp(param1:WindowMouseEvent) : void
      {
         makeSnowballButtonPressed(false);
      }
      
      public function startWaitingForSnowball() : void
      {
         if(_loadIcon != null)
         {
            _loadIcon.dispose();
            _loadIcon = null;
         }
         _loadIcon = new SnowWarAnimatedWindowElement(var_1451.assets,_progressIcon,"load_",8);
         SnowWarEngine.playSound("HBSTG_snowwar_make_snowball");
      }
      
      public function stopWaitingForSnowball() : void
      {
         disposeLoadIcon();
         SnowWarEngine.stopSound("HBSTG_snowwar_make_snowball");
         if(_makingSnowballs)
         {
            onMakeSnowballDown(null);
         }
      }
      
      private function disposeLoadIcon() : void
      {
         if(_loadIcon != null)
         {
            _loadIcon.dispose();
            _loadIcon = null;
         }
      }
      
      private function onExit(param1:WindowMouseEvent) : void
      {
         if(!_exitConfirmation)
         {
            _exitConfirmation = WindowUtils.createWindow("snowwar_exit_confirmation") as class_3151;
            _exitConfirmation.findChildByName("yes").addEventListener("WME_CLICK",confirmationHandler);
            _exitConfirmation.findChildByName("no").addEventListener("WME_CLICK",confirmationHandler);
            _exitConfirmation.findChildByTag("close").addEventListener("WME_CLICK",confirmationHandler);
         }
         else
         {
            _exitConfirmation.visible = true;
            _exitConfirmation.activate();
         }
      }
      
      private function confirmationHandler(param1:WindowMouseEvent) : void
      {
         if(param1.window.name == "yes")
         {
            var_1451.send(new Game2ExitGameMessageComposer());
            var_1451.resetGameSession();
            var_1451.resetRoomSession();
         }
         else
         {
            _exitConfirmation.visible = false;
         }
      }
      
      public function set snowballs(param1:int) : void
      {
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < 5)
         {
            _snowballs.findChildByName("ball_" + _loc3_).visible = _loc3_ < param1;
            _loc3_++;
         }
         var_3740 = param1;
         var _loc2_:class_3127 = _snowballs.findChildByName("ball_" + param1);
         if(_loc2_ != null)
         {
            _progressIcon.x = _loc2_.x;
            _progressIcon.y = _loc2_.y;
         }
      }
      
      public function set ownScore(param1:int) : void
      {
         WindowUtils.setCaption(var_1780.findChildByName("personal_score"),param1.toString());
      }
      
      public function set timer(param1:int) : void
      {
         if(var_2932)
         {
            if(_checksumIndicatorColor)
            {
               _checksumIndicatorColor.tweenTo(_tweenColor);
               var_1635.getChildByName("checksumIndicator").color = _checksumIndicatorColor.rgb;
            }
         }
         if(var_4032 == param1)
         {
            return;
         }
         var_4032 = param1;
         var _loc2_:String = "" + int(param1 / 60);
         var _loc3_:String = "" + int(param1 % 60);
         if(int(_loc2_) < 10)
         {
            _loc2_ = "0" + _loc2_;
         }
         if(int(_loc3_) < 10)
         {
            _loc3_ = "0" + _loc3_;
         }
         WindowUtils.showElement(var_1635,"time_left");
         WindowUtils.setCaption(var_1635.findChildByName("time_left"),_loc2_ + ":" + _loc3_);
         if(param1 <= 5 && param1 > 0)
         {
            SnowWarEngine.playSound("HBST_call_for_help");
            if(!var_2062)
            {
               var_2062 = new Timer(500,1);
               var_2062.addEventListener("timerComplete",onTimerHider);
            }
            var_2062.reset();
            var_2062.start();
         }
      }
      
      private function onTimerHider(param1:TimerEvent) : void
      {
         if(var_1635)
         {
            WindowUtils.hideElement(var_1635,"time_left");
         }
      }
      
      public function set hitPoints(param1:int) : void
      {
         if(var_3421 != param1)
         {
            WindowUtils.setElementImage(getElement(var_1780,"energy_bar"),getBitmap("ui_me_health_" + Math.min(5,param1)));
            var_3421 = param1;
         }
      }
      
      public function showChecksumError(param1:uint) : void
      {
         if(var_2932)
         {
            var_1635.color = param1;
            if(_checksumIndicatorColor)
            {
               _checksumIndicatorColor.fromInt(param1);
            }
         }
      }
      
      public function initCounter() : void
      {
         _timeSinceLastUpdate = 0;
         var_1149 = 1;
      }
      
      public function update(param1:uint) : void
      {
         updateAmmoDisplay();
         updateCounterImage(param1);
         updateScoreFlash(param1);
         updateTeamScores();
      }
      
      private function updateScoreFlash(param1:uint) : void
      {
         var _loc2_:int = 0;
         if(var_2340 > 0)
         {
            _loc2_ = var_2340 / 50 + 1;
            if(_loc2_ > 4)
            {
               var_2340 = 0;
               var_2813.visible = false;
            }
            else
            {
               var_2340 += param1;
               var_2813.visible = true;
               WindowUtils.setElementImage(var_2813,getBitmap(_scoreBackgroundAsset + _loc2_));
            }
         }
      }
      
      public function flashOwnScore(param1:Boolean) : void
      {
         var_2340 = 1;
         _scoreBackgroundAsset = param1 ? "ui_me_plus_" : "ui_me_minus_";
      }
      
      private function updateAmmoDisplay() : void
      {
         _emptyAmmoFlash.visible = var_3740 == 0 && _loadIcon == null;
      }
      
      private function updateCounterImage(param1:uint) : void
      {
         var _loc2_:BitmapData = null;
         var _loc3_:Point = null;
         var _loc5_:Boolean = false;
         _timeSinceLastUpdate += param1;
         if(var_1149 < 6)
         {
            if(_timeSinceLastUpdate >= 1000)
            {
               _loc5_ = true;
               _timeSinceLastUpdate = 0;
            }
         }
         else if(var_1149 < 11)
         {
            if(_timeSinceLastUpdate > 100)
            {
               _loc5_ = true;
               _timeSinceLastUpdate = 0;
            }
         }
         else if(var_1586)
         {
            var_1586.dispose();
            var_1586 = null;
         }
         if(!_loc5_ || var_311 || !var_1586)
         {
            return;
         }
         var _loc4_:BitmapDataAsset;
         if(_loc4_ = var_1451.assets.getAssetByName(padName("explosion",var_1149)) as BitmapDataAsset)
         {
            _loc2_ = _loc4_.content as BitmapData;
            if(true)
            {
               var_1586.bitmap = new BitmapData(var_1586.width,var_1586.height,true,16777215);
            }
            var_1586.bitmap.fillRect(var_1586.bitmap.rect,16777215);
            _loc3_ = new Point(-_loc4_.offset.x,-_loc4_.offset.y);
            var_1586.bitmap.copyPixels(_loc2_,_loc2_.rect,_loc3_,null,null,true);
            var_1586.invalidate();
         }
         var_1149++;
      }
      
      private function padName(param1:String, param2:int, param3:int = 4) : String
      {
         var _loc4_:String = param2.toString();
         while(_loc4_.length < param3)
         {
            _loc4_ = "0" + _loc4_;
         }
         return param1 + _loc4_;
      }
      
      private function updateTeamScores() : void
      {
         var _loc1_:Array = var_1451.gameArena.getTeamScores();
         if(_loc1_.length >= 2)
         {
            WindowUtils.setCaption(var_1335.findChildByName("score_blue"),_loc1_[0]);
            WindowUtils.setCaption(var_1335.findChildByName("score_red"),_loc1_[1]);
         }
      }
      
      private function makeSnowballButtonPressed(param1:Boolean) : void
      {
         if(_makingSnowballs != param1)
         {
            WindowUtils.setElementImage(_makeSnowballButton,getBitmap("ui_make_balls_" + (param1 ? "down" : "up")));
         }
         _makingSnowballs = param1;
      }
   }
}

class RGBColor
{
    
   
   private var _r:uint;
   
   private var _g:uint;
   
   private var _b:uint;
   
   private var _a:uint;
   
   public function RGBColor(param1:uint = 0)
   {
      super();
      fromInt(param1);
   }
   
   public function get r() : uint
   {
      return _r;
   }
   
   public function get g() : uint
   {
      return _g;
   }
   
   public function get b() : uint
   {
      return _b;
   }
   
   public function get a() : uint
   {
      return _a;
   }
   
   public function fromInt(param1:uint) : void
   {
      _a = param1 >> 24 & 255;
      _r = param1 >> 16 & 255;
      _g = param1 >> 8 & 255;
      _b = param1 >> 0 & 255;
   }
   
   public function get rgb() : uint
   {
      return _a << 24 | _r << 16 | _g << 8 | _b;
   }
   
   public function tweenTo(param1:RGBColor) : void
   {
      _a += (param1.a - a) / 24;
      _r += (param1.r - r) / 24;
      _g += (param1.g - g) / 24;
      _b += (param1.b - b) / 24;
   }
}
