package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectRoomColorUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const BACKGROUND_COLOR:String = "RORCUM_BACKGROUND_COLOR";
       
      
      private var var_271:String = "";
      
      private var _color:uint = 0;
      
      private var var_1063:int = 0;
      
      private var var_3890:Boolean = true;
      
      public function RoomObjectRoomColorUpdateMessage(param1:String, param2:uint, param3:int, param4:Boolean)
      {
         super(null,null);
         var_271 = param1;
         _color = param2;
         var_1063 = param3;
         var_3890 = param4;
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get light() : uint
      {
         return var_1063;
      }
      
      public function get bgOnly() : Boolean
      {
         return var_3890;
      }
   }
}
