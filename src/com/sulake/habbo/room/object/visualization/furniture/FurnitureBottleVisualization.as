package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const ANIMATION_ID_OFFSET_SLOW1:int = 20;
      
      private static const ANIMATION_ID_OFFSET_SLOW2:int = 9;
      
      private static const const_510:int = -1;
       
      
      private var var_1760:Array;
      
      private var var_86:Boolean = false;
      
      public function FurnitureBottleVisualization()
      {
         var_1760 = [];
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!var_86)
            {
               var_86 = true;
               var_1760 = [];
               var_1760.push(-1);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(var_86)
            {
               var_86 = false;
               var_1760 = [];
               var_1760.push(20);
               var_1760.push(9 + param1);
               var_1760.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(0))
         {
            if(false)
            {
               super.setAnimation(var_1760.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
