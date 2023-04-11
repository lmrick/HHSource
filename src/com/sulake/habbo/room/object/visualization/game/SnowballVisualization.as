package com.sulake.habbo.room.object.visualization.game
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.habbo.room.object.visualization.furniture.class_3249;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   
   public class SnowballVisualization extends RoomObjectSpriteVisualization
   {
      
      private static const SNOWBALL_ASSET_NAME:String = "snowball_small_png";
      
      private static const SNOWBALL_SHADOW_ASSET_NAME:String = "snowball_small_shadow_png";
      
      private static const const_1103:int = 16;
       
      
      private var var_45:class_3249;
      
      private var var_2133:IRoomObjectSprite;
      
      public function SnowballVisualization()
      {
         super();
      }
      
      override public function dispose() : void
      {
         var_2133 = null;
         super.dispose();
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         var _loc2_:BitmapDataAsset = null;
         var_45 = param1 as class_3249;
         createSprites(2);
         _loc2_ = var_45.assets.getAssetByName("snowball_small_png") as BitmapDataAsset;
         getSprite(0).asset = _loc2_.content as BitmapData;
         _loc2_ = var_45.assets.getAssetByName("snowball_small_shadow_png") as BitmapDataAsset;
         var_2133 = getSprite(1);
         var_2133.asset = _loc2_.content as BitmapData;
         var_2133.alpha = 100;
         var_2133.relativeDepth = 1;
         return true;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean, param4:Boolean) : void
      {
         var_2133.offsetY = object.getLocation().z * 16;
         var_2133.alpha = Math.max(0,100);
      }
   }
}
