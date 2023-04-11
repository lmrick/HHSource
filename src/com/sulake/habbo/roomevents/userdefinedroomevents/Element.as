package com.sulake.habbo.roomevents.userdefinedroomevents
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import package_5.class_564;
   import package_79.class_1554;
   
   public interface Element
   {
       
      
      function get code() : int;
      
      function get negativeCode() : int;
      
      function get requiresFurni() : int;
      
      function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void;
      
      function onEditStart(param1:class_3151, param2:class_1554) : void;
      
      function readIntParamsFromForm(param1:class_3151) : Array;
      
      function readStringParamFromForm(param1:class_3151) : String;
      
      function get hasSpecialInputs() : Boolean;
      
      function get hasStateSnapshot() : Boolean;
      
      function validate(param1:class_3151, param2:HabboUserDefinedRoomEvents) : String;
      
      function onGuildMemberships(param1:class_564) : void;
   }
}
