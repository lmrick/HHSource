package com.sulake.habbo.room.object.visualization.avatar.additions
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualization;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import flash.display.BitmapData;
   
   public class NumberBubble implements IAvatarAddition
   {
       
      
      private var var_247:int = -1;
      
      private var var_224:AvatarVisualization;
      
      private var _asset:BitmapDataAsset;
      
      private var var_757:Number;
      
      private var var_3343:int = 0;
      
      private var _numberValueFadeDirection:int = 0;
      
      private var var_3244:Boolean = false;
      
      private var var_2709:int = 0;
      
      public function NumberBubble(param1:int, param2:int, param3:AvatarVisualization)
      {
         super();
         var_247 = param1;
         var_3343 = param2;
         var_224 = param3;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get disposed() : Boolean
      {
         return var_224 == null;
      }
      
      public function dispose() : void
      {
         var_224 = null;
         _asset = null;
      }
      
      public function update(param1:IRoomObjectSprite, param2:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(!param1)
         {
            return;
         }
         var_757 = param2;
         if(var_3343 > 0)
         {
            _loc5_ = 64;
            if(param2 < 48)
            {
               _asset = var_224.getAvatarRendererAsset("number_" + var_3343 + "_small_png") as BitmapDataAsset;
               _loc3_ = -6;
               _loc4_ = -52;
               _loc5_ = 32;
            }
            else
            {
               _asset = var_224.getAvatarRendererAsset("number_" + var_3343 + "_png") as BitmapDataAsset;
               _loc3_ = -8;
               _loc4_ = -105;
            }
            if(false)
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(false)
            {
               _loc4_ += _loc5_;
            }
            if(_asset != null)
            {
               param1.visible = true;
               param1.asset = _asset.content as BitmapData;
               param1.offsetX = _loc3_;
               param1.offsetY = _loc4_;
               param1.relativeDepth = -0.01;
               _numberValueFadeDirection = 1;
               var_3244 = true;
               var_2709 = 0;
               param1.alpha = 0;
            }
            else
            {
               param1.visible = false;
            }
         }
         else if(param1.visible)
         {
            _numberValueFadeDirection = -1;
         }
      }
      
      public function animate(param1:IRoomObjectSprite) : Boolean
      {
         var _loc2_:int = 0;
         if(!param1)
         {
            return false;
         }
         if(_asset)
         {
            param1.asset = _asset.content as BitmapData;
         }
         var _loc3_:int = param1.alpha;
         var _loc4_:Boolean = false;
         if(var_3244)
         {
            var_2709++;
            if(var_2709 < 10)
            {
               return false;
            }
            if(_numberValueFadeDirection < 0)
            {
               if(var_757 < 48)
               {
                  param1.offsetY -= 2;
               }
               else
               {
                  param1.offsetY -= 4;
               }
            }
            else
            {
               _loc2_ = 4;
               if(var_757 < 48)
               {
                  _loc2_ = 8;
               }
               if(var_2709 % _loc2_ == 0)
               {
                  param1.offsetY -= 1;
                  _loc4_ = true;
               }
            }
         }
         if(_numberValueFadeDirection > 0)
         {
            if(_loc3_ < 255)
            {
               _loc3_ += 32;
            }
            if(_loc3_ >= 255)
            {
               _loc3_ = 255;
               _numberValueFadeDirection = 0;
            }
            param1.alpha = _loc3_;
            return true;
         }
         if(_numberValueFadeDirection < 0)
         {
            if(_loc3_ >= 0)
            {
               _loc3_ -= 32;
            }
            if(_loc3_ <= 0)
            {
               _numberValueFadeDirection = 0;
               var_3244 = false;
               _loc3_ = 0;
               param1.visible = false;
            }
            param1.alpha = _loc3_;
            return true;
         }
         return _loc4_;
      }
   }
}
