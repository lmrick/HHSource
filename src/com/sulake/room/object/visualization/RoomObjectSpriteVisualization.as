package com.sulake.room.object.visualization
{
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomObjectSpriteVisualization implements IRoomObjectSpriteVisualization
   {
      
      protected static const const_895:String = "_";
      
      protected static const ICON_LAYER_ID:String = "_icon_";
      
      private static var var_3749:int = 0;
       
      
      private var var_1551:Array;
      
      private var var_1795:IRoomObject;
      
      private var _assetCollection:IGraphicAssetCollection;
      
      protected var var_2503:int = -1;
      
      protected var var_1595:int = -1;
      
      protected var var_1545:int = -1;
      
      private var var_3728:int = 0;
      
      private var var_1454:int = 0;
      
      public function RoomObjectSpriteVisualization()
      {
         super();
         var_3728 = var_3749++;
         var_1551 = [];
         var_1795 = null;
         _assetCollection = null;
      }
      
      public function dispose() : void
      {
         var _loc1_:RoomObjectSprite = null;
         if(var_1551 != null)
         {
            while(false)
            {
               _loc1_ = var_1551[0] as RoomObjectSprite;
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
               var_1551.pop();
            }
            var_1551 = null;
         }
         var_1795 = null;
         assetCollection = null;
      }
      
      public function set assetCollection(param1:IGraphicAssetCollection) : void
      {
         if(_assetCollection != null)
         {
            _assetCollection.removeReference();
         }
         _assetCollection = param1;
         if(_assetCollection != null)
         {
            _assetCollection.addReference();
         }
      }
      
      public function setExternalBaseUrls(param1:String, param2:String, param3:Boolean) : void
      {
      }
      
      public function get assetCollection() : IGraphicAssetCollection
      {
         return _assetCollection;
      }
      
      public function getUpdateID() : int
      {
         return var_1454;
      }
      
      public function getInstanceId() : int
      {
         return var_3728;
      }
      
      protected function createSprites(param1:int) : void
      {
         var _loc2_:RoomObjectSprite = null;
         while(var_1551.length > param1)
         {
            _loc2_ = var_1551[-1] as RoomObjectSprite;
            if(_loc2_ != null)
            {
               _loc2_.dispose();
            }
            var_1551.pop();
         }
         while(var_1551.length < param1)
         {
            _loc2_ = new RoomObjectSprite();
            var_1551.push(_loc2_);
         }
      }
      
      public function addSprite() : IRoomObjectSprite
      {
         return addSpriteAt(var_1551.length);
      }
      
      public function addSpriteAt(param1:int) : IRoomObjectSprite
      {
         var _loc2_:IRoomObjectSprite = new RoomObjectSprite();
         if(param1 >= var_1551.length)
         {
            var_1551.push(_loc2_);
         }
         else
         {
            var_1551.splice(param1,0,_loc2_);
         }
         return _loc2_;
      }
      
      public function removeSprite(param1:IRoomObjectSprite) : void
      {
         var _loc2_:int = var_1551.indexOf(param1);
         if(_loc2_ == -1)
         {
            throw new Error("Trying to remove non-existing sprite!");
         }
         var_1551.splice(_loc2_,1);
         RoomObjectSprite(param1).dispose();
      }
      
      public function get spriteCount() : int
      {
         return var_1551.length;
      }
      
      public function getSprite(param1:int) : IRoomObjectSprite
      {
         if(param1 >= 0 && param1 < var_1551.length)
         {
            return var_1551[param1];
         }
         return null;
      }
      
      public function get object() : IRoomObject
      {
         return var_1795;
      }
      
      public function set object(param1:IRoomObject) : void
      {
         var_1795 = param1;
      }
      
      public function update(param1:IRoomGeometry, param2:int, param3:Boolean, param4:Boolean) : void
      {
      }
      
      protected function increaseUpdateId() : void
      {
         var_1454++;
      }
      
      protected function reset() : void
      {
         var_2503 = 4294967295;
         var_1595 = 4294967295;
         var_1545 = -1;
      }
      
      public function getSpriteList() : Array
      {
         return null;
      }
      
      public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         return false;
      }
      
      public function get image() : BitmapData
      {
         return getImage(0,-1);
      }
      
      public function getImage(param1:int, param2:int) : BitmapData
      {
         var _loc15_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc6_:int = 0;
         var _loc14_:* = 0;
         var _loc8_:* = 0;
         var _loc4_:* = 0;
         var _loc17_:ColorTransform = null;
         var _loc12_:Matrix = null;
         var _loc7_:Rectangle;
         if((_loc7_ = boundingRectangle).width * _loc7_.height == 0)
         {
            return null;
         }
         var _loc9_:int = spriteCount;
         var _loc3_:IRoomObjectSprite = null;
         var _loc11_:* = [];
         var _loc10_:int = 0;
         var _loc5_:BitmapData = null;
         _loc10_ = 0;
         while(_loc10_ < _loc9_)
         {
            _loc3_ = getSprite(_loc10_);
            if(_loc3_ != null && _loc3_.visible)
            {
               if((_loc5_ = _loc3_.asset) != null)
               {
                  _loc11_.push(_loc3_);
               }
            }
            _loc10_++;
         }
         _loc11_.sortOn("relativeDepth",16);
         _loc11_.reverse();
         var _loc16_:BitmapData = null;
         try
         {
            _loc16_ = new BitmapData(_loc7_.width,_loc7_.height,true,param1);
         }
         catch(e:ArgumentError)
         {
            class_14.log("Unable to create BitmapData object! " + e);
         }
         if(!_loc16_)
         {
            return new BitmapData(1,1,true);
         }
         _loc10_ = 0;
         while(_loc10_ < _loc11_.length)
         {
            _loc3_ = _loc11_[_loc10_] as IRoomObjectSprite;
            if((_loc5_ = _loc3_.asset) != null)
            {
               _loc14_ = (_loc6_ = _loc3_.color) >> 16;
               _loc8_ = _loc6_ >> 8 & 255;
               _loc4_ = _loc6_ & 255;
               _loc17_ = null;
               if(_loc14_ < 255 || _loc8_ < 255 || _loc4_ < 255)
               {
                  _loc18_ = _loc14_ / 255;
                  _loc15_ = _loc8_ / 255;
                  _loc13_ = _loc4_ / 255;
                  _loc17_ = new ColorTransform(_loc18_,_loc15_,_loc13_,_loc3_.alpha / 255);
               }
               else if(_loc3_.alpha < 255)
               {
                  _loc17_ = new ColorTransform(1,1,1,_loc3_.alpha / 255);
               }
               if(param1 == 0)
               {
                  if(_loc3_.blendMode == "add")
                  {
                     if(_loc17_ == null)
                     {
                        _loc17_ = new ColorTransform(1,1,1,0);
                     }
                     else
                     {
                        _loc17_.alphaMultiplier = 0;
                     }
                  }
               }
               _loc12_ = new Matrix();
               if(_loc3_.flipH)
               {
                  _loc12_.scale(-1,1);
                  _loc12_.translate(_loc5_.width,0);
               }
               if(_loc3_.flipV)
               {
                  _loc12_.scale(1,-1);
                  _loc12_.translate(0,_loc5_.height);
               }
               _loc12_.translate(_loc3_.offsetX - _loc7_.left,_loc3_.offsetY - _loc7_.top);
               _loc16_.draw(_loc5_,_loc12_,_loc17_,_loc3_.blendMode,null,false);
            }
            _loc10_++;
         }
         return _loc16_;
      }
      
      public function get boundingRectangle() : Rectangle
      {
         var _loc3_:Point = null;
         var _loc5_:int = spriteCount;
         var _loc1_:IRoomObjectSprite = null;
         var _loc4_:Rectangle = new Rectangle();
         var _loc6_:int = 0;
         var _loc2_:BitmapData = null;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc1_ = getSprite(_loc6_);
            if(_loc1_ != null && _loc1_.visible)
            {
               _loc2_ = _loc1_.asset;
               if(_loc2_ != null)
               {
                  _loc3_ = new Point(_loc1_.offsetX,_loc1_.offsetY);
                  if(_loc6_ == 0)
                  {
                     _loc4_.left = _loc3_.x;
                     _loc4_.top = _loc3_.y;
                     _loc4_.right = _loc3_.x + _loc1_.width;
                     _loc4_.bottom = _loc3_.y + _loc1_.height;
                  }
                  else
                  {
                     if(_loc3_.x < _loc4_.left)
                     {
                        _loc4_.left = _loc3_.x;
                     }
                     if(_loc3_.y < _loc4_.top)
                     {
                        _loc4_.top = _loc3_.y;
                     }
                     if(_loc3_.x + _loc1_.width > _loc4_.right)
                     {
                        _loc4_.right = _loc3_.x + _loc1_.width;
                     }
                     if(_loc3_.y + _loc1_.height > _loc4_.bottom)
                     {
                        _loc4_.bottom = _loc3_.y + _loc1_.height;
                     }
                  }
               }
            }
            _loc6_++;
         }
         return _loc4_;
      }
   }
}
