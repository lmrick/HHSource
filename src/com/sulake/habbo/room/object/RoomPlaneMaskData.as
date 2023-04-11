package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_1163:Number = 0;
      
      private var var_863:Number = 0;
      
      private var _leftSideLength:Number = 0;
      
      private var _rightSideLength:Number = 0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1163 = param1;
         var_863 = param2;
         _leftSideLength = param3;
         _rightSideLength = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1163;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_863;
      }
      
      public function get leftSideLength() : Number
      {
         return _leftSideLength;
      }
      
      public function get rightSideLength() : Number
      {
         return _rightSideLength;
      }
   }
}
