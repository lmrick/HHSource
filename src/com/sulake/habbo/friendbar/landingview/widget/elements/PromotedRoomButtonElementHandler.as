package com.sulake.habbo.friendbar.landingview.widget.elements
{
   import com.sulake.core.window.class_3127;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
   
   public class PromotedRoomButtonElementHandler extends class_3529
   {
       
      
      private var var_3543:String;
      
      public function PromotedRoomButtonElementHandler()
      {
         super();
      }
      
      override protected function onClick() : void
      {
         landingView.goToRoom(var_3543);
         landingView.tracking.trackGoogle("landingView","click_promotedroom" + var_3543);
      }
      
      override public function initialize(param1:HabboLandingView, param2:class_3127, param3:Array, param4:GenericWidget) : void
      {
         super.initialize(param1,param2,param3,param4);
         if(param3.length > 1)
         {
            var_3543 = param3[2];
         }
      }
   }
}
