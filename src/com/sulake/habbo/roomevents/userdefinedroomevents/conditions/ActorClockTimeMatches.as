package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
   import com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs.class_3306;
   import flash.events.Event;
   import package_79.class_1554;
   
   public class class_3476 extends DefaultConditionType
   {
       
      
      private var _cont:class_3151;
      
      private var _roomEvents:HabboUserDefinedRoomEvents;
      
      private var var_3069:SliderWindowController;
      
      private var var_2999:SliderWindowController;
      
      public function class_3476()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3523.CLOCK_TIME_MATCHES;
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID_OR_BY_TYPE;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         _cont = param1;
         _roomEvents = param2;
         var_3069 = new SliderWindowController(param2,getInputSeconds(),param2.assets,0,119,1);
         var_3069.setValue(0);
         var_3069.addEventListener("change",onSliderSecondsChange);
         var_2999 = new SliderWindowController(param2,getInputMinutes(),param2.assets,0,99,1);
         var_2999.setValue(0);
         var_2999.addEventListener("change",onSliderMinutesChange);
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var _loc4_:int = int(param2.intParams[0]);
         var _loc5_:int = int(param2.intParams[1]);
         var _loc6_:int = int(param2.intParams[2]);
         var_3069.setValue(_loc4_ * 2 + _loc6_);
         var_2999.setValue(_loc5_);
         var _loc3_:int = int(param2.intParams[3]);
         getComparisonSelector().setSelected(getComparisonRadio(_loc3_));
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         var _loc5_:Number = var_3069.getValue();
         var _loc3_:int = Math.floor(_loc5_ / 2);
         var _loc4_:int = _loc5_ % 2;
         _loc2_.push(_loc3_);
         _loc2_.push(var_2999.getValue());
         _loc2_.push(_loc4_);
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
      
      private function getInputSeconds() : class_3151
      {
         return _cont.findChildByName("slider_container_seconds") as class_3151;
      }
      
      private function getInputMinutes() : class_3151
      {
         return _cont.findChildByName("slider_container_minutes") as class_3151;
      }
      
      private function onSliderSecondsChange(param1:Event) : void
      {
         var _loc2_:SliderWindowController = null;
         var _loc5_:Number = NaN;
         var _loc4_:int = 0;
         var _loc3_:String = null;
         if(param1.type == "change")
         {
            _loc2_ = param1.target as SliderWindowController;
            if(_loc2_)
            {
               _loc4_ = _loc5_ = _loc2_.getValue();
               _loc3_ = class_3306.getSecsFromPulses(_loc4_);
               _roomEvents.localization.registerParameter("wiredfurni.params.clock_seconds_elapsed","seconds","" + _loc3_);
            }
         }
      }
      
      private function onSliderMinutesChange(param1:Event) : void
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
               _roomEvents.localization.registerParameter("wiredfurni.params.clock_minutes_elapsed","minutes","" + _loc3_);
            }
         }
      }
   }
}
