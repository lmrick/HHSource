package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   public class LeaveTeam extends DefaultActionType
   {
       
      
      public function LeaveTeam()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3520.LEAVE_TEAM;
      }
   }
}
