package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureSoundBlockVisualization extends AnimatedFurnitureVisualization
   {
       
      
      private var var_3690:int = 1;
      
      private var var_2639:Number = 0;
      
      public function FurnitureSoundBlockVisualization()
      {
         super();
      }
      
      override protected function get frameIncrease() : int
      {
         return var_3690;
      }
      
      override protected function updateAnimations(param1:Number) : int
      {
         var_2639 += object.getModel().getNumber("furniture_soundblock_relative_animation_speed");
         var_3690 = var_2639;
         var_2639 -= var_3690;
         return super.updateAnimations(param1);
      }
   }
}
