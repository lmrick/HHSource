package com.sulake.habbo.roomevents.userdefinedroomevents.addons
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
   import flash.events.Event;
   import package_79.class_1554;
   
   public class PickOneRandomlyPropagation extends DefaultAddonType
   {
       
      
      private var _roomEvents:HabboUserDefinedRoomEvents;
      
      private var var_2978:SliderWindowController;
      
      private var var_2996:SliderWindowController;
      
      public function PickOneRandomlyPropagation()
      {
         super();
      }
      
      private static function getInputPicks(param1:class_3151) : class_3151
      {
         return param1.findChildByName("slider_container_picks") as class_3151;
      }
      
      private static function getInputSkips(param1:class_3151) : class_3151
      {
         return param1.findChildByName("slider_container_skips") as class_3151;
      }
      
      override public function get code() : int
      {
         return class_3513.var_4322;
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(var_2996.getValue());
         _loc2_.push(var_2978.getValue());
         return _loc2_;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         _roomEvents = param2;
         var_2978 = new SliderWindowController(param2,getInputPicks(param1),param2.assets,1,50,1);
         var_2978.setValue(0);
         var_2978.addEventListener("change",onSliderPicksChange);
         var_2996 = new SliderWindowController(param2,getInputSkips(param1),param2.assets,0,50,1);
         var_2996.setValue(0);
         var_2996.addEventListener("change",onSliderSkipsChange);
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var _loc3_:int = int(param2.intParams[0]);
         var _loc4_:int = int(param2.intParams[1]);
         var_2996.setValue(_loc3_);
         var_2978.setValue(_loc4_);
      }
      
      private function onSliderPicksChange(param1:Event) : void
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
               _roomEvents.localization.registerParameter("wiredfurni.params.pickamount","picks","" + _loc3_);
            }
         }
      }
      
      private function onSliderSkipsChange(param1:Event) : void
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
               _roomEvents.localization.registerParameter("wiredfurni.params.skipactions","skips","" + _loc3_);
            }
         }
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
   }
}
