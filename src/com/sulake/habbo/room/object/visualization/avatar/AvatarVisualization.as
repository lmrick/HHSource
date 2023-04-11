package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.animation.class_3292;
   import com.sulake.habbo.avatar.animation.class_3341;
   import com.sulake.habbo.avatar.class_1870;
   import com.sulake.habbo.avatar.class_3156;
   import com.sulake.habbo.avatar.class_3157;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.room.object.visualization.avatar.additions.FloatingIdleZ;
   import com.sulake.habbo.room.object.visualization.avatar.additions.GameClickTarget;
   import com.sulake.habbo.room.object.visualization.avatar.additions.GuideStatusBubble;
   import com.sulake.habbo.room.object.visualization.avatar.additions.IAvatarAddition;
   import com.sulake.habbo.room.object.visualization.avatar.additions.MutedBubble;
   import com.sulake.habbo.room.object.visualization.avatar.additions.NumberBubble;
   import com.sulake.habbo.room.object.visualization.avatar.additions.TypingBubble;
   import com.sulake.habbo.room.object.visualization.avatar.additions.class_3397;
   import com.sulake.habbo.utils.class_3310;
   import com.sulake.room.data.RoomObjectSpriteData;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.enum.RoomObjectSpriteType;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements class_1870, class_3157
   {
      
      private static const AVATAR_SPRITE_TAG:String = "avatar";
      
      private static const AVATAR_SPRITE_DEFAULT_DEPTH:Number = -0.01;
      
      private static const AVATAR_OWN_DEPTH_ADJUST:Number = 0.001;
      
      private static const AVATAR_SPRITE_LAYING_DEPTH:Number = -0.409;
      
      private static const BASE_Y_SCALE:int = 1000;
      
      private static const ANIMATION_FRAME_UPDATE_INTERVAL:int = 2;
      
      private static const DEFAULT_CANVAS_OFFSETS:Array = [0,0,0];
      
      private static const SNOWBOARDING_EFFECT:int = 97;
      
      private static const MAX_AVATARS_WITH_EFFECT:int = 3;
      
      private static const SPRITE_INDEX_AVATAR:int = 0;
      
      private static const const_1110:int = 1;
      
      private static const INITIAL_RESERVED_SPRITES:int = 2;
      
      private static const ADDITION_ID_IDLE_BUBBLE:int = 1;
      
      private static const ADDITION_ID_TYPING_BUBBLE:int = 2;
      
      private static const ADDITION_ID_EXPRESSION:int = 3;
      
      private static const ADDITION_ID_NUMBER_BUBBLE:int = 4;
      
      private static const ADDITION_ID_GAME_CLICK_TARGET:int = 5;
      
      private static const ADDITION_ID_MUTED_BUBBLE:int = 6;
      
      private static const ADDITION_ID_GUIDE_STATUS_BUBBLE:int = 7;
       
      
      private var _lastAnimationUpdateTime:int = -1000;
      
      private const const_1167:int = 41;
      
      private var var_2443:com.sulake.habbo.room.object.visualization.avatar.AvatarVisualizationData = null;
      
      private var _avatars:class_24;
      
      private var var_2214:class_24;
      
      private var _updatesUntilFrameUpdate:int = 0;
      
      private var var_2466:Boolean;
      
      private var var_427:String;
      
      private var var_122:String;
      
      private var var_3136:int = 0;
      
      private var _shadowAsset:BitmapDataAsset;
      
      private var _forceUpdate:Boolean;
      
      private var var_2864:int;
      
      private var _headAngle:int = -1;
      
      private var var_3339:int = -1;
      
      private var var_3585:int = -1;
      
      private var var_3663:int = 2;
      
      private var var_1591:class_24;
      
      private var var_3173:int = -1;
      
      private var var_1302:String = "";
      
      private var var_3371:String = "";
      
      private var var_3597:Boolean = false;
      
      private var var_3390:Boolean = false;
      
      private var var_3039:Boolean = false;
      
      private var var_515:int = 0;
      
      private var var_535:int = 0;
      
      private var var_951:int = 0;
      
      private var var_3783:int = 0;
      
      private var var_3521:Boolean = false;
      
      private var var_3219:int = -1;
      
      private var var_2371:int = 0;
      
      private var var_2549:int = 0;
      
      private var var_2061:int = 0;
      
      private var _geometryOffset:int = 0;
      
      private var var_3315:int = 0;
      
      private var var_2374:Boolean = false;
      
      private var var_2582:Boolean = false;
      
      private var var_3293:Boolean = false;
      
      private var var_1466:class_3156 = null;
      
      private var var_3477:Boolean = false;
      
      private var var_311:Boolean;
      
      public function AvatarVisualization()
      {
         super();
         _avatars = new class_24();
         var_2214 = new class_24();
         var_2466 = false;
         var_2864 = Math.random() * 200 + 200;
      }
      
      override public function dispose() : void
      {
         if(_avatars != null)
         {
            resetImages();
            _avatars.dispose();
            var_2214.dispose();
            _avatars = null;
         }
         var_2443 = null;
         _shadowAsset = null;
         if(var_1591)
         {
            for each(var _loc1_ in var_1591)
            {
               _loc1_.dispose();
            }
            var_1591 = null;
         }
         super.dispose();
         var_311 = true;
      }
      
      override public function getSpriteList() : Array
      {
         var _loc17_:RoomObjectSpriteData = null;
         var _loc6_:RoomObjectSpriteData = null;
         var _loc11_:class_3292 = null;
         var _loc18_:int = 0;
         var _loc1_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc19_:* = 0;
         var _loc8_:int = 0;
         var _loc7_:String = null;
         var _loc2_:BitmapDataAsset = null;
         var _loc12_:Rectangle = null;
         var _loc5_:String = null;
         if(var_1466 == null)
         {
            return null;
         }
         var _loc3_:IRoomObjectSprite = getSprite(1);
         if(_loc3_)
         {
            (_loc17_ = new RoomObjectSpriteData()).alpha = _loc3_.alpha;
            _loc17_.x = _loc3_.offsetX;
            _loc17_.y = _loc3_.offsetY;
            _loc17_.name = _loc3_.assetName;
            _loc17_.width = _loc3_.width;
            _loc17_.height = _loc3_.height;
         }
         var _loc9_:Array = var_1466.getServerRenderData();
         for each(var _loc10_ in var_1466.getSprites())
         {
            _loc6_ = new RoomObjectSpriteData();
            _loc11_ = var_1466.getLayerData(_loc10_);
            _loc18_ = 0;
            _loc1_ = var_1466.getDirection();
            _loc13_ = _loc10_.getDirectionOffsetX(_loc1_);
            _loc14_ = _loc10_.getDirectionOffsetY(_loc1_);
            _loc15_ = _loc10_.getDirectionOffsetZ(_loc1_);
            _loc19_ = 0;
            if(_loc10_.hasDirections)
            {
               _loc19_ = _loc1_;
            }
            if(_loc11_ != null)
            {
               _loc18_ = _loc11_.animationFrame;
               _loc13_ += _loc11_.dx;
               _loc14_ += _loc11_.dy;
               _loc19_ += _loc11_.directionOffset;
            }
            if((_loc8_ = 64) < 48)
            {
               _loc13_ /= 2;
               _loc14_ /= 2;
            }
            if(_loc19_ < 0)
            {
               _loc19_ += 8;
            }
            else if(_loc19_ > 7)
            {
               _loc19_ -= 8;
            }
            _loc7_ = var_1466.getScale() + "_" + _loc10_.member + "_" + _loc19_ + "_" + _loc18_;
            _loc2_ = var_1466.getAsset(_loc7_);
            if(_loc2_ != null)
            {
               _loc6_.x = -_loc2_.offset.x - _loc8_ / 2 + _loc13_;
               _loc6_.y = -_loc2_.offset.y + _loc14_;
               if(_loc10_.hasStaticY)
               {
                  _loc6_.y += var_3315 * _loc8_ / 2000;
               }
               if(_loc10_.ink == 33)
               {
                  _loc6_.blendMode = "add";
               }
               _loc6_.name = _loc7_;
               if(var_2582)
               {
                  _loc6_.z = -0.409 - 0.001 * spriteCount * _loc15_;
               }
               else
               {
                  _loc6_.z = -0.001 * spriteCount * _loc15_;
               }
               if((_loc12_ = _loc2_.rectangle) == null)
               {
                  _loc6_.width = 60;
                  _loc6_.height = 60;
               }
               else
               {
                  _loc6_.width = _loc12_.width;
                  _loc6_.height = _loc12_.height;
               }
               _loc9_.push(_loc6_);
            }
         }
         var _loc4_:class_3341;
         if((_loc4_ = var_1466.avatarSpriteData) != null && _loc4_.paletteIsGrayscale)
         {
            _loc5_ = String(_loc4_.reds[0].toString());
            for each(var _loc16_ in _loc9_)
            {
               if(_loc16_.name.indexOf("h_std_fx") == -1 && _loc16_.name.indexOf("h_std_sd") == -1)
               {
                  _loc16_.color = _loc5_;
               }
            }
         }
         if(_loc17_)
         {
            _loc9_.push(_loc17_);
         }
         return _loc9_;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function get angle() : int
      {
         return var_3339;
      }
      
      public function get posture() : String
      {
         return var_1302;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         var_2443 = param1 as com.sulake.habbo.room.object.visualization.avatar.AvatarVisualizationData;
         createSprites(2);
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number, param3:Boolean) : Boolean
      {
         var _loc7_:Boolean = false;
         var _loc4_:* = false;
         var _loc8_:int = 0;
         var _loc6_:String = null;
         var _loc9_:IAvatarAddition = null;
         var _loc5_:String = null;
         if(param1.getUpdateID() != var_1595)
         {
            _loc7_ = false;
            _loc4_ = false;
            _loc8_ = 0;
            _loc6_ = "";
            if((_loc4_ = param1.getNumber("figure_talk") > 0 && param3) != var_3597)
            {
               var_3597 = _loc4_;
               _loc7_ = true;
            }
            if((_loc8_ = int(param1.getNumber("figure_expression"))) != var_515)
            {
               var_515 = _loc8_;
               _loc7_ = true;
            }
            _loc4_ = param1.getNumber("figure_sleep") > 0;
            if(param1.getNumber("figure_sleep") > 0 != var_3390)
            {
               var_3390 = _loc4_;
               _loc7_ = true;
            }
            if((_loc4_ = param1.getNumber("figure_blink") > 0 && param3) != var_3039)
            {
               var_3039 = _loc4_;
               _loc7_ = true;
            }
            if((_loc8_ = int(param1.getNumber("figure_gesture"))) != var_535)
            {
               var_535 = _loc8_;
               _loc7_ = true;
            }
            if((_loc6_ = String(param1.getString("figure_posture"))) != var_1302)
            {
               var_1302 = _loc6_;
               _loc7_ = true;
            }
            if((_loc6_ = String(param1.getString("figure_posture_parameter"))) != var_3371)
            {
               var_3371 = _loc6_;
               _loc7_ = true;
            }
            _loc4_ = param1.getNumber("figure_can_stand_up") > 0;
            if(param1.getNumber("figure_can_stand_up") > 0 != var_2374)
            {
               var_2374 = _loc4_;
               _loc7_ = true;
            }
            if((_loc8_ = param1.getNumber("figure_vertical_offset") * 1000) != var_3315)
            {
               var_3315 = _loc8_;
               _loc7_ = true;
            }
            if((_loc8_ = int(param1.getNumber("figure_dance"))) != var_951)
            {
               var_951 = _loc8_;
               _loc7_ = true;
            }
            if((_loc8_ = int(param1.getNumber("figure_effect"))) != var_2371)
            {
               var_2371 = _loc8_;
               _loc7_ = true;
            }
            if((_loc8_ = int(param1.getNumber("figure_carry_object"))) != var_2549)
            {
               var_2549 = _loc8_;
               _loc7_ = true;
            }
            if((_loc8_ = int(param1.getNumber("figure_use_object"))) != var_2061)
            {
               var_2061 = _loc8_;
               _loc7_ = true;
            }
            if((_loc8_ = int(param1.getNumber("head_direction"))) != _headAngle)
            {
               _headAngle = _loc8_;
               _loc7_ = true;
            }
            if(var_2549 > 0 && param1.getNumber("figure_use_object") > 0)
            {
               if(var_2061 != var_2549)
               {
                  var_2061 = var_2549;
                  _loc7_ = true;
               }
            }
            else if(var_2061 != 0)
            {
               var_2061 = 0;
               _loc7_ = true;
            }
            _loc9_ = getAddition(1) as FloatingIdleZ;
            if(var_3390)
            {
               if(!_loc9_)
               {
                  _loc9_ = addAddition(new FloatingIdleZ(1,this));
               }
               _loc7_ = true;
            }
            else if(_loc9_)
            {
               removeAddition(1);
            }
            _loc4_ = param1.getNumber("figure_is_muted") > 0;
            _loc9_ = getAddition(6) as MutedBubble;
            if(_loc4_)
            {
               if(!_loc9_)
               {
                  _loc9_ = addAddition(new MutedBubble(6,this));
               }
               removeAddition(2);
               _loc7_ = true;
            }
            else
            {
               if(_loc9_)
               {
                  removeAddition(6);
                  _loc7_ = true;
               }
               _loc4_ = param1.getNumber("figure_is_typing") > 0;
               _loc9_ = getAddition(2) as TypingBubble;
               if(_loc4_)
               {
                  if(!_loc9_)
                  {
                     _loc9_ = addAddition(new TypingBubble(2,this));
                  }
                  _loc7_ = true;
               }
               else if(_loc9_)
               {
                  removeAddition(2);
               }
            }
            if((_loc8_ = int(param1.getNumber("figure_guide_status"))) != 0)
            {
               removeAddition(7);
               addAddition(new GuideStatusBubble(7,this,_loc8_));
               _loc7_ = true;
            }
            else if(getAddition(7) as GuideStatusBubble != null)
            {
               removeAddition(7);
               _loc7_ = true;
            }
            _loc4_ = param1.getNumber("figure_is_playing_game") > 0;
            _loc9_ = getAddition(5) as GameClickTarget;
            if(_loc4_)
            {
               if(!_loc9_)
               {
                  _loc9_ = addAddition(new GameClickTarget(5));
               }
               _loc7_ = true;
            }
            else if(_loc9_)
            {
               removeAddition(5);
            }
            _loc8_ = int(param1.getNumber("figure_number_value"));
            _loc9_ = getAddition(4) as NumberBubble;
            if(_loc8_ > 0)
            {
               if(!_loc9_)
               {
                  _loc9_ = addAddition(new NumberBubble(4,_loc8_,this));
               }
               _loc7_ = true;
            }
            else if(_loc9_)
            {
               removeAddition(4);
            }
            _loc8_ = int(param1.getNumber("figure_expression"));
            _loc9_ = getAddition(3);
            if(_loc8_ > 0)
            {
               if(!_loc9_)
               {
                  if(_loc9_ = class_3397.make(3,_loc8_,this))
                  {
                     addAddition(_loc9_);
                  }
               }
            }
            else if(_loc9_)
            {
               removeAddition(3);
            }
            validateActions(param2);
            if((_loc6_ = String(param1.getString("gender"))) != var_122)
            {
               var_122 = _loc6_;
               _loc7_ = true;
            }
            _loc5_ = String(param1.getString("figure"));
            if(updateFigure(_loc5_))
            {
               _loc7_ = true;
            }
            if(param1.hasNumber("figure_sign"))
            {
               if((_loc8_ = int(param1.getNumber("figure_sign"))) != var_3219)
               {
                  _loc7_ = true;
                  var_3219 = _loc8_;
               }
            }
            _loc4_ = param1.getNumber("figure_highlight_enable") > 0;
            if(param1.getNumber("figure_highlight_enable") > 0 != var_3521)
            {
               var_3521 = _loc4_;
               _loc7_ = true;
            }
            if(var_3521)
            {
               if((_loc8_ = int(param1.getNumber("figure_highlight"))) != var_3783)
               {
                  var_3783 = _loc8_;
                  _loc7_ = true;
               }
            }
            _loc4_ = param1.getNumber("own_user") > 0;
            if(param1.getNumber("own_user") > 0 != var_3477)
            {
               var_3477 = _loc4_;
               _loc7_ = true;
            }
            var_1595 = param1.getUpdateID();
            return _loc7_;
         }
         return false;
      }
      
      private function updateFigure(param1:String) : Boolean
      {
         if(var_427 != param1)
         {
            var_427 = param1;
            resetImages();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in _avatars)
         {
            if(_loc2_)
            {
               _loc2_.dispose();
            }
         }
         for each(_loc2_ in var_2214)
         {
            if(_loc2_)
            {
               _loc2_.dispose();
            }
         }
         _avatars.reset();
         var_2214.reset();
         var_1466 = null;
         var _loc1_:IRoomObjectSprite = getSprite(0);
         if(_loc1_ != null)
         {
            _loc1_.asset = null;
            _loc1_.alpha = 255;
         }
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            var_3039 = false;
         }
         if(var_1302 == "sit" || var_1302 == "lay")
         {
            _geometryOffset = param1 / 2;
         }
         else
         {
            _geometryOffset = 0;
         }
         var_3293 = false;
         var_2582 = false;
         if(var_1302 == "lay")
         {
            var_2582 = true;
            _loc2_ = int(var_3371);
            if(_loc2_ < 0)
            {
               var_3293 = true;
            }
         }
      }
      
      private function getAvatarImage(param1:Number, param2:int) : class_3156
      {
         var _loc4_:class_3156 = null;
         var _loc5_:class_3156 = null;
         var _loc3_:String = "avatarImage" + param1.toString();
         if(param2 == 0)
         {
            _loc4_ = _avatars.getValue(_loc3_) as class_3156;
         }
         else
         {
            _loc3_ += "-" + param2;
            if(_loc4_ = var_2214.getValue(_loc3_) as class_3156)
            {
               _loc4_.forceActionUpdate();
            }
         }
         if(_loc4_ == null)
         {
            if((_loc4_ = var_2443.getAvatar(var_427,param1,var_122,this,this)) != null)
            {
               if(param2 == 0)
               {
                  _avatars.add(_loc3_,_loc4_);
               }
               else
               {
                  if(false)
                  {
                     if(_loc5_ = var_2214.remove(var_2214.getKey(0)))
                     {
                        _loc5_.dispose();
                     }
                  }
                  var_2214.add(_loc3_,_loc4_);
               }
            }
         }
         return _loc4_;
      }
      
      public function getAvatarRendererAsset(param1:String) : IAsset
      {
         return !!var_2443 ? var_2443.getAvatarRendererAsset(param1) : null;
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean, param4:Boolean = false) : Boolean
      {
         var _loc6_:* = false;
         var _loc5_:int = 0;
         var _loc7_:* = 0;
         if(param4 || var_2503 != param1.getUpdateID() || var_3173 != param2.updateId)
         {
            _loc6_ = param3;
            _loc5_ = ((_loc5_ = param1.getDirection().x - param2.direction.x) % 360 + 360) % 360;
            if(var_1302 == "sit" && var_2374)
            {
               _loc5_ -= _loc5_ % 90 - 45;
            }
            _loc7_ = _headAngle;
            if(var_1302 == "float")
            {
               _loc7_ = _loc5_;
            }
            else
            {
               _loc7_ -= param2.direction.x;
            }
            _loc7_ = (_loc7_ % 360 + 360) % 360;
            if(var_1302 == "sit" && var_2374 || var_1302 == "swdieback" || var_1302 == "swdiefront")
            {
               _loc7_ -= _loc7_ % 90 - 45;
            }
            if(_loc5_ != var_3339 || param4)
            {
               _loc6_ = true;
               var_3339 = _loc5_;
               _loc5_ = ((_loc5_ -= 112.5) + 360) % 360;
               var_1466.setDirectionAngle("full",_loc5_);
            }
            if(_loc7_ != var_3585 || param4)
            {
               _loc6_ = true;
               var_3585 = _loc7_;
               if(var_3585 != var_3339)
               {
                  _loc7_ = ((_loc7_ -= 112.5) + 360) % 360;
                  var_1466.setDirectionAngle("head",_loc7_);
               }
            }
            var_2503 = param1.getUpdateID();
            var_3173 = param2.updateId;
            return _loc6_;
         }
         return false;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc5_:IRoomObjectSprite = getSprite(1);
         _shadowAsset = null;
         var _loc4_:Boolean = var_1302 == "mv" || var_1302 == "std" || var_1302 == "sit" && var_2374;
         if(var_2371 == 97)
         {
            _loc4_ = false;
         }
         if(_loc4_)
         {
            _loc5_.visible = true;
            if(_shadowAsset == null || param1 != var_1545)
            {
               _loc2_ = 0;
               _loc3_ = 0;
               if(param1 < 48)
               {
                  _loc5_.libraryAssetName = "sh_std_sd_1_0_0";
                  _shadowAsset = var_1466.getAsset(_loc5_.libraryAssetName);
                  _loc2_ = -8;
                  _loc3_ = var_2374 ? 6 : -3;
               }
               else
               {
                  _loc5_.libraryAssetName = "h_std_sd_1_0_0";
                  _shadowAsset = var_1466.getAsset(_loc5_.libraryAssetName);
                  _loc2_ = -17;
                  _loc3_ = var_2374 ? 10 : -7;
               }
               if(_shadowAsset != null)
               {
                  _loc5_.asset = _shadowAsset.content as BitmapData;
                  _loc5_.offsetX = _loc2_;
                  _loc5_.offsetY = _loc3_;
                  _loc5_.alpha = 50;
                  _loc5_.relativeDepth = 1;
               }
               else
               {
                  _loc5_.visible = false;
               }
            }
         }
         else
         {
            _shadowAsset = null;
            _loc5_.visible = false;
         }
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean, param4:Boolean) : void
      {
         var _loc5_:int = 0;
         var _loc10_:IRoomObjectSprite = null;
         var _loc22_:IRoomObjectSprite = null;
         var _loc18_:Array = null;
         var _loc23_:Boolean = false;
         var _loc27_:BitmapData = null;
         var _loc36_:BitmapFilter = null;
         var _loc34_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:class_3292 = null;
         var _loc13_:int = 0;
         var _loc12_:int = 0;
         var _loc16_:class_3292 = null;
         var _loc42_:int = 0;
         var _loc17_:int = 0;
         var _loc19_:int = 0;
         var _loc21_:int = 0;
         var _loc26_:* = 0;
         var _loc31_:String = null;
         var _loc6_:BitmapDataAsset = null;
         var _loc32_:int = 0;
         var _loc8_:Boolean = false;
         var _loc38_:int = 0;
         var _loc37_:int = 0;
         var _loc39_:IRoomObject;
         if((_loc39_ = object) == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(var_2443 == null)
         {
            return;
         }
         if(--var_2864 <= 0 && var_1466)
         {
            var_1466.disposeInactiveActionCache();
            var_2864 = 500;
         }
         var _loc15_:* = param2 >= _lastAnimationUpdateTime + 41;
         if(param2 >= _lastAnimationUpdateTime + 41)
         {
            _lastAnimationUpdateTime += 41;
            if(_lastAnimationUpdateTime + 41 < param2)
            {
               _lastAnimationUpdateTime = param2 - 41;
            }
         }
         var _loc24_:IRoomObjectModel = _loc39_.getModel();
         var _loc11_:Number = param1.scale;
         var _loc7_:Boolean = false;
         var _loc20_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc35_:int = var_2371;
         var _loc41_:Boolean = false;
         var _loc33_:Boolean = updateModel(_loc24_,_loc11_,param3);
         if(_forceUpdate)
         {
            resetImages();
            _forceUpdate = false;
         }
         if(_loc33_ || _loc11_ != var_1545 || var_1466 == null)
         {
            if(_loc11_ != var_1545)
            {
               _loc20_ = true;
               validateActions(_loc11_);
            }
            if(_loc35_ != var_2371)
            {
               _loc41_ = true;
            }
            if(_loc20_ || var_1466 == null || _loc41_)
            {
               var_1466 = getAvatarImage(_loc11_,var_2371);
               if(var_1466 == null)
               {
                  return;
               }
               _loc7_ = true;
               if((_loc10_ = getSprite(0)) && var_1466 && var_1466.isPlaceholder())
               {
                  _loc10_.alpha = 150;
               }
               else if(_loc10_)
               {
                  _loc10_.alpha = 255;
               }
            }
            if(var_1466 == null)
            {
               return;
            }
            if(_loc41_ && false)
            {
               var_1466.resetAnimationFrameCounter();
            }
            updateShadow(_loc11_);
            _loc9_ = updateObject(_loc39_,param1,param3,true);
            updateActions(var_1466);
            if(var_1591)
            {
               _loc5_ = var_3663;
               for each(var _loc25_ in var_1591)
               {
                  _loc25_.update(getSprite(_loc5_++),_loc11_);
               }
            }
            var_1545 = _loc11_;
         }
         else
         {
            _loc9_ = updateObject(_loc39_,param1,param3);
         }
         if(_loc15_ && var_1591)
         {
            _loc5_ = var_3663;
            for each(_loc25_ in var_1591)
            {
               if(_loc25_.animate(getSprite(_loc5_++)))
               {
                  increaseUpdateId();
               }
            }
         }
         var _loc40_:Boolean = _loc9_ || _loc33_ || _loc20_;
         var _loc30_:Boolean = (var_2466 || var_3136 > 0) && param3 && _loc15_;
         if(_loc40_)
         {
            var_3136 = 2;
         }
         if(_loc40_ || _loc30_)
         {
            increaseUpdateId();
            if(_loc15_)
            {
               var_3136--;
               _updatesUntilFrameUpdate--;
            }
            if(!(_updatesUntilFrameUpdate <= 0 || _loc20_ || _loc33_ || _loc7_))
            {
               return;
            }
            var_1466.updateAnimationByFrames(1);
            _updatesUntilFrameUpdate = 2;
            if((_loc18_ = var_1466.getCanvasOffsets()) == null || _loc18_.length < 3)
            {
               _loc18_ = DEFAULT_CANVAS_OFFSETS;
            }
            if((_loc22_ = getSprite(0)) != null)
            {
               _loc23_ = _loc24_.getNumber("figure_highlight_enable") == 1 && _loc24_.getNumber("figure_highlight") == 1;
               if((_loc27_ = var_1466.getImage("full",_loc23_)) != null)
               {
                  if(_loc23_)
                  {
                     _loc36_ = new GlowFilter(16777215,1,6,6);
                     _loc27_.applyFilter(_loc27_,_loc27_.rect,new Point(0,0),_loc36_);
                  }
                  _loc22_.asset = _loc27_;
               }
               if(_loc22_.asset)
               {
                  _loc22_.offsetX = -1 * _loc11_ / 2 + _loc18_[0] - (_loc22_.asset.width - _loc11_) / 2;
                  _loc22_.offsetY = -_loc22_.asset.height + _loc11_ / 4 + _loc18_[1] + _geometryOffset;
                  if(var_1302 == "swdieback" || var_1302 == "swdiefront")
                  {
                     _loc22_.offsetY += 20 * _loc11_ / 32;
                  }
               }
               if(var_2582)
               {
                  if(var_3293)
                  {
                     _loc22_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc22_.relativeDepth = -0.409 + _loc18_[2];
                  }
               }
               else
               {
                  _loc22_.relativeDepth = -0.01 + _loc18_[2];
               }
               if(var_3477)
               {
                  _loc22_.relativeDepth -= 0.001;
                  _loc22_.spriteType = RoomObjectSpriteType.var_3809;
               }
               else
               {
                  _loc22_.spriteType = RoomObjectSpriteType.AVATAR;
               }
            }
            if(_loc25_ = getAddition(2) as TypingBubble)
            {
               if(!var_2582)
               {
                  TypingBubble(_loc25_).relativeDepth = -0.02 + _loc18_[2];
               }
               else
               {
                  TypingBubble(_loc25_).relativeDepth = -0.419 + _loc18_[2];
               }
            }
            var_2466 = var_1466.isAnimating();
            _loc34_ = 2;
            _loc28_ = var_1466.getDirection();
            for each(var _loc14_ in var_1466.getSprites())
            {
               if(_loc14_.id == "avatar")
               {
                  _loc22_ = getSprite(0);
                  _loc29_ = var_1466.getLayerData(_loc14_);
                  _loc13_ = _loc14_.getDirectionOffsetX(_loc28_);
                  _loc12_ = _loc14_.getDirectionOffsetY(_loc28_);
                  if(_loc29_ != null)
                  {
                     _loc13_ += _loc29_.dx;
                     _loc12_ += _loc29_.dy;
                  }
                  if(_loc11_ < 48)
                  {
                     _loc13_ /= 2;
                     _loc12_ /= 2;
                  }
                  if(!var_2374)
                  {
                     _loc22_.offsetX += _loc13_;
                     _loc22_.offsetY += _loc12_;
                  }
               }
               else
               {
                  if((_loc22_ = getSprite(_loc34_)) != null)
                  {
                     _loc22_.alphaTolerance = 256;
                     _loc22_.visible = true;
                     _loc16_ = var_1466.getLayerData(_loc14_);
                     _loc42_ = 0;
                     _loc17_ = _loc14_.getDirectionOffsetX(_loc28_);
                     _loc19_ = _loc14_.getDirectionOffsetY(_loc28_);
                     _loc21_ = _loc14_.getDirectionOffsetZ(_loc28_);
                     _loc26_ = 0;
                     if(_loc14_.hasDirections)
                     {
                        _loc26_ = _loc28_;
                     }
                     if(_loc16_ != null)
                     {
                        _loc42_ = _loc16_.animationFrame;
                        _loc17_ += _loc16_.dx;
                        _loc19_ += _loc16_.dy;
                        _loc26_ += _loc16_.directionOffset;
                     }
                     if(_loc11_ < 48)
                     {
                        _loc17_ /= 2;
                        _loc19_ /= 2;
                     }
                     if(_loc26_ < 0)
                     {
                        _loc26_ += 8;
                     }
                     else if(_loc26_ > 7)
                     {
                        _loc26_ -= 8;
                     }
                     _loc31_ = var_1466.getScale() + "_" + _loc14_.member + "_" + _loc26_ + "_" + _loc42_;
                     _loc6_ = var_1466.getAsset(_loc31_);
                     _loc32_ = var_1466.getScale() == "sh" ? 32 : 64;
                     _loc8_ = false;
                     if(_loc6_ == null)
                     {
                        if(var_1466.getScale() == "sh")
                        {
                           _loc31_ = "h_" + _loc14_.member + "_" + _loc26_ + "_" + _loc42_;
                           _loc6_ = var_1466.getAsset(_loc31_);
                           _loc8_ = true;
                        }
                        if(_loc6_ == null)
                        {
                           continue;
                        }
                     }
                     _loc22_.asset = _loc8_ ? class_3310.resampleBitmapData(_loc6_.content as BitmapData,0.5) : _loc6_.content as BitmapData;
                     _loc38_ = _loc8_ ? _loc6_.offset.x / 2 : _loc6_.offset.x;
                     _loc37_ = _loc8_ ? _loc6_.offset.y / 2 : _loc6_.offset.y;
                     _loc22_.offsetX = -_loc38_ - _loc32_ / 2 + _loc17_;
                     _loc22_.offsetY = -_loc37_ + _loc19_;
                     if(_loc14_.hasStaticY)
                     {
                        _loc22_.offsetY += var_3315 * _loc11_ / 2000;
                     }
                     else
                     {
                        _loc22_.offsetY += _geometryOffset;
                     }
                     if(var_2582)
                     {
                        _loc22_.relativeDepth = -0.409 - 0.001 * spriteCount * _loc21_;
                     }
                     else
                     {
                        _loc22_.relativeDepth = -0.01 - 0.001 * spriteCount * _loc21_;
                     }
                     if(_loc14_.ink == 33)
                     {
                        _loc22_.blendMode = "add";
                     }
                     else
                     {
                        _loc22_.blendMode = "normal";
                     }
                  }
                  _loc34_++;
               }
            }
         }
      }
      
      private function updateActions(param1:class_3156) : void
      {
         var _loc3_:String = null;
         var _loc5_:IRoomObjectSprite = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction("posture",var_1302,var_3371);
         if(var_535 > 0)
         {
            param1.appendAction("gest",AvatarAction.getGesture(var_535));
         }
         if(var_951 > 0)
         {
            param1.appendAction("dance",var_951);
         }
         if(var_3219 > -1)
         {
            param1.appendAction("sign",var_3219);
         }
         if(var_2549 > 0)
         {
            param1.appendAction("cri",var_2549);
         }
         if(var_2061 > 0)
         {
            param1.appendAction("usei",var_2061);
         }
         if(var_3597)
         {
            param1.appendAction("talk");
         }
         if(var_3390 || var_3039)
         {
            param1.appendAction("Sleep");
         }
         if(var_515 > 0)
         {
            _loc3_ = AvatarAction.getExpression(var_515);
            if(_loc3_ != "")
            {
               var _loc7_:* = _loc3_;
               if("dance" !== _loc7_)
               {
                  param1.appendAction(_loc3_);
               }
               else
               {
                  param1.appendAction("dance",2);
               }
            }
         }
         if(var_2371 > 0)
         {
            param1.appendAction("fx",var_2371);
         }
         param1.endActionAppends();
         var_2466 = param1.isAnimating();
         var _loc2_:int = 2;
         for each(var _loc4_ in var_1466.getSprites())
         {
            if(_loc4_.id != "avatar")
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
         var_3663 = _loc2_;
         if(var_1591)
         {
            for each(var _loc6_ in var_1591)
            {
               _loc5_ = addSprite();
            }
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         _forceUpdate = true;
      }
      
      public function avatarEffectReady(param1:int) : void
      {
         _forceUpdate = true;
      }
      
      protected function get numAdditions() : int
      {
         return !!var_1591 ? var_1591.length : 0;
      }
      
      public function addAddition(param1:IAvatarAddition) : IAvatarAddition
      {
         if(!var_1591)
         {
            var_1591 = new class_24();
         }
         if(var_1591.hasKey(param1.id))
         {
            throw new Error("Avatar addition with index " + param1.id + "already exists!");
         }
         var_1591.add(param1.id,param1);
         return param1;
      }
      
      public function getAddition(param1:int) : IAvatarAddition
      {
         return !!var_1591 ? var_1591[param1] : null;
      }
      
      public function removeAddition(param1:int) : void
      {
         var _loc2_:IAvatarAddition = getAddition(param1);
         if(!_loc2_)
         {
            return;
         }
         var_1591.remove(param1);
         _loc2_.dispose();
      }
   }
}
