package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.utils.ChronoFieldMaskFilter;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.utils.ChronoFieldRangeFilter;
   import package_79.class_1554;
   
   public class class_3462 extends TimeBasedCondition
   {
       
      
      public function class_3462()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3523.DATE_MATCHES;
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         super.onEditStart(param1,param2);
         var _loc6_:int = int(param2.intParams[0]);
         var _loc4_:int = int(param2.intParams[1]);
         var _loc12_:int = int(param2.intParams[2]);
         var _loc10_:int = int(param2.intParams[3]);
         var _loc13_:int = int(param2.intParams[4]);
         var _loc9_:int = int(param2.intParams[5]);
         var _loc3_:int = int(param2.intParams[6]);
         var _loc11_:int = int(param2.intParams[7]);
         var _loc8_:ChronoFieldMaskFilter = new ChronoFieldMaskFilter("weekday",_loc12_,7);
         var _loc14_:ChronoFieldRangeFilter = new ChronoFieldRangeFilter("day",_loc6_,_loc10_,_loc13_,1);
         var _loc5_:ChronoFieldMaskFilter = new ChronoFieldMaskFilter("month",_loc9_,12);
         var _loc7_:ChronoFieldRangeFilter = new ChronoFieldRangeFilter("year",_loc4_,_loc3_,_loc11_);
         initializeMaskFilter(_loc8_);
         initializeRangeFilter(_loc14_);
         initializeMaskFilter(_loc5_);
         initializeRangeFilter(_loc7_);
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         var _loc6_:ChronoFieldMaskFilter = readMaskFilter("weekday",7);
         var _loc4_:ChronoFieldRangeFilter = readRangeFilter("day",1);
         var _loc3_:ChronoFieldMaskFilter = readMaskFilter("month",12);
         var _loc5_:ChronoFieldRangeFilter = readRangeFilter("year");
         _loc2_.push(_loc4_.useFilter ? 1 : 0);
         _loc2_.push(_loc5_.useFilter ? 1 : 0);
         _loc2_.push(_loc6_.mask);
         _loc2_.push(_loc4_.min);
         _loc2_.push(_loc4_.max);
         _loc2_.push(_loc3_.mask);
         _loc2_.push(_loc5_.min);
         _loc2_.push(_loc5_.max);
         return _loc2_;
      }
   }
}
