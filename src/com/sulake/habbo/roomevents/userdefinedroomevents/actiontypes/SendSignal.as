package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   
   public class SendSignal extends DefaultActionType
   {
       
      
      public function SendSignal()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3520.SEND_SIGNAL;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID;
      }
   }
}
