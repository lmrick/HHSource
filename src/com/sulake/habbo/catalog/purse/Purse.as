package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class Purse implements class_3160
   {
       
      
      private var var_4093:int = 0;
      
      private var var_3088:Dictionary;
      
      private var var_3478:int = 0;
      
      private var var_3677:int = 0;
      
      private var var_1296:Boolean = false;
      
      private var var_1265:int = 0;
      
      private var var_1159:int = 0;
      
      private var _isExpiring:Boolean = false;
      
      private var _minutesUntilExpiration:int = 0;
      
      private var var_1279:int;
      
      private var var_1633:int;
      
      public function Purse()
      {
         var_3088 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return var_4093;
      }
      
      public function set credits(param1:int) : void
      {
         var_1633 = getTimer();
         var_4093 = param1;
      }
      
      public function get clubDays() : int
      {
         return var_3478;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1633 = getTimer();
         var_3478 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_3677;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1633 = getTimer();
         var_3677 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return var_3478 > 0 || var_3677 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1296;
      }
      
      public function get isExpiring() : Boolean
      {
         return _isExpiring;
      }
      
      public function set isExpiring(param1:Boolean) : void
      {
         _isExpiring = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_1296 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return var_1265;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         var_1633 = getTimer();
         var_1265 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return var_1159;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         var_1633 = getTimer();
         var_1159 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return var_3088;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         var_1633 = getTimer();
         var_3088 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return var_3088[param1];
      }
      
      public function set minutesUntilExpiration(param1:int) : void
      {
         var_1633 = getTimer();
         _minutesUntilExpiration = param1;
      }
      
      public function get minutesUntilExpiration() : int
      {
         var _loc1_:int = (getTimer() - var_1633) / 60000;
         var _loc2_:int = _minutesUntilExpiration - _loc1_;
         return _loc2_ > 0 ? _loc2_ : 0;
      }
      
      public function set minutesSinceLastModified(param1:int) : void
      {
         var_1633 = getTimer();
         var_1279 = param1;
      }
      
      public function get minutesSinceLastModified() : int
      {
         return var_1279;
      }
      
      public function get lastUpdated() : int
      {
         return var_1633;
      }
   }
}
