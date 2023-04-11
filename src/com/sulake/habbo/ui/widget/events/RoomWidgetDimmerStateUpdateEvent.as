package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetDimmerStateUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_450:String = "RWDSUE_DIMMER_STATE";
       
      
      private var var_159:int;
      
      private var var_3821:int;
      
      private var var_355:int;
      
      private var _color:uint;
      
      private var var_3076:int;
      
      public function RoomWidgetDimmerStateUpdateEvent(param1:int, param2:int, param3:int, param4:uint, param5:uint, param6:Boolean = false, param7:Boolean = false)
      {
         super("RWDSUE_DIMMER_STATE",param6,param7);
         var_159 = param1;
         var_3821 = param2;
         var_355 = param3;
         _color = param4;
         var_3076 = param5;
      }
      
      public function get state() : int
      {
         return var_159;
      }
      
      public function get presetId() : int
      {
         return var_3821;
      }
      
      public function get effectId() : int
      {
         return var_355;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get brightness() : uint
      {
         return var_3076;
      }
   }
}
