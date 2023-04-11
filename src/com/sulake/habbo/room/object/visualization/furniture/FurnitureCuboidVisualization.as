package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class FurnitureCuboidVisualization extends RoomObjectSpriteVisualization
   {
       
      
      private var var_2029:AssetLibrary = null;
      
      private var var_37:Array;
      
      private var var_3192:Boolean = false;
      
      private var var_2682:int = 0;
      
      public function FurnitureCuboidVisualization()
      {
         var_37 = [];
         super();
      }
      
      override public function dispose() : void
      {
         var _loc2_:int = 0;
         var _loc1_:FurniturePlane = null;
         super.dispose();
         if(var_2029 != null)
         {
            var_2029.dispose();
            var_2029 = null;
         }
         if(var_37 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < var_37.length)
            {
               _loc1_ = var_37[_loc2_] as FurniturePlane;
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
               _loc2_++;
            }
            var_37 = null;
         }
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         reset();
         return true;
      }
      
      protected function defineSprites() : void
      {
         createSprites(1);
      }
      
      protected function initializePlanes() : void
      {
         var _loc4_:IVector3d = null;
         var _loc1_:FurniturePlane = null;
         if(var_3192)
         {
            return;
         }
         var _loc6_:IRoomObject;
         if((_loc6_ = object) == null)
         {
            return;
         }
         var _loc2_:Number = Number(_loc6_.getModel().getNumber("furniture_size_x"));
         var _loc9_:Number = Number(_loc6_.getModel().getNumber("furniture_size_y"));
         var _loc10_:Number = Number(_loc6_.getModel().getNumber("furniture_size_z"));
         if(isNaN(_loc2_) || isNaN(_loc9_) || isNaN(_loc10_))
         {
            return;
         }
         var _loc5_:Vector3d = new Vector3d(_loc2_,0,0);
         var _loc7_:Vector3d = new Vector3d(0,_loc9_,0);
         var _loc3_:Vector3d = new Vector3d(-0.5,-0.5,0);
         if(_loc3_ != null && _loc5_ != null && _loc7_ != null)
         {
            _loc4_ = Vector3d.crossProduct(_loc5_,_loc7_);
            _loc1_ = new FurniturePlane(_loc3_,_loc5_,_loc7_);
            _loc1_.color = 16776960;
            var_37.push(_loc1_);
            var_3192 = true;
            defineSprites();
            return;
         }
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean, param4:Boolean) : void
      {
         var _loc5_:IRoomObject;
         if((_loc5_ = object) == null)
         {
            return;
         }
         if(var_2029 == null)
         {
            var_2029 = new AssetLibrary("furniture cuboid visualization - " + _loc5_.getInstanceId());
         }
         if(param1 == null)
         {
            return;
         }
         initializePlanes();
         updatePlanes(param1,param2);
      }
      
      protected function updatePlanes(param1:IRoomGeometry, param2:int) : void
      {
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc13_:String = null;
         var _loc14_:* = null;
         var _loc3_:FurniturePlane = null;
         var _loc8_:int = 0;
         var _loc11_:BitmapData = null;
         var _loc9_:BitmapData = null;
         var _loc12_:IRoomObjectSprite = null;
         var _loc5_:Point = null;
         var _loc10_:IRoomObject;
         if((_loc10_ = object) == null)
         {
            return;
         }
         if(param1 == null || var_2029 == null)
         {
            return;
         }
         var_2682++;
         var _loc4_:* = param2;
         _loc6_ = 0;
         while(_loc6_ < var_37.length)
         {
            _loc7_ = false;
            _loc13_ = "plane " + _loc6_ + " " + param1.scale;
            if((_loc14_ = var_2029.getAssetByName(_loc13_) as BitmapDataAsset) == null)
            {
               _loc14_ = new BitmapDataAsset(var_2029.getAssetTypeDeclarationByClass(BitmapDataAsset));
               var_2029.setAsset(_loc13_,_loc14_);
            }
            _loc3_ = var_37[_loc6_] as FurniturePlane;
            if(_loc3_ != null)
            {
               if((_loc8_ = int(_loc10_.getDirection().x)) / 45 == 2 || _loc8_ / 45 == 6)
               {
                  _loc3_.setRotation(true);
               }
               else
               {
                  _loc3_.setRotation(false);
               }
               if(_loc3_.update(param1,_loc4_))
               {
                  _loc11_ = _loc3_.bitmapData;
                  _loc9_ = _loc14_.content as BitmapData;
                  if(_loc11_ == null)
                  {
                     _loc14_ = null;
                  }
                  else if(_loc9_ != _loc11_)
                  {
                     if(_loc9_ != null)
                     {
                        _loc9_.dispose();
                     }
                     _loc14_.setUnknownContent(_loc11_);
                  }
                  _loc7_ = true;
               }
            }
            else
            {
               _loc14_ = null;
            }
            if((_loc12_ = getSprite(_loc6_)) != null)
            {
               if(_loc3_ != null)
               {
                  _loc5_ = _loc3_.offset;
                  _loc12_.offsetX = -_loc5_.x;
                  _loc12_.offsetY = -_loc5_.y;
                  _loc12_.color = _loc3_.color;
                  _loc12_.visible = _loc3_.visible;
               }
               else
               {
                  _loc12_.visible = false;
               }
               if(_loc14_ != null)
               {
                  _loc12_.asset = _loc14_.content as BitmapData;
               }
               else
               {
                  _loc12_.asset = null;
               }
               if(_loc7_)
               {
                  _loc12_.assetName = _loc13_ + "_" + _loc10_.getInstanceId() + "_" + var_2682;
               }
               _loc12_.relativeDepth = _loc3_.relativeDepth;
            }
            _loc6_++;
         }
      }
   }
}
