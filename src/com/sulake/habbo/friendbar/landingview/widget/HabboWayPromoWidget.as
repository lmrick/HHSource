package com.sulake.habbo.friendbar.landingview.widget
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
   import package_52.class_753;
   import package_83.class_513;
   
   public class HabboWayPromoWidget implements ILandingViewWidget
   {
       
      
      private var _landingView:HabboLandingView;
      
      private var _container:class_3151;
      
      private var var_4073:int;
      
      public function HabboWayPromoWidget(param1:HabboLandingView)
      {
         super();
         _landingView = param1;
      }
      
      public function get container() : class_3127
      {
         return _container;
      }
      
      public function dispose() : void
      {
         _landingView = null;
         _container = null;
      }
      
      public function initialize() : void
      {
         _container = class_3151(_landingView.getXmlWindow("habbo_way_promo"));
         _container.findChildByName("go_button").procedure = onGoButton;
         _landingView.communicationManager.addHabboConnectionMessageEvent(new class_513(onCommunityGoalProgress));
      }
      
      public function refresh() : void
      {
         _landingView.send(new class_753());
         refreshContent();
      }
      
      public function get disposed() : Boolean
      {
         return _landingView == null;
      }
      
      private function onGoButton(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _landingView.habboHelp.showHabboWay();
         }
      }
      
      private function onCommunityGoalProgress(param1:class_513) : void
      {
         var_4073 = param1.getParser().data.communityTotalScore;
         refreshContent();
      }
      
      private function refreshContent() : void
      {
         var _loc1_:String = "" + var_4073;
         while(_loc1_.length < 8)
         {
            _loc1_ = "0" + _loc1_;
         }
         _container.findChildByName("counter_txt").caption = _loc1_;
      }
   }
}
