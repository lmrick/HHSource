package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_510:int = 3;
      
      private static const const_874:int = 2;
      
      private static const ANIMATION_ID_NORMAL:int = 1;
      
      private static const const_621:int = 15;
       
      
      private var var_1760:Array;
      
      private var var_2719:int;
      
      public function FurnitureQueueTileVisualization()
      {
         var_1760 = [];
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 2)
         {
            var_1760 = [];
            var_1760.push(1);
            var_2719 = 15;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(var_2719 > 0)
         {
            var_2719--;
         }
         if(var_2719 == 0)
         {
            if(false)
            {
               super.setAnimation(var_1760.shift());
            }
         }
         return super.updateAnimation(param1);
      }
      
      override protected function usesAnimationResetting() : Boolean
      {
         return true;
      }
   }
}
