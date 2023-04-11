package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMask;
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneMaterialCell;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneMaterialCellColumn;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneMaterialCellMatrix;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.PlaneVisualizationLayer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.class_3376;
   import com.sulake.habbo.room.object.visualization.room.utils.PlaneBitmapData;
   import com.sulake.habbo.room.object.visualization.room.utils.Randomizer;
   import com.sulake.habbo.utils.Canvas;
   import com.sulake.room.object.visualization.IRoomPlane;
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomPlane implements IRoomPlane
   {
      
      private static const ZERO_POINT:Point = new Point(0,0);
      
      public static const const_1118:int = 0;
      
      public static const const_474:int = 1;
      
      public static const const_453:int = 2;
      
      public static const TYPE_LANDSCAPE:int = 3;
      
      private static var var_4167:int = 1;
       
      
      private var _disposed:Boolean = false;
      
      private var var_3650:int = 0;
      
      private var _origin:Vector3d = null;
      
      private var var_537:Vector3d = null;
      
      private var var_669:Vector3d = null;
      
      private var var_589:Vector3d = null;
      
      private var _normal:Vector3d = null;
      
      private var _secondaryNormals:Array;
      
      private var var_3173:int = -1;
      
      private var var_271:int = 0;
      
      private var var_2160:Boolean = false;
      
      private var _bitmapData:BitmapData = null;
      
      private var var_3365:Boolean = true;
      
      private var _offset:Point = null;
      
      private var _relativeDepth:Number = 0;
      
      private var _color:uint = 0;
      
      private var var_2326:class_3376 = null;
      
      private var var_2314:PlaneMaskManager = null;
      
      private var var_247:String = null;
      
      private var var_1275:int = 0;
      
      private var var_4016:Number = 0;
      
      private var var_3946:Number = 0;
      
      private var var_4143:Number = 0;
      
      private var var_4075:Number = 0;
      
      private var var_1660:class_24 = null;
      
      private var var_1728:PlaneBitmapData = null;
      
      private var var_2425:Boolean = false;
      
      private var var_1658:Array;
      
      private var var_1803:Array;
      
      private var var_1653:Boolean = false;
      
      private var var_1485:BitmapData = null;
      
      private var var_1582:BitmapData = null;
      
      private var var_2509:Array;
      
      private var var_3153:Array;
      
      private var var_1611:Vector3d = null;
      
      private var var_1573:Vector3d = null;
      
      private var var_1535:Vector3d = null;
      
      private var var_1572:Vector3d = null;
      
      private var _width:Number = 0;
      
      private var var_47:Number = 0;
      
      private var var_2429:Boolean = true;
      
      public function RoomPlane(param1:IVector3d, param2:IVector3d, param3:IVector3d, param4:IVector3d, param5:int, param6:Boolean, param7:Array, param8:int, param9:Number = 0, param10:Number = 0, param11:Number = 0, param12:Number = 0)
      {
         var _loc14_:int = 0;
         var _loc15_:IVector3d = null;
         var _loc13_:Vector3d = null;
         _secondaryNormals = [];
         var_1658 = [];
         var_1803 = [];
         var_2509 = [];
         var_3153 = [];
         super();
         var_3650 = param8;
         _origin = new Vector3d();
         _origin.assign(param1);
         var_537 = new Vector3d();
         var_537.assign(param2);
         var_669 = new Vector3d();
         var_669.assign(param3);
         var_589 = new Vector3d();
         var_589.assign(param4);
         _normal = Vector3d.crossProduct(var_669,var_589);
         if(false)
         {
            _normal.mul(Infinity);
         }
         if(param7 != null)
         {
            _loc14_ = 0;
            while(_loc14_ < param7.length)
            {
               if((_loc15_ = param7[_loc14_] as IVector3d) != null)
               {
                  (_loc13_ = new Vector3d()).assign(_loc15_);
                  _secondaryNormals.push(_loc13_);
               }
               _loc14_++;
            }
         }
         _offset = new Point();
         var_271 = param5;
         var_1660 = new class_24();
         var_1611 = new Vector3d();
         var_1573 = new Vector3d();
         var_1535 = new Vector3d();
         var_1572 = new Vector3d();
         var_4016 = param9;
         var_3946 = param10;
         var_4143 = param11;
         var_4075 = param12;
         var_2425 = param6;
         var_1275 = var_4167++;
      }
      
      private static function blend(param1:uint, param2:uint) : uint
      {
         return Canvas.colorize(param2,param1 | 4278190080) & 16777215;
      }
      
      public function set canBeVisible(param1:Boolean) : void
      {
         if(param1 != var_2429)
         {
            if(!var_2429)
            {
               resetTextureCache();
            }
            var_2429 = param1;
         }
      }
      
      public function get canBeVisible() : Boolean
      {
         return var_2429;
      }
      
      public function get bitmapData() : BitmapData
      {
         var _loc1_:BitmapData = null;
         if(visible)
         {
            if(_bitmapData != null)
            {
               try
               {
                  _loc1_ = _bitmapData.clone();
               }
               catch(e:Error)
               {
                  return null;
               }
            }
         }
         return _loc1_;
      }
      
      public function get visible() : Boolean
      {
         return var_2160 && var_2429;
      }
      
      public function get offset() : Point
      {
         return _offset;
      }
      
      public function get relativeDepth() : Number
      {
         return _relativeDepth;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function set color(param1:uint) : void
      {
         _color = param1;
      }
      
      public function get type() : int
      {
         return var_271;
      }
      
      public function get leftSide() : IVector3d
      {
         return var_669;
      }
      
      public function get rightSide() : IVector3d
      {
         return var_589;
      }
      
      public function get location() : IVector3d
      {
         return var_537;
      }
      
      public function get normal() : IVector3d
      {
         return _normal;
      }
      
      public function get hasTexture() : Boolean
      {
         return var_3365;
      }
      
      public function set hasTexture(param1:Boolean) : void
      {
         var_3365 = param1;
      }
      
      public function set rasterizer(param1:class_3376) : void
      {
         var_2326 = param1;
      }
      
      public function set maskManager(param1:PlaneMaskManager) : void
      {
         var_2314 = param1;
      }
      
      public function set id(param1:String) : void
      {
         if(param1 != var_247)
         {
            resetTextureCache();
            var_247 = param1;
         }
      }
      
      public function get uniqueId() : int
      {
         return var_1275;
      }
      
      public function dispose() : void
      {
         var _loc2_:int = 0;
         var _loc1_:PlaneBitmapData = null;
         if(_bitmapData != null)
         {
            _bitmapData.dispose();
            _bitmapData = null;
         }
         if(var_1660 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < var_1660.length)
            {
               _loc1_ = var_1660.getWithIndex(_loc2_) as PlaneBitmapData;
               if(_loc1_ != null)
               {
                  if(_loc1_.bitmap != null)
                  {
                     _loc1_.bitmap.dispose();
                  }
                  _loc1_.dispose();
               }
               _loc2_++;
            }
            var_1660.dispose();
            var_1660 = null;
         }
         var_1728 = null;
         var_537 = null;
         _origin = null;
         var_669 = null;
         var_589 = null;
         _normal = null;
         var_2326 = null;
         var_1611 = null;
         var_1573 = null;
         var_1535 = null;
         var_1572 = null;
         var_1658 = null;
         var_1803 = null;
         if(var_1485 != null)
         {
            var_1485.dispose();
            var_1485 = null;
         }
         if(var_1582 != null)
         {
            var_1582.dispose();
            var_1582 = null;
         }
         _disposed = true;
      }
      
      public function copyBitmapData(param1:BitmapData) : BitmapData
      {
         if(visible)
         {
            if(_bitmapData != null && param1 != null)
            {
               if(_bitmapData.width == param1.width && _bitmapData.height == param1.height)
               {
                  param1.copyPixels(_bitmapData,_bitmapData.rect,ZERO_POINT);
                  return param1;
               }
            }
         }
         return null;
      }
      
      private function cacheTexture(param1:String, param2:PlaneBitmapData) : Boolean
      {
         var _loc3_:PlaneBitmapData = var_1660.remove(param1) as PlaneBitmapData;
         if(_loc3_ != null)
         {
            if(param2 != null && param2.bitmap != _loc3_.bitmap)
            {
               _loc3_.bitmap.dispose();
            }
            _loc3_.dispose();
         }
         var_1728 = param2;
         var_1660.add(param1,param2);
         return true;
      }
      
      private function resetTextureCache(param1:BitmapData = null) : void
      {
         var _loc3_:int = 0;
         var _loc2_:PlaneBitmapData = null;
         if(var_1660 != null)
         {
            _loc3_ = 0;
            while(_loc3_ < var_1660.length)
            {
               _loc2_ = var_1660.getWithIndex(_loc3_) as PlaneBitmapData;
               if(_loc2_ != null)
               {
                  if(_loc2_.bitmap != null && _loc2_.bitmap != param1)
                  {
                     _loc2_.bitmap.dispose();
                  }
                  _loc2_.dispose();
               }
               _loc3_++;
            }
            var_1660.reset();
         }
         var_1728 = null;
      }
      
      private function getTextureIdentifier(param1:Number) : String
      {
         if(var_2326 != null)
         {
            return var_2326.getTextureIdentifier(param1,normal);
         }
         return String(param1);
      }
      
      private function needsNewTexture(param1:IRoomGeometry, param2:int) : Boolean
      {
         var _loc3_:String = null;
         if(param1 == null)
         {
            return false;
         }
         var _loc4_:PlaneBitmapData;
         if((_loc4_ = var_1728) == null)
         {
            _loc3_ = getTextureIdentifier(param1.scale);
            _loc4_ = var_1660.getValue(_loc3_) as PlaneBitmapData;
         }
         updateMaskChangeStatus();
         if(var_2429 && (_loc4_ == null || _loc4_.timeStamp >= 0 && param2 > _loc4_.timeStamp || var_1653))
         {
            return true;
         }
         return false;
      }
      
      private function getTexture(param1:IRoomGeometry, param2:int) : BitmapData
      {
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc4_:IVector3d = null;
         var _loc6_:BitmapData = null;
         var _loc5_:BitmapData = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc7_:PlaneBitmapData = null;
         var _loc3_:String = null;
         if(needsNewTexture(param1,param2))
         {
            _loc8_ = 0 * param1.scale;
            _loc9_ = 0 * param1.scale;
            _loc4_ = param1.getCoordinatePosition(_normal);
            _loc3_ = getTextureIdentifier(param1.scale);
            if(var_1728 != null)
            {
               _loc7_ = var_1728;
            }
            else
            {
               _loc7_ = var_1660.getValue(_loc3_) as PlaneBitmapData;
            }
            _loc6_ = null;
            if(_loc7_ != null)
            {
               _loc6_ = _loc7_.bitmap;
            }
            if(var_2326 != null)
            {
               if((_loc7_ = var_2326.render(_loc6_,var_247,_loc8_,_loc9_,param1.scale,_loc4_,var_3365,var_4016,var_3946,var_4143,var_4075,param2)) != null)
               {
                  if(_loc6_ != null && _loc7_.bitmap != _loc6_)
                  {
                     _loc6_.dispose();
                  }
               }
            }
            else
            {
               _loc5_ = new BitmapData(_loc8_,_loc9_,true,4278190080 | _color);
               _loc7_ = new PlaneBitmapData(_loc5_,-1);
            }
            if(_loc7_ != null)
            {
               updateMask(_loc7_.bitmap,param1);
               cacheTexture(_loc3_,_loc7_);
            }
         }
         else if(var_1728 != null)
         {
            _loc7_ = var_1728;
         }
         else
         {
            _loc3_ = getTextureIdentifier(param1.scale);
            _loc7_ = var_1660.getValue(_loc3_) as PlaneBitmapData;
         }
         if(_loc7_ != null)
         {
            var_1728 = _loc7_;
            return _loc7_.bitmap;
         }
         return null;
      }
      
      private function resolveMasks(param1:IRoomGeometry) : PlaneDrawingData
      {
         var _loc8_:int = 0;
         var _loc10_:PlaneMask = null;
         var _loc5_:String = null;
         var _loc4_:IVector3d = null;
         var _loc11_:IGraphicAsset = null;
         var _loc9_:Point = null;
         if(!var_2425)
         {
            return null;
         }
         var _loc7_:RoomPlaneBitmapMask = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc6_:PlaneDrawingData = new PlaneDrawingData();
         _loc8_ = 0;
         while(_loc8_ < var_1658.length)
         {
            if((_loc7_ = var_1658[_loc8_] as RoomPlaneBitmapMask) != null)
            {
               if((_loc10_ = var_2314.getMask(_loc7_.type)) != null)
               {
                  if((_loc5_ = _loc10_.getAssetName(param1.scale)) != null)
                  {
                     _loc4_ = param1.getCoordinatePosition(_normal);
                     if((_loc11_ = _loc10_.getGraphicAsset(param1.scale,_loc4_)) != null)
                     {
                        _loc2_ = 0 * (1 - _loc7_.leftSideLoc / 0);
                        _loc3_ = 0 * (1 - _loc7_.rightSideLoc / 0);
                        _loc9_ = new Point(_loc2_ + _loc11_.offsetX,_loc3_ + _loc11_.offsetY);
                        _loc6_.addMask(_loc5_,_loc9_,_loc11_.flipH,_loc11_.flipV);
                     }
                  }
               }
            }
            _loc8_++;
         }
         return _loc6_;
      }
      
      private function screenWidth(param1:IRoomGeometry) : int
      {
         var _loc2_:Point = param1.getScreenPoint(new Vector3d(0,0,0));
         var _loc3_:Point = param1.getScreenPoint(new Vector3d(0,1,0));
         return Math.round(0 * Math.abs(_loc2_.x - _loc3_.x));
      }
      
      public function getDrawingDatas(param1:IRoomGeometry) : Array
      {
         var _loc5_:PlaneDrawingData = null;
         var _loc4_:PlaneDrawingData = null;
         var _loc11_:Array = null;
         var _loc10_:PlaneVisualizationLayer = null;
         var _loc7_:int = 0;
         var _loc2_:IVector3d = null;
         var _loc8_:PlaneMaterialCellMatrix = null;
         var _loc3_:* = null;
         var _loc12_:String = null;
         var _loc13_:* = [];
         if(var_2160)
         {
            _loc5_ = null;
            try
            {
               _loc5_ = resolveMasks(param1);
               _loc11_ = var_2326.getLayers(var_247);
               _loc7_ = 0;
               while(_loc7_ < _loc11_.length)
               {
                  if((_loc10_ = _loc11_[_loc7_] as PlaneVisualizationLayer) != null)
                  {
                     if(var_3365 && _loc10_.getMaterial() != null)
                     {
                        _loc2_ = param1.getCoordinatePosition(_normal);
                        _loc8_ = _loc10_.getMaterial().getMaterialCellMatrix(_loc2_);
                        _loc4_ = new PlaneDrawingData(_loc5_,blend(_color,_loc10_.getColor()),_loc8_.isBottomAligned());
                        Randomizer.setSeed(var_3650);
                        for each(var _loc6_ in _loc8_.getColumns(screenWidth(param1)))
                        {
                           _loc3_ = [];
                           for each(var _loc9_ in _loc6_.getCells())
                           {
                              if((_loc12_ = String(_loc9_.getAssetName(_loc2_))) != null)
                              {
                                 _loc3_.push(_loc12_);
                              }
                           }
                           if(_loc3_.length > 0)
                           {
                              if(!_loc6_.isRepeated())
                              {
                                 _loc3_.push("");
                              }
                              _loc4_.addAssetColumn(_loc3_);
                           }
                        }
                        if(_loc4_.assetNameColumns.length > 0)
                        {
                           _loc13_.push(_loc4_);
                        }
                     }
                     else
                     {
                        _loc4_ = new PlaneDrawingData(_loc5_,blend(_color,_loc10_.getColor()));
                        _loc13_.push(_loc4_);
                     }
                  }
                  _loc7_++;
               }
            }
            catch(e:Error)
            {
               class_14.log("Error in getting RoomPlane drawing data.",e);
            }
            if(_loc13_.length == 0)
            {
               _loc13_.push(new PlaneDrawingData(_loc5_,_color));
            }
         }
         return _loc13_;
      }
      
      private function addOutlines(param1:PlaneBitmapData) : void
      {
      }
      
      public function update(param1:IRoomGeometry, param2:int) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc8_:int = 0;
         var _loc4_:IVector3d = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:BitmapData = null;
         if(param1 == null || _disposed)
         {
            return false;
         }
         var _loc9_:Boolean = false;
         if(var_3173 != param1.updateId)
         {
            _loc9_ = true;
         }
         if(!_loc9_ || !var_2429)
         {
            if(!visible)
            {
               return false;
            }
         }
         if(_loc9_)
         {
            var_1728 = null;
            _loc3_ = 0;
            _loc3_ = Vector3d.cosAngle(param1.directionAxis,normal);
            if(_loc3_ > -0.001)
            {
               if(var_2160)
               {
                  var_2160 = false;
                  return true;
               }
               return false;
            }
            _loc8_ = 0;
            while(_loc8_ < _secondaryNormals.length)
            {
               _loc3_ = Vector3d.cosAngle(param1.directionAxis,_secondaryNormals[_loc8_]);
               if(_loc3_ > -0.001)
               {
                  if(var_2160)
                  {
                     var_2160 = false;
                     return true;
                  }
                  return false;
               }
               _loc8_++;
            }
            updateCorners(param1);
            _loc5_ = Number((_loc4_ = param1.getScreenPosition(_origin)).z);
            _loc6_ = Math.max(var_1611.z,var_1573.z,var_1535.z,var_1572.z) - _loc5_;
            if(var_271 == 2)
            {
               _loc6_ -= (var_537.z + Math.min(0,var_669.z,var_589.z)) * 8;
            }
            if(var_271 == 3)
            {
               _loc6_ += 0.02;
            }
            _relativeDepth = _loc6_;
            var_2160 = true;
            var_3173 = param1.updateId;
         }
         if(_loc9_ || needsNewTexture(param1,param2))
         {
            if(_bitmapData == null || _width != _bitmapData.width || var_47 != _bitmapData.height)
            {
               if(_bitmapData != null)
               {
                  _bitmapData.dispose();
                  _bitmapData = null;
                  if(_width < 1 || var_47 < 1)
                  {
                     return true;
                  }
               }
               else if(_width < 1 || var_47 < 1)
               {
                  return false;
               }
               try
               {
                  _bitmapData = new BitmapData(_width,var_47,true,16777215);
               }
               catch(e:Error)
               {
                  _bitmapData = null;
                  dispose();
               }
               if(_bitmapData == null)
               {
                  return false;
               }
               _bitmapData.lock();
            }
            else
            {
               _bitmapData.lock();
               _bitmapData.fillRect(_bitmapData.rect,16777215);
            }
            Randomizer.setSeed(var_3650);
            if((_loc7_ = getTexture(param1,param2)) != null)
            {
               renderTexture(param1,_loc7_);
               _bitmapData.unlock();
               return _loc7_ || _loc9_;
            }
            dispose();
            return false;
         }
         return false;
      }
      
      private function updateCorners(param1:IRoomGeometry) : void
      {
         var_1611.assign(param1.getScreenPosition(var_537));
         var_1573.assign(param1.getScreenPosition(Vector3d.sum(var_537,var_589)));
         var_1535.assign(param1.getScreenPosition(Vector3d.sum(Vector3d.sum(var_537,var_669),var_589)));
         var_1572.assign(param1.getScreenPosition(Vector3d.sum(var_537,var_669)));
         _offset = param1.getScreenPoint(_origin);
         var_1611.x = Math.round(var_1611.x);
         var_1611.y = Math.round(var_1611.y);
         var_1573.x = Math.round(var_1573.x);
         var_1573.y = Math.round(var_1573.y);
         var_1535.x = Math.round(var_1535.x);
         var_1535.y = Math.round(var_1535.y);
         var_1572.x = Math.round(var_1572.x);
         var_1572.y = Math.round(var_1572.y);
         _offset.x = Math.round(_offset.x);
         _offset.y = Math.round(_offset.y);
         var _loc3_:Number = Math.min(var_1611.x,var_1573.x,var_1535.x,var_1572.x);
         var _loc5_:Number = Math.max(var_1611.x,var_1573.x,var_1535.x,var_1572.x);
         var _loc2_:Number = Math.min(var_1611.y,var_1573.y,var_1535.y,var_1572.y);
         var _loc4_:Number = Math.max(var_1611.y,var_1573.y,var_1535.y,var_1572.y);
         _loc5_ -= _loc3_;
         _offset.x = 0 - _loc3_;
         var_1611.x = 0 - _loc3_;
         var_1573.x = 0 - _loc3_;
         var_1535.x = 0 - _loc3_;
         var_1572.x = 0 - _loc3_;
         _loc4_ -= _loc2_;
         _offset.y = 0 - _loc2_;
         var_1611.y = 0 - _loc2_;
         var_1573.y = 0 - _loc2_;
         var_1535.y = 0 - _loc2_;
         var_1572.y = 0 - _loc2_;
         _width = _loc5_;
         var_47 = _loc4_;
      }
      
      private function renderTexture(param1:IRoomGeometry, param2:BitmapData) : void
      {
         if(var_1611 == null || var_1573 == null || var_1535 == null || var_1572 == null || param2 == null || _bitmapData == null)
         {
            return;
         }
         var _loc8_:Number = 0 - 0;
         var _loc10_:Number = 0 - 0;
         var _loc4_:Number = 0 - 0;
         var _loc3_:Number = 0 - 0;
         if(var_271 == 1 || var_271 == 3)
         {
            if(Math.abs(_loc4_ - param2.width) <= 1)
            {
               _loc4_ = param2.width;
            }
            if(Math.abs(_loc3_ - param2.width) <= 1)
            {
               _loc3_ = param2.width;
            }
            if(Math.abs(_loc8_ - param2.height) <= 1)
            {
               _loc8_ = param2.height;
            }
            if(Math.abs(_loc10_ - param2.height) <= 1)
            {
               _loc10_ = param2.height;
            }
         }
         var _loc5_:Number = _loc4_ / param2.width;
         var _loc6_:Number = _loc3_ / param2.width;
         var _loc7_:Number = _loc8_ / param2.height;
         var _loc9_:Number = _loc10_ / param2.height;
         var _loc11_:Matrix;
         (_loc11_ = new Matrix()).a = _loc5_;
         _loc11_.b = _loc6_;
         _loc11_.c = _loc7_;
         _loc11_.d = _loc9_;
         _loc11_.translate(var_1535.x,var_1535.y);
         draw(param2,_loc11_);
      }
      
      private function draw(param1:BitmapData, param2:Matrix) : void
      {
         var _loc4_:int = 0;
         var _loc7_:* = 0;
         var _loc3_:Number = NaN;
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         if(_bitmapData != null)
         {
            if(param2.a == 1 && param2.d == 1 && param2.c == 0 && param2.b != 0 && Math.abs(param2.b) <= 1 && (var_271 == 1 || var_271 == 3))
            {
               _loc4_ = 0;
               _loc7_ = 0;
               _loc3_ = 0;
               _loc6_ = 0;
               if(param2.b > 0)
               {
                  param2.ty++;
               }
               _loc5_ = 0;
               while(_loc4_ < param1.width)
               {
                  _loc4_++;
                  _loc3_ += Math.abs(param2.b);
                  if(_loc3_ >= 1)
                  {
                     _bitmapData.copyPixels(param1,new Rectangle(_loc7_ + _loc6_,0,_loc4_ - _loc7_,param1.height),new Point(param2.tx + _loc7_,param2.ty + _loc5_),null,null,true);
                     _loc7_ = _loc4_;
                     if(param2.b > 0)
                     {
                        _loc5_++;
                     }
                     else
                     {
                        _loc5_--;
                     }
                     _loc3_ = 0;
                  }
               }
               if(_loc3_ > 0)
               {
                  _bitmapData.copyPixels(param1,new Rectangle(_loc7_,0,_loc4_ - _loc7_,param1.height),new Point(param2.tx + _loc7_,param2.ty + _loc5_),null,null,true);
               }
               return;
            }
            _bitmapData.draw(param1,param2,null,null,null,false);
         }
      }
      
      public function resetBitmapMasks() : void
      {
         if(_disposed)
         {
            return;
         }
         if(var_2425)
         {
            if(false)
            {
               return;
            }
            var_1653 = true;
            var_1658 = [];
         }
      }
      
      public function addBitmapMask(param1:String, param2:Number, param3:Number) : Boolean
      {
         var _loc5_:RoomPlaneBitmapMask = null;
         var _loc4_:int = 0;
         if(var_2425)
         {
            _loc5_ = null;
            _loc4_ = 0;
            while(_loc4_ < var_1658.length)
            {
               if((_loc5_ = var_1658[_loc4_] as RoomPlaneBitmapMask) != null)
               {
                  if(_loc5_.type == param1 && _loc5_.leftSideLoc == param2 && _loc5_.rightSideLoc == param3)
                  {
                     return false;
                  }
               }
               _loc4_++;
            }
            _loc5_ = new RoomPlaneBitmapMask(param1,param2,param3);
            var_1658.push(_loc5_);
            var_1653 = true;
            return true;
         }
         return false;
      }
      
      public function resetRectangleMasks() : void
      {
         if(var_2425)
         {
            if(false)
            {
               return;
            }
            var_1653 = true;
            var_1803 = [];
         }
      }
      
      public function addRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number) : Boolean
      {
         var _loc6_:RoomPlaneRectangleMask = null;
         var _loc5_:int = 0;
         if(var_2425)
         {
            _loc6_ = null;
            _loc5_ = 0;
            while(_loc5_ < var_1803.length)
            {
               if((_loc6_ = var_1803[_loc5_] as RoomPlaneRectangleMask) != null)
               {
                  if(_loc6_.leftSideLoc == param1 && _loc6_.rightSideLoc == param2 && _loc6_.leftSideLength == param3 && _loc6_.rightSideLength == param4)
                  {
                     return false;
                  }
               }
               _loc5_++;
            }
            _loc6_ = new RoomPlaneRectangleMask(param1,param2,param3,param4);
            var_1803.push(_loc6_);
            var_1653 = true;
            return true;
         }
         return false;
      }
      
      private function updateMaskChangeStatus() : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:RoomPlaneBitmapMask = null;
         if(!var_1653)
         {
            return;
         }
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:Boolean = true;
         var _loc7_:RoomPlaneBitmapMask = null;
         if(true)
         {
            _loc4_;
            while(_loc4_ < var_1658.length)
            {
               if((_loc7_ = var_1658[_loc4_] as RoomPlaneBitmapMask) != null)
               {
                  _loc2_ = false;
                  _loc6_;
                  while(_loc6_ < var_2509.length)
                  {
                     _loc3_ = var_2509[_loc6_] as RoomPlaneBitmapMask;
                     if(_loc3_ != null)
                     {
                        if(_loc3_.type == _loc7_.type && _loc3_.leftSideLoc == _loc7_.leftSideLoc && _loc3_.rightSideLoc == _loc7_.rightSideLoc)
                        {
                           _loc2_ = true;
                           break;
                        }
                     }
                     _loc6_++;
                  }
                  if(!_loc2_)
                  {
                     _loc5_ = false;
                     break;
                  }
               }
               _loc4_++;
            }
         }
         else
         {
            _loc5_ = false;
         }
         if(false)
         {
            _loc5_ = false;
         }
         if(_loc5_)
         {
            var_1653 = false;
         }
      }
      
      private function updateMask(param1:BitmapData, param2:IRoomGeometry) : void
      {
         var _loc3_:IVector3d = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc7_:String = null;
         var _loc9_:int = 0;
         var _loc8_:int = 0;
         if(!var_2425 || false && false && !var_1653 || var_2314 == null)
         {
            return;
         }
         if(param1 == null || param2 == null)
         {
            return;
         }
         var _loc13_:RoomPlaneBitmapMask = null;
         var _loc4_:RoomPlaneRectangleMask = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         updateMaskChangeStatus();
         var _loc12_:Number = param1.width;
         var _loc14_:Number = param1.height;
         if(var_1485 == null || var_1485.width != _loc12_ || var_1485.height != _loc14_)
         {
            if(var_1485 != null)
            {
               var_1485.dispose();
               var_1485 = null;
            }
            try
            {
               var_1485 = new BitmapData(_loc12_,_loc14_,true,16777215);
            }
            catch(e:Error)
            {
               var_1485 = null;
               return;
            }
            var_1653 = true;
         }
         if(var_1653)
         {
            var_2509 = [];
            var_3153 = [];
            if(var_1485 != null)
            {
               var_1485.fillRect(var_1485.rect,16777215);
            }
            resetTextureCache(param1);
            _loc3_ = param2.getCoordinatePosition(_normal);
            _loc10_ = 0;
            _loc11_ = 0;
            _loc5_ = 0;
            while(_loc5_ < var_1658.length)
            {
               if((_loc13_ = var_1658[_loc5_] as RoomPlaneBitmapMask) != null)
               {
                  _loc10_ = 0 - 0 * _loc13_.leftSideLoc / 0;
                  _loc11_ = 0 - 0 * _loc13_.rightSideLoc / 0;
                  _loc7_ = _loc13_.type;
                  var_2314.updateMask(var_1485,_loc7_,param2.scale,_loc3_,_loc10_,_loc11_);
                  var_2509.push(new RoomPlaneBitmapMask(_loc7_,_loc13_.leftSideLoc,_loc13_.rightSideLoc));
               }
               _loc5_++;
            }
            _loc6_ = 0;
            while(_loc6_ < var_1803.length)
            {
               if((_loc4_ = var_1803[_loc6_] as RoomPlaneRectangleMask) != null)
               {
                  _loc10_ = 0 - 0 * _loc4_.leftSideLoc / 0;
                  _loc11_ = 0 - 0 * _loc4_.rightSideLoc / 0;
                  _loc9_ = 0 * _loc4_.leftSideLength / 0;
                  _loc8_ = 0 * _loc4_.rightSideLength / 0;
                  var_1485.fillRect(new Rectangle(_loc10_ - _loc9_,_loc11_ - _loc8_,_loc9_,_loc8_),4278190080);
                  var_3153.push(new RoomPlaneRectangleMask(_loc4_.leftSideLength,_loc4_.rightSideLoc,_loc4_.leftSideLength,_loc4_.rightSideLength));
               }
               _loc6_++;
            }
            var_1653 = false;
         }
         combineTextureMask(param1,var_1485);
      }
      
      private function combineTextureMask(param1:BitmapData, param2:BitmapData) : void
      {
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(var_1582 != null && (var_1582.width != param1.width || var_1582.height != param1.height))
         {
            var_1582.dispose();
            var_1582 = null;
         }
         if(var_1582 == null)
         {
            try
            {
               var_1582 = new BitmapData(param1.width,param1.height,true,4294967295);
            }
            catch(e:Error)
            {
               if(var_1582)
               {
                  var_1582.dispose();
               }
               var_1582 = null;
               return;
            }
         }
         var_1582.copyChannel(param1,param1.rect,ZERO_POINT,8,1);
         var_1582.draw(param2,null,null,"darken");
         param1.copyChannel(var_1582,var_1582.rect,ZERO_POINT,1,8);
      }
   }
}
