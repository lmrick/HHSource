package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
   import flash.events.Event;
   import package_79.class_1554;
   
   public class class_3475 extends DefaultConditionType
   {
       
      
      private var _roomEvents:HabboUserDefinedRoomEvents;
      
      private var var_3017:SliderWindowController;
      
      private var var_2897:SliderWindowController;
      
      public function class_3475()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3523.USER_COUNT_IN;
      }
      
      override public function get negativeCode() : int
      {
         return class_3523.NOT_USER_COUNT_IN;
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(var_3017.getValue());
         _loc2_.push(var_2897.getValue());
         return _loc2_;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         _roomEvents = param2;
         var_3017 = new SliderWindowController(param2,getMinInput(param1),param2.assets,0,125,1);
         var_3017.addEventListener("change",onMinSliderChange);
         var_3017.setValue(1);
         var_2897 = new SliderWindowController(param2,getMaxInput(param1),param2.assets,0,125,1);
         var_2897.addEventListener("change",onMaxSliderChange);
         var_2897.setValue(50);
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var _loc3_:int = int(param2.intParams[0]);
         var _loc4_:int = int(param2.intParams[1]);
         var_3017.setValue(_loc3_);
         var_2897.setValue(_loc4_);
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      private function getMinInput(param1:class_3151) : class_3151
      {
         return param1.findChildByName("min_slider_container") as class_3151;
      }
      
      private function getMaxInput(param1:class_3151) : class_3151
      {
         return param1.findChildByName("max_slider_container") as class_3151;
      }
      
      private function onMinSliderChange(param1:Event) : void
      {
         var _loc2_:SliderWindowController = null;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         if(param1.type == "change")
         {
            _loc2_ = param1.target as SliderWindowController;
            if(_loc2_)
            {
               _loc3_ = _loc2_.getValue();
               _loc4_ = _loc3_;
               _roomEvents.localization.registerParameter("wiredfurni.params.usercountmin","value","" + _loc4_);
            }
         }
      }
      
      private function onMaxSliderChange(param1:Event) : void
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
               _roomEvents.localization.registerParameter("wiredfurni.params.usercountmax","value","" + _loc3_);
            }
         }
      }
   }
}
