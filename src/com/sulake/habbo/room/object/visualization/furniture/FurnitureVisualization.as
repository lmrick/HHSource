package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.habbo.utils.StringBuffer;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   
   public class FurnitureVisualization extends RoomObjectSpriteVisualization
   {
      
      protected static const Z_MULTIPLIER:Number = Math.sqrt(0.5);
      
      private static var var_2397:StringBuffer;
      
      private static var var_1755:Array;
       
      
      private const const_603:int = 41;
      
      private var _lastUpdateTime:int = -1000;
      
      private var _direction:int;
      
      private var var_4035:Number = NaN;
      
      private var _selectedColor:int = -1;
      
      protected var var_2486:Number = 1;
      
      private var var_3178:String = null;
      
      private var var_3699:Boolean = false;
      
      private var var_45:com.sulake.habbo.room.object.visualization.furniture.FurnitureVisualizationData = null;
      
      private var var_271:String = "";
      
      private var var_625:Array;
      
      private var _assetNamesFrame:Array;
      
      private var var_4145:Number = 0;
      
      private var var_3527:int = -1;
      
      private var _cacheDirection:int = -1;
      
      private var var_2050:Array;
      
      private var var_2057:Array;
      
      private var _spriteColors:Array;
      
      private var var_2064:Array;
      
      private var var_2069:Array;
      
      private var var_2042:Array;
      
      private var var_2095:Array;
      
      private var var_2031:Array;
      
      protected var var_2877:Boolean = true;
      
      protected var var_2182:int = 0;
      
      protected var var_3285:int = -1;
      
      private var _updatedLayers:int = 0;
      
      private var var_4017:Number = 0;
      
      public function FurnitureVisualization()
      {
         var_625 = [];
         _assetNamesFrame = [];
         var_2050 = [];
         var_2057 = [];
         _spriteColors = [];
         var_2064 = [];
         var_2069 = [];
         var_2042 = [];
         var_2095 = [];
         var_2031 = [];
         super();
         reset();
         if(!var_2397)
         {
            var_2397 = new StringBuffer();
            var_1755 = [];
            var_1755[0] = null;
            var_1755[1] = "_";
            var_1755[2] = null;
            var_1755[3] = "_";
            var_1755[4] = null;
            var_1755[5] = "_";
            var_1755[6] = null;
            var_1755[7] = "_";
         }
      }
      
      protected function set direction(param1:int) : void
      {
         _direction = param1;
      }
      
      protected function get direction() : int
      {
         return _direction;
      }
      
      protected function get type() : String
      {
         return var_271;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_45 = null;
         var_625 = null;
         _assetNamesFrame = null;
         var_2050 = null;
         var_2057 = null;
         _spriteColors = null;
         var_2064 = null;
         var_2069 = null;
         var_2042 = null;
         var_2095 = null;
         var_2031 = null;
      }
      
      override protected function reset() : void
      {
         super.reset();
         direction = -1;
         var_45 = null;
         var_625 = [];
         _assetNamesFrame = [];
         var_2050 = [];
         var_2057 = [];
         _spriteColors = [];
         var_2064 = [];
         var_2069 = [];
         var_2042 = [];
         var_2095 = [];
         var_2031 = [];
         this.createSprites(0);
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         reset();
         if(param1 == null || !(param1 is com.sulake.habbo.room.object.visualization.furniture.FurnitureVisualizationData))
         {
            return false;
         }
         var_45 = param1 as com.sulake.habbo.room.object.visualization.furniture.FurnitureVisualizationData;
         var_271 = var_45.getType();
         return true;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean, param4:Boolean) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param2 < _lastUpdateTime + 41)
         {
            return;
         }
         _lastUpdateTime += 41;
         if(_lastUpdateTime + 41 < param2)
         {
            _lastUpdateTime = param2 - 41;
         }
         var _loc5_:Boolean = false;
         var _loc6_:Number = param1.scale;
         if(updateObject(_loc6_,param1.direction.x))
         {
            _loc5_ = true;
         }
         if(updateModel(_loc6_))
         {
            _loc5_ = true;
         }
         var _loc7_:* = 0;
         if(param4)
         {
            _updatedLayers |= updateAnimation(_loc6_);
         }
         else
         {
            _loc7_ = updateAnimation(_loc6_) | _updatedLayers;
            _updatedLayers = 0;
         }
         if(_loc5_ || _loc7_ != 0)
         {
            updateSprites(_loc6_,_loc5_,_loc7_);
            var_1545 = _loc6_;
            increaseUpdateId();
         }
      }
      
      protected function updateSprites(param1:int, param2:Boolean, param3:int) : void
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         if(var_2182 != spriteCount)
         {
            createSprites(var_2182);
         }
         if(param2)
         {
            _loc5_ = spriteCount - 1;
            while(_loc5_ >= 0)
            {
               updateSprite(param1,_loc5_);
               _loc5_--;
            }
         }
         else
         {
            _loc4_ = 0;
            while(param3 > 0)
            {
               if(param3 & 1)
               {
                  updateSprite(param1,_loc4_);
               }
               _loc4_++;
               param3 >>= 1;
            }
         }
         var_2877 = false;
      }
      
      protected function updateSprite(param1:int, param2:int) : void
      {
         var _loc7_:IGraphicAsset = null;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:String = getSpriteAssetName(param1,param2);
         var _loc6_:IRoomObjectSprite;
         if((_loc6_ = getSprite(param2)) != null && _loc5_ != null)
         {
            if((_loc7_ = getAsset(_loc5_,param2)) != null && _loc7_.asset != null)
            {
               _loc6_.visible = true;
               _loc6_.objectType = var_271;
               _loc6_.asset = _loc7_.asset.content as BitmapData;
               if(_loc7_.asset.content == null)
               {
                  var_1595++;
               }
               _loc6_.flipH = _loc7_.flipH;
               _loc6_.flipV = _loc7_.flipV;
               _loc6_.direction = _direction;
               _loc3_ = 0;
               if(param2 != var_3285)
               {
                  _loc6_.tag = getSpriteTag(param1,_direction,param2);
                  _loc6_.alpha = getSpriteAlpha(param1,_direction,param2);
                  _loc6_.color = getSpriteColor(param1,param2,_selectedColor);
                  _loc6_.offsetX = _loc7_.offsetX + getSpriteXOffset(param1,_direction,param2);
                  _loc6_.offsetY = _loc7_.offsetY + getSpriteYOffset(param1,_direction,param2);
                  _loc6_.alphaTolerance = getSpriteMouseCapture(param1,_direction,param2) ? 128 : 256;
                  _loc6_.blendMode = getBlendMode(getSpriteInk(param1,_direction,param2));
                  _loc3_ = getSpriteZOffset(param1,_direction,param2);
                  _loc3_ -= param2 * 0.001;
               }
               else
               {
                  _loc6_.offsetX = _loc7_.offsetX;
                  _loc6_.offsetY = _loc7_.offsetY + getSpriteYOffset(param1,_direction,param2);
                  _loc4_ = (_loc4_ = 48) * var_2486;
                  _loc6_.alpha = _loc4_;
                  _loc6_.alphaTolerance = 256;
                  _loc3_ = 1;
               }
               _loc3_ *= Z_MULTIPLIER;
               _loc6_.relativeDepth = _loc3_;
               _loc6_.assetName = _loc7_.assetName;
               _loc6_.libraryAssetName = getLibraryAssetNameForSprite(_loc7_,_loc6_);
               _loc6_.assetPosture = getPostureForAssetFile(param1,_loc7_.libraryAssetName);
               _loc6_.clickHandling = var_3699;
            }
            else
            {
               resetSprite(_loc6_);
            }
         }
         else if(_loc6_ != null)
         {
            resetSprite(_loc6_);
         }
      }
      
      protected function getLibraryAssetNameForSprite(param1:IGraphicAsset, param2:IRoomObjectSprite) : String
      {
         return param1.libraryAssetName;
      }
      
      private function resetSprite(param1:IRoomObjectSprite) : void
      {
         param1.asset = null;
         param1.assetName = "";
         param1.assetPosture = null;
         param1.tag = "";
         param1.flipH = false;
         param1.flipV = false;
         param1.offsetX = 0;
         param1.offsetY = 0;
         param1.relativeDepth = 0;
         param1.clickHandling = false;
      }
      
      protected function getBlendMode(param1:int) : String
      {
         var _loc2_:String = "normal";
         switch(param1)
         {
            case 0:
               break;
            case 1:
               _loc2_ = "add";
               break;
            case 2:
               _loc2_ = "subtract";
               break;
            case 3:
               _loc2_ = "darken";
         }
         return _loc2_;
      }
      
      protected function updateObject(param1:Number, param2:Number) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return false;
         }
         if(var_2503 != _loc3_.getUpdateID() || param1 != var_1545 || param2 != var_4035)
         {
            _loc4_ = ((_loc4_ = _loc3_.getDirection().x - (param2 + 135)) % 360 + 360) % 360;
            if(var_45 != null)
            {
               direction = _loc5_ = var_45.getDirectionValue(param1,_loc4_);
            }
            var_2503 = _loc3_.getUpdateID();
            var_4035 = param2;
            var_1545 = param1;
            updateAssetAndSpriteCache(param1,_direction);
            return true;
         }
         return false;
      }
      
      protected function updateModel(param1:Number) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc2_:IRoomObject = object;
         if(_loc2_ == null)
         {
            return false;
         }
         var _loc3_:IRoomObjectModel = _loc2_.getModel();
         if(_loc3_ == null)
         {
            return false;
         }
         if(var_1595 != _loc3_.getUpdateID())
         {
            _selectedColor = _loc3_.getNumber("furniture_color");
            _loc4_ = Number(_loc3_.getNumber("furniture_alpha_multiplier"));
            if(isNaN(_loc4_))
            {
               _loc4_ = 1;
            }
            if(_loc4_ != var_2486)
            {
               var_2486 = _loc4_;
               var_2877 = true;
            }
            var_3178 = getAdClickUrl(_loc3_);
            var_3699 = var_3178 != null && var_3178 != "" && var_3178.indexOf("http") == 0;
            var_4017 = _loc3_.getNumber("furniture_lift_amount");
            var_1595 = _loc3_.getUpdateID();
            return true;
         }
         return false;
      }
      
      protected function getAdClickUrl(param1:IRoomObjectModel) : String
      {
         return param1.getString("furniture_ad_url");
      }
      
      protected function updateAnimation(param1:Number) : int
      {
         return 0;
      }
      
      private function updateAssetAndSpriteCache(param1:Number, param2:int) : void
      {
         if(_cacheDirection != param2 || var_4145 != param1)
         {
            var_625 = [];
            _assetNamesFrame = [];
            var_2050 = [];
            var_2057 = [];
            _spriteColors = [];
            var_2064 = [];
            var_2069 = [];
            var_2042 = [];
            var_2095 = [];
            var_2031 = [];
            _cacheDirection = param2;
            var_4145 = param1;
            var_3527 = getSize(param1);
            updateLayerCount(var_45.getLayerCount(param1) + getAdditionalSpriteCount());
         }
      }
      
      protected function updateLayerCount(param1:int) : void
      {
         var_2182 = param1;
         var_3285 = var_2182 - getAdditionalSpriteCount();
      }
      
      protected function getAdditionalSpriteCount() : int
      {
         return 1;
      }
      
      protected function getFrameNumber(param1:int, param2:int) : int
      {
         return 0;
      }
      
      protected function getPostureForAssetFile(param1:int, param2:String) : String
      {
         return null;
      }
      
      protected function getAsset(param1:String, param2:int = -1) : IGraphicAsset
      {
         var _loc3_:* = null;
         if(assetCollection != null)
         {
            return assetCollection.getAsset(param1);
         }
         return null;
      }
      
      protected function getSpriteAssetName(param1:int, param2:int) : String
      {
         if(var_45 == null || param2 >= com.sulake.habbo.room.object.visualization.furniture.FurnitureVisualizationData.LAYER_NAMES.length)
         {
            return "";
         }
         var _loc4_:String = "null";
         var _loc3_:* = false;
         if(_loc4_ == null || _loc4_.length == 0)
         {
            _loc4_ = getSpriteAssetNameWithoutFrame(param1,param2,true);
            _loc3_ = var_3527 != 1;
         }
         if(_loc3_)
         {
            _loc4_ += getFrameNumber(param1,param2);
         }
         return _loc4_;
      }
      
      protected function getSpriteAssetNameWithoutFrame(param1:int, param2:int, param3:Boolean) : String
      {
         var _loc7_:String = null;
         var _loc4_:int;
         var _loc5_:* = (_loc4_ = param3 ? var_3527 : getSize(param1)) == 1;
         if(param2 != var_3285)
         {
            _loc7_ = String(com.sulake.habbo.room.object.visualization.furniture.FurnitureVisualizationData.LAYER_NAMES[param2]);
         }
         else
         {
            _loc7_ = "sd";
         }
         if(_loc5_)
         {
            return var_271 + "_icon_" + _loc7_;
         }
         var_1755[0] = var_271;
         var_1755[2] = _loc4_;
         var_1755[4] = _loc7_;
         var_1755[6] = _direction;
         var_2397.length = 0;
         var_2397.appendStringArray(var_1755);
         var _loc6_:String = var_2397.toString();
         if(param3)
         {
            var_625[param2] = _loc6_;
            _assetNamesFrame[param2] = !_loc5_;
         }
         return _loc6_;
      }
      
      protected function getSpriteTag(param1:int, param2:int, param3:int) : String
      {
         if(false)
         {
            return var_2050[param3];
         }
         if(var_45 == null)
         {
            return "";
         }
         var _loc4_:String = var_45.getTag(param1,param2,param3);
         var_2050[param3] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteAlpha(param1:int, param2:int, param3:int) : int
      {
         if(false && !var_2877)
         {
            return var_2057[param3];
         }
         if(var_45 == null)
         {
            return 255;
         }
         var _loc4_:int = (_loc4_ = var_45.getAlpha(param1,param2,param3)) * var_2486;
         var_2057[param3] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteColor(param1:int, param2:int, param3:int) : int
      {
         if(false)
         {
            return _spriteColors[param2];
         }
         if(var_45 == null)
         {
            return 16777215;
         }
         var _loc4_:int = var_45.getColor(param1,param2,param3);
         _spriteColors[param2] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteXOffset(param1:int, param2:int, param3:int) : int
      {
         if(false)
         {
            return var_2064[param3];
         }
         if(var_45 == null)
         {
            return 0;
         }
         var _loc4_:int = var_45.getXOffset(param1,param2,param3);
         var_2064[param3] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteYOffset(param1:int, param2:int, param3:int) : int
      {
         var _loc4_:int = 0;
         if(param3 != var_3285)
         {
            if(false)
            {
               return var_2069[param3];
            }
            if(var_45 != null)
            {
               _loc4_ = var_45.getYOffset(param1,param2,param3);
               var_2069[param3] = _loc4_;
               return _loc4_;
            }
            return 0;
         }
         return Math.ceil(var_4017 * (param1 / 2));
      }
      
      protected function getSpriteMouseCapture(param1:int, param2:int, param3:int) : Boolean
      {
         if(false)
         {
            return var_2095[param3];
         }
         if(var_45 == null)
         {
            return true;
         }
         var _loc4_:* = !var_45.getIgnoreMouse(param1,param2,param3);
         var_2095[param3] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteInk(param1:int, param2:int, param3:int) : int
      {
         if(false)
         {
            return var_2031[param3];
         }
         if(var_45 == null)
         {
            return 0;
         }
         var _loc4_:int = var_45.getInk(param1,param2,param3);
         var_2031[param3] = _loc4_;
         return _loc4_;
      }
      
      protected function getSpriteZOffset(param1:int, param2:int, param3:int) : Number
      {
         if(false)
         {
            return var_2042[param3];
         }
         if(var_45 == null)
         {
            return 0;
         }
         var _loc4_:Number = var_45.getZOffset(param1,param2,param3);
         var_2042[param3] = _loc4_;
         return _loc4_;
      }
      
      protected function getSize(param1:int) : int
      {
         if(var_45 != null)
         {
            return var_45.getSize(param1);
         }
         return param1;
      }
      
      protected function get data() : com.sulake.habbo.room.object.visualization.furniture.FurnitureVisualizationData
      {
         return var_45;
      }
   }
}
