package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   
   public class class_3450 extends DefaultTriggerConf
   {
       
      
      public function class_3450()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3431.var_4323;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID_OR_BY_TYPE;
      }
   }
}
