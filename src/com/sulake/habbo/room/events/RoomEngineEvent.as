package com.sulake.habbo.room.events
{
   import flash.events.Event;
   
   public class RoomEngineEvent extends Event
   {
      
      public static const ROOM_ENGINE_INITIALIZED:String = "REE_ENGINE_INITIALIZED";
      
      public static const ROOM_INITIALIZED:String = "REE_INITIALIZED";
      
      public static const ROOM_DISPOSED:String = "REE_DISPOSED";
      
      public static const ROOM_ENGINE_GAME_MODE:String = "REE_GAME_MODE";
      
      public static const ROOM_ENGINE_NORMAL_MODE:String = "REE_NORMAL_MODE";
      
      public static const ROOM_OBJECTS_INITIALIZED:String = "REE_OBJECTS_INITIALIZED";
      
      public static const ROOM_ZOOMED:String = "REE_ROOM_ZOOMED";
       
      
      private var var_354:int;
      
      public function RoomEngineEvent(param1:String, param2:int, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         var_354 = param2;
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
   }
}
