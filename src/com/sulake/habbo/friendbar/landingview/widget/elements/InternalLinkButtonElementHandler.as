package com.sulake.habbo.friendbar.landingview.widget.elements
{
   import com.sulake.core.window.class_3127;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
   
   public class InternalLinkButtonElementHandler extends class_3529
   {
       
      
      private var var_365:String;
      
      private var var_3250:String;
      
      public function InternalLinkButtonElementHandler()
      {
         super();
      }
      
      override public function initialize(param1:HabboLandingView, param2:class_3127, param3:Array, param4:GenericWidget) : void
      {
         super.initialize(param1,param2,param3,param4);
         var_365 = param3[2];
         var_3250 = param4.configurationCode;
      }
      
      override protected function onClick() : void
      {
         landingView.context.createLinkEvent(var_365);
         landingView.tracking.trackEventLog("LandingView",var_3250,"client_link",var_365);
      }
   }
}
