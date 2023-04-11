package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.object.IRoomObject;
   
   public class RoomObjectTileMouseEvent extends RoomObjectMouseEvent
   {
       
      
      private var var_3598:Number;
      
      private var var_3589:Number;
      
      private var var_3693:Number;
      
      public function RoomObjectTileMouseEvent(param1:String, param2:IRoomObject, param3:String, param4:Number, param5:Number, param6:Number, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super(param1,param2,param3,param7,param8,param9,param10,param11,param12);
         var_3598 = param4;
         var_3589 = param5;
         var_3693 = param6;
      }
      
      public function get tileX() : Number
      {
         return var_3598;
      }
      
      public function get tileY() : Number
      {
         return var_3589;
      }
      
      public function get tileZ() : Number
      {
         return var_3693;
      }
      
      public function get tileXAsInt() : int
      {
         return var_3598 + 0.499;
      }
      
      public function get tileYAsInt() : int
      {
         return var_3589 + 0.499;
      }
      
      public function get tileZAsInt() : int
      {
         return var_3693 + 0.499;
      }
   }
}
