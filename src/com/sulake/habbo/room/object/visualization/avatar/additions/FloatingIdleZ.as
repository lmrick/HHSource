package com.sulake.habbo.room.object.visualization.avatar.additions
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualization;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import flash.display.BitmapData;
   import flash.utils.getTimer;
   
   public class FloatingIdleZ implements IAvatarAddition
   {
      
      private static const DELAY_BEFORE_ANIMATION:int = 2000;
      
      private static const DELAY_PER_FRAME:int = 2000;
      
      private static const STATE_DELAY:int = 0;
      
      private static const STATE_FRAME_A:int = 1;
      
      private static const STATE_FRAME_B:int = 2;
       
      
      protected var var_247:int;
      
      protected var var_224:AvatarVisualization;
      
      private var _asset:BitmapDataAsset;
      
      private var _startTime:int;
      
      private var _offsetY:int;
      
      private var var_757:Number;
      
      private var var_159:int = -1;
      
      public function FloatingIdleZ(param1:int, param2:AvatarVisualization)
      {
         super();
         var_247 = param1;
         var_224 = param2;
         _startTime = getTimer();
         var_159 = 0;
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
      
      protected function getAssetNameForFrame(param1:int) : String
      {
         var _loc2_:String = "left";
         if(false)
         {
            _loc2_ = "right";
         }
         return "user_idle_" + _loc2_ + "_" + param1 + (var_757 < 48 ? "_small" : "") + "_png";
      }
      
      public function animate(param1:IRoomObjectSprite) : Boolean
      {
         if(!param1)
         {
            return false;
         }
         if(var_159 == 0)
         {
            if(getTimer() - _startTime >= 2000)
            {
               var_159 = 1;
               _startTime = getTimer();
               _asset = var_224.getAvatarRendererAsset(getAssetNameForFrame(1)) as BitmapDataAsset;
            }
         }
         if(var_159 == 1)
         {
            if(getTimer() - _startTime >= 2000)
            {
               var_159 = 2;
               _startTime = getTimer();
               _asset = var_224.getAvatarRendererAsset(getAssetNameForFrame(2)) as BitmapDataAsset;
            }
         }
         if(var_159 == 2)
         {
            if(getTimer() - _startTime >= 2000)
            {
               var_159 = 1;
               _startTime = getTimer();
               _asset = var_224.getAvatarRendererAsset(getAssetNameForFrame(1)) as BitmapDataAsset;
            }
         }
         if(_asset)
         {
            param1.asset = _asset.content as BitmapData;
            param1.alpha = 255;
            param1.visible = true;
         }
         else
         {
            param1.visible = false;
         }
         return false;
      }
      
      public function update(param1:IRoomObjectSprite, param2:Number) : void
      {
         var _loc3_:int = 0;
         if(!param1)
         {
            return;
         }
         var_757 = param2;
         _asset = var_224.getAvatarRendererAsset(getAssetNameForFrame(var_159 == 1 ? 1 : 2)) as BitmapDataAsset;
         var _loc4_:int = 64;
         if(param2 < 48)
         {
            if(false)
            {
               _loc3_ = 10;
            }
            else
            {
               _loc3_ = -16;
            }
            _offsetY = -38;
            _loc4_ = 32;
         }
         else
         {
            if(false)
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
            _offsetY += _loc4_ - 0.3 * _loc4_;
         }
         if(_asset != null)
         {
            param1.asset = _asset.content as BitmapData;
            param1.offsetX = _loc3_;
            param1.offsetY = _offsetY;
            param1.relativeDepth = -0.02;
            param1.alpha = 0;
         }
      }
   }
}
