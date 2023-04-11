package com.sulake.habbo.friendbar.landingview.widget.elements
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
   import com.sulake.habbo.friendbar.landingview.interfaces.elements.ILayoutNameProvider;
   import com.sulake.habbo.friendbar.landingview.interfaces.elements.class_3524;
   import com.sulake.habbo.friendbar.landingview.interfaces.elements.class_3526;
   import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
   import com.sulake.habbo.window.widgets.IRunningNumberWidget;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import package_52.class_753;
   import package_83.class_1571;
   import package_83.class_513;
   
   public class CommunityGoalScoreCounterElementHandler implements IElementHandler, class_13, class_3526, ILayoutNameProvider, class_3524
   {
       
      
      private var _landingView:HabboLandingView;
      
      private var _window:class_3151;
      
      private var var_3514:Boolean;
      
      private var var_2230:Timer;
      
      private var var_3305:Boolean;
      
      public function CommunityGoalScoreCounterElementHandler()
      {
         super();
      }
      
      public function dispose() : void
      {
         if(_landingView)
         {
            _landingView.communicationManager.removeHabboConnectionMessageEvent(new class_513(onCommunityGoalProgress));
            _landingView = null;
         }
         if(var_2230)
         {
            var_2230.stop();
            var_2230.removeEventListener("timer",onPollTimer);
            var_2230 = null;
         }
         _window = null;
      }
      
      public function get disposed() : Boolean
      {
         return _landingView == null;
      }
      
      public function initialize(param1:HabboLandingView, param2:class_3127, param3:Array, param4:GenericWidget) : void
      {
         _landingView = param1;
         _window = class_3151(param2);
         var _loc7_:int = int(param3[1]);
         var _loc6_:int = int(param3[2]);
         var _loc8_:int = int(param3[3]);
         var_3514 = param3[4] == "true";
         var _loc5_:class_3217 = class_3217(_window.findChildByName("running_number_widget"));
         var _loc9_:IRunningNumberWidget;
         (_loc9_ = IRunningNumberWidget(_loc5_.widget)).digits = _loc7_;
         _loc9_.updateFrequency = _loc6_;
         if(var_3514)
         {
            _window.x = int(param3[5]);
            _window.y = int(param3[6]);
         }
         _landingView.communicationManager.addHabboConnectionMessageEvent(new class_513(onCommunityGoalProgress));
         var_2230 = new Timer(_loc8_);
         var_2230.addEventListener("timer",onPollTimer);
      }
      
      public function disable() : void
      {
         var_2230.stop();
      }
      
      public function refresh() : void
      {
         _landingView.send(new class_753());
         var_3305 = false;
         var_2230.start();
      }
      
      public function isFloating(param1:Boolean) : Boolean
      {
         return var_3514;
      }
      
      public function get layoutName() : String
      {
         return "element_community_goal_score";
      }
      
      private function onCommunityGoalProgress(param1:class_513) : void
      {
         var _loc4_:class_1571 = null;
         var _loc2_:class_3217 = null;
         var _loc3_:IRunningNumberWidget = null;
         if(_landingView)
         {
            _loc4_ = param1.getParser().data;
            _loc2_ = class_3217(_window.findChildByName("running_number_widget"));
            _loc3_ = IRunningNumberWidget(_loc2_.widget);
            if(var_3305)
            {
               _loc3_.number = _loc4_.communityTotalScore;
            }
            else
            {
               _loc3_.initialNumber = _loc4_.communityTotalScore;
               var_3305 = true;
            }
         }
      }
      
      private function onPollTimer(param1:TimerEvent) : void
      {
         _landingView.send(new class_753());
      }
   }
}
