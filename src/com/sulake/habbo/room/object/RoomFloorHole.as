package com.sulake.habbo.room.object
{
   public class RoomFloorHole
   {
       
      
      private var var_29:int;
      
      private var var_28:int;
      
      private var _width:int;
      
      private var var_47:int;
      
      public function RoomFloorHole(param1:int, param2:int, param3:int, param4:int)
      {
         super();
         var_29 = param1;
         var_28 = param2;
         _width = param3;
         var_47 = param4;
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
