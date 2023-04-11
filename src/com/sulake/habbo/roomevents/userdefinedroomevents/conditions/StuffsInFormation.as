package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
   import flash.events.Event;
   import package_79.class_1554;
   
   public class StuffsInFormation extends DefaultConditionType
   {
       
      
      private var _roomEvents:HabboUserDefinedRoomEvents;
      
      private var var_2627:SliderWindowController;
      
      public function StuffsInFormation()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3523.STUFFS_IN_FORMATION;
      }
      
      override public function get negativeCode() : int
      {
         return class_3523.NOT_STUFFS_IN_FORMATION;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID;
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(int(var_2627.getValue()));
         _loc2_.push(getFormationSelector(param1).getSelected().id);
         return _loc2_;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         _roomEvents = param2;
         var_2627 = new SliderWindowController(param2,getInput(param1),param2.assets,2,10,1);
         var_2627.setValue(3);
         var_2627.addEventListener("change",onSliderChange);
         param2.refreshButton(param1,"move_diag",true,null,0);
         param2.refreshButton(param1,"move_vrt",true,null,0);
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var_2627.setValue(param2.intParams[0]);
         var _loc3_:int = int(param2.intParams[1]);
         getFormationSelector(param1).setSelected(getFormationRadio(param1,_loc3_));
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      private function getInput(param1:class_3151) : class_3151
      {
         return param1.findChildByName("slider_container") as class_3151;
      }
      
      private function onSliderChange(param1:Event) : void
      {
         var _loc2_:SliderWindowController = null;
         var _loc4_:Number = NaN;
         var _loc3_:int = 0;
         if(param1.type == "change")
         {
            _loc2_ = param1.target as SliderWindowController;
            if(_loc2_)
            {
               _loc3_ = _loc4_ = _loc2_.getValue();
               _roomEvents.localization.registerParameter("wiredfurni.params.requiredformationsize","furnis","" + _loc3_);
            }
         }
      }
      
      private function getFormationRadio(param1:class_3151, param2:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName("formation_" + param2 + "_radio"));
      }
      
      private function getFormationSelector(param1:class_3151) : ISelectorWindow
      {
         return ISelectorWindow(param1.findChildByName("formation_selector"));
      }
   }
}
