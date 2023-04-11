package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   
   public class CallAnotherStack extends DefaultActionType
   {
       
      
      public function CallAnotherStack()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3520.CALL_ANOTHER_STACK;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID;
      }
   }
}
