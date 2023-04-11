package com.sulake.habbo.roomevents.userdefinedroomevents.addons
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
   import flash.events.Event;
   import package_79.class_1554;
   
   public class AnimationTime extends DefaultAddonType
   {
       
      
      private var _roomEvents:HabboUserDefinedRoomEvents;
      
      private var var_2627:SliderWindowController;
      
      public function AnimationTime()
      {
         super();
      }
      
      private static function getInput(param1:class_3151) : class_3151
      {
         return param1.findChildByName("slider_container") as class_3151;
      }
      
      override public function get code() : int
      {
         return class_3513.ANIMATION_TIME;
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(var_2627.getValue());
         return _loc2_;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         _roomEvents = param2;
         var_2627 = new SliderWindowController(param2,getInput(param1),param2.assets,50,2000,50);
         var_2627.setValue(500);
         var_2627.addEventListener("change",onSliderChange);
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var _loc3_:int = int(param2.intParams[0]);
         var_2627.setValue(_loc3_);
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      protected function onSliderChange(param1:Event) : void
      {
         var _loc2_:SliderWindowController = null;
         var _loc4_:Number = NaN;
         var _loc3_:String = null;
         if(param1.type == "change")
         {
            _loc2_ = param1.target as SliderWindowController;
            if(_loc2_)
            {
               _loc3_ = (int(_loc4_ = _loc2_.getValue())) + "";
               _roomEvents.localization.registerParameter("wiredfurni.params.setanimationtime","ms",_loc3_);
            }
         }
      }
      
      protected function get roomEvents() : HabboUserDefinedRoomEvents
      {
         return _roomEvents;
      }
      
      public function get slider() : SliderWindowController
      {
         return var_2627;
      }
   }
}
