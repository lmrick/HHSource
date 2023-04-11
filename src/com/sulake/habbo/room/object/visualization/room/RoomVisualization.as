package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.habbo.room.object.RoomPlaneBitmapMaskParser;
   import com.sulake.habbo.room.object.RoomPlaneParser;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.enum.RoomObjectSpriteType;
   import com.sulake.room.object.visualization.IPlaneVisualization;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.IRoomPlane;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomVisualization extends RoomObjectSpriteVisualization implements IPlaneVisualization
   {
      
      public static const const_587:int = 16777215;
      
      public static const const_795:int = 14540253;
      
      public static const FLOOR_COLOR_RIGHT:int = 12303291;
      
      private static const const_1126:int = 16777215;
      
      private static const WALL_COLOR_SIDE:int = 13421772;
      
      private static const WALL_COLOR_BOTTOM:int = 10066329;
      
      private static const WALL_COLOR_BORDER:int = 10066329;
      
      public static const LANDSCAPE_COLOR_TOP:int = 16777215;
      
      public static const LANDSCAPE_COLOR_SIDE:int = 13421772;
      
      public static const LANDSCAPE_COLOR_BOTTOM:int = 10066329;
      
      private static const ROOM_DEPTH_OFFSET:Number = 1000;
       
      
      protected var var_45:com.sulake.habbo.room.object.visualization.room.RoomVisualizationData = null;
      
      private var var_2029:AssetLibrary = null;
      
      private var var_1529:RoomPlaneParser = null;
      
      private var var_37:Array;
      
      private var var_3192:Boolean = false;
      
      private var var_1669:Array;
      
      private var _visiblePlaneSpriteNumbers:Array;
      
      private var _boundingRectangle:Rectangle = null;
      
      private var var_2066:RoomPlaneBitmapMaskParser = null;
      
      private var var_371:String = null;
      
      private var var_351:String = null;
      
      private var var_558:String = null;
      
      private var var_187:Number = NaN;
      
      private var var_267:Number = NaN;
      
      private var _floorHoleUpdateTime:Number = NaN;
      
      private var var_3442:String = null;
      
      private var _backgroundColor:uint = 16777215;
      
      private var _backgroundRed:int = 255;
      
      private var _backgroundGreen:int = 255;
      
      private var _backgroundBlue:int = 255;
      
      private var var_3513:Boolean = true;
      
      private var var_2682:int = 0;
      
      private var _lastUpdateTime:int = -1000;
      
      private const const_603:int = 250;
      
      private var var_3173:int = -1;
      
      private var var_2962:Number = 0;
      
      private var var_3816:Number = 0;
      
      private var var_4162:Number = 0;
      
      private var var_3264:Number = 0;
      
      private var var_1862:Array;
      
      public function RoomVisualization()
      {
         var_37 = [];
         var_1669 = [];
         _visiblePlaneSpriteNumbers = [];
         var_1862 = [];
         super();
         var_2029 = new AssetLibrary("room visualization");
         var_1529 = new RoomPlaneParser();
         var_2066 = new RoomPlaneBitmapMaskParser();
         var_1862[0] = false;
         var_1862[2] = true;
         var_1862[1] = true;
         var_1862[3] = true;
      }
      
      public function get floorRelativeDepth() : Number
      {
         return 1000.1;
      }
      
      public function get wallRelativeDepth() : Number
      {
         return 1000.5;
      }
      
      public function get wallAdRelativeDepth() : Number
      {
         return 1000.49;
      }
      
      public function get planeCount() : int
      {
         return var_37.length;
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:IAsset = null;
         super.dispose();
         if(var_2029 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_2029.numAssets)
            {
               _loc2_ = var_2029.getAssetByIndex(_loc1_);
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            var_2029.dispose();
            var_2029 = null;
         }
         resetRoomPlanes();
         var_37 = null;
         var_1669 = null;
         _visiblePlaneSpriteNumbers = null;
         if(var_1529 != null)
         {
            var_1529.dispose();
            var_1529 = null;
         }
         if(var_2066 != null)
         {
            var_2066.dispose();
            var_2066 = null;
         }
         if(var_45 != null)
         {
            var_45.clearCache();
            var_45 = null;
         }
      }
      
      private function resetRoomPlanes() : void
      {
         var _loc2_:int = 0;
         var _loc1_:RoomPlane = null;
         if(var_37 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < var_37.length)
            {
               _loc1_ = var_37[_loc2_] as RoomPlane;
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
               _loc2_++;
            }
            var_37 = [];
         }
         var_3192 = false;
         var_2682 += 1;
         reset();
      }
      
      override protected function reset() : void
      {
         super.reset();
         var_371 = null;
         var_351 = null;
         var_558 = null;
         var_3442 = null;
         var_3173 = -1;
         var_3264 = 0;
      }
      
      override public function get boundingRectangle() : Rectangle
      {
         if(_boundingRectangle == null)
         {
            _boundingRectangle = super.boundingRectangle;
         }
         return new Rectangle(_boundingRectangle.x,_boundingRectangle.y,_boundingRectangle.width,_boundingRectangle.height);
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         reset();
         if(param1 == null || !(param1 is com.sulake.habbo.room.object.visualization.room.RoomVisualizationData))
         {
            return false;
         }
         var_45 = param1 as com.sulake.habbo.room.object.visualization.room.RoomVisualizationData;
         var_45.initializeAssetCollection(assetCollection);
         return true;
      }
      
      protected function defineSprites() : void
      {
         var _loc3_:int = 0;
         var _loc1_:RoomPlane = null;
         var _loc2_:IRoomObjectSprite = null;
         var _loc4_:int = 0;
         createSprites(_loc4_);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc1_ = var_37[_loc3_] as RoomPlane;
            _loc2_ = getSprite(_loc3_);
            if(_loc2_ != null && _loc1_ != null && _loc1_.leftSide != null && _loc1_.rightSide != null)
            {
               if(_loc1_.type == 1 && (_loc1_.leftSide.length < 1 || _loc1_.rightSide.length < 1))
               {
                  _loc2_.alphaTolerance = 256;
               }
               else
               {
                  _loc2_.alphaTolerance = 128;
               }
               if(_loc1_.type == 1)
               {
                  _loc2_.tag = "plane.wall@" + (_loc3_ + 1);
               }
               else if(_loc1_.type == 2)
               {
                  _loc2_.tag = "plane.floor@" + (_loc3_ + 1);
               }
               else
               {
                  _loc2_.tag = "plane@" + (_loc3_ + 1);
               }
               _loc2_.spriteType = RoomObjectSpriteType.ROOM_PLANE;
            }
            _loc3_++;
         }
      }
      
      protected function initializeRoomPlanes() : void
      {
         var _loc8_:int = 0;
         var _loc3_:IVector3d = null;
         var _loc18_:IVector3d = null;
         var _loc11_:IVector3d = null;
         var _loc6_:Array = null;
         var _loc12_:int = 0;
         var _loc1_:RoomPlane = null;
         var _loc4_:IVector3d = null;
         var _loc19_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc10_:int = 0;
         var _loc5_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc9_:Number = NaN;
         if(var_3192)
         {
            return;
         }
         var _loc20_:IRoomObject;
         if((_loc20_ = object) == null)
         {
            return;
         }
         if(!isNaN(var_187))
         {
            var_1529.floorThicknessMultiplier = var_187;
         }
         if(!isNaN(var_267))
         {
            var_1529.wallThicknessMultiplier = var_267;
         }
         var _loc7_:String = String(_loc20_.getModel().getString("room_plane_xml"));
         if(!var_1529.initializeFromXML({_loc7_}))
         {
            return;
         }
         var _loc23_:Number = getLandscapeWidth();
         var _loc17_:Number = getLandscapeHeight();
         var _loc22_:Number = 0;
         var _loc16_:int = int(_loc20_.getModel().getNumber("room_random_seed"));
         _loc8_ = 0;
         while(_loc8_ < var_1529.planeCount)
         {
            _loc3_ = var_1529.getPlaneLocation(_loc8_);
            _loc18_ = var_1529.getPlaneLeftSide(_loc8_);
            _loc11_ = var_1529.getPlaneRightSide(_loc8_);
            _loc6_ = var_1529.getPlaneSecondaryNormals(_loc8_);
            _loc12_ = var_1529.getPlaneType(_loc8_);
            _loc1_ = null;
            if(!(_loc3_ != null && _loc18_ != null && _loc11_ != null))
            {
               return;
            }
            _loc4_ = Vector3d.crossProduct(_loc18_,_loc11_);
            _loc16_ = _loc16_ * 7613 + 517;
            _loc1_ = null;
            if(_loc12_ == 1)
            {
               _loc19_ = _loc3_.x + _loc18_.x + 0.5;
               _loc21_ = _loc3_.y + _loc11_.y + 0.5;
               _loc13_ = int(_loc19_) - _loc19_;
               _loc14_ = int(_loc21_) - _loc21_;
               _loc1_ = new RoomPlane(_loc20_.getLocation(),_loc3_,_loc18_,_loc11_,2,true,_loc6_,_loc16_,-_loc13_,-_loc14_);
               if(_loc4_.z != 0)
               {
                  _loc1_.color = 16777215;
               }
               else
               {
                  _loc1_.color = _loc4_.x != 0 ? 12303291 : 14540253;
               }
               if(var_45 != null)
               {
                  _loc1_.rasterizer = var_45.floorRasterizer;
               }
            }
            else if(_loc12_ == 2)
            {
               _loc1_ = new RoomPlane(_loc20_.getLocation(),_loc3_,_loc18_,_loc11_,1,true,_loc6_,_loc16_);
               if(_loc18_.length < 1 || _loc11_.length < 1)
               {
                  _loc1_.hasTexture = false;
               }
               if(_loc4_.x == 0 && _loc4_.y == 0)
               {
                  _loc1_.color = 10066329;
               }
               else if(_loc4_.y > 0)
               {
                  _loc1_.color = 16777215;
               }
               else if(_loc4_.y == 0)
               {
                  _loc1_.color = 13421772;
               }
               else
               {
                  _loc1_.color = 10066329;
               }
               if(var_45 != null)
               {
                  _loc1_.rasterizer = var_45.wallRasterizer;
               }
            }
            else if(_loc12_ == 3)
            {
               _loc1_ = new RoomPlane(_loc20_.getLocation(),_loc3_,_loc18_,_loc11_,3,true,_loc6_,_loc16_,_loc22_,0,_loc23_,_loc17_);
               if(_loc4_.y > 0)
               {
                  _loc1_.color = 16777215;
               }
               else if(_loc4_.y == 0)
               {
                  _loc1_.color = 13421772;
               }
               else
               {
                  _loc1_.color = 10066329;
               }
               if(var_45 != null)
               {
                  _loc1_.rasterizer = var_45.landscapeRasterizer;
               }
               _loc22_ += _loc18_.length;
            }
            else if(_loc12_ == 4)
            {
               _loc1_ = new RoomPlane(_loc20_.getLocation(),_loc3_,_loc18_,_loc11_,1,true,_loc6_,_loc16_);
               if(_loc18_.length < 1 || _loc11_.length < 1)
               {
                  _loc1_.hasTexture = false;
               }
               if(_loc4_.x == 0 && _loc4_.y == 0)
               {
                  _loc1_.color = 10066329;
               }
               else if(_loc4_.y > 0)
               {
                  _loc1_.color = 16777215;
               }
               else if(_loc4_.y == 0)
               {
                  _loc1_.color = 13421772;
               }
               else
               {
                  _loc1_.color = 10066329;
               }
               if(var_45 != null)
               {
                  _loc1_.rasterizer = var_45.wallAdRasterizr;
               }
            }
            if(_loc1_ != null)
            {
               _loc1_.maskManager = var_45.maskManager;
               _loc10_ = 0;
               while(_loc10_ < var_1529.getPlaneMaskCount(_loc8_))
               {
                  _loc5_ = var_1529.getPlaneMaskLeftSideLoc(_loc8_,_loc10_);
                  _loc2_ = var_1529.getPlaneMaskRightSideLoc(_loc8_,_loc10_);
                  _loc15_ = var_1529.getPlaneMaskLeftSideLength(_loc8_,_loc10_);
                  _loc9_ = var_1529.getPlaneMaskRightSideLength(_loc8_,_loc10_);
                  _loc1_.addRectangleMask(_loc5_,_loc2_,_loc15_,_loc9_);
                  _loc10_++;
               }
               var_37.push(_loc1_);
            }
            _loc8_++;
         }
         var_3192 = true;
         defineSprites();
      }
      
      private function getLandscapeWidth() : Number
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:IVector3d = null;
         var _loc4_:Number = 0;
         _loc2_ = 0;
         while(_loc2_ < var_1529.planeCount)
         {
            _loc3_ = var_1529.getPlaneType(_loc2_);
            if(_loc3_ == 3)
            {
               _loc1_ = var_1529.getPlaneLeftSide(_loc2_);
               _loc4_ += _loc1_.length;
            }
            _loc2_++;
         }
         return _loc4_;
      }
      
      private function getLandscapeHeight() : Number
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:IVector3d = null;
         var _loc1_:Number = 0;
         _loc2_ = 0;
         while(_loc2_ < var_1529.planeCount)
         {
            if((_loc4_ = var_1529.getPlaneType(_loc2_)) == 3)
            {
               _loc3_ = var_1529.getPlaneRightSide(_loc2_);
               if(_loc3_.length > _loc1_)
               {
                  _loc1_ = Number(_loc3_.length);
               }
            }
            _loc2_++;
         }
         if(_loc1_ > 5)
         {
            _loc1_ = 5;
         }
         return _loc1_;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean, param4:Boolean) : void
      {
         var _loc8_:int = 0;
         var _loc16_:int = 0;
         var _loc14_:IRoomObjectSprite = null;
         var _loc5_:RoomPlane = null;
         var _loc7_:* = 0;
         var _loc11_:* = 0;
         var _loc6_:* = 0;
         var _loc10_:* = 0;
         var _loc13_:* = 0;
         var _loc12_:IRoomObject;
         if((_loc12_ = object) == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         var _loc9_:Boolean = updateGeometry(param1);
         var _loc15_:IRoomObjectModel = _loc12_.getModel();
         var _loc18_:Boolean = false;
         if(updatePlaneThicknesses(_loc15_))
         {
            _loc18_ = true;
         }
         if(updateFloorHoles(_loc15_))
         {
            _loc18_ = true;
         }
         initializeRoomPlanes();
         _loc18_ = updateMasksAndColors(_loc15_);
         var _loc17_:*;
         if((_loc17_ = param2) < _lastUpdateTime + 250 && !_loc9_ && !_loc18_)
         {
            return;
         }
         if(updatePlaneTexturesAndVisibilities(_loc15_))
         {
            _loc18_ = true;
         }
         if(updatePlanes(param1,_loc9_,param2))
         {
            _loc18_ = true;
         }
         if(_loc18_)
         {
            _loc8_ = 0;
            while(_loc8_ < var_1669.length)
            {
               _loc16_ = 0;
               _loc14_ = getSprite(_loc16_);
               _loc5_ = var_1669[_loc8_] as RoomPlane;
               if(_loc14_ != null && _loc5_ != null && _loc5_.type != 3)
               {
                  if(var_3513)
                  {
                     _loc11_ = ((_loc7_ = _loc5_.color) & 255) * _backgroundBlue / 255;
                     _loc6_ = (_loc7_ >> 8 & 255) * _backgroundGreen / 255;
                     _loc10_ = (_loc7_ >> 16 & 255) * _backgroundRed / 255;
                     _loc7_ = uint(((_loc13_ = uint(_loc7_ >> 24)) << 24) + (_loc10_ << 16) + (_loc6_ << 8) + _loc11_);
                     _loc14_.color = _loc7_;
                  }
                  else
                  {
                     _loc14_.color = _loc5_.color;
                  }
               }
               _loc8_++;
            }
            increaseUpdateId();
         }
         var_1595 = _loc15_.getUpdateID();
         _lastUpdateTime = _loc17_;
      }
      
      private function updateGeometry(param1:IRoomGeometry) : Boolean
      {
         var _loc2_:IVector3d = null;
         var _loc3_:Boolean = false;
         if(param1.updateId != var_3173)
         {
            var_3173 = param1.updateId;
            _boundingRectangle = null;
            _loc2_ = param1.direction;
            if(_loc2_ != null && (_loc2_.x != var_2962 || _loc2_.y != var_3816 || _loc2_.z != var_4162 || param1.scale != var_3264))
            {
               var_2962 = _loc2_.x;
               var_3816 = _loc2_.y;
               var_4162 = _loc2_.z;
               var_3264 = param1.scale;
               _loc3_ = true;
            }
         }
         return _loc3_;
      }
      
      private function updateMasksAndColors(param1:IRoomObjectModel) : Boolean
      {
         var _loc2_:String = null;
         var _loc3_:* = 0;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         if(var_1595 != param1.getUpdateID())
         {
            _loc2_ = String(param1.getString("room_plane_mask_xml"));
            if(_loc2_ != var_3442)
            {
               updatePlaneMasks(_loc2_);
               var_3442 = _loc2_;
               _loc5_ = true;
            }
            _loc3_ = uint(param1.getNumber("room_background_color"));
            if(_loc3_ != _backgroundColor)
            {
               _backgroundColor = _loc3_;
               _backgroundBlue = _backgroundColor & 255;
               _backgroundGreen = _backgroundColor >> 8 & 255;
               _backgroundRed = _backgroundColor >> 16 & 255;
               _loc5_ = true;
            }
            if((_loc4_ = Boolean(param1.getNumber("room_colorize_bg_only"))) != var_3513)
            {
               var_3513 = _loc4_;
               _loc5_ = true;
            }
         }
         return _loc5_;
      }
      
      private function updatePlaneTexturesAndVisibilities(param1:IRoomObjectModel) : Boolean
      {
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc2_:String = null;
         var _loc3_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc4_:Boolean = false;
         if(var_1595 != param1.getUpdateID())
         {
            _loc5_ = String(param1.getString("room_wall_type"));
            _loc6_ = String(param1.getString("room_floor_type"));
            _loc2_ = String(param1.getString("room_landscape_type"));
            updatePlaneTextureTypes(_loc6_,_loc5_,_loc2_);
            _loc3_ = Boolean(param1.getNumber("room_floor_visibility"));
            _loc7_ = Boolean(param1.getNumber("room_wall_visibility"));
            _loc4_ = Boolean(param1.getNumber("room_landscape_visibility"));
            updatePlaneTypeVisibilities(_loc3_,_loc7_,_loc4_);
            return true;
         }
         return false;
      }
      
      private function updatePlaneThicknesses(param1:IRoomObjectModel) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc2_:Number = NaN;
         if(var_1595 != param1.getUpdateID())
         {
            _loc3_ = Number(param1.getNumber("room_floor_thickness"));
            _loc2_ = Number(param1.getNumber("room_wall_thickness"));
            if(!isNaN(_loc3_) && !isNaN(_loc2_) && (_loc3_ != var_187 || _loc2_ != var_267))
            {
               var_187 = _loc3_;
               var_267 = _loc2_;
               resetRoomPlanes();
               return true;
            }
         }
         return false;
      }
      
      private function updateFloorHoles(param1:IRoomObjectModel) : Boolean
      {
         var _loc2_:Number = NaN;
         if(var_1595 != param1.getUpdateID())
         {
            _loc2_ = Number(param1.getNumber("room_floor_hole_update_time"));
            if(!isNaN(_loc2_) && _loc2_ != _floorHoleUpdateTime)
            {
               _floorHoleUpdateTime = _loc2_;
               resetRoomPlanes();
               return true;
            }
         }
         return false;
      }
      
      protected function updatePlaneTextureTypes(param1:String, param2:String, param3:String) : Boolean
      {
         var _loc5_:int = 0;
         var _loc4_:RoomPlane = null;
         if(param1 != var_351)
         {
            var_351 = param1;
         }
         else
         {
            param1 = null;
         }
         if(param2 != var_371)
         {
            var_371 = param2;
         }
         else
         {
            param2 = null;
         }
         if(param3 != var_558)
         {
            var_558 = param3;
         }
         else
         {
            param3 = null;
         }
         if(param1 == null && param2 == null && param3 == null)
         {
            return false;
         }
         _loc5_ = 0;
         while(_loc5_ < var_37.length)
         {
            if((_loc4_ = var_37[_loc5_] as RoomPlane) != null)
            {
               if(_loc4_.type == 2 && param1 != null)
               {
                  _loc4_.id = param1;
               }
               else if(_loc4_.type == 1 && param2 != null)
               {
                  _loc4_.id = param2;
               }
               else if(_loc4_.type == 3 && param3 != null)
               {
                  _loc4_.id = param3;
               }
            }
            _loc5_++;
         }
         return true;
      }
      
      private function updatePlaneTypeVisibilities(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 != var_1862[2] || param2 != var_1862[1] || param3 != var_1862[3])
         {
            var_1862[2] = param1;
            var_1862[1] = param2;
            var_1862[3] = param3;
            var_1669 = [];
            _visiblePlaneSpriteNumbers = [];
         }
      }
      
      protected function updatePlanes(param1:IRoomGeometry, param2:Boolean, param3:int) : Boolean
      {
         var _loc8_:int = 0;
         var _loc9_:* = 0;
         var _loc12_:IRoomObjectSprite = null;
         var _loc4_:RoomPlane = null;
         var _loc10_:Number = NaN;
         var _loc13_:String = null;
         var _loc11_:IRoomObject;
         if((_loc11_ = object) == null)
         {
            return false;
         }
         if(param1 == null)
         {
            return false;
         }
         var_2682++;
         if(param2)
         {
            var_1669 = [];
            _visiblePlaneSpriteNumbers = [];
         }
         var _loc5_:* = param3;
         var _loc6_:Array = var_1669;
         if(false)
         {
            _loc6_ = var_37;
         }
         var _loc14_:Boolean = false;
         var _loc7_:Boolean = false;
         _loc8_ = 0;
         while(_loc8_ < _loc6_.length)
         {
            _loc9_ = _loc8_;
            if(_loc7_)
            {
               _loc9_ = 0;
            }
            if((_loc12_ = getSprite(_loc9_)) != null)
            {
               if((_loc4_ = _loc6_[_loc8_] as RoomPlane) != null)
               {
                  _loc12_.planeId = _loc4_.uniqueId;
                  if(_loc4_.update(param1,_loc5_))
                  {
                     if(_loc4_.visible)
                     {
                        _loc10_ = _loc4_.relativeDepth + floorRelativeDepth + _loc9_ / 1000;
                        if(_loc4_.type != 2)
                        {
                           _loc10_ = _loc4_.relativeDepth + wallRelativeDepth + _loc9_ / 1000;
                           if(_loc4_.leftSide.length < 1 || _loc4_.rightSide.length < 1)
                           {
                              _loc10_ += 500;
                           }
                        }
                        _loc13_ = "plane " + _loc9_ + " " + param1.scale;
                        updateSprite(_loc12_,_loc4_,_loc13_,_loc10_);
                     }
                     _loc14_ = true;
                  }
                  if(_loc12_.visible != (_loc4_.visible && false))
                  {
                     _loc12_.visible = !_loc12_.visible;
                     _loc14_ = true;
                  }
                  if(_loc12_.visible)
                  {
                     if(!_loc7_)
                     {
                        var_1669.push(_loc4_);
                        _visiblePlaneSpriteNumbers.push(_loc8_);
                     }
                  }
               }
               else
               {
                  _loc12_.planeId = 0;
                  if(_loc12_.visible)
                  {
                     _loc12_.visible = false;
                     _loc14_ = true;
                  }
               }
            }
            _loc8_++;
         }
         return _loc14_;
      }
      
      private function updateSprite(param1:IRoomObjectSprite, param2:RoomPlane, param3:String, param4:Number) : void
      {
         var _loc5_:Point = param2.offset;
         param1.offsetX = -_loc5_.x;
         param1.offsetY = -_loc5_.y;
         param1.relativeDepth = param4;
         param1.color = param2.color;
         param1.asset = getPlaneBitmap(param2,param3);
         param1.assetName = param3 + "_" + var_2682;
      }
      
      private function getPlaneBitmap(param1:RoomPlane, param2:String) : BitmapData
      {
         var _loc4_:BitmapDataAsset;
         if((_loc4_ = var_2029.getAssetByName(param2) as BitmapDataAsset) == null)
         {
            _loc4_ = new BitmapDataAsset(var_2029.getAssetTypeDeclarationByClass(BitmapDataAsset));
            var_2029.setAsset(param2,_loc4_);
         }
         var _loc5_:BitmapData = _loc4_.content as BitmapData;
         var _loc3_:BitmapData = param1.copyBitmapData(_loc5_);
         if(_loc3_ == null)
         {
            _loc3_ = param1.bitmapData;
            if(_loc3_ != null)
            {
               if(_loc5_ != _loc3_)
               {
                  if(_loc5_ != null)
                  {
                     _loc5_.dispose();
                  }
                  _loc4_.setUnknownContent(_loc3_);
               }
            }
         }
         return _loc3_;
      }
      
      protected function updatePlaneMasks(param1:String) : void
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc7_:String = null;
         var _loc9_:IVector3d = null;
         var _loc12_:String = null;
         var _loc13_:int = 0;
         var _loc18_:IVector3d = null;
         var _loc8_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc15_:int = 0;
         var _loc4_:int = 0;
         if(param1 == null)
         {
            return;
         }
         var _loc17_:XML = XML(param1);
         var_2066.initialize(_loc17_);
         var _loc2_:RoomPlane = null;
         var _loc14_:* = [];
         var _loc16_:* = [];
         var _loc6_:Boolean = false;
         _loc10_ = 0;
         while(_loc10_ < var_37.length)
         {
            _loc2_ = var_37[_loc10_] as RoomPlane;
            if(_loc2_ != null)
            {
               _loc2_.resetBitmapMasks();
               if(_loc2_.type == 3)
               {
                  _loc14_.push(_loc10_);
               }
            }
            _loc10_++;
         }
         _loc11_ = 0;
         while(_loc11_ < var_2066.maskCount)
         {
            _loc7_ = var_2066.getMaskType(_loc11_);
            _loc9_ = var_2066.getMaskLocation(_loc11_);
            _loc12_ = var_2066.getMaskCategory(_loc11_);
            if(_loc9_ != null)
            {
               _loc13_ = 0;
               while(_loc13_ < var_37.length)
               {
                  _loc2_ = var_37[_loc13_] as RoomPlane;
                  if(_loc2_.type == 1 || _loc2_.type == 3)
                  {
                     if(_loc2_ != null && _loc2_.location != null && _loc2_.normal != null)
                     {
                        _loc18_ = Vector3d.dif(_loc9_,_loc2_.location);
                        if((_loc8_ = Math.abs(Vector3d.scalarProjection(_loc18_,_loc2_.normal))) < 0.01)
                        {
                           if(_loc2_.leftSide != null && _loc2_.rightSide != null)
                           {
                              _loc5_ = Vector3d.scalarProjection(_loc18_,_loc2_.leftSide);
                              _loc3_ = Vector3d.scalarProjection(_loc18_,_loc2_.rightSide);
                              if(_loc2_.type == 1 || _loc2_.type == 3 && _loc12_ == "hole")
                              {
                                 _loc2_.addBitmapMask(_loc7_,_loc5_,_loc3_);
                              }
                              else if(_loc2_.type == 3)
                              {
                                 if(!_loc2_.canBeVisible)
                                 {
                                    _loc6_ = true;
                                 }
                                 _loc2_.canBeVisible = true;
                                 _loc16_.push(_loc13_);
                              }
                           }
                        }
                     }
                  }
                  _loc13_++;
               }
            }
            _loc11_++;
         }
         _loc15_ = 0;
         while(_loc15_ < _loc14_.length)
         {
            _loc4_ = int(_loc14_[_loc15_]);
            if(_loc16_.indexOf(_loc4_) < 0)
            {
               _loc2_ = var_37[_loc4_] as RoomPlane;
               _loc2_.canBeVisible = false;
               _loc6_ = true;
            }
            _loc15_++;
         }
         if(_loc6_)
         {
            var_1669 = [];
            _visiblePlaneSpriteNumbers = [];
         }
      }
      
      public function get planes() : Vector.<IRoomPlane>
      {
         var _loc2_:Vector.<IRoomPlane> = new Vector.<IRoomPlane>(0);
         for each(var _loc1_ in var_1669)
         {
            _loc2_.push(_loc1_);
         }
         return _loc2_;
      }
   }
}
