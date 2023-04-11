package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   
   public class AvatarWalksOnFurni extends DefaultTriggerConf
   {
       
      
      public function AvatarWalksOnFurni()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3431.AVATAR_CLICKS_FURNI;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID_OR_BY_TYPE;
      }
   }
}
