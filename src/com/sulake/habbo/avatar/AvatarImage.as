package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.avatar.actions.ActionDefinition;
   import com.sulake.habbo.avatar.actions.ActiveActionData;
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.actions.class_3311;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.animation.Animation;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.animation.class_3292;
   import com.sulake.habbo.avatar.animation.class_3341;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.structure.AvatarCanvas;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import com.sulake.habbo.utils.class_3310;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class AvatarImage implements class_3156, class_13, com.sulake.habbo.avatar.class_3157
   {
      
      private static const CHANNELS_EQUAL:String = "CHANNELS_EQUAL";
      
      private static const CHANNELS_UNIQUE:String = "CHANNELS_UNIQUE";
      
      private static const CHANNELS_RED:String = "CHANNELS_RED";
      
      private static const CHANNELS_GREEN:String = "CHANNELS_GREEN";
      
      private static const CHANNELS_BLUE:String = "CHANNELS_BLUE";
      
      private static const CHANNELS_SATURATED:String = "CHANNELS_SATURATED";
      
      private static const DEFAULT_ACTION:String = "Default";
      
      private static const DEFAULT_DIR:int = 2;
      
      private static const DEFAULT_AVATAR_SET:String = "full";
      
      private static const DEFAULT_POINT:Point = new Point(0,0);
       
      
      protected var var_1469:com.sulake.habbo.avatar.AvatarStructure;
      
      protected var var_757:String;
      
      protected var _mainDirection:int;
      
      protected var _headDirection:int;
      
      protected var _mainAction:class_3311;
      
      protected var var_311:Boolean;
      
      protected var var_2087:Array;
      
      protected var _assets:AssetAliasCollection;
      
      protected var _cache:AvatarImageCache;
      
      protected var var_427:com.sulake.habbo.avatar.AvatarFigureContainer;
      
      protected var var_1984:class_3341;
      
      protected var var_474:Array;
      
      protected var var_973:BitmapData;
      
      private var _defaultAction:class_3311;
      
      private var var_1967:int = 0;
      
      private var _directionOffset:int = 0;
      
      private var var_1601:Boolean;
      
      private var var_1551:Vector.<ISpriteDataContainer>;
      
      private var var_2466:Boolean;
      
      private var var_2787:Boolean = false;
      
      private var var_2448:Boolean = false;
      
      private var var_1713:Array;
      
      private var var_2605:String;
      
      private var var_1900:String;
      
      private var _fullImageCache:class_24;
      
      protected var var_2891:Boolean = false;
      
      private var _useFullImageCache:Boolean;
      
      private var var_2653:int = -1;
      
      private var var_3840:int;
      
      private var var_3463:Array;
      
      private var _cachedBodyPartsDirection:int = -1;
      
      private var var_4054:String = null;
      
      private var var_4173:String = null;
      
      private var var_3664:com.sulake.habbo.avatar.EffectAssetDownloadManager;
      
      private var var_3646:com.sulake.habbo.avatar.class_3157;
      
      public function AvatarImage(param1:com.sulake.habbo.avatar.AvatarStructure, param2:AssetAliasCollection, param3:com.sulake.habbo.avatar.AvatarFigureContainer, param4:String, param5:com.sulake.habbo.avatar.EffectAssetDownloadManager, param6:com.sulake.habbo.avatar.class_3157)
      {
         var_2087 = [];
         var_474 = [];
         var_3463 = [];
         super();
         var_1601 = true;
         var_3664 = param5;
         var_1469 = param1;
         _assets = param2;
         var_757 = param4;
         var_3646 = param6;
         var _loc7_:Boolean = false;
         if(var_757 == null)
         {
            var_757 = "h";
         }
         else if(var_757 == "h_50")
         {
            _loc7_ = true;
            var_757 = "sh";
         }
         if(param3 == null)
         {
            param3 = new com.sulake.habbo.avatar.AvatarFigureContainer("hr-893-45.hd-180-2.ch-210-66.lg-270-82.sh-300-91.wa-2007-.ri-1-");
            class_14.log("Using default avatar figure");
         }
         var_427 = param3;
         _cache = new AvatarImageCache(var_1469,this,_assets,var_757,_loc7_);
         setDirection("full",2);
         var_474 = [];
         _defaultAction = new ActiveActionData("std");
         _defaultAction.definition = var_1469.getActionDefinition("Default");
         resetActions();
         _fullImageCache = new class_24();
      }
      
      public function getServerRenderData() : Array
      {
         getAvatarPartsForCamera("full");
         return _cache.getServerRenderData();
      }
      
      public function dispose() : void
      {
         if(!var_311)
         {
            var_1469 = null;
            _assets = null;
            _mainAction = null;
            var_427 = null;
            var_1984 = null;
            var_474 = null;
            if(var_973)
            {
               var_973.dispose();
            }
            if(_cache)
            {
               _cache.dispose();
               _cache = null;
            }
            if(_fullImageCache)
            {
               for each(var _loc1_ in _fullImageCache)
               {
                  _loc1_.dispose();
               }
               _fullImageCache.dispose();
               _fullImageCache = null;
            }
            var_973 = null;
            var_2087 = null;
            var_311 = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function getFigure() : class_3182
      {
         return var_427;
      }
      
      public function getScale() : String
      {
         return var_757;
      }
      
      public function getPartColor(param1:String) : IPartColor
      {
         return var_1469.getPartColor(var_427,param1);
      }
      
      public function setDirection(param1:String, param2:int) : void
      {
         param2 += _directionOffset;
         if(param2 < 0)
         {
            param2 = 7 + (param2 + 1);
         }
         if(param2 > 7)
         {
            param2 -= 8;
         }
         if(var_1469.isMainAvatarSet(param1))
         {
            _mainDirection = param2;
         }
         if(param1 == "head" || param1 == "full")
         {
            if(param1 == "head" && isHeadTurnPreventedByAction())
            {
               param2 = _mainDirection;
            }
            _headDirection = param2;
         }
         _cache.setDirection(param1,param2);
         var_1601 = true;
      }
      
      public function setDirectionAngle(param1:String, param2:int) : void
      {
         var _loc3_:int = 0;
         _loc3_ = param2 / 45;
         setDirection(param1,_loc3_);
      }
      
      public function getSprites() : Vector.<ISpriteDataContainer>
      {
         return var_1551;
      }
      
      public function getCanvasOffsets() : Array
      {
         return var_2087;
      }
      
      public function getLayerData(param1:ISpriteDataContainer) : class_3292
      {
         return var_1469.getBodyPartData(param1.animation.id,var_1967,param1.id);
      }
      
      public function updateAnimationByFrames(param1:int = 1) : void
      {
         var_1967 += param1;
         var_1601 = true;
      }
      
      public function resetAnimationFrameCounter() : void
      {
         var_1967 = 0;
         var_1601 = true;
      }
      
      private function getFullImageCacheKey() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if(!_useFullImageCache)
         {
            return null;
         }
         if(false && _mainDirection == _headDirection)
         {
            if(_mainAction == "std")
            {
               return _mainDirection + var_1900;
            }
            return _mainDirection + var_1900 + var_1967 % 4;
         }
         if(false)
         {
            for each(_loc1_ in var_1713)
            {
               if(_loc1_.actionType == "fx" && (_loc1_.actionParameter == "33" || _loc1_.actionParameter == "34" || _loc1_.actionParameter == "35" || _loc1_.actionParameter == "36"))
               {
                  return _mainDirection + var_1900 + 0;
               }
               if(_loc1_.actionType == "fx" && (_loc1_.actionParameter == "38" || _loc1_.actionParameter == "39"))
               {
                  _loc2_ = var_1967 % 11;
                  return _mainDirection + "_" + _headDirection + var_1900 + _loc2_;
               }
            }
         }
         return null;
      }
      
      private function getBodyParts(param1:String, param2:String, param3:int) : Array
      {
         if(param3 != _cachedBodyPartsDirection || param2 != var_4054 || param1 != var_4173)
         {
            _cachedBodyPartsDirection = param3;
            var_4054 = param2;
            var_4173 = param1;
            var_3463 = var_1469.getBodyParts(param1,param2,param3);
         }
         return var_3463;
      }
      
      public function getAvatarPartsForCamera(param1:String) : void
      {
         var _loc4_:String = null;
         var _loc2_:AvatarImageBodyPartContainer = null;
         var _loc6_:int = 0;
         if(_mainAction == null)
         {
            return;
         }
         var _loc5_:AvatarCanvas;
         if((_loc5_ = var_1469.getCanvas(var_757,_mainAction.definition.geometryType)) == null)
         {
            return;
         }
         var _loc3_:Array = getBodyParts(param1,_mainAction.definition.geometryType,_mainDirection);
         _loc6_ = _loc3_.length - 1;
         while(_loc6_ >= 0)
         {
            _loc4_ = String(_loc3_[_loc6_]);
            _loc2_ = _cache.getImageContainer(_loc4_,var_1967,true);
            _loc6_--;
         }
      }
      
      public function getImage(param1:String, param2:Boolean, param3:Number = 1) : BitmapData
      {
         var _loc12_:String = null;
         var _loc4_:AvatarImageBodyPartContainer = null;
         var _loc10_:BitmapData = null;
         var _loc8_:Point = null;
         var _loc11_:int = 0;
         var _loc7_:BitmapData = null;
         if(!var_1601)
         {
            return var_973;
         }
         if(_mainAction == null)
         {
            return null;
         }
         if(!var_2448)
         {
            endActionAppends();
         }
         var _loc9_:String;
         if((_loc9_ = getFullImageCacheKey()) != null)
         {
            if(getFullImage(_loc9_))
            {
               var_1601 = false;
               if(param2)
               {
                  return (getFullImage(_loc9_) as BitmapData).clone();
               }
               var_973 = getFullImage(_loc9_) as BitmapData;
               var_2891 = true;
               return var_973;
            }
         }
         var _loc6_:AvatarCanvas;
         if((_loc6_ = var_1469.getCanvas(var_757,_mainAction.definition.geometryType)) == null)
         {
            return null;
         }
         if(var_2891 || var_973 == null || (var_973.width != _loc6_.width || var_973.height != _loc6_.height))
         {
            if(var_973 != null && !var_2891)
            {
               var_973.dispose();
            }
            var_973 = new BitmapData(_loc6_.width,_loc6_.height,true,0);
            var_2891 = false;
         }
         var _loc5_:Array = getBodyParts(param1,_mainAction.definition.geometryType,_mainDirection);
         var_973.lock();
         var_973.fillRect(var_973.rect,0);
         var _loc13_:Boolean = true;
         _loc11_ = _loc5_.length - 1;
         while(_loc11_ >= 0)
         {
            _loc12_ = String(_loc5_[_loc11_]);
            if(_loc4_ = _cache.getImageContainer(_loc12_,var_1967))
            {
               _loc13_ &&= _loc4_.isCacheable;
               _loc10_ = _loc4_.image;
               _loc8_ = _loc4_.regPoint.add(_loc6_.offset);
               if(_loc10_ && _loc8_)
               {
                  _loc8_ = _loc8_.add(_loc6_.regPoint);
                  var_973.copyPixels(_loc10_,_loc10_.rect,_loc8_,null,null,true);
               }
            }
            _loc11_--;
         }
         var_973.unlock();
         var_1601 = false;
         if(var_1984 != null)
         {
            if(false)
            {
               _loc7_ = convertToGrayscale(var_973);
               if(var_973)
               {
                  var_973.dispose();
               }
               var_973 = _loc7_;
               var_973.paletteMap(var_973,var_973.rect,DEFAULT_POINT,var_1984.reds,[],[]);
            }
            else
            {
               var_973.copyChannel(var_973,var_973.rect,DEFAULT_POINT,2,8);
            }
         }
         if(_loc9_ != null && _loc13_)
         {
            cacheFullImage(_loc9_,var_973.clone());
         }
         if(param3 != 1)
         {
            var_973 = class_3310.resampleBitmapData(var_973,param3);
         }
         if(var_973 && param2)
         {
            return var_973.clone();
         }
         return var_973;
      }
      
      public function getCroppedImage(param1:String, param2:Number = 1) : BitmapData
      {
         var _loc11_:String = null;
         var _loc3_:AvatarImageBodyPartContainer = null;
         var _loc8_:BitmapData = null;
         var _loc7_:Point = null;
         var _loc9_:int = 0;
         if(_mainAction == null)
         {
            return null;
         }
         if(!var_2448)
         {
            endActionAppends();
         }
         var _loc6_:AvatarCanvas;
         if((_loc6_ = var_1469.getCanvas(var_757,_mainAction.definition.geometryType)) == null)
         {
            return null;
         }
         var _loc4_:BitmapData = new BitmapData(_loc6_.width,_loc6_.height,true,16777215);
         var _loc5_:Array = var_1469.getBodyParts(param1,_mainAction.definition.geometryType,_mainDirection);
         var _loc10_:Rectangle = null;
         var _loc13_:Rectangle = new Rectangle();
         _loc9_ = _loc5_.length - 1;
         while(_loc9_ >= 0)
         {
            _loc11_ = String(_loc5_[_loc9_]);
            _loc3_ = _cache.getImageContainer(_loc11_,var_1967);
            if(_loc3_ != null)
            {
               if((_loc8_ = _loc3_.image) == null)
               {
                  _loc4_.dispose();
                  return null;
               }
               _loc7_ = _loc3_.regPoint;
               _loc4_.copyPixels(_loc8_,_loc8_.rect,_loc7_,null,null,true);
               _loc13_.x = _loc7_.x;
               _loc13_.y = _loc7_.y;
               _loc13_.width = _loc8_.width;
               _loc13_.height = _loc8_.height;
               if(_loc10_ == null)
               {
                  _loc10_ = _loc13_.clone();
               }
               else
               {
                  _loc10_ = _loc10_.union(_loc13_);
               }
            }
            _loc9_--;
         }
         if(_loc10_ == null)
         {
            _loc10_ = new Rectangle(0,0,1,1);
         }
         var _loc12_:BitmapData;
         (_loc12_ = new BitmapData(_loc10_.width,_loc10_.height,true,16777215)).copyPixels(_loc4_,_loc10_,DEFAULT_POINT,null,null,true);
         _loc4_.dispose();
         if(param2 != 1)
         {
            _loc12_ = class_3310.resampleBitmapData(_loc12_,param2);
         }
         return _loc12_;
      }
      
      protected function getFullImage(param1:String) : BitmapData
      {
         return _fullImageCache[param1];
      }
      
      protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         if(_fullImageCache.getValue(param1))
         {
            (_fullImageCache.getValue(param1) as BitmapData).dispose();
            _fullImageCache.remove(param1);
         }
         _fullImageCache[param1] = param2;
      }
      
      public function getAsset(param1:String) : BitmapDataAsset
      {
         return _assets.getAssetByName(param1) as BitmapDataAsset;
      }
      
      public function getDirection() : int
      {
         return _mainDirection;
      }
      
      public function initActionAppends() : void
      {
         var_474 = [];
         var_2448 = false;
         var_1900 = "";
         _useFullImageCache = false;
      }
      
      public function endActionAppends() : void
      {
         var _loc1_:* = null;
         if(sortActions())
         {
            for each(_loc1_ in var_1713)
            {
               if(_loc1_.actionType == "fx")
               {
                  if(!var_3664.isReady(parseInt(_loc1_.actionParameter)))
                  {
                     var_3664.loadEffectData(parseInt(_loc1_.actionParameter),this);
                  }
               }
            }
            resetActions();
            setActionsToParts();
         }
      }
      
      public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:String = null;
         var _loc4_:ActionDefinition = null;
         var_2448 = false;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = String(rest[0]);
         }
         switch(param1)
         {
            case "posture":
               switch(_loc3_)
               {
                  case "lay":
                     if(_mainDirection == 0)
                     {
                        setDirection("full",4);
                     }
                     else
                     {
                        setDirection("full",2);
                     }
                  case "mv":
                     _useFullImageCache = true;
                  case "std":
                     _useFullImageCache = true;
                  case "swim":
                  case "float":
                  case "sit":
                  case "swrun":
                  case "swdiefront":
                  case "swdieback":
                  case "swpick":
                  case "swthrow":
                     break;
                  default:
                     errorThis("appendAction() >> UNKNOWN POSTURE TYPE: " + _loc3_);
               }
               addActionData(_loc3_);
               break;
            case "gest":
               switch(_loc3_)
               {
                  case "agr":
                  case "sad":
                  case "sml":
                  case "srp":
                     break;
                  default:
                     errorThis("appendAction() >> UNKNOWN GESTURE TYPE: " + _loc3_);
               }
               addActionData(_loc3_);
               break;
            case "fx":
               if(_loc3_ == "33" || _loc3_ == "34" || _loc3_ == "35" || _loc3_ == "36" || _loc3_ == "38" || _loc3_ == "39")
               {
                  _useFullImageCache = true;
               }
            case "dance":
            case "talk":
            case "wave":
            case "Sleep":
            case "sign":
            case "respect":
            case "blow":
            case "laugh":
            case "cry":
            case "idle":
            case "sbollie":
            case "sb360":
            case "ridejump":
               addActionData(param1,_loc3_);
               break;
            case "cri":
            case "usei":
               if((_loc4_ = var_1469.getActionDefinitionWithState(param1)) != null)
               {
                  logThis("appendAction:" + [_loc3_,"->",_loc4_.getParameterValue(_loc3_)]);
                  _loc3_ = _loc4_.getParameterValue(_loc3_);
               }
               addActionData(param1,_loc3_);
               break;
            default:
               errorThis("appendAction() >> UNKNOWN ACTION TYPE: " + param1);
         }
         return true;
      }
      
      protected function addActionData(param1:String, param2:String = "") : void
      {
         var _loc4_:ActiveActionData = null;
         var _loc3_:int = 0;
         if(var_474 == null)
         {
            var_474 = [];
         }
         _loc3_ = 0;
         while(_loc3_ < var_474.length)
         {
            if((_loc4_ = var_474[_loc3_]).actionType == param1 && _loc4_.actionParameter == param2)
            {
               return;
            }
            _loc3_++;
         }
         var_474.push(new ActiveActionData(param1,param2,var_1967));
      }
      
      public function isAnimating() : Boolean
      {
         return var_2466 || var_3840 > 1;
      }
      
      private function resetActions() : Boolean
      {
         var_2787 = false;
         var_2466 = false;
         var_1551 = new Vector.<ISpriteDataContainer>(0);
         var_1984 = null;
         _directionOffset = 0;
         var_1469.removeDynamicItems(this);
         _mainAction = _defaultAction;
         _mainAction.definition = _defaultAction.definition;
         resetBodyPartCache(_defaultAction);
         return true;
      }
      
      private function isHeadTurnPreventedByAction() : Boolean
      {
         var _loc2_:IActionDefinition = null;
         var _loc1_:* = null;
         if(var_1713 == null)
         {
            return false;
         }
         for each(_loc1_ in var_1713)
         {
            _loc2_ = var_1469.getActionDefinitionWithState(_loc1_.actionType);
            if(!(_loc1_.actionType == "Sleep" && _mainAction))
            {
               if(_loc2_ != null && _loc2_.getPreventHeadTurn(_loc1_.actionParameter))
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      private function sortActions() : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc1_:Boolean = false;
         var _loc4_:* = null;
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         var_1900 = "";
         var_1713 = var_1469.sortActions(var_474);
         var_3840 = var_1469.maxFrames(var_1713);
         if(var_1713 == null)
         {
            var_2087 = new Array(0,0,0);
            if(var_2605 != "")
            {
               _loc3_ = true;
               var_2605 = "";
            }
         }
         else
         {
            var_2087 = var_1469.getCanvasOffsets(var_1713,var_757,_mainDirection);
            for each(_loc4_ in var_1713)
            {
               var_1900 += _loc4_.actionType + _loc4_.actionParameter;
               if(_loc4_.actionType == "fx")
               {
                  _loc2_ = parseInt(_loc4_.actionParameter);
                  if(var_2653 != _loc2_)
                  {
                     _loc5_ = true;
                  }
                  var_2653 = _loc2_;
                  _loc1_ = true;
               }
            }
            if(!_loc1_)
            {
               if(var_2653 > -1)
               {
                  _loc5_ = true;
               }
               var_2653 = -1;
            }
            if(_loc5_)
            {
               _cache.disposeInactiveActions(0);
            }
            if(var_2605 != var_1900)
            {
               _loc3_ = true;
               var_2605 = var_1900;
            }
         }
         var_2448 = true;
         return _loc3_;
      }
      
      private function setActionsToParts() : void
      {
         var _loc2_:* = null;
         var _loc6_:Animation = null;
         var _loc1_:Array = null;
         var _loc4_:* = null;
         var _loc5_:* = undefined;
         if(var_1713 == null)
         {
            return;
         }
         var _loc3_:int = getTimer();
         var _loc7_:* = [];
         for each(_loc2_ in var_1713)
         {
            _loc7_.push(_loc2_.actionType);
         }
         for each(_loc2_ in var_1713)
         {
            if(_loc2_ && _loc2_.definition && _loc2_.definition.isAnimation)
            {
               if((_loc6_ = var_1469.getAnimation(_loc2_.definition.state + "." + _loc2_.actionParameter)) && _loc6_.hasOverriddenActions())
               {
                  _loc1_ = _loc6_.overriddenActionNames();
                  if(_loc1_)
                  {
                     for each(_loc4_ in _loc1_)
                     {
                        if(_loc7_.indexOf(_loc4_) >= 0)
                        {
                           _loc2_.overridingAction = _loc6_.overridingAction(_loc4_);
                        }
                     }
                  }
               }
               if(_loc6_ && _loc6_.resetOnToggle)
               {
                  var_2787 = true;
               }
            }
         }
         for each(_loc2_ in var_1713)
         {
            if(!(!_loc2_ || !_loc2_.definition))
            {
               if(_loc2_.definition.isAnimation && _loc2_.actionParameter == "")
               {
                  _loc2_.actionParameter = "1";
               }
               setActionToParts(_loc2_,_loc3_);
               if(_loc2_.definition.isAnimation)
               {
                  var_2466 = _loc2_.definition.isAnimated(_loc2_.actionParameter);
                  if((_loc6_ = var_1469.getAnimation(_loc2_.definition.state + "." + _loc2_.actionParameter)) != null)
                  {
                     if(_loc5_ = _loc6_.spriteData)
                     {
                        var_1551 = var_1551.concat(_loc5_);
                     }
                     if(_loc6_.hasDirectionData())
                     {
                        _directionOffset = _loc6_.directionData.offset;
                     }
                     if(_loc6_.hasAvatarData())
                     {
                        var_1984 = _loc6_.avatarData;
                     }
                  }
               }
            }
         }
      }
      
      private function setActionToParts(param1:class_3311, param2:int) : void
      {
         if(param1 == null || param1.definition == null)
         {
            return;
         }
         if(param1.definition.assetPartDefinition == "")
         {
            return;
         }
         if(param1.definition.isMain)
         {
            _mainAction = param1;
            _cache.setGeometryType(param1.definition.geometryType);
         }
         _cache.setAction(param1,param2);
         var_1601 = true;
      }
      
      private function resetBodyPartCache(param1:class_3311) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.definition.assetPartDefinition == "")
         {
            return;
         }
         if(param1.definition.isMain)
         {
            _mainAction = param1;
            _cache.setGeometryType(param1.definition.geometryType);
         }
         _cache.resetBodyPartCache(param1);
         var_1601 = true;
      }
      
      public function get avatarSpriteData() : class_3341
      {
         return var_1984;
      }
      
      private function convertToGrayscale(param1:BitmapData, param2:String = "CHANNELS_EQUAL") : BitmapData
      {
         var _loc5_:Number = 0.33;
         var _loc8_:Number = 0.33;
         var _loc6_:Number = 0.33;
         switch(param2)
         {
            case "CHANNELS_UNIQUE":
               _loc5_ = 0.3;
               _loc8_ = 0.59;
               _loc6_ = 0.11;
               break;
            case "CHANNELS_RED":
               _loc5_ = 1;
               _loc8_ = 0;
               _loc6_ = 0;
               break;
            case "CHANNELS_GREEN":
               _loc5_ = 0;
               _loc8_ = 1;
               _loc6_ = 0;
               break;
            case "CHANNELS_BLUE":
               _loc5_ = 0;
               _loc8_ = 0;
               _loc6_ = 1;
               break;
            case "CHANNELS_DESATURATED":
               _loc5_ = 0.3086;
               _loc8_ = 0.6094;
               _loc6_ = 0.082;
         }
         var _loc7_:Array = [_loc5_,_loc8_,_loc6_,0,0,_loc5_,_loc8_,_loc6_,0,0,_loc5_,_loc8_,_loc6_,0,0,0,0,0,1,0];
         var _loc3_:ColorMatrixFilter = new ColorMatrixFilter(_loc7_);
         var _loc9_:BitmapData;
         (_loc9_ = new BitmapData(param1.width,param1.height,param1.transparent,4294967295)).copyPixels(param1,param1.rect,DEFAULT_POINT,null,null,false);
         _loc9_.applyFilter(_loc9_,_loc9_.rect,DEFAULT_POINT,_loc3_);
         return _loc9_;
      }
      
      private function errorThis(param1:String) : void
      {
      }
      
      private function logThis(param1:String) : void
      {
      }
      
      public function isPlaceholder() : Boolean
      {
         return false;
      }
      
      public function forceActionUpdate() : void
      {
         var_2605 = "";
      }
      
      public function get animationHasResetOnToggle() : Boolean
      {
         return var_2787;
      }
      
      public function get mainAction() : String
      {
         return _mainAction.actionType;
      }
      
      public function disposeInactiveActionCache() : void
      {
         if(_cache)
         {
            _cache.disposeInactiveActions();
         }
      }
      
      public function avatarEffectReady(param1:int) : void
      {
         if(param1 == var_2653)
         {
            resetActions();
            setActionsToParts();
            var_2787 = true;
            var_1601 = true;
            if(var_3646)
            {
               var_3646.avatarEffectReady(param1);
            }
         }
      }
   }
}
