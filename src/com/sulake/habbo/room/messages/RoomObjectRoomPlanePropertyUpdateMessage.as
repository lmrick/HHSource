package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectRoomPlanePropertyUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const WALL_THICKNESS:String = "RORPPUM_WALL_THICKNESS";
      
      public static const FLOOR_THICKNESS:String = "RORPVUM_FLOOR_THICKNESS";
       
      
      private var var_271:String = "";
      
      private var var_195:Number = 0;
      
      public function RoomObjectRoomPlanePropertyUpdateMessage(param1:String, param2:Number)
      {
         super(null,null);
         var_271 = param1;
         var_195 = param2;
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function get value() : Number
      {
         return var_195;
      }
   }
}
