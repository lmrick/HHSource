package com.sulake.habbo.room.events
{
   public class RoomEngineRoomColorEvent extends RoomEngineEvent
   {
      
      public static const ROOM_COLOR:String = "REE_ROOM_COLOR";
       
      
      private var _color:uint;
      
      private var var_3894:uint;
      
      private var var_3890:Boolean;
      
      public function RoomEngineRoomColorEvent(param1:int, param2:uint, param3:uint, param4:Boolean, param5:Boolean = false, param6:Boolean = false)
      {
         super("REE_ROOM_COLOR",param1,param5,param6);
         _color = param2;
         var_3894 = param3;
         var_3890 = param4;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get brightness() : uint
      {
         return var_3894;
      }
      
      public function get bgOnly() : Boolean
      {
         return var_3890;
      }
   }
}
