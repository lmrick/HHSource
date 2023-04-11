package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetDimmerUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_716:String = "RWDUE_PRESETS";
      
      public static const DIMMER_HIDE:String = "RWDUE_HIDE";
       
      
      private var var_1005:int = 0;
      
      private var var_193:Array;
      
      public function RoomWidgetDimmerUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_193 = [];
         super(param1,param2,param3);
      }
      
      public function get selectedPresetId() : int
      {
         return var_1005;
      }
      
      public function get presetCount() : int
      {
         return var_193.length;
      }
      
      public function get presets() : Array
      {
         return var_193;
      }
      
      public function set selectedPresetId(param1:int) : void
      {
         var_1005 = param1;
      }
      
      public function storePreset(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:RoomWidgetDimmerUpdateEventPresetItem = new RoomWidgetDimmerUpdateEventPresetItem(param1,param2,param3,param4);
         var_193[param1 - 1] = _loc5_;
      }
      
      public function getPreset(param1:int) : RoomWidgetDimmerUpdateEventPresetItem
      {
         if(param1 < 0 || param1 >= var_193.count)
         {
            return null;
         }
         return var_193[param1];
      }
   }
}
