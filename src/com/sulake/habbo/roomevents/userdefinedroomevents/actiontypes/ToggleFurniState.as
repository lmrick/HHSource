package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import package_79.class_1554;
   
   public class ToggleFurniState extends DefaultActionType
   {
       
      
      private var _cont:class_3151;
      
      public function ToggleFurniState()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3520.TOGGLE_FURNI_STATE;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID_BY_TYPE_OR_FROM_CONTEXT;
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         _cont = param1;
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var _loc3_:int = int(param2.intParams[0]);
         getToggleTypeSelector().setSelected(getToggleTypeRadio(_loc3_));
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(getToggleTypeSelector().getSelected().id);
         return _loc2_;
      }
      
      private function getToggleTypeRadio(param1:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(_cont.findChildByName("toggletype_" + param1 + "_radio"));
      }
      
      private function getToggleTypeSelector() : ISelectorWindow
      {
         return ISelectorWindow(_cont.findChildByName("toggletype_selector"));
      }
   }
}
