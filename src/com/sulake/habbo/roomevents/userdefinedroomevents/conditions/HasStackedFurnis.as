package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import package_79.class_1554;
   
   public class HasStackedFurnis extends DefaultConditionType
   {
       
      
      public function HasStackedFurnis()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3523.HAS_STACKED_FURNIS;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID;
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(getEvalSelector(param1).getSelected().id);
         return _loc2_;
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var _loc3_:int = int(param2.intParams[0]);
         getEvalSelector(param1).setSelected(getEvalRadio(param1,_loc3_));
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      private function getEvalRadio(param1:class_3151, param2:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName("eval_" + param2 + "_radio"));
      }
      
      private function getEvalSelector(param1:class_3151) : ISelectorWindow
      {
         return ISelectorWindow(param1.findChildByName("eval_selector"));
      }
   }
}
