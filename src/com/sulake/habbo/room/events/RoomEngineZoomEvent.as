package com.sulake.habbo.room.events
{
   public class RoomEngineZoomEvent extends RoomEngineEvent
   {
      
      public static const ROOM_ZOOM:String = "REE_ROOM_ZOOM";
       
      
      private var var_262:Number = 1;
      
      private var var_3917:Boolean = false;
      
      public function RoomEngineZoomEvent(param1:int, param2:Number, param3:* = false, param4:Boolean = false, param5:Boolean = false)
      {
         super("REE_ROOM_ZOOM",param1,param4,param5);
         var_262 = param2;
         var_3917 = param3;
      }
      
      public function get level() : Number
      {
         return var_262;
      }
      
      public function get isFlipForced() : Boolean
      {
         return var_3917;
      }
   }
}
