package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   
   public class class_3454 extends DefaultConditionType
   {
       
      
      public function class_3454()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3523.TRIGGERER_IS_ON_FURNI;
      }
      
      override public function get negativeCode() : int
      {
         return class_3523.NOT_TRIGGERER_IS_ON_FURNI;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID;
      }
   }
}
