package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import package_79.class_1554;
   
   public class class_3423 extends DefaultConditionType
   {
       
      
      private var _cont:class_3151;
      
      public function class_3423()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3523.TEAM_IS_WINNING;
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         _cont = param1;
         var _loc4_:int = int(param2.intParams[0]);
         var _loc3_:int = int(param2.intParams[1]);
         getTeamSelector().setSelected(getTeamRadio(_loc4_));
         getPlacementSelector().setSelected(getPlacementRadio(_loc3_));
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(getTeamSelector().getSelected().id);
         _loc2_.push(getPlacementSelector().getSelected().id);
         return _loc2_;
      }
      
      private function getTeamRadio(param1:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(_cont.findChildByName("team_" + param1 + "_radio"));
      }
      
      private function getTeamSelector() : ISelectorWindow
      {
         return ISelectorWindow(_cont.findChildByName("team_selector"));
      }
      
      private function getPlacementRadio(param1:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(_cont.findChildByName("placement_" + param1 + "_radio"));
      }
      
      private function getPlacementSelector() : ISelectorWindow
      {
         return ISelectorWindow(_cont.findChildByName("placement_selector"));
      }
   }
}
