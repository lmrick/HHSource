package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
   import flash.events.Event;
   import package_79.class_1554;
   
   public class MoveFurniTo extends DefaultActionType
   {
       
      
      private var _roomEvents:HabboUserDefinedRoomEvents;
      
      private var var_2627:SliderWindowController;
      
      public function MoveFurniTo()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3520.MOVE_FURNI_TO;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID_OR_BY_TYPE;
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(getDirectionSelector(param1).getSelected().id);
         _loc2_.push(int(var_2627.getValue()));
         return _loc2_;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         _roomEvents = param2;
         var_2627 = new SliderWindowController(param2,getInput(param1),param2.assets,1,5,1);
         var_2627.setValue(1);
         var_2627.addEventListener("change",onSliderChange);
         param2.refreshButton(param1,"move_0",true,null,0);
         param2.refreshButton(param1,"move_2",true,null,0);
         param2.refreshButton(param1,"move_4",true,null,0);
         param2.refreshButton(param1,"move_6",true,null,0);
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var _loc3_:int = int(param2.intParams[0]);
         getDirectionSelector(param1).setSelected(getDirectionRadio(param1,_loc3_));
         var_2627.setValue(param2.intParams[1]);
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
               _roomEvents.localization.registerParameter("wiredfurni.params.emptytiles","tiles","" + _loc3_);
            }
         }
      }
      
      private function getDirectionRadio(param1:class_3151, param2:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName("direction_" + param2 + "_radio"));
      }
      
      private function getDirectionSelector(param1:class_3151) : ISelectorWindow
      {
         return ISelectorWindow(param1.findChildByName("direction_selector"));
      }
   }
}
