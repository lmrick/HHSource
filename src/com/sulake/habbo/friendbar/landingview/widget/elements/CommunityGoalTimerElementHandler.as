package com.sulake.habbo.friendbar.landingview.widget.elements
{
   import com.sulake.core.window.class_3127;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
   import package_52.class_753;
   import package_83.class_1571;
   import package_83.class_513;
   
   public class CommunityGoalTimerElementHandler extends class_3536
   {
       
      
      public function CommunityGoalTimerElementHandler()
      {
         super();
      }
      
      override public function initialize(param1:HabboLandingView, param2:class_3127, param3:Array, param4:GenericWidget) : void
      {
         super.initialize(param1,param2,param3,param4);
         param1.communicationManager.addHabboConnectionMessageEvent(new class_513(onCommunityGoalProgress));
      }
      
      override public function refresh() : void
      {
         landingView.send(new class_753());
      }
      
      private function onCommunityGoalProgress(param1:class_513) : void
      {
         var _loc2_:class_1571 = param1.getParser().data;
         setTimer(_loc2_.hasGoalExpired ? 0 : _loc2_.timeRemainingInSeconds);
      }
   }
}
