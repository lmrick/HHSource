package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.class_3376;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_2093:WallRasterizer;
      
      private var var_2046:FloorRasterizer;
      
      private var var_2389:WallAdRasterizer;
      
      private var var_2086:LandscapeRasterizer;
      
      private var var_2314:PlaneMaskManager;
      
      private var var_66:Boolean = false;
      
      public function RoomVisualizationData()
      {
         super();
         var_2093 = new WallRasterizer();
         var_2046 = new FloorRasterizer();
         var_2389 = new WallAdRasterizer();
         var_2086 = new LandscapeRasterizer();
         var_2314 = new PlaneMaskManager();
      }
      
      public function get initialized() : Boolean
      {
         return var_66;
      }
      
      public function get floorRasterizer() : class_3376
      {
         return var_2046;
      }
      
      public function get wallRasterizer() : class_3376
      {
         return var_2093;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return var_2389;
      }
      
      public function get landscapeRasterizer() : class_3376
      {
         return var_2086;
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return var_2314;
      }
      
      public function dispose() : void
      {
         if(var_2093 != null)
         {
            var_2093.dispose();
            var_2093 = null;
         }
         if(var_2046 != null)
         {
            var_2046.dispose();
            var_2046 = null;
         }
         if(var_2389 != null)
         {
            var_2389.dispose();
            var_2389 = null;
         }
         if(var_2086 != null)
         {
            var_2086.dispose();
            var_2086 = null;
         }
         if(var_2314 != null)
         {
            var_2314.dispose();
            var_2314 = null;
         }
      }
      
      public function clearCache() : void
      {
         if(var_2093 != null)
         {
            var_2093.clearCache();
         }
         if(var_2046 != null)
         {
            var_2046.clearCache();
         }
         if(var_2086 != null)
         {
            var_2086.clearCache();
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc4_:XML = null;
         var _loc3_:XML = null;
         var _loc7_:XML = null;
         var _loc11_:XML = null;
         var _loc6_:XML = null;
         reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc5_:XMLList;
         if((_loc5_ = param1.wallData).length() > 0)
         {
            _loc4_ = _loc5_[0];
            var_2093.initialize(_loc4_);
         }
         var _loc2_:XMLList = param1.floorData;
         if(_loc2_.length() > 0)
         {
            _loc3_ = _loc2_[0];
            var_2046.initialize(_loc3_);
         }
         var _loc10_:XMLList;
         if((_loc10_ = param1.wallAdData).length() > 0)
         {
            _loc7_ = _loc10_[0];
            var_2389.initialize(_loc7_);
         }
         var _loc8_:XMLList;
         if((_loc8_ = param1.landscapeData).length() > 0)
         {
            _loc11_ = _loc8_[0];
            var_2086.initialize(_loc11_);
         }
         var _loc9_:XMLList;
         if((_loc9_ = param1.maskData).length() > 0)
         {
            _loc6_ = _loc9_[0];
            var_2314.initialize(_loc6_);
         }
         return true;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(var_66)
         {
            return;
         }
         var_2093.initializeAssetCollection(param1);
         var_2046.initializeAssetCollection(param1);
         var_2389.initializeAssetCollection(param1);
         var_2086.initializeAssetCollection(param1);
         var_2314.initializeAssetCollection(param1);
         var_66 = true;
      }
      
      protected function reset() : void
      {
      }
   }
}
