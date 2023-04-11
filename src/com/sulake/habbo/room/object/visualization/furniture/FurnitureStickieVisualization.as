package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   
   public class FurnitureStickieVisualization extends FurnitureVisualization
   {
       
      
      private var var_45:com.sulake.habbo.room.object.visualization.furniture.FurnitureVisualizationData = null;
      
      public function FurnitureStickieVisualization()
      {
         super();
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         var_45 = param1 as com.sulake.habbo.room.object.visualization.furniture.FurnitureVisualizationData;
         return super.initialize(param1);
      }
      
      override protected function getSpriteColor(param1:int, param2:int, param3:int) : int
      {
         if(var_45 == null)
         {
            return 16777215;
         }
         return var_45.getColor(param1,param2,param3);
      }
   }
}
