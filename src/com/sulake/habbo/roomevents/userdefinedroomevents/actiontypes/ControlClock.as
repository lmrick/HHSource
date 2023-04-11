package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import package_79.class_1554;
   
   public class ControlClock extends DefaultActionType
   {
       
      
      public function ControlClock()
      {
         super();
      }
      
      private static function getClockControlRadio(param1:class_3151, param2:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName("clock_control_" + param2 + "_radio"));
      }
      
      private static function getClockControlSelector(param1:class_3151) : ISelectorWindow
      {
         return ISelectorWindow(param1.findChildByName("clock_control_selector"));
      }
      
      override public function get code() : int
      {
         return class_3520.CONTROL_CLOCK;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID_BY_TYPE_OR_FROM_CONTEXT;
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var _loc3_:int = int(param2.intParams[0]);
         getClockControlSelector(param1).setSelected(getClockControlRadio(param1,_loc3_));
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(getClockControlSelector(param1).getSelected().id);
         return _loc2_;
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
   }
}
