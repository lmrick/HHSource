package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   public class UnFreezeUser extends DefaultActionType
   {
       
      
      public function UnFreezeUser()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3520.UNFREEZE_USER;
      }
   }
}
