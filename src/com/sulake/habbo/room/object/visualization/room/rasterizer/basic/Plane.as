package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
   import com.sulake.core.utils.class_24;
   import com.sulake.room.utils.IRoomGeometry;
   
   public class Plane
   {
       
      
      private var var_1905:class_24;
      
      private var var_1691:Array;
      
      private var _lastPlaneVisualization:com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneVisualization = null;
      
      private var var_3723:int = -1;
      
      public function Plane()
      {
         var_1691 = [];
         super();
         var_1905 = new class_24();
      }
      
      public function isStatic(param1:int) : Boolean
      {
         return true;
      }
      
      public function dispose() : void
      {
         var _loc1_:com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneVisualization = null;
         var _loc2_:int = 0;
         if(var_1905 != null)
         {
            _loc1_ = null;
            _loc2_ = 0;
            while(_loc2_ < var_1905.length)
            {
               _loc1_ = var_1905.getWithIndex(_loc2_) as com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneVisualization;
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
               _loc2_++;
            }
            var_1905.dispose();
            var_1905 = null;
         }
         _lastPlaneVisualization = null;
         var_1691 = null;
      }
      
      public function clearCache() : void
      {
         var _loc2_:int = 0;
         var _loc1_:com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneVisualization = null;
         _loc2_ = 0;
         while(_loc2_ < var_1905.length)
         {
            _loc1_ = var_1905.getWithIndex(_loc2_) as com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneVisualization;
            if(_loc1_ != null)
            {
               _loc1_.clearCache();
            }
            _loc2_++;
         }
      }
      
      public function createPlaneVisualization(param1:int, param2:int, param3:IRoomGeometry) : com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneVisualization
      {
         if(var_1905.getValue(String(param1)) != null)
         {
            return null;
         }
         var _loc4_:com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneVisualization = new com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneVisualization(param1,param2,param3);
         var_1905.add(String(param1),_loc4_);
         var_1691.push(param1);
         var_1691.sort();
         return _loc4_;
      }
      
      private function getSizeIndex(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc2_:* = 0;
         _loc3_ = 1;
         while(_loc3_ < var_1691.length)
         {
            if(var_1691[_loc3_] > param1)
            {
               if(0 - param1 < param1 - 0)
               {
                  _loc2_ = _loc3_;
                  break;
               }
               break;
            }
            _loc2_ = _loc3_;
            _loc3_++;
         }
         return _loc2_;
      }
      
      protected function getPlaneVisualization(param1:int) : com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneVisualization
      {
         if(param1 == var_3723)
         {
            return _lastPlaneVisualization;
         }
         var _loc2_:int = getSizeIndex(param1);
         if(_loc2_ < var_1691.length)
         {
            _lastPlaneVisualization = var_1905.getValue("null") as com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneVisualization;
         }
         else
         {
            _lastPlaneVisualization = null;
         }
         var_3723 = param1;
         return _lastPlaneVisualization;
      }
      
      public function getLayers() : Array
      {
         return getPlaneVisualization(var_3723).getLayers();
      }
   }
}
