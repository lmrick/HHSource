package com.sulake.habbo.room.object.visualization.avatar.additions
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualization;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import flash.display.BitmapData;
   import flash.utils.getTimer;
   
   public class FloatingHeart extends ExpressionAddition
   {
      
      private static const DELAY_BEFORE_ANIMATION:int = 300;
      
      private static const STATE_DELAY:int = 0;
      
      private static const STATE_FADE_IN:int = 1;
      
      private static const STATE_FLOAT:int = 2;
      
      private static const STATE_COMPLETE:int = 3;
       
      
      private var _asset:BitmapDataAsset;
      
      private var _startTime:int;
      
      private var var_1684:Number = 0;
      
      private var _offsetY:int;
      
      private var var_757:Number;
      
      private var var_159:int = -1;
      
      public function FloatingHeart(param1:int, param2:int, param3:AvatarVisualization)
      {
         super(param1,param2,param3);
         _startTime = getTimer();
         var_159 = 0;
      }
      
      override public function animate(param1:IRoomObjectSprite) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc2_:int = 0;
         if(!param1)
         {
            return false;
         }
         if(_asset)
         {
            param1.asset = _asset.content as BitmapData;
         }
         if(var_159 == 0)
         {
            if(getTimer() - _startTime < 300)
            {
               return false;
            }
            var_159 = 1;
            param1.alpha = 0;
            param1.visible = true;
            var_1684 = 0;
            return true;
         }
         if(var_159 == 1)
         {
            var_1684 += 0.1;
            param1.offsetY = _offsetY;
            param1.alpha = Math.pow(var_1684,0.9) * 255;
            if(var_1684 >= 1)
            {
               var_1684 = 0;
               param1.alpha = 255;
               var_159 = 2;
            }
            return true;
         }
         if(var_159 == 2)
         {
            _loc3_ = Math.pow(var_1684,0.9);
            var_1684 += 0.05;
            _loc2_ = var_757 < 48 ? -30 : -40;
            param1.offsetY = _offsetY + (var_1684 < 1 ? _loc3_ : 1) * _loc2_;
            param1.alpha = (1 - _loc3_) * 255;
            if(param1.alpha <= 0)
            {
               param1.visible = false;
               var_159 = 3;
            }
            return true;
         }
         return false;
      }
      
      override public function update(param1:IRoomObjectSprite, param2:Number) : void
      {
         var _loc3_:int = 0;
         var _loc5_:Number = NaN;
         if(!param1)
         {
            return;
         }
         var_757 = param2;
         var _loc4_:int = 64;
         if(param2 < 48)
         {
            _asset = var_224.getAvatarRendererAsset("user_blowkiss_small_png") as BitmapDataAsset;
            if(false)
            {
               _loc3_ = 0;
            }
            else if(false)
            {
               _loc3_ = 6;
            }
            else
            {
               _loc3_ = -6;
            }
            _offsetY = -38;
            _loc4_ = 32;
         }
         else
         {
            _asset = var_224.getAvatarRendererAsset("user_blowkiss_png") as BitmapDataAsset;
            if(false)
            {
               _loc3_ = -3;
            }
            else if(false)
            {
               _loc3_ = 22;
            }
            else
            {
               _loc3_ = -30;
            }
            _offsetY = -70;
         }
         if(false)
         {
            _offsetY += _loc4_ / 2;
         }
         else if(false)
         {
            _offsetY += _loc4_;
         }
         if(_asset != null)
         {
            param1.asset = _asset.content as BitmapData;
            param1.offsetX = _loc3_;
            param1.offsetY = _offsetY;
            param1.relativeDepth = -0.02;
            param1.alpha = 0;
            _loc5_ = var_1684;
            animate(param1);
            var_1684 = _loc5_;
         }
      }
   }
}
