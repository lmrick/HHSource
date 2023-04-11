package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
   import com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs.*;
   import flash.events.Event;
   import package_79.class_1554;
   
   public class class_3417 extends DefaultConditionType
   {
       
      
      private var _roomEvents:HabboUserDefinedRoomEvents;
      
      private var var_2627:SliderWindowController;
      
      public function class_3417()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3523.TIME_ELAPSED_MORE;
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         var _loc3_:int = var_2627.getValue();
         _loc2_.push(_loc3_ + 1);
         return _loc2_;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         _roomEvents = param2;
         var_2627 = new SliderWindowController(param2,getInput(param1),param2.assets,1,1200,1);
         var_2627.setValue(1);
         var_2627.addEventListener("change",onSliderChange);
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var _loc3_:int = param2.intParams[0] - 1;
         var_2627.setValue(_loc3_);
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
               _roomEvents.localization.registerParameter("wiredfurni.params.allowafter","seconds",_loc3_);
            }
         }
      }
   }
}
