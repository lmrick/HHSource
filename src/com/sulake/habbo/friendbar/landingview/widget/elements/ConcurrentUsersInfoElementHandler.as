package com.sulake.habbo.friendbar.landingview.widget.elements
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
   import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import package_52.class_210;
   import package_52.class_964;
   import package_83.class_789;
   
   public class ConcurrentUsersInfoElementHandler implements IElementHandler, class_13
   {
      
      private static const STATE_DISABLED:int = 0;
      
      private static const STATE_ACTIVE:int = 1;
      
      private static const STATE_REDEEM:int = 2;
      
      private static const STATE_REWARDED:int = 3;
      
      private static const UPDATE_INTERVAL_MS:int = 5000;
       
      
      private var _landingView:HabboLandingView;
      
      private var var_1429:GenericWidget;
      
      private var _localizationKey:String;
      
      private var var_159:int = -1;
      
      private var var_392:int = -1;
      
      private var var_493:int = -1;
      
      private var _window:class_3151;
      
      private var var_1581:Timer;
      
      private var var_311:Boolean = false;
      
      public function ConcurrentUsersInfoElementHandler()
      {
         super();
         var_1581 = new Timer(5000);
         var_1581.addEventListener("timer",onUpdateTimer);
      }
      
      private function onUpdateTimer(param1:TimerEvent) : void
      {
         if(_window == null || false || true)
         {
            return;
         }
         refresh();
      }
      
      public function dispose() : void
      {
         if(var_1581)
         {
            var_1581.stop();
         }
         var_1581 = null;
         var_311 = true;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function initialize(param1:HabboLandingView, param2:class_3127, param3:Array, param4:GenericWidget) : void
      {
         var_1429 = param4;
         _landingView = param1;
         _window = param2 as class_3151;
         _localizationKey = param3[1];
         _window.findChildByName("users_desc").caption = "${" + _localizationKey + "}";
         var _loc5_:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(_window.findChildByName("badge_image"));
         var _loc6_:String = String(param3.length > 2 ? param3[2] : "ConcurrentUsersReward");
         var _loc7_:String = "${image.library.url}album1584/" + _loc6_ + ".png";
         _loc5_.assetUri = _loc7_;
         updateLocalization();
         param2.procedure = onButton;
         param1.communicationManager.addHabboConnectionMessageEvent(new class_789(onConcurrentUsersGoalProgress));
         var_1581.start();
      }
      
      public function refresh() : void
      {
         _landingView.send(new class_964());
      }
      
      private function updateLocalization() : void
      {
         var _loc4_:String = "landing.view.concurrentusers.caption";
         var _loc3_:String = "landing.view.concurrentusers.bodytext";
         _landingView.windowManager.registerLocalizationParameter(_localizationKey,"userCount",var_392.toString());
         _landingView.windowManager.registerLocalizationParameter(_localizationKey,"userGoal",var_493.toString());
         _landingView.windowManager.registerLocalizationParameter("landing.view.concurrentusers.bodytext","userCount",var_392.toString());
         _landingView.windowManager.registerLocalizationParameter("landing.view.concurrentusers.bodytext","userGoal",var_493.toString());
         _landingView.windowManager.registerLocalizationParameter("landing.view.concurrentusers.bodytext","domain",_landingView.localizationManager.getLocalization("landing.view.hotel.domain","Habbo"));
         switch(var_159)
         {
            case 0:
               _window.findChildByName("state.active").visible = true;
               _window.findChildByName("state.achieved").visible = false;
               break;
            case 1:
               _window.findChildByName("state.active").visible = true;
               _window.findChildByName("state.achieved").visible = false;
               break;
            case 2:
               if(var_1581)
               {
                  var_1581.stop();
               }
               _loc4_ += ".success";
               _loc3_ += ".success";
               _window.findChildByName("state.active").visible = false;
               _window.findChildByName("state.active").enable();
               _window.findChildByName("state.achieved").visible = true;
               _window.findChildByName("action_button").visible = true;
               break;
            case 3:
               if(var_1581)
               {
                  var_1581.stop();
               }
               _loc4_ += ".success";
               _loc3_ += ".success";
               _window.findChildByName("state.active").visible = false;
               _window.findChildByName("state.achieved").visible = true;
               _window.findChildByName("action_button").visible = false;
         }
         var _loc1_:class_3527 = var_1429.getElementByName("bodytext") as class_3527;
         if(_loc1_)
         {
            _loc1_.localizationKey = _loc3_;
         }
         var _loc2_:class_3527 = var_1429.getElementByName("caption") as class_3527;
         if(_loc2_)
         {
            _loc2_.localizationKey = _loc4_;
         }
      }
      
      private function onConcurrentUsersGoalProgress(param1:class_789) : void
      {
         var_159 = param1.getParser().state;
         var_392 = param1.getParser().userCount;
         var_493 = param1.getParser().userCountGoal;
         updateLocalization();
      }
      
      private function onButton(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            onClick();
         }
      }
      
      protected function onClick() : void
      {
         _landingView.send(new class_210());
         _landingView.send(new class_964());
         _window.findChildByName("state.active").disable();
      }
   }
}
