package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   
   public class class_3460 extends DefaultConditionType
   {
       
      
      public function class_3460()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3523.STUFF_TYPE_MATCHES;
      }
      
      override public function get negativeCode() : int
      {
         return class_3523.NOT_STUFF_TYPE_MATCHES;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID_OR_BY_TYPE;
      }
   }
}
