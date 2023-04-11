package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   
   public class class_3485 extends DefaultTriggerConf
   {
       
      
      public function class_3485()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3431.RECEIVE_SIGNAL;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID;
      }
   }
}
