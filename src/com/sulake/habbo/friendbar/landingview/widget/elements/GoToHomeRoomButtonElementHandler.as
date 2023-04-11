package com.sulake.habbo.friendbar.landingview.widget.elements
{
   public class GoToHomeRoomButtonElementHandler extends class_3529
   {
       
      
      public function GoToHomeRoomButtonElementHandler()
      {
         super();
      }
      
      override protected function onClick() : void
      {
         landingView.questEngine.reenableRoomCompetitionWindow();
         landingView.navigator.goToHomeRoom();
         landingView.tracking.trackGoogle("landingView","click_gotohomeroom");
      }
   }
}
