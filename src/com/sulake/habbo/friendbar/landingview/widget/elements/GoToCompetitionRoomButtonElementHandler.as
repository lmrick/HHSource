package com.sulake.habbo.friendbar.landingview.widget.elements
{
   import com.sulake.core.window.class_3127;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
   import package_3.class_467;
   
   public class GoToCompetitionRoomButtonElementHandler extends class_3529
   {
       
      
      private var var_822:String;
      
      public function GoToCompetitionRoomButtonElementHandler()
      {
         super();
      }
      
      override public function initialize(param1:HabboLandingView, param2:class_3127, param3:Array, param4:GenericWidget) : void
      {
         super.initialize(param1,param2,param3,param4);
         var_822 = param3[2];
      }
      
      override protected function onClick() : void
      {
         landingView.questEngine.reenableRoomCompetitionWindow();
         landingView.send(new class_467(var_822));
         landingView.tracking.trackGoogle("landingView","click_gotocompetitionroom");
      }
   }
}
