package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.widgets.class_3366;
   
   public class AchievementResolutionCompletedView implements class_13
   {
      
      private static const const_563:String = "header_button_close";
      
      private static const const_813:String = "cancel_button";
       
      
      private var var_282:com.sulake.habbo.quest.AchievementsResolutionController;
      
      private var _window:class_3281;
      
      private var var_331:String;
      
      private var var_414:String;
      
      public function AchievementResolutionCompletedView(param1:com.sulake.habbo.quest.AchievementsResolutionController)
      {
         super();
         var_282 = param1;
      }
      
      public function dispose() : void
      {
         var_282 = null;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return var_282 != null;
      }
      
      public function get visible() : Boolean
      {
         if(!_window)
         {
            return false;
         }
         return _window.visible;
      }
      
      public function show(param1:String, param2:String) : void
      {
         if(_window == null)
         {
            createWindow();
         }
         initializeWindow();
         var_414 = param1;
         var_331 = param2;
         setBadge(var_331);
         _window.visible = true;
      }
      
      private function createWindow() : void
      {
         _window = class_3281(var_282.questEngine.getXmlWindow("AchievementResolutionCompleted"));
         addClickListener("header_button_close");
         addClickListener("cancel_button");
      }
      
      private function addClickListener(param1:String) : void
      {
         var _loc2_:class_3127 = _window.findChildByName(param1);
         if(_loc2_ != null)
         {
            _loc2_.addEventListener("WME_CLICK",onMouseClick);
         }
      }
      
      private function onMouseClick(param1:WindowMouseEvent) : void
      {
         switch(param1.target.name)
         {
            case "header_button_close":
            case "cancel_button":
               close();
         }
      }
      
      private function initializeWindow() : void
      {
         _window.center();
      }
      
      private function setBadge(param1:String) : void
      {
         var _loc3_:class_3217 = _window.findChildByName("achievement_badge") as class_3217;
         var _loc2_:class_3366 = _loc3_.widget as class_3366;
         IStaticBitmapWrapperWindow(class_3151(_loc3_.rootWindow).findChildByName("bitmap")).assetUri = "common_loading_icon";
         _loc2_.badgeId = param1;
         _loc3_.visible = true;
      }
      
      public function close() : void
      {
         if(_window)
         {
            _window.visible = false;
         }
      }
   }
}
