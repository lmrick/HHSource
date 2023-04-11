package com.sulake.habbo.friendbar.landingview.widget.elements
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
   import com.sulake.habbo.friendbar.landingview.interfaces.elements.class_3526;
   import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
   import package_83.class_789;
   
   public class ConcurrentUsersMeterElementHandler implements IElementHandler, class_3526
   {
       
      
      private var var_973:IStaticBitmapWrapperWindow;
      
      private var var_159:int;
      
      private var var_392:int;
      
      private var var_493:int;
      
      public function ConcurrentUsersMeterElementHandler()
      {
         super();
      }
      
      public function initialize(param1:HabboLandingView, param2:class_3127, param3:Array, param4:GenericWidget) : void
      {
         var_973 = IStaticBitmapWrapperWindow(param2);
         var _loc5_:String = String(param3[1]);
         var_973.assetUri = _loc5_;
         var_973.x = param3.length > 2 ? int(param3[2]) : 0;
         var_973.y = param3.length > 3 ? int(param3[3]) : 0;
         class_14.log("Init Concurrent users meter: " + _loc5_);
         param1.communicationManager.addHabboConnectionMessageEvent(new class_789(onConcurrentUsersGoalProgress));
      }
      
      public function refresh() : void
      {
      }
      
      public function isFloating(param1:Boolean) : Boolean
      {
         return true;
      }
      
      private function onConcurrentUsersGoalProgress(param1:class_789) : void
      {
         var_159 = param1.getParser().state;
         var_392 = param1.getParser().userCount;
         var_493 = param1.getParser().userCountGoal;
         var _loc3_:int = var_392 / var_493 * 100;
         _loc3_ = Math.max(20,Math.min(100,_loc3_));
         _loc3_ = Math.floor(_loc3_ / 10) * 10;
         var _loc2_:String = "challenge_meter_" + _loc3_;
         var_973.assetUri = "${image.library.url}reception/" + _loc2_ + ".png";
         class_14.log("Updating meter: " + _loc2_);
      }
   }
}
