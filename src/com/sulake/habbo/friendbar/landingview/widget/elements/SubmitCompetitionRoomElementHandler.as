package com.sulake.habbo.friendbar.landingview.widget.elements
{
   import com.sulake.core.window.class_3127;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
   import package_3.class_120;
   import package_3.class_442;
   import package_73.class_623;
   
   public class SubmitCompetitionRoomElementHandler extends class_3529
   {
       
      
      private var _submittedKey:String;
      
      private var var_822:String;
      
      private var var_1267:Boolean;
      
      private var var_882:int;
      
      public function SubmitCompetitionRoomElementHandler()
      {
         super();
      }
      
      override public function initialize(param1:HabboLandingView, param2:class_3127, param3:Array, param4:GenericWidget) : void
      {
         super.initialize(param1,param2,param3,param4);
         _submittedKey = param3[2];
         var_822 = param3[3];
         param1.communicationManager.addHabboConnectionMessageEvent(new class_623(onInfo));
      }
      
      override public function refresh() : void
      {
         super.refresh();
         landingView.send(new class_442(var_822));
      }
      
      override protected function onClick() : void
      {
         landingView.questEngine.reenableRoomCompetitionWindow();
         if(var_1267)
         {
            landingView.navigator.goToPrivateRoom(var_882);
            landingView.tracking.trackGoogle("landingView","click_submittedroom");
         }
         else
         {
            landingView.send(new class_120());
            landingView.tracking.trackGoogle("landingView","click_startsubmit");
         }
      }
      
      private function onInfo(param1:class_623) : void
      {
         var_1267 = param1.getParser().isPartOf;
         var_882 = param1.getParser().targetId;
         if(var_1267)
         {
            window.caption = "${" + _submittedKey + "}";
         }
      }
   }
}
