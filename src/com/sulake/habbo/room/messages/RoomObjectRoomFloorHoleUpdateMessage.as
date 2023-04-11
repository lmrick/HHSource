package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectRoomFloorHoleUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const ADD_HOLE:String = "RORPFHUM_ADD";
      
      public static const REMOVE_HOLE:String = "RORPFHUM_REMOVE";
       
      
      private var var_271:String = "";
      
      private var var_247:int;
      
      private var var_29:int;
      
      private var var_28:int;
      
      private var _width:int;
      
      private var var_47:int;
      
      public function RoomObjectRoomFloorHoleUpdateMessage(param1:String, param2:int, param3:int = 0, param4:int = 0, param5:int = 0, param6:int = 0)
      {
         super(null,null);
         var_271 = param1;
         var_247 = param2;
         var_29 = param3;
         var_28 = param4;
         _width = param5;
         var_47 = param6;
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get x() : int
      {
         return var_29;
      }
      
      public function get y() : int
      {
         return var_28;
      }
      
      public function get width() : int
      {
         return _width;
      }
      
      public function get height() : int
      {
         return var_47;
      }
   }
}
