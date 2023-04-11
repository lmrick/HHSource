package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.object.IRoomObject;
   
   public class RoomObjectDimmerStateUpdateEvent extends RoomObjectEvent
   {
      
      public static const const_450:String = "RODSUE_DIMMER_STATE";
       
      
      private var var_159:int;
      
      private var var_3821:int;
      
      private var var_355:int;
      
      private var _color:uint;
      
      private var var_3076:int;
      
      public function RoomObjectDimmerStateUpdateEvent(param1:IRoomObject, param2:int, param3:int, param4:int, param5:uint, param6:int, param7:Boolean = false, param8:Boolean = false)
      {
         super("RODSUE_DIMMER_STATE",param1,param7,param8);
         var_159 = param2;
         var_3821 = param3;
         var_355 = param4;
         _color = param5;
         var_3076 = param6;
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
