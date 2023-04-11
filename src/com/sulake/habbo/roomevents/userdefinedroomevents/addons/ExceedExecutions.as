package com.sulake.habbo.roomevents.userdefinedroomevents.addons
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
   import com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs.class_3306;
   import flash.events.Event;
   import package_79.class_1554;
   
   public class ExceedExecutions extends DefaultAddonType
   {
       
      
      private var _roomEvents:HabboUserDefinedRoomEvents;
      
      private var _cont:class_3151;
      
      private var var_3028:SliderWindowController;
      
      private var var_3132:SliderWindowController;
      
      public function ExceedExecutions()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3513.var_4315;
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         _cont = param1;
         _roomEvents = param2;
         var_3028 = new SliderWindowController(param2,getExecutionsSlider(),param2.assets,1,100,1);
         var_3028.setValue(100);
         var_3028.addEventListener("change",onExecutionsChange);
         var_3132 = new SliderWindowController(param2,getTimeWindowSlider(),param2.assets,1,20,1);
         var_3132.setValue(1);
         var_3132.addEventListener("change",onTimeWindowChange);
      }
      
      private function getExecutionsSlider() : class_3151
      {
         return _cont.findChildByName("execution_slider_cont") as class_3151;
      }
      
      private function getTimeWindowSlider() : class_3151
      {
         return _cont.findChildByName("timewindow_slider_cont") as class_3151;
      }
      
      private function onExecutionsChange(param1:Event) : void
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
               _roomEvents.localization.registerParameter("wiredfurni.params.setexecutions","amount","" + _loc3_);
            }
         }
      }
      
      private function onTimeWindowChange(param1:Event) : void
      {
         var _loc2_:SliderWindowController = null;
         var _loc5_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         if(param1.type == "change")
         {
            _loc2_ = param1.target as SliderWindowController;
            if(_loc2_)
            {
               _loc3_ = _loc5_ = _loc2_.getValue();
               _loc4_ = class_3306.getSecsFromPulses(_loc3_);
               _roomEvents.localization.registerParameter("wiredfurni.params.settimewindow","timewindow","" + _loc4_);
            }
         }
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var _loc4_:int = int(param2.intParams[0]);
         var _loc3_:int = int(param2.intParams[1]);
         var_3028.setValue(_loc4_);
         var_3132.setValue(_loc3_);
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(var_3028.getValue());
         _loc2_.push(var_3132.getValue());
         return _loc2_;
      }
   }
}
