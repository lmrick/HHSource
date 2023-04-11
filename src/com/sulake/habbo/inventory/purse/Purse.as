package com.sulake.habbo.inventory.purse
{
   import flash.utils.getTimer;
   
   public class Purse
   {
       
      
      private var _isExpiring:Boolean = false;
      
      private var _isCitizenshipVipExpiring:Boolean = false;
      
      private var var_3478:int = 0;
      
      private var var_3677:int = 0;
      
      private var var_3947:int = 0;
      
      private var var_3992:Boolean = false;
      
      private var var_1296:Boolean = false;
      
      private var _minutesUntilExpiration:int = 0;
      
      private var var_1279:int = -1;
      
      private var var_1633:int;
      
      public function Purse()
      {
         super();
      }
      
      public function get clubDays() : int
      {
         return var_3478;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1633 = getTimer();
         var_3478 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_3677;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1633 = getTimer();
         var_3677 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_3947;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_1633 = getTimer();
         var_3947 = Math.max(0,param1);
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_3992;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_1633 = getTimer();
         var_3992 = param1;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1296;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_1633 = getTimer();
         var_1296 = param1;
      }
      
      public function get minutesUntilExpiration() : int
      {
         var _loc1_:int = (getTimer() - var_1633) / 60000;
         var _loc2_:int = _minutesUntilExpiration - _loc1_;
         return _loc2_ > 0 ? _loc2_ : 0;
      }
      
      public function set minutesUntilExpiration(param1:int) : void
      {
         var_1633 = getTimer();
         _minutesUntilExpiration = param1;
      }
      
      public function get clubIsExpiring() : Boolean
      {
         return _isExpiring;
      }
      
      public function set clubIsExpiring(param1:Boolean) : void
      {
         _isExpiring = param1;
      }
      
      public function get citizenshipVipIsExpiring() : Boolean
      {
         return _isCitizenshipVipExpiring;
      }
      
      public function set citizenshipVipIsExpiring(param1:Boolean) : void
      {
         _isCitizenshipVipExpiring = param1;
      }
      
      public function get minutesSinceLastModified() : int
      {
         return var_1279;
      }
      
      public function set minutesSinceLastModified(param1:int) : void
      {
         var_1633 = getTimer();
         var_1279 = param1;
      }
   }
}
