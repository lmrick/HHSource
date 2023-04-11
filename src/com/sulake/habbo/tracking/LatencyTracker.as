package com.sulake.habbo.tracking
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import flash.utils.getTimer;
   import package_115.class_837;
   import package_169.class_1227;
   import package_49.class_428;
   import package_49.class_475;
   
   public class LatencyTracker implements class_13
   {
       
      
      private var var_159:Boolean = false;
      
      private var var_3276:int = 0;
      
      private var var_3537:int = 0;
      
      private var var_3698:int = 0;
      
      private var var_4187:int = 0;
      
      private var _lastTestTime:int = 0;
      
      private var var_3512:int = 0;
      
      private var var_1645:Array;
      
      private var var_2232:class_24;
      
      private var _habboTracking:com.sulake.habbo.tracking.HabboTracking;
      
      public function LatencyTracker(param1:com.sulake.habbo.tracking.HabboTracking)
      {
         super();
         _habboTracking = param1;
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         var_159 = false;
         if(var_2232 != null)
         {
            var_2232.dispose();
            var_2232 = null;
         }
         var_1645 = null;
         _habboTracking = null;
      }
      
      public function init() : void
      {
         var_3537 = _habboTracking.getInteger("latencytest.interval",20000);
         var_3698 = _habboTracking.getInteger("latencytest.report.index",100);
         var_4187 = _habboTracking.getInteger("latencytest.report.delta",3);
         if(var_3537 < 1)
         {
            return;
         }
         var_2232 = new class_24();
         var_1645 = [];
         var_159 = true;
      }
      
      public function update(param1:uint, param2:int) : void
      {
         if(!var_159)
         {
            return;
         }
         if(param2 - _lastTestTime > var_3537)
         {
            testLatency();
         }
      }
      
      private function testLatency() : void
      {
         _lastTestTime = getTimer();
         var_2232.add(var_3276,_lastTestTime);
         _habboTracking.send(new class_428(var_3276));
         var_3276++;
      }
      
      public function onPingResponse(param1:class_837) : void
      {
         var _loc7_:int = 0;
         var _loc2_:int = 0;
         var _loc10_:int = 0;
         var _loc8_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var _loc11_:class_475 = null;
         if(var_2232 == null || var_1645 == null)
         {
            return;
         }
         var _loc4_:class_1227 = param1.getParser();
         var _loc9_:int = var_2232.getValue(_loc4_.requestId);
         var_2232.remove(_loc4_.requestId);
         var _loc6_:int = getTimer() - _loc9_;
         var_1645.push(_loc6_);
         if(var_1645.length == var_3698 && var_3698 > 0)
         {
            _loc7_ = 0;
            _loc2_ = 0;
            _loc10_ = 0;
            _loc8_ = 0;
            while(_loc8_ < var_1645.length)
            {
               _loc7_ += var_1645[_loc8_];
               _loc8_++;
            }
            _loc5_ = _loc7_ / 0;
            _loc8_ = 0;
            while(_loc8_ < var_1645.length)
            {
               if(var_1645[_loc8_] < _loc5_ * 2)
               {
                  _loc2_ += var_1645[_loc8_];
                  _loc10_++;
               }
               _loc8_++;
            }
            if(_loc10_ == 0)
            {
               var_1645 = [];
               return;
            }
            _loc3_ = _loc2_ / _loc10_;
            if(Math.abs(_loc5_ - var_3512) > var_4187 || var_3512 == 0)
            {
               var_3512 = _loc5_;
               _loc11_ = new class_475(_loc5_,_loc3_,var_1645.length);
               _habboTracking.send(_loc11_);
            }
            var_1645 = [];
         }
      }
      
      public function get disposed() : Boolean
      {
         return _habboTracking == null;
      }
   }
}
