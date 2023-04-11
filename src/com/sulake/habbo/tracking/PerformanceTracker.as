package com.sulake.habbo.tracking
{
   import com.sulake.core.utils.debug.GarbageMonitor;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   import package_49.class_203;
   
   public class PerformanceTracker
   {
       
      
      private var var_1186:int = 0;
      
      private var var_1989:Number = 0;
      
      private var var_2929:String = "";
      
      private var _flashVersion:String = "";
      
      private var var_1319:String = "";
      
      private var var_4312:String = "";
      
      private var var_4117:Boolean = false;
      
      private var var_3494:GarbageMonitor = null;
      
      private var var_3123:int = 0;
      
      private var var_3018:int = 0;
      
      private var var_3402:int = 0;
      
      private var var_3224:int = 0;
      
      private var var_3797:Number = 0;
      
      private var _habboTracking:com.sulake.habbo.tracking.HabboTracking;
      
      public function PerformanceTracker(param1:com.sulake.habbo.tracking.HabboTracking)
      {
         super();
         _habboTracking = param1;
         _flashVersion = Capabilities.version;
         var_1319 = Capabilities.os;
         var_4117 = Capabilities.isDebugger;
         try
         {
            var_2929 = ExternalInterface.available ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         }
         catch(e:Error)
         {
         }
         if(var_2929 == null)
         {
            var_2929 = "unknown";
         }
         var_3494 = new GarbageMonitor();
         updateGarbageMonitor();
         var_3402 = getTimer();
      }
      
      private static function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc4_:* = param1;
         var _loc3_:* = param2;
         if(param2 > param1)
         {
            _loc4_ = param2;
            _loc3_ = param1;
         }
         return 100 * (1 - _loc3_ / _loc4_);
      }
      
      public function get flashVersion() : String
      {
         return _flashVersion;
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_1989;
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:Object = null;
         var _loc1_:Array = var_3494.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_3494.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function update(param1:uint, param2:int) : void
      {
         var _loc7_:Object = null;
         var _loc3_:Number = NaN;
         var _loc4_:* = 0;
         var _loc6_:Boolean = false;
         var _loc5_:Number = NaN;
         if(isGarbageMonitored)
         {
            if((_loc7_ = updateGarbageMonitor()) != null)
            {
               var_3123++;
               class_14.log("Garbage collection");
            }
         }
         var _loc8_:Boolean = false;
         if(param1 > slowUpdateLimit)
         {
            var_3018++;
            _loc8_ = true;
         }
         else
         {
            var_1186++;
            if(var_1186 <= 1)
            {
               var_1989 = param1;
            }
            else
            {
               _loc3_ = var_1186;
               var_1989 = var_1989 * (_loc3_ - 1) / _loc3_ + param1 / _loc3_;
            }
         }
         if(param2 - var_3402 > reportInterval * 1000 && var_3224 < reportLimit)
         {
            _loc4_ = 0;
            class_14.log("*** Performance tracker: average frame rate " + 1000 / var_1989 + "/s, system memory usage : " + _loc4_ + " bytes");
            _loc6_ = true;
            if(useDistribution && var_3224 > 0)
            {
               if((_loc5_ = differenceInPercents(var_3797,var_1989)) < meanDevianceLimit)
               {
                  _loc6_ = false;
               }
            }
            var_3402 = param2;
            if(_loc6_ || _loc8_)
            {
               var_3797 = var_1989;
               sendReport(param2);
               var_3224++;
            }
         }
      }
      
      private function sendReport(param1:int) : void
      {
         var _loc4_:int = param1 / 1000;
         var _loc2_:int = 0;
         _habboTracking.send(new class_203(_loc4_,var_2929,_flashVersion,var_1319,var_4312,var_4117,_loc2_,-1,var_3123,var_1989,var_3018));
         var_3123 = 0;
         var_1989 = 0;
         var_1186 = 0;
         var_3018 = 0;
      }
      
      private function get isGarbageMonitored() : Boolean
      {
         return _habboTracking.getBoolean("monitor.garbage.collection");
      }
      
      private function get slowUpdateLimit() : int
      {
         return _habboTracking.getInteger("performancetest.slowupdatelimit",1000);
      }
      
      private function get reportInterval() : int
      {
         return _habboTracking.getInteger("performancetest.interval",60);
      }
      
      private function get reportLimit() : int
      {
         return _habboTracking.getInteger("performancetest.reportlimit",10);
      }
      
      private function get meanDevianceLimit() : Number
      {
         return _habboTracking.propertyExists("performancetest.distribution.deviancelimit.percent") ? Number(_habboTracking.getProperty("performancetest.distribution.deviancelimit.percent")) : 10;
      }
      
      private function get useDistribution() : Boolean
      {
         return _habboTracking.getBoolean("performancetest.distribution.enabled");
      }
   }
}
