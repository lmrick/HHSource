package com.sulake.habbo.friendbar.landingview.widget.elements
{
   import com.sulake.core.window.class_3127;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
   import package_3.class_176;
   import package_73.class_508;
   
   public class CustomTimerElementHandler extends class_3536
   {
       
      
      private var var_1150:String;
      
      public function CustomTimerElementHandler()
      {
         super();
      }
      
      override public function initialize(param1:HabboLandingView, param2:class_3127, param3:Array, param4:GenericWidget) : void
      {
         super.initialize(param1,param2,param3,param4);
         var_1150 = param3[6];
         param1.communicationManager.addHabboConnectionMessageEvent(new class_508(onTime));
      }
      
      override public function refresh() : void
      {
         landingView.send(new class_176(var_1150));
      }
      
      private function onTime(param1:class_508) : void
      {
         if(param1.getParser().timeStr == var_1150)
         {
            setTimer(param1.getParser().secondsUntil);
         }
      }
   }
}
