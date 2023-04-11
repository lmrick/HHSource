package com.sulake.habbo.room.events
{
   public class RoomEngineHSLColorEnableEvent extends RoomEngineEvent
   {
      
      public static const ROOM_BACKGROUND_COLOR:String = "ROHSLCEE_ROOM_BACKGROUND_COLOR";
       
      
      private var var_3908:Boolean;
      
      private var var_829:int;
      
      private var _saturation:int;
      
      private var var_1054:int;
      
      public function RoomEngineHSLColorEnableEvent(param1:String, param2:int, param3:Boolean, param4:int, param5:int, param6:int, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param2,param7,param8);
         var_3908 = param3;
         var_829 = param4;
         _saturation = param5;
         var_1054 = param6;
      }
      
      public function get enable() : Boolean
      {
         return var_3908;
      }
      
      public function get hue() : int
      {
         return var_829;
      }
      
      public function get saturation() : int
      {
         return _saturation;
      }
      
      public function get lightness() : int
      {
         return var_1054;
      }
   }
}
