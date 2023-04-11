package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.window.widgets.class_3332;
   import com.sulake.habbo.window.widgets.class_3366;
   
   public class AchievementResolutionProgressView implements class_13
   {
      
      private static const PROGRESSBAR_LEFT:String = "achieved_left";
      
      private static const PROGRESSBAR_MID:String = "achieved_mid";
      
      private static const PROGRESSBAR_RIGHT:String = "achieved_right";
       
      
      private var var_3884:int;
      
      private var var_282:com.sulake.habbo.quest.AchievementsResolutionController;
      
      private var _window:class_3281;
      
      private var _stuffId:int;
      
      private var var_442:int;
      
      private var var_331:String;
      
      public function AchievementResolutionProgressView(param1:com.sulake.habbo.quest.AchievementsResolutionController)
      {
         super();
         var_282 = param1;
      }
      
      public function dispose() : void
      {
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         var_282 = null;
      }
      
      public function get disposed() : Boolean
      {
         return var_282 == null;
      }
      
      public function get achievementId() : int
      {
         return var_442;
      }
      
      public function get stuffId() : int
      {
         return _stuffId;
      }
      
      public function get visible() : Boolean
      {
         if(!_window)
         {
            return false;
         }
         return _window.visible;
      }
      
      public function show(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int) : void
      {
         if(_window == null)
         {
            createWindow();
         }
         if(param2 != var_442)
         {
            initializeWindow();
            _window.center();
         }
         _stuffId = param1;
         var_442 = param2;
         var_331 = param3;
         setProgress(param4,param5);
         setBadge(var_331);
         setLocalizations();
         setCountdown(param6);
         _window.visible = true;
      }
      
      private function setProgress(param1:int, param2:int) : void
      {
         var _loc3_:Number = Math.min(1,param1 / param2);
         if(_loc3_ > 0)
         {
            _window.setVisibleChildren(true,["achieved_left","achieved_mid"]);
            _window.findChildByName("achieved_right").visible = _loc3_ == 1;
         }
         _window.findChildByName("achieved_mid").width = var_3884 * _loc3_;
         var_282.questEngine.localization.registerParameter("resolution.progress.progress","progress",param1.toString());
         var_282.questEngine.localization.registerParameter("resolution.progress.progress","total",param2.toString());
      }
      
      private function setBadge(param1:String) : void
      {
         var _loc3_:class_3217 = _window.findChildByName("achievement_badge") as class_3217;
         var _loc2_:class_3366 = _loc3_.widget as class_3366;
         IStaticBitmapWrapperWindow(class_3151(_loc3_.rootWindow).findChildByName("bitmap")).assetUri = "common_loading_icon";
         _loc2_.badgeId = param1;
         _loc3_.visible = true;
      }
      
      private function setLocalizations() : void
      {
         _window.findChildByName("achievement.name").caption = var_282.questEngine.localization.getBadgeName(var_331);
         _window.findChildByName("achievement.desc").caption = var_282.questEngine.localization.getBadgeDesc(var_331);
      }
      
      private function setCountdown(param1:int) : void
      {
         var _loc2_:class_3217 = class_3217(_window.findChildByName("time_left_widget"));
         var _loc3_:class_3332 = class_3332(_loc2_.widget);
         _loc3_.seconds = param1;
         _loc3_.running = true;
      }
      
      private function createWindow() : void
      {
         _window = class_3281(var_282.questEngine.getXmlWindow("AchievementResolutionProgress"));
         _window.findChildByTag("close").procedure = onWindowClose;
         _window.findChildByName("reset_button").procedure = onResetButton;
         var_3884 = _window.findChildByName("achieved_mid").width;
      }
      
      private function initializeWindow() : void
      {
         _window.center();
         _window.setVisibleChildren(false,["achieved_left","achieved_mid","achieved_right"]);
      }
      
      public function close() : void
      {
         if(_window)
         {
            _window.visible = false;
         }
      }
      
      private function onWindowClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            close();
         }
      }
      
      private function onResetButton(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            var_282.resetResolution(_stuffId);
            close();
         }
      }
   }
}
