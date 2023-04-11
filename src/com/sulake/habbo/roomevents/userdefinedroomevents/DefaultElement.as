package com.sulake.habbo.roomevents.userdefinedroomevents
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import package_5.class_564;
   import package_79.class_1554;
   
   public class DefaultElement implements class_3304
   {
       
      
      public function DefaultElement()
      {
         super();
      }
      
      public function get code() : int
      {
         return -1;
      }
      
      public function get negativeCode() : int
      {
         return -1;
      }
      
      public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_NONE;
      }
      
      public function get hasStateSnapshot() : Boolean
      {
         return false;
      }
      
      public function readIntParamsFromForm(param1:class_3151) : Array
      {
         return [];
      }
      
      public function readStringParamFromForm(param1:class_3151) : String
      {
         return "";
      }
      
      public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
      }
      
      public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
      }
      
      public function get hasSpecialInputs() : Boolean
      {
         return false;
      }
      
      public function validate(param1:class_3151, param2:HabboUserDefinedRoomEvents) : String
      {
         return null;
      }
      
      public function onGuildMemberships(param1:class_564) : void
      {
      }
   }
}
