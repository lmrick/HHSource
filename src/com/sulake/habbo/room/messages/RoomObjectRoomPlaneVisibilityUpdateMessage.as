package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectRoomPlaneVisibilityUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_1077:String = "RORPVUM_WALL_VISIBILITY";
      
      public static const const_748:String = "RORPVUM_FLOOR_VISIBILITY";
       
      
      private var var_271:String = "";
      
      private var var_805:Boolean = false;
      
      public function RoomObjectRoomPlaneVisibilityUpdateMessage(param1:String, param2:Boolean)
      {
         super(null,null);
         var_271 = param1;
         var_805 = param2;
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function get visible() : Boolean
      {
         return var_805;
      }
   }
}
