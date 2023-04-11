package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.utils.ChronoFieldRangeFilter;
   import package_79.class_1554;
   
   public class class_3490 extends TimeBasedCondition
   {
      
      private static var SECONDS_CONTAINER_NAME:String = "second";
      
      private static var MINUTES_CONTAINER_NAME:String = "minute";
      
      private static var HOURS_CONTAINER_NAME:String = "hour";
       
      
      public function class_3490()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3523.TIME_MATCHES;
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         super.onEditStart(param1,param2);
         var _loc12_:int = int(param2.intParams[0]);
         var _loc11_:int = int(param2.intParams[1]);
         var _loc3_:int = int(param2.intParams[2]);
         var _loc8_:int = int(param2.intParams[3]);
         var _loc13_:int = int(param2.intParams[4]);
         var _loc5_:int = int(param2.intParams[5]);
         var _loc7_:int = int(param2.intParams[6]);
         var _loc9_:int = int(param2.intParams[7]);
         var _loc6_:int = int(param2.intParams[8]);
         var _loc10_:ChronoFieldRangeFilter = new ChronoFieldRangeFilter(SECONDS_CONTAINER_NAME,_loc12_,_loc8_,_loc13_);
         var _loc14_:ChronoFieldRangeFilter = new ChronoFieldRangeFilter(MINUTES_CONTAINER_NAME,_loc11_,_loc5_,_loc7_);
         var _loc4_:ChronoFieldRangeFilter = new ChronoFieldRangeFilter(HOURS_CONTAINER_NAME,_loc3_,_loc9_,_loc6_);
         initializeRangeFilter(_loc10_);
         initializeRangeFilter(_loc14_);
         initializeRangeFilter(_loc4_);
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         var _loc4_:ChronoFieldRangeFilter = readRangeFilter(SECONDS_CONTAINER_NAME);
         var _loc5_:ChronoFieldRangeFilter = readRangeFilter(MINUTES_CONTAINER_NAME);
         var _loc3_:ChronoFieldRangeFilter = readRangeFilter(HOURS_CONTAINER_NAME);
         _loc2_.push(_loc4_.useFilter ? 1 : 0);
         _loc2_.push(_loc5_.useFilter ? 1 : 0);
         _loc2_.push(_loc3_.useFilter ? 1 : 0);
         _loc2_.push(_loc4_.min);
         _loc2_.push(_loc4_.max);
         _loc2_.push(_loc5_.min);
         _loc2_.push(_loc5_.max);
         _loc2_.push(_loc3_.min);
         _loc2_.push(_loc3_.max);
         return _loc2_;
      }
   }
}
