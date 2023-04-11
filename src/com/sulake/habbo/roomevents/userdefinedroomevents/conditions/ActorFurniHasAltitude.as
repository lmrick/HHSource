package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
   import flash.events.Event;
   import package_79.class_1554;
   
   public class class_3494 extends DefaultConditionType
   {
       
      
      private var _roomEvents:HabboUserDefinedRoomEvents;
      
      private var _cont:class_3151;
      
      private var var_2644:SliderWindowController;
      
      public function class_3494()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3523.FURNI_HAS_ALTITUDE;
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID_BY_TYPE_OR_FROM_CONTEXT;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         _cont = param1;
         _roomEvents = param2;
         var_2644 = new SliderWindowController(param2,getAltitudeContainer(),param2.assets,0,4000,1);
         var_2644.setValue(0);
         var_2644.addEventListener("change",onAltitudeChange);
         getAltitudeInput().text = "0.00";
         getAltitudeInput().addEventListener("WE_CHANGE",onAltitudeTextFieldChange);
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var _loc3_:Number = Number(param2.intParams[0]);
         var _loc4_:int = int(param2.intParams[1]);
         var_2644.setValue(_loc3_);
         getAltitudeInput().text = (_loc3_ / 100).toFixed(2);
         getComparisonSelector().setSelected(getComparisonRadio(_loc4_));
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(int(var_2644.getValue()));
         _loc2_.push(getComparisonSelector().getSelected().id);
         return _loc2_;
      }
      
      private function getComparisonRadio(param1:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(_cont.findChildByName("comp_" + param1 + "_radio"));
      }
      
      private function getComparisonSelector() : ISelectorWindow
      {
         return ISelectorWindow(_cont.findChildByName("comp_selector"));
      }
      
      private function getAltitudeInput() : ITextFieldWindow
      {
         return ITextFieldWindow(_cont.findChildByName("altitude_input"));
      }
      
      private function getAltitudeValueFromInput() : int
      {
         var _loc1_:String = String(getAltitudeInput().text);
         if(isNaN(Number(_loc1_)))
         {
            return -1;
         }
         return int(Number(_loc1_) * 100);
      }
      
      private function getAltitudeContainer() : class_3151
      {
         return _cont.findChildByName("altitude_slider_cont") as class_3151;
      }
      
      private function onAltitudeTextFieldChange(param1:class_3134) : void
      {
         var _loc2_:int = getAltitudeValueFromInput();
         if(_loc2_ != -1)
         {
            var_2644.setValue(_loc2_,true,false);
         }
      }
      
      private function onAltitudeChange(param1:Event) : void
      {
         var _loc2_:SliderWindowController = null;
         var _loc4_:Number = NaN;
         var _loc3_:String = null;
         if(param1.type == "change")
         {
            _loc2_ = param1.target as SliderWindowController;
            if(_loc2_)
            {
               _loc3_ = (_loc4_ = _loc2_.getValue() / 100).toFixed(2);
               getAltitudeInput().text = _loc3_;
            }
         }
      }
   }
}
