package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.core.assets.class_21;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   
   public class SnowballVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var _assets:class_21;
      
      public function class_3249()
      {
         super();
      }
      
      public function dispose() : void
      {
         _assets = null;
      }
      
      public function initialize(param1:XML) : Boolean
      {
         return true;
      }
      
      public function set assets(param1:class_21) : void
      {
         _assets = param1;
      }
      
      public function get assets() : class_21
      {
         return _assets;
      }
   }
}
