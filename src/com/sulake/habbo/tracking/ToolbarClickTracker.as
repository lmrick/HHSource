package com.sulake.habbo.tracking
{
   public class ToolbarClickTracker
   {
       
      
      private var _tracking:com.sulake.habbo.tracking.HabboTracking;
      
      private var var_3501:int = 0;
      
      public function ToolbarClickTracker(param1:com.sulake.habbo.tracking.HabboTracking)
      {
         super();
         _tracking = param1;
      }
      
      public function track(param1:String) : void
      {
         if(!_tracking.getBoolean("toolbar.tracking.enabled"))
         {
            return;
         }
         var_3501++;
         if(var_3501 <= _tracking.getInteger("toolbar.tracking.max.events",100))
         {
            _tracking.trackGoogle("toolbar",param1);
         }
      }
   }
}
