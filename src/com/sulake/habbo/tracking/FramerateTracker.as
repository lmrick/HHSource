package com.sulake.habbo.tracking
{
   public class FramerateTracker
   {
       
      
      private var var_3402:int;
      
      private var var_2280:int;
      
      private var var_1989:Number;
      
      private var var_3602:int;
      
      private var _habboTracking:com.sulake.habbo.tracking.HabboTracking;
      
      public function FramerateTracker(param1:com.sulake.habbo.tracking.HabboTracking)
      {
         super();
         _habboTracking = param1;
      }
      
      public function get frameRate() : int
      {
         return Math.round(1000 / var_1989);
      }
      
      public function trackUpdate(param1:uint, param2:int) : void
      {
         var _loc3_:Number = NaN;
         var_2280++;
         if(var_2280 == 1)
         {
            var_1989 = param1;
            var_3402 = param2;
         }
         else
         {
            _loc3_ = var_2280;
            var_1989 = var_1989 * (_loc3_ - 1) / _loc3_ + param1 / _loc3_;
         }
         if(param2 - var_3402 >= _habboTracking.getInteger("tracking.framerate.reportInterval.seconds",300) * 1000)
         {
            var_2280 = 0;
            if(var_3602 < _habboTracking.getInteger("tracking.framerate.maximumEvents",5))
            {
               _habboTracking.trackGoogle("performance","averageFramerate",frameRate);
               var_3602++;
               var_3402 = param2;
            }
         }
      }
   }
}
