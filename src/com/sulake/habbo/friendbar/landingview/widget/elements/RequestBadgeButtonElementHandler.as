package com.sulake.habbo.friendbar.landingview.widget.elements
{
   import com.sulake.core.window.class_3127;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.interfaces.elements.class_3526;
   import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
   import package_104.class_647;
   import package_79.class_459;
   import package_88.class_423;
   
   public class RequestBadgeButtonElementHandler extends class_3529 implements class_3526
   {
       
      
      private var var_2784:String;
      
      private var var_4024:Boolean = true;
      
      public function RequestBadgeButtonElementHandler()
      {
         super();
      }
      
      override public function initialize(param1:HabboLandingView, param2:class_3127, param3:Array, param4:GenericWidget) : void
      {
         super.initialize(param1,param2,param3,param4);
         var_2784 = param3[2];
         param2.x = int(param3[3]);
         param2.y = int(param3[4]);
         if(param3.length > 5)
         {
            var_4024 = param3[5] == "true";
         }
         param1.communicationManager.addHabboConnectionMessageEvent(new class_647(onInfo));
         param1.communicationManager.addHabboConnectionMessageEvent(new class_459(onReward));
      }
      
      override protected function onClick() : void
      {
         landingView.requestBadge(var_2784);
         landingView.tracking.trackGoogle("landingView","click_requestbadge_" + var_2784);
      }
      
      override public function refresh() : void
      {
         super.refresh();
         landingView.send(new class_423(var_2784));
      }
      
      public function isFloating(param1:Boolean) : Boolean
      {
         return var_4024;
      }
      
      private function onInfo(param1:class_647) : void
      {
         if(param1.getParser().requestCode == var_2784)
         {
            window.visible = !param1.getParser().fulfilled;
         }
      }
      
      private function onReward(param1:class_459) : void
      {
         if(window)
         {
            landingView.send(new class_423(var_2784));
         }
      }
   }
}
