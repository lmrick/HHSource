package com.sulake.room.renderer.cache
{
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.utils.Canvas;
   import com.sulake.habbo.utils.StringUtil;
   import com.sulake.room.data.RoomObjectSpriteData;
   import com.sulake.room.object.enum.RoomObjectSpriteType;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.renderer.utils.class_3438;
 
   public class RoomObjectCache
   {
      
      private static const MAX_SIZE_FOR_AVG_COLOR:int = 200;
       
      
      private var var_45:class_24 = null;
      
      private var var_3769:String = "";
      
      public function RoomObjectCache(param1:String)
      {
         super();
         var_3769 = param1;
         var_45 = new class_24();
      }
      
      public function dispose() : void
      {
         var _loc2_:int = 0;
         var _loc1_:class_3448 = null;
         if(var_45 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < var_45.length)
            {
               _loc1_ = var_45.getWithIndex(_loc2_) as class_3448;
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
               _loc2_++;
            }
            var_45.dispose();
            var_45 = null;
         }
      }
      
      public function getObjectCache(param1:String) : class_3448
      {
         var _loc2_:class_3448 = var_45.getValue(param1) as class_3448;
         if(_loc2_ == null)
         {
            _loc2_ = new class_3448(var_3769);
            var_45.add(param1,_loc2_);
         }
         return _loc2_;
      }
      
      public function removeObjectCache(param1:String) : void
      {
         var _loc2_:class_3448 = var_45.remove(param1) as class_3448;
         if(_loc2_ != null)
         {
            _loc2_.dispose();
         }
      }
      
      public function getSortableSpriteList() : Vector.<RoomObjectSpriteData>
      {
         var _loc3_:RoomObjectSpriteData = null;
         var _loc6_:Boolean = false;
         var _loc4_:Vector.<RoomObjectSpriteData> = new Vector.<RoomObjectSpriteData>();
         var _loc5_:Array = var_45.getValues();
         for each(var _loc1_ in _loc5_)
         {
            for each(var _loc2_ in _loc1_.sprites.sprites)
            {
               if(_loc2_.sprite.spriteType != RoomObjectSpriteType.ROOM_PLANE && _loc2_.sprite.libraryAssetName != "")
               {
                  _loc3_ = new RoomObjectSpriteData();
                  _loc3_.objectId = _loc1_.objectId;
                  _loc3_.x = _loc2_.x;
                  _loc3_.y = _loc2_.y;
                  _loc3_.z = _loc2_.z;
                  _loc3_.name = StringUtil.nonNull(_loc2_.sprite.libraryAssetName);
                  _loc3_.flipH = _loc2_.sprite.flipH;
                  _loc3_.alpha = _loc2_.sprite.alpha;
                  _loc3_.color = _loc2_.sprite.color.toString();
                  _loc3_.blendMode = _loc2_.sprite.blendMode;
                  _loc3_.width = _loc2_.sprite.width;
                  _loc3_.height = _loc2_.sprite.height;
                  _loc3_.objectType = _loc2_.sprite.objectType;
                  _loc3_.posture = _loc2_.sprite.assetPosture;
                  if(_loc6_ = isSkewedSprite(_loc2_.sprite))
                  {
                     _loc3_.skew = _loc2_.sprite.direction % 4 == 0 ? -0.5 : 0.5;
                  }
                  if((_loc6_ || _loc3_.name.indexOf("%image.library.url%") >= 0 || _loc3_.name.indexOf("%group.badge.url%") >= 0) && _loc3_.width <= 200 && _loc3_.height <= 200)
                  {
                     _loc3_.color = Canvas.averageColor(_loc2_.sprite.asset).toString();
                     if(_loc2_.sprite.objectType.indexOf("external_image_wallitem") == 0)
                     {
                        _loc3_.frame = true;
                     }
                  }
                  _loc4_.push(_loc3_);
               }
            }
         }
         return _loc4_;
      }
      
      private function isSkewedSprite(param1:IRoomObjectSprite) : Boolean
      {
         if(!param1.objectType)
         {
            return false;
         }
         if(param1.objectType.indexOf("external_image_wallitem") == 0 && param1.tag == "THUMBNAIL")
         {
            return true;
         }
         if(param1.objectType.indexOf("guild_forum") == 0 && param1.tag == "THUMBNAIL")
         {
            return true;
         }
         return false;
      }
      
      public function getPlaneSortableSprites() : Array
      {
         var _loc3_:* = [];
         var _loc4_:Array = var_45.getValues();
         for each(var _loc1_ in _loc4_)
         {
            for each(var _loc2_ in _loc1_.sprites.sprites)
            {
               if(_loc2_.sprite.spriteType == RoomObjectSpriteType.ROOM_PLANE)
               {
                  _loc3_.push(_loc2_);
               }
            }
         }
         return _loc3_;
      }
   }
}
