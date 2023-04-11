package com.sulake.habbo.room.object.visualization.data
{
   public class AnimationFrameData
   {
       
      
      private var var_247:int = 0;
      
      private var var_29:int = 0;
      
      private var var_28:int = 0;
      
      private var var_3766:int = 0;
      
      private var var_3902:int = 0;
      
      private var var_4207:int = 1;
      
      public function AnimationFrameData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int)
      {
         super();
         var_247 = param1;
         var_29 = param2;
         var_28 = param3;
         var_3766 = param4;
         var_3902 = param5;
         var_4207 = param6;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function hasDirectionalOffsets() : Boolean
      {
         return false;
      }
      
      public function getX(param1:int) : int
      {
         return var_29;
      }
      
      public function getY(param1:int) : int
      {
         return var_28;
      }
      
      public function get x() : int
      {
         return var_29;
      }
      
      public function get y() : int
      {
         return var_29;
      }
      
      public function get randomX() : int
      {
         return var_3766;
      }
      
      public function get randomY() : int
      {
         return var_3902;
      }
      
      public function get repeats() : int
      {
         return var_4207;
      }
   }
}
