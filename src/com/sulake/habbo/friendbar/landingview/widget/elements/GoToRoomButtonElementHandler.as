package com.sulake.habbo.friendbar.landingview.widget.elements
{
   import com.sulake.core.window.class_3127;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
   
   public class GoToRoomButtonElementHandler extends class_3529
   {
       
      
      private var var_354:int;
      
      public function GoToRoomButtonElementHandler()
      {
         super();
      }
      
      override public function initialize(param1:HabboLandingView, param2:class_3127, param3:Array, param4:GenericWidget) : void
      {
         super.initialize(param1,param2,param3,param4);
         var_354 = int(param3[2]);
      }
      
      override protected function onClick() : void
      {
         landingView.navigator.goToPrivateRoom(var_354);
         landingView.tracking.trackGoogle("landingView","click_gotoroom");
      }
   }
}
