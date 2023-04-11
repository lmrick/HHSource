package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectRoomUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const ROOM_WALL_UPDATE:String = "RORUM_ROOM_WALL_UPDATE";
      
      public static const ROOM_FLOOR_UPDATE:String = "RORUM_ROOM_FLOOR_UPDATE";
      
      public static const ROOM_LANDSCAPE_UPDATE:String = "RORUM_ROOM_LANDSCAPE_UPDATE";
       
      
      private var var_271:String = "";
      
      private var var_195:String = "";
      
      public function RoomObjectRoomUpdateMessage(param1:String, param2:String)
      {
         super(null,null);
         var_271 = param1;
         var_195 = param2;
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function get value() : String
      {
         return var_195;
      }
   }
}
