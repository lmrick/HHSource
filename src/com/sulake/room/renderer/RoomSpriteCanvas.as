package com.sulake.room.renderer
{
   import com.sulake.core.utils.class_24;
   import com.sulake.room.data.RoomObjectSpriteData;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.enum.RoomObjectSpriteType;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectSpriteVisualization;
   import com.sulake.room.renderer.cache.class_3421;
   import com.sulake.room.renderer.cache.class_3445;
   import com.sulake.room.renderer.cache.class_3448;
   import com.sulake.room.renderer.cache.class_3492;
   import com.sulake.room.renderer.cache.class_3509;
   import com.sulake.room.renderer.utils.class_3438;
   import com.sulake.room.renderer.utils.class_3446;
   import com.sulake.room.renderer.utils.class_3453;
   import com.sulake.room.renderer.utils.class_3496;
   import com.sulake.room.utils.*;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomSpriteCanvas implements IRoomRenderingCanvas
   {
      
      private static const ZERO_POINT:Point = new Point(0,0);
      
      private static const SKIP_FRAME_COUNT_FOR_UPDATE_INTERVAL:int = 50;
      
      private static const FRAME_COUNT_FOR_UPDATE_INTERVAL:int = 50;
      
      private static const SLOW_FRAME_UPDATE_INTERVAL:Number = 60;
      
      private static const FAST_FRAME_UPDATE_INTERVAL:Number = 50;
      
      private static const MAXIMUM_VALID_FRAME_UPDATE_INTERVAL:int = 1000;
       
      
      private var _container:com.sulake.room.renderer.class_3221;
      
      private var _geometry:RoomGeometry;
      
      private var _bgColor:int = 0;
      
      private var var_1571:Sprite;
      
      private var var_1549:Sprite;
      
      private var _display:Sprite;
      
      private var var_2136:class_24;
      
      private var _mouseLocation:Point;
      
      private var _bitmapDataCache:class_3492;
      
      private var _roomObjectCache:class_3509;
      
      private var var_1910:Array;
      
      private var var_2115:Array;
      
      private var var_3124:com.sulake.room.renderer.IRoomRenderingCanvasMouseListener = null;
      
      private var var_247:int;
      
      private var _eventCache:class_24 = null;
      
      private var var_3591:int = 0;
      
      private var var_2108:int;
      
      private var var_2109:int;
      
      private var var_1716:int;
      
      private var var_1689:int;
      
      private var var_3381:int;
      
      private var var_3194:int;
      
      private var var_3054:int = -1;
      
      private var var_4085:Number = -10000000;
      
      private var var_4041:Number = -10000000;
      
      private var var_2671:int = 0;
      
      private var var_3643:Boolean = false;
      
      private var var_2425:Boolean = false;
      
      private var var_1913:ColorTransform;
      
      private var var_2227:Matrix;
      
      private var var_1989:Number = 0;
      
      private var var_2280:int = 0;
      
      private var _runningSlow:Boolean = false;
      
      private var _skipObjectUpdate:Boolean = false;
      
      private var var_2674:int = 0;
      
      private var var_4317:Boolean = false;
      
      private var var_4026:Array;
      
      private var var_2560:int = 0;
      
      private var var_3427:Number = 0;
      
      private var var_4283:int = 0;
      
      private var var_3544:int = 0;
      
      private var var_757:Number = 1;
      
      private var var_2270:Boolean;
      
      public function RoomSpriteCanvas(param1:com.sulake.room.renderer.class_3221, param2:int, param3:int, param4:int, param5:int)
      {
         var_2136 = new class_24();
         _mouseLocation = new Point();
         var_1910 = [];
         var_2115 = [];
         var_4026 = [];
         super();
         _container = param1;
         var_247 = param2;
         var_1571 = new Sprite();
         var_1571.mouseEnabled = false;
         _display = new Sprite();
         _display.name = "canvas";
         _display.mouseEnabled = false;
         var_1571.addChild(_display);
         _display.mouseEnabled = true;
         _display.doubleClickEnabled = true;
         _display.addEventListener("click",clickHandler);
         _display.addEventListener("doubleClick",clickHandler);
         _geometry = new RoomGeometry(param5,new Vector3d(-135,30,0),new Vector3d(11,11,5),new Vector3d(-135,0.5,0));
         _bitmapDataCache = new class_3492(16,32,1);
         var _loc6_:String = null;
         if(_container != null)
         {
            _loc6_ = "null";
         }
         _eventCache = new class_24();
         _roomObjectCache = new class_3509(_loc6_);
         var_1913 = new ColorTransform();
         var_2227 = new Matrix();
         initialize(param3,param4);
      }
      
      protected function get container() : com.sulake.room.renderer.class_3221
      {
         return _container;
      }
      
      protected function get activeSpriteCount() : int
      {
         return var_2560;
      }
      
      public function get width() : int
      {
         return var_2108 * var_757;
      }
      
      public function get height() : int
      {
         return var_2109 * var_757;
      }
      
      public function set screenOffsetX(param1:int) : void
      {
         _mouseLocation.x = 0 - (param1 - var_1716);
         var_1716 = param1;
      }
      
      public function set screenOffsetY(param1:int) : void
      {
         _mouseLocation.y = 0 - (param1 - var_1689);
         var_1689 = param1;
      }
      
      public function get screenOffsetX() : int
      {
         return var_1716;
      }
      
      public function get screenOffsetY() : int
      {
         return var_1689;
      }
      
      public function get displayObject() : DisplayObject
      {
         return var_1571;
      }
      
      public function get geometry() : IRoomGeometry
      {
         return _geometry;
      }
      
      public function set mouseListener(param1:com.sulake.room.renderer.IRoomRenderingCanvasMouseListener) : void
      {
         var_3124 = param1;
      }
      
      public function set useMask(param1:Boolean) : void
      {
         if(param1 && !var_2425)
         {
            var_2425 = true;
            if(var_1549 != null && !var_1571.contains(var_1549))
            {
               var_1571.addChild(var_1549);
               _display.mask = var_1549;
            }
         }
         else if(!param1 && var_2425)
         {
            var_2425 = false;
            if(var_1549 != null && var_1571.contains(var_1549))
            {
               var_1571.removeChild(var_1549);
               _display.mask = null;
            }
         }
      }
      
      public function getSortableSpriteList() : Vector.<RoomObjectSpriteData>
      {
         return _roomObjectCache.getSortableSpriteList();
      }
      
      public function getPlaneSortableSprites() : Array
      {
         return _roomObjectCache.getPlaneSortableSprites();
      }
      
      public function setScale(param1:Number, param2:Point = null, param3:Point = null, param4:Boolean = false) : void
      {
         if(!var_1571 || true || !_display)
         {
            return;
         }
         if(param2 == null)
         {
            param2 = new Point(var_1571.stage.stageWidth / 2,var_1571.stage.stageHeight / 2);
         }
         if(param3 == null)
         {
            param3 = param2;
         }
         param2 = _display.globalToLocal(param2);
         var_757 = param1;
         if(var_757 < 1)
         {
            _display.stage.quality = var_757 == 0.5 ? "best" : _display.stage.quality;
            if(!param4)
            {
               _display.rotationX = 0;
            }
         }
         else
         {
            recreateRoomDisplaySprite();
         }
         screenOffsetX = param3.x - param2.x * param1;
         screenOffsetY = param3.y - param2.y * param1;
      }
      
      private function recreateRoomDisplaySprite() : void
      {
         _display.removeEventListener("click",clickHandler);
         _display.removeEventListener("doubleClick",clickHandler);
         var_1571.removeChild(_display);
         var _loc1_:Sprite = new Sprite();
         while(false)
         {
            _loc1_.addChild(_display.removeChildAt(0));
         }
         _loc1_.name = "canvas";
         _loc1_.mouseEnabled = false;
         var_1571.addChild(_loc1_);
         _loc1_.mouseEnabled = true;
         _loc1_.doubleClickEnabled = true;
         _loc1_.addEventListener("click",clickHandler);
         _loc1_.addEventListener("doubleClick",clickHandler);
         if(var_2425 && var_1549 != null)
         {
            _loc1_.mask = var_1549;
         }
         var_3381 = -1;
         var_3194 = -1;
         _display = _loc1_;
      }
      
      public function get scale() : Number
      {
         return var_757;
      }
      
      public function takeScreenShot() : BitmapData
      {
         var_2270 = true;
         var _loc5_:Number = var_757;
         var _loc2_:int = var_1716;
         var _loc1_:int = var_1689;
         var _loc6_:String = _display.stage.quality;
         setScale(1);
         var_1716 = 0;
         var_1689 = 0;
         _display.stage.quality = "low";
         render(-1,true);
         var _loc3_:BitmapData = new BitmapData(_display.width,_display.height,true,0);
         var _loc4_:Rectangle = _display.getBounds(_display);
         _loc3_.draw(_display,new Matrix(1,0,0,1,-_loc4_.x,-_loc4_.y));
         var_2270 = false;
         setScale(_loc5_);
         var_1716 = _loc2_;
         var_1689 = _loc1_;
         _display.stage.quality = _loc6_;
         return _loc3_;
      }
      
      public function skipSpriteVisibilityChecking() : void
      {
         var_2270 = true;
         render(-1,true);
      }
      
      public function resumeSpriteVisibilityChecking() : void
      {
         var_2270 = false;
      }
      
      public function dispose() : void
      {
         cleanSprites(0,true);
         if(_geometry != null)
         {
            _geometry.dispose();
            _geometry = null;
         }
         if(var_1549 != null)
         {
            var_1549 = null;
         }
         if(_bitmapDataCache != null)
         {
            _bitmapDataCache.dispose();
            _bitmapDataCache = null;
         }
         if(_roomObjectCache != null)
         {
            _roomObjectCache.dispose();
            _roomObjectCache = null;
         }
         _container = null;
         if(var_1571 != null)
         {
            while(false)
            {
               var_1571.removeChildAt(0);
            }
            var_1571 = null;
         }
         _display = null;
         var_1549 = null;
         var_1910 = [];
         if(var_2136 != null)
         {
            var_2136.dispose();
            var_2136 = null;
         }
         var _loc1_:int = 0;
         if(var_2115 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_2115.length)
            {
               cleanSprite(var_2115[_loc1_] as class_3453,true);
               _loc1_++;
            }
            var_2115 = [];
         }
         if(_eventCache != null)
         {
            _eventCache.dispose();
            _eventCache = null;
         }
         var_3124 = null;
         var_1913 = null;
         var_2227 = null;
      }
      
      public function initialize(param1:int, param2:int) : void
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         if(param2 < 1)
         {
            param2 = 1;
         }
         if(var_1549 != null)
         {
            var_1549.graphics.clear();
         }
         else
         {
            var_1549 = new Sprite();
            var_1549.name = "mask";
            if(var_2425)
            {
               var_1571.addChild(var_1549);
               _display.mask = var_1549;
            }
         }
         var_1549.graphics.beginFill(0);
         var_1549.graphics.drawRect(0,0,param1,param2);
         var_2108 = param1;
         var_2109 = param2;
      }
      
      public function roomObjectRemoved(param1:String) : void
      {
         _roomObjectCache.removeObjectCache(param1);
      }
      
      public function render(param1:int, param2:Boolean = false) : void
      {
         if(param1 == -1)
         {
            param1 == var_3054 + 1;
         }
         _skipObjectUpdate = !_skipObjectUpdate;
         if(_container == null || _geometry == null)
         {
            return;
         }
         if(param1 == var_3054)
         {
            return;
         }
         calculateUpdateInterval(param1);
         _bitmapDataCache.compress();
         var _loc7_:int = _container.getRoomObjectCount();
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc8_:String = "";
         var _loc9_:IRoomObject = null;
         if(var_2108 != var_3381 || var_2109 != var_3194)
         {
            param2 = true;
         }
         if(_display.x != var_1716 || _display.y != var_1689 || _display.scaleX != var_757)
         {
            _display.x = var_1716;
            _display.y = var_1689;
            _display.scaleX = var_757;
            _display.scaleY = var_757;
            param2 = true;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc7_)
         {
            if((_loc9_ = _container.getRoomObjectWithIndex(_loc4_)) != null)
            {
               _loc8_ = _container.getRoomObjectIdWithIndex(_loc4_);
               _loc5_ += renderObject(_loc9_,_loc8_,param1,param2,_loc5_);
            }
            _loc4_++;
         }
         var_1910.sortOn("z",16);
         var_1910.reverse();
         if(_loc5_ < var_1910.length)
         {
            var_1910.splice(_loc5_);
         }
         var _loc3_:class_3438 = null;
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc3_ = var_1910[_loc4_] as class_3438;
            if(_loc3_ != null)
            {
               updateSprite(_loc4_,_loc3_);
            }
            _loc4_++;
         }
         cleanSprites(_loc5_);
         var_3054 = param1;
         var_3381 = var_2108;
         var_3194 = var_2109;
      }
      
      private function calculateUpdateInterval(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Number = NaN;
         if(var_3054 > 0)
         {
            _loc3_ = param1 - var_3054;
            if(_loc3_ > 180)
            {
               class_14.log("Really slow frame update " + _loc3_ + "ms");
               var_3544 = _loc3_;
            }
            if(_loc3_ <= 1000)
            {
               var_2280++;
               if(var_2280 == 51)
               {
                  var_1989 = _loc3_;
                  var_3427 = var_4283;
               }
               else if(var_2280 > 51)
               {
                  _loc2_ = var_2280 - 50;
                  var_1989 = var_1989 * (_loc2_ - 1) / _loc2_ + _loc3_ / _loc2_;
                  var_3427 = var_3427 * (_loc2_ - 1) / _loc2_ + var_4283 / _loc2_;
                  if(var_2280 > 50 + 50)
                  {
                     var_2280 = 50;
                     if(!_runningSlow && var_1989 > 60)
                     {
                        _runningSlow = true;
                        class_14.log("Room canvas updating really slow - now entering frame skipping mode...");
                     }
                     else if(_runningSlow && var_1989 < 50)
                     {
                        _runningSlow = false;
                        class_14.log("Room canvas updating fast again - now entering normal frame mode...");
                     }
                     var_3544 = 0;
                  }
               }
            }
         }
      }
      
      protected function getRoomObjectCacheItem(param1:String) : class_3448
      {
         return _roomObjectCache.getObjectCache(param1);
      }
      
      private function renderObject(param1:IRoomObject, param2:String, param3:int, param4:Boolean, param5:int) : int
      {
         var _loc14_:int = 0;
         var _loc11_:BitmapData = null;
         var _loc8_:IRoomObjectSpriteVisualization;
         if((_loc8_ = param1.getVisualization() as IRoomObjectSpriteVisualization) == null)
         {
            _roomObjectCache.removeObjectCache(param2);
            return 0;
         }
         var _loc9_:class_3448;
         (_loc9_ = getRoomObjectCacheItem(param2)).objectId = param1.getId();
         var _loc20_:class_3421 = _loc9_.location;
         var _loc7_:class_3445 = _loc9_.sprites;
         var _loc10_:IVector3d;
         if((_loc10_ = _loc20_.getScreenLocation(param1,_geometry)) == null)
         {
            _roomObjectCache.removeObjectCache(param2);
            return 0;
         }
         _loc8_.update(_geometry,param3,!_loc7_.isEmpty || param4,_skipObjectUpdate && _runningSlow);
         var _loc17_:Boolean;
         if(_loc17_ = _loc20_.locationChanged)
         {
            param4 = true;
         }
         if(!_loc7_.needsUpdate(_loc8_.getInstanceId(),_loc8_.getUpdateID()) && !param4)
         {
            return _loc7_.spriteCount;
         }
         var _loc12_:int = _loc8_.spriteCount;
         var _loc16_:int = int(_loc10_.x);
         var _loc15_:int = int(_loc10_.y);
         var _loc13_:Number = Number(_loc10_.z);
         if(_loc16_ > 0)
         {
            _loc13_ += _loc16_ * 1.2e-7;
         }
         else
         {
            _loc13_ += -_loc16_ * 1.2e-7;
         }
         _loc16_ += int(var_2108 / 2);
         _loc15_ += int(var_2109 / 2);
         var _loc19_:int = 0;
         var _loc18_:class_3438 = null;
         var _loc6_:IRoomObjectSprite = null;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         _loc14_ = 0;
         while(_loc14_ < _loc12_)
         {
            if((_loc6_ = _loc8_.getSprite(_loc14_)) != null && _loc6_.visible)
            {
               if((_loc11_ = _loc6_.asset) != null)
               {
                  _loc21_ = _loc16_ + _loc6_.offsetX + var_1716;
                  _loc22_ = _loc15_ + _loc6_.offsetY + var_1689;
                  if(rectangleVisible(_loc21_,_loc22_,_loc11_.width,_loc11_.height))
                  {
                     if((_loc18_ = _loc7_.getSprite(_loc19_)) == null)
                     {
                        _loc18_ = new class_3438();
                        _loc7_.addSprite(_loc18_);
                        var_1910.push(_loc18_);
                        _loc18_.name = param2;
                     }
                     _loc18_.sprite = _loc6_;
                     if(_loc6_.spriteType == RoomObjectSpriteType.AVATAR || _loc6_.spriteType == RoomObjectSpriteType.var_3809)
                     {
                        _loc18_.sprite.libraryAssetName = param1.getAvatarLibraryAssetName();
                     }
                     _loc18_.x = _loc21_ - var_1716;
                     _loc18_.y = _loc22_ - var_1689;
                     _loc18_.z = _loc13_ + _loc6_.relativeDepth + 3.7e-11 * param5;
                     _loc19_++;
                     param5++;
                  }
               }
            }
            _loc14_++;
         }
         _loc7_.setSpriteCount(_loc19_);
         return _loc19_;
      }
      
      private function rectangleVisible(param1:int, param2:int, param3:int, param4:int) : Boolean
      {
         if(var_2270)
         {
            return true;
         }
         param1 = (param1 - var_1716) * var_757 + var_1716;
         param2 = (param2 - var_1689) * var_757 + var_1689;
         param3 *= var_757;
         param4 *= var_757;
         if(param1 < var_2108 && param1 + param3 >= 0 && (param2 < var_2109 && param2 + param4 >= 0))
         {
            if(!var_4317)
            {
               return true;
            }
            return rectangleVisibleWithExclusion(param1,param2,param3,param4);
         }
         return false;
      }
      
      private function rectangleVisibleWithExclusion(param1:int, param2:int, param3:int, param4:int) : Boolean
      {
         if(param1 < 0)
         {
            param3 += param1;
            param1 = 0;
         }
         if(param2 < 0)
         {
            param4 += param2;
            param2 = 0;
         }
         if(param1 + param3 >= var_2108)
         {
            param3 -= var_2108 + 1 - (param1 + param3);
         }
         if(param2 + param4 >= var_2109)
         {
            param4 -= var_2109 + 1 - (param2 + param4);
         }
         for each(var _loc5_ in var_4026)
         {
            if(param1 >= _loc5_.left && param1 + param3 < _loc5_.right && param2 >= _loc5_.top && param2 + param4 < _loc5_.bottom)
            {
               return false;
            }
         }
         return true;
      }
      
      protected function getSprite(param1:int) : class_3453
      {
         if(param1 < 0 || param1 >= var_2674)
         {
            return null;
         }
         return _display.getChildAt(param1) as class_3453;
      }
      
      private function createSprite(param1:class_3438, param2:int = -1) : void
      {
         var _loc4_:class_3453 = null;
         var _loc3_:IRoomObjectSprite = param1.sprite;
         if(false)
         {
            _loc4_ = var_2115.pop() as class_3453;
         }
         if(_loc4_ == null)
         {
            _loc4_ = new class_3453();
         }
         _loc4_.x = param1.x;
         _loc4_.y = param1.y;
         _loc4_.offsetRefX = _loc3_.offsetX;
         _loc4_.offsetRefY = _loc3_.offsetY;
         _loc4_.identifier = param1.name;
         _loc4_.alpha = _loc3_.alpha / 255;
         _loc4_.tag = _loc3_.tag;
         _loc4_.blendMode = _loc3_.blendMode;
         _loc4_.filters = _loc3_.filters;
         _loc4_.varyingDepth = _loc3_.varyingDepth;
         _loc4_.clickHandling = _loc3_.clickHandling;
         _loc4_.smoothing = false;
         _loc4_.pixelSnapping = "always";
         _loc4_.bitmapData = getBitmapData(_loc3_.asset,_loc3_.assetName,_loc3_.flipH,_loc3_.flipV,_loc3_.color);
         updateEnterRoomEffect(_loc4_,_loc3_);
         _loc4_.alphaTolerance = _loc3_.alphaTolerance;
         if(param2 < 0 || param2 >= var_2674)
         {
            _display.addChild(_loc4_);
            var_2674++;
         }
         else
         {
            _display.addChildAt(_loc4_,param2);
         }
         var_2560++;
      }
      
      private function updateSprite(param1:int, param2:class_3438) : Boolean
      {
         var _loc5_:Number = NaN;
         var _loc4_:BitmapData = null;
         if(param1 >= var_2674)
         {
            createSprite(param2);
            return true;
         }
         var _loc3_:IRoomObjectSprite = param2.sprite;
         var _loc6_:class_3453;
         if((_loc6_ = getSprite(param1)) != null)
         {
            if(_loc6_.varyingDepth != _loc3_.varyingDepth)
            {
               if(_loc6_.varyingDepth && !_loc3_.varyingDepth)
               {
                  _display.removeChildAt(param1);
                  var_2115.push(_loc6_);
                  return updateSprite(param1,param2);
               }
               createSprite(param2,param1);
               return true;
            }
            if(_loc6_.needsUpdate(_loc3_.instanceId,_loc3_.updateId) || RoomEnterEffect.isVisualizationOn())
            {
               _loc6_.alphaTolerance = _loc3_.alphaTolerance;
               _loc5_ = _loc3_.alpha / 255;
               if(_loc6_.alpha != _loc5_)
               {
                  _loc6_.alpha = _loc5_;
               }
               _loc6_.identifier = param2.name;
               _loc6_.tag = _loc3_.tag;
               _loc6_.varyingDepth = _loc3_.varyingDepth;
               _loc6_.blendMode = _loc3_.blendMode;
               _loc6_.clickHandling = _loc3_.clickHandling;
               _loc6_.filters = _loc3_.filters;
               _loc4_ = getBitmapData(_loc3_.asset,_loc3_.assetName,_loc3_.flipH,_loc3_.flipV,_loc3_.color);
               if(_loc6_.bitmapData != _loc4_)
               {
                  _loc6_.bitmapData = _loc4_;
               }
               updateEnterRoomEffect(_loc6_,_loc3_);
            }
            if(_loc6_.x != param2.x)
            {
               _loc6_.x = param2.x;
            }
            if(_loc6_.y != param2.y)
            {
               _loc6_.y = param2.y;
            }
            _loc6_.offsetRefX = _loc3_.offsetX;
            _loc6_.offsetRefY = _loc3_.offsetY;
            return true;
         }
         return false;
      }
      
      private function updateEnterRoomEffect(param1:class_3453, param2:IRoomObjectSprite) : void
      {
         if(!RoomEnterEffect.isVisualizationOn() || param1.bitmapData == null || param2 == null)
         {
            return;
         }
         switch(param2.spriteType)
         {
            case RoomObjectSpriteType.var_3809:
               break;
            case RoomObjectSpriteType.ROOM_PLANE:
               param1.alpha = RoomEnterEffect.getDelta(0.9);
               break;
            case RoomObjectSpriteType.AVATAR:
               param1.alpha = RoomEnterEffect.getDelta(0.5);
               break;
            default:
               param1.alpha = RoomEnterEffect.getDelta(0.1);
         }
      }
      
      private function cleanSprites(param1:int, param2:Boolean = false) : void
      {
         var _loc4_:int = 0;
         if(_display == null)
         {
            return;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         var _loc3_:class_3453 = null;
         if(param1 < var_2560 || var_2560 == 0)
         {
            _loc4_ = var_2674 - 1;
            while(_loc4_ >= param1)
            {
               _loc3_ = getSprite(_loc4_);
               cleanSprite(_loc3_,param2);
               _loc4_--;
            }
         }
         var_2560 = param1;
      }
      
      private function cleanSprite(param1:class_3453, param2:Boolean) : void
      {
         if(param1 != null)
         {
            if(!param2)
            {
               param1.bitmapData = null;
            }
            else
            {
               param1.dispose();
            }
         }
      }
      
      private function getSortableSprite(param1:int) : class_3438
      {
         if(param1 < 0 || param1 >= var_1910.length)
         {
            return null;
         }
         return var_1910[param1] as class_3438;
      }
      
      private function getBitmapData(param1:BitmapData, param2:String, param3:Boolean, param4:Boolean, param5:int) : BitmapData
      {
         param5 &= 16777215;
         if(!param3 && !param4 && param5 == 16777215)
         {
            return param1;
         }
         var _loc7_:class_3496 = null;
         var _loc6_:String = "";
         if((param3 || param4) && param5 != 16777215)
         {
            _loc6_ = param2 + " " + param5 + (param3 ? " FH" : "") + (param4 ? " FV" : "");
            if(param2.length > 0)
            {
               _loc7_ = _bitmapDataCache.getBitmapData(_loc6_);
            }
            if(_loc7_ == null)
            {
               if((_loc7_ = getColoredBitmapData(param1,param2,param5)) != null)
               {
                  _loc7_ = getFlippedBitmapData(_loc7_,param2,true,param3,param4);
                  if(param2.length > 0)
                  {
                     _bitmapDataCache.addBitmapData(_loc6_,_loc7_);
                  }
                  return _loc7_;
               }
               if((_loc7_ = getFlippedBitmapData(param1,param2,true,param3,param4)) != null)
               {
                  _loc7_ = getColoredBitmapData(_loc7_,"",param5,true);
                  if(param2.length > 0)
                  {
                     _bitmapDataCache.addBitmapData(_loc6_,_loc7_);
                  }
                  return _loc7_;
               }
               _loc7_ = getColoredBitmapData(param1,param2,param5,true);
               _loc7_ = getFlippedBitmapData(_loc7_,param2,true,param3,param4);
               if(param2.length > 0)
               {
                  _bitmapDataCache.addBitmapData(_loc6_,_loc7_);
               }
            }
         }
         else if(param3 || param4)
         {
            _loc7_ = getFlippedBitmapData(param1,param2,true,param3,param4);
         }
         else
         {
            if(param5 == 16777215)
            {
               return param1;
            }
            _loc7_ = getColoredBitmapData(param1,param2,param5,true);
         }
         return _loc7_;
      }
      
      private function getFlippedBitmapData(param1:BitmapData, param2:String, param3:Boolean = false, param4:Boolean = true, param5:Boolean = false) : class_3496
      {
         var _loc6_:String = param2 + (param4 ? " FH" : "") + (param5 ? " FV" : "");
         var _loc7_:class_3496 = null;
         if(param2.length > 0)
         {
            _loc7_ = _bitmapDataCache.getBitmapData(_loc6_);
            if(!param3)
            {
               return _loc7_;
            }
         }
         if(_loc7_ == null)
         {
            try
            {
               _loc7_ = new class_3496(param1.width,param1.height,true,16777215);
            }
            catch(e:Error)
            {
               _loc7_ = new class_3496(1,1,true,16777215);
            }
            var_2227.identity();
            if(param4)
            {
               var_2227.scale(-1,1);
               var_2227.translate(param1.width,0);
            }
            if(param5)
            {
               var_2227.scale(1,-1);
               var_2227.translate(0,param1.height);
            }
            _loc7_.draw(param1,var_2227);
            if(param2.length > 0)
            {
               _bitmapDataCache.addBitmapData(_loc6_,_loc7_);
            }
         }
         return _loc7_;
      }
      
      private function getColoredBitmapData(param1:BitmapData, param2:String, param3:int, param4:Boolean = false) : class_3496
      {
         var _loc5_:* = 0;
         var _loc10_:* = 0;
         var _loc6_:* = 0;
         var _loc11_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc7_:String = param2 + " " + param3;
         var _loc9_:class_3496 = null;
         if(param2.length > 0)
         {
            _loc9_ = _bitmapDataCache.getBitmapData(_loc7_);
            if(!param4)
            {
               return _loc9_;
            }
         }
         if(_loc9_ == null)
         {
            _loc5_ = param3 >> 16 & 255;
            _loc10_ = param3 >> 8 & 255;
            _loc6_ = param3 & 255;
            _loc11_ = _loc5_ / 255;
            _loc8_ = _loc10_ / 255;
            _loc12_ = _loc6_ / 255;
            try
            {
               (_loc9_ = new class_3496(param1.width,param1.height,true,16777215)).copyPixels(param1,param1.rect,ZERO_POINT);
            }
            catch(e:Error)
            {
               _loc9_ = new class_3496(1,1,true,16777215);
            }
            var_1913.redMultiplier = _loc11_;
            var_1913.greenMultiplier = _loc8_;
            var_1913.blueMultiplier = _loc12_;
            _loc9_.colorTransform(_loc9_.rect,var_1913);
            if(param2.length > 0)
            {
               _bitmapDataCache.addBitmapData(_loc7_,_loc9_);
            }
         }
         return _loc9_;
      }
      
      protected function getObjectId(param1:class_3453) : String
      {
         var _loc2_:* = null;
         if(param1 != null)
         {
            return param1.identifier;
         }
         return "";
      }
      
      public function handleMouseEvent(param1:int, param2:int, param3:String, param4:Boolean, param5:Boolean, param6:Boolean, param7:Boolean) : Boolean
      {
         param1 -= var_1716;
         param2 -= var_1689;
         _mouseLocation.x = param1 / var_757;
         _mouseLocation.y = param2 / var_757;
         if(var_2671 > 0 && param3 == "mouseMove")
         {
            return var_3643;
         }
         var_3643 = checkMouseHits(param1 / var_757,param2 / var_757,param3,param4,param5,param6,param7);
         var_2671++;
         return var_3643;
      }
      
      protected function createMouseEvent(param1:int, param2:int, param3:int, param4:int, param5:String, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean) : RoomSpriteMouseEvent
      {
         var _loc13_:Number = param1 - var_2108 / 2;
         var _loc14_:Number = param2 - var_2109 / 2;
         var _loc11_:String = "canvas_" + var_247;
         var _loc12_:* = null;
         return new RoomSpriteMouseEvent(param5,_loc11_ + "_" + var_3591,_loc11_,param6,_loc13_,_loc14_,param3,param4,param8,param7,param9,param10);
      }
      
      private function checkMouseClickHits(param1:Number, param2:Number, param3:Boolean, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false) : Boolean
      {
         var _loc10_:String = null;
         var _loc11_:Boolean = false;
         var _loc15_:String = "";
         var _loc12_:class_3453 = null;
         var _loc14_:RoomSpriteMouseEvent = null;
         var _loc9_:String = "click";
         if(param3)
         {
            _loc9_ = "doubleClick";
         }
         var _loc13_:* = [];
         var _loc8_:int = 0;
         _loc8_ = activeSpriteCount - 1;
         while(_loc8_ >= 0)
         {
            if((_loc12_ = getSprite(_loc8_)) != null && _loc12_.clickHandling)
            {
               if(_loc12_.hitTest(param1 - _loc12_.x,param2 - _loc12_.y))
               {
                  _loc15_ = getObjectId(_loc12_);
                  if(_loc13_.indexOf(_loc15_) < 0)
                  {
                     _loc10_ = _loc12_.tag;
                     _loc14_ = createMouseEvent(param1,param2,param1 - _loc12_.x,param2 - _loc12_.y,_loc9_,_loc10_,param4,param5,param6,param7);
                     bufferMouseEvent(_loc14_,_loc15_);
                     _loc13_.push(_loc15_);
                  }
               }
               _loc11_ = true;
            }
            _loc8_--;
         }
         processMouseEvents();
         return _loc11_;
      }
      
      private function checkMouseHits(param1:int, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false) : Boolean
      {
         var _loc12_:String = null;
         var _loc16_:String = null;
         var _loc11_:int = 0;
         var _loc13_:Boolean = false;
         var _loc18_:String = "";
         var _loc14_:class_3453 = null;
         var _loc17_:RoomSpriteMouseEvent = null;
         var _loc15_:* = [];
         var _loc8_:class_3446 = null;
         var _loc10_:int = 0;
         _loc10_ = activeSpriteCount - 1;
         while(_loc10_ >= 0)
         {
            if((_loc14_ = getSprite(_loc10_) as class_3453) != null && _loc14_.hitTestPoint(param1 - _loc14_.x,param2 - _loc14_.y))
            {
               if(!(_loc14_.clickHandling && (param3 == "click" || param3 == "doubleClick")))
               {
                  _loc18_ = getObjectId(_loc14_);
                  if(_loc15_.indexOf(_loc18_) < 0)
                  {
                     _loc12_ = _loc14_.tag;
                     if((_loc8_ = var_2136.getValue(_loc18_) as class_3446) != null)
                     {
                        if(_loc8_.spriteTag != _loc12_)
                        {
                           _loc17_ = createMouseEvent(0,0,0,0,"rollOut",_loc8_.spriteTag,param4,param5,param6,param7);
                           bufferMouseEvent(_loc17_,_loc18_);
                        }
                     }
                     if(param3 == "mouseMove" && (_loc8_ == null || _loc8_.spriteTag != _loc12_))
                     {
                        _loc17_ = createMouseEvent(param1,param2,param1 - _loc14_.x,param2 - _loc14_.y,"rollOver",_loc12_,param4,param5,param6,param7);
                     }
                     else
                     {
                        (_loc17_ = createMouseEvent(param1,param2,param1 - _loc14_.x,param2 - _loc14_.y,param3,_loc12_,param4,param5,param6,param7)).spriteOffsetX = _loc14_.offsetRefX;
                        _loc17_.spriteOffsetY = _loc14_.offsetRefY;
                     }
                     if(_loc8_ == null)
                     {
                        (_loc8_ = new class_3446()).objectId = _loc18_;
                        var_2136.add(_loc18_,_loc8_);
                     }
                     _loc8_.spriteTag = _loc12_;
                     if(param3 != "mouseMove" || param1 != var_4085 || param2 != var_4041)
                     {
                        bufferMouseEvent(_loc17_,_loc18_);
                     }
                     _loc15_.push(_loc18_);
                  }
                  _loc13_ = true;
               }
            }
            _loc10_--;
         }
         var _loc9_:Array = var_2136.getKeys();
         _loc10_ = 0;
         while(_loc10_ < _loc9_.length)
         {
            _loc16_ = _loc9_[_loc10_] as String;
            if((_loc11_ = _loc15_.indexOf(_loc16_)) >= 0)
            {
               _loc9_[_loc10_] = null;
            }
            _loc10_++;
         }
         _loc10_ = 0;
         while(_loc10_ < _loc9_.length)
         {
            if((_loc18_ = _loc9_[_loc10_] as String) != null)
            {
               if((_loc8_ = var_2136.remove(_loc18_) as class_3446) != null)
               {
                  _loc17_ = createMouseEvent(0,0,0,0,"rollOut",_loc8_.spriteTag,param4,param5,param6,param7);
                  bufferMouseEvent(_loc17_,_loc18_);
               }
            }
            _loc10_++;
         }
         processMouseEvents();
         var_4085 = param1;
         var_4041 = param2;
         return _loc13_;
      }
      
      protected function bufferMouseEvent(param1:RoomSpriteMouseEvent, param2:String) : void
      {
         if(_eventCache != null && param1 != null)
         {
            _eventCache.remove(param2);
            _eventCache.add(param2,param1);
         }
      }
      
      protected function processMouseEvents() : void
      {
         var _loc3_:int = 0;
         var _loc5_:String = null;
         var _loc4_:RoomSpriteMouseEvent = null;
         var _loc6_:IRoomObject = null;
         var _loc1_:IRoomObjectMouseHandler = null;
         if(_container == null || _eventCache == null)
         {
            return;
         }
         var _loc2_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if(_eventCache == null)
            {
               return;
            }
            _loc5_ = _eventCache.getKey(_loc3_);
            _loc4_ = _eventCache.getWithIndex(_loc3_);
            if(_loc5_ != null && _loc4_ != null)
            {
               if((_loc6_ = _container.getRoomObject(_loc5_)) != null)
               {
                  if(var_3124 != null)
                  {
                     var_3124.processRoomCanvasMouseEvent(_loc4_,_loc6_,geometry);
                  }
                  else
                  {
                     _loc1_ = _loc6_.getMouseHandler();
                     if(_loc1_ != null)
                     {
                        _loc1_.mouseEvent(_loc4_,_geometry);
                     }
                  }
               }
            }
            _loc3_++;
         }
         if(_eventCache)
         {
            _eventCache.reset();
         }
      }
      
      public function update() : void
      {
         if(var_2671 == 0)
         {
            checkMouseHits(_mouseLocation.x,_mouseLocation.y,"mouseMove");
         }
         var_2671 = 0;
         var_3591++;
      }
      
      private function clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = false;
         if(param1.type == "click" || param1.type == "doubleClick")
         {
            _loc2_ = param1.type == "doubleClick";
            checkMouseClickHits(param1.localX,param1.localY,_loc2_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
         }
      }
      
      public function getId() : int
      {
         return var_247;
      }
   }
}
