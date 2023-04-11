package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
   import flash.events.Event;
   import package_79.class_1554;
   
   public class GiveScore extends DefaultActionType
   {
      
      private static var var_4308:Number = 10;
      
      private static var var_3114:Number = var_4308 + 1;
       
      
      private var _roomEvents:HabboUserDefinedRoomEvents;
      
      private var var_2627:SliderWindowController;
      
      private var var_2810:SliderWindowController;
      
      private var _cont:class_3151;
      
      public function GiveScore()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3520.GIVE_SCORE;
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(getScore());
         _loc2_.push(var_2810.getValue() == var_3114 ? 0 : var_2810.getValue());
         return _loc2_;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         _roomEvents = param2;
         _cont = param1;
         getTypeSelector().setSelected(getTypeRadio(0));
         var_2627 = new SliderWindowController(param2,getInput(),param2.assets,1,100,1);
         var_2627.addEventListener("change",onSliderChange);
         var_2627.setValue(1);
         getTypeRadio(0).addEventListener("WE_SELECT",onTypeChange);
         getTypeRadio(1).addEventListener("WE_SELECT",onTypeChange);
         var_2810 = new SliderWindowController(param2,getCounterInput(),param2.assets,1,var_3114,1);
         var_2810.addEventListener("change",onCounterSliderChange);
         var_2810.setValue(1);
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var _loc3_:int = int(param2.intParams[0]);
         var _loc4_:int = int(param2.intParams[1]);
         var _loc5_:int = 0;
         if(_loc3_ < 0)
         {
            _loc3_ = -_loc3_;
            _loc5_ = 1;
         }
         getTypeSelector().setSelected(getTypeRadio(_loc5_));
         var_2627.setValue(_loc3_);
         var_2810.setValue(_loc4_ == 0 ? var_3114 : _loc4_);
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      private function getInput() : class_3151
      {
         return _cont.findChildByName("slider_container") as class_3151;
      }
      
      private function getCounterInput() : class_3151
      {
         return _cont.findChildByName("counter_slider_container") as class_3151;
      }
      
      private function onSliderChange(param1:Event) : void
      {
         var _loc2_:SliderWindowController = null;
         if(param1.type == "change")
         {
            _loc2_ = param1.target as SliderWindowController;
            if(_loc2_)
            {
               updateSliderText();
            }
         }
      }
      
      private function onTypeChange(param1:class_3134) : void
      {
         updateSliderText();
      }
      
      private function updateSliderText() : void
      {
         var _loc1_:int = getScore();
         _roomEvents.localization.registerParameter("wiredfurni.params.setpoints","points","" + _loc1_);
      }
      
      private function getScore() : int
      {
         var _loc1_:int = var_2627.getValue();
         if(getTypeSelector().getSelected().id == 1)
         {
            _loc1_ = -_loc1_;
         }
         return _loc1_;
      }
      
      private function onCounterSliderChange(param1:Event) : void
      {
         var _loc2_:SliderWindowController = null;
         var _loc3_:Number = NaN;
         var _loc4_:String = null;
         if(param1.type == "change")
         {
            _loc2_ = param1.target as SliderWindowController;
            if(_loc2_)
            {
               _loc3_ = _loc2_.getValue();
               _loc4_ = int(_loc3_) == var_3114 ? "∞" : "" + int(_loc3_);
               _roomEvents.localization.registerParameter("wiredfurni.params.settimesingame","times",_loc4_);
            }
         }
      }
      
      private function getTypeRadio(param1:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(_cont.findChildByName("type_" + param1 + "_radio"));
      }
      
      private function getTypeSelector() : ISelectorWindow
      {
         return ISelectorWindow(_cont.findChildByName("type_selector"));
      }
   }
}
