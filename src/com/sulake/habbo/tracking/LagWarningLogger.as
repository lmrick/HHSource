package com.sulake.habbo.tracking
{
   import package_49.class_247;
   
   public class LagWarningLogger
   {
       
      
      private var var_1313:int;
      
      private var var_1062:int;
      
      private var _habboTracking:com.sulake.habbo.tracking.HabboTracking;
      
      public function LagWarningLogger(param1:com.sulake.habbo.tracking.HabboTracking)
      {
         super();
         _habboTracking = param1;
      }
      
      public function chatLagDetected(param1:int) : void
      {
         if(!enabled || warningInterval <= 0)
         {
            return;
         }
         var_1062++;
         reportWarningsAsNeeded(param1);
      }
      
      public function update(param1:int) : void
      {
         reportWarningsAsNeeded(param1);
      }
      
      private function reportWarningsAsNeeded(param1:int) : void
      {
         var _loc2_:class_247 = null;
         if(var_1062 == 0)
         {
            return;
         }
         if(var_1313 == 0 || param1 - var_1313 > warningInterval)
         {
            _loc2_ = new class_247(var_1062);
            _habboTracking.send(_loc2_);
            var_1313 = param1;
            var_1062 = 0;
         }
      }
      
      private function get enabled() : Boolean
      {
         return _habboTracking.getBoolean("lagWarningLog.enabled");
      }
      
      private function get warningInterval() : int
      {
         return _habboTracking.getInteger("lagWarningLog.interval.seconds",10) * 1000;
      }
   }
}
