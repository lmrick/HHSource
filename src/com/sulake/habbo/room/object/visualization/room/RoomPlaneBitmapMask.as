package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneBitmapMask
   {
       
      
      private var var_271:String = null;
      
      private var var_1163:Number = 0;
      
      private var var_863:Number = 0;
      
      public function RoomPlaneBitmapMask(param1:String, param2:Number, param3:Number)
      {
         super();
         var_271 = param1;
         var_1163 = param2;
         var_863 = param3;
      }
      
      public function get type() : String
      {
         return var_271;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1163;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_863;
      }
   }
}
