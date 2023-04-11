package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   
   public class ToggleToRandomState extends DefaultActionType
   {
       
      
      public function ToggleToRandomState()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3520.TOGGLE_TO_RANDOM_STATE;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID_BY_TYPE_OR_FROM_CONTEXT;
      }
   }
}
