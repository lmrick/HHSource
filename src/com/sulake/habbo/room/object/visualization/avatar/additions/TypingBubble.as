package com.sulake.habbo.room.object.visualization.avatar.additions
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.habbo.room.object.visualization.avatar.AvatarVisualization;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import flash.display.BitmapData;
   
   public class TypingBubble implements IAvatarAddition
   {
       
      
      private var var_247:int = -1;
      
      private var _asset:BitmapDataAsset;
      
      private var var_224:AvatarVisualization;
      
      private var _relativeDepth:Number = 0;
      
      public function TypingBubble(param1:int, param2:AvatarVisualization)
      {
         super();
         var_247 = param1;
         var_224 = param2;
      }
      
      public function set relativeDepth(param1:Number) : void
      {
         _relativeDepth = param1;
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
      
      public function animate(param1:IRoomObjectSprite) : Boolean
      {
         if(_asset && param1)
         {
            param1.asset = _asset.content as BitmapData;
         }
         return false;
      }
      
      public function update(param1:IRoomObjectSprite, param2:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(!param1)
         {
            return;
         }
         param1.visible = true;
         param1.relativeDepth = _relativeDepth;
         param1.alpha = 255;
         var _loc5_:int = 64;
         if(param2 < 48)
         {
            _asset = var_224.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
            _loc3_ = 3;
            _loc4_ = -42;
            _loc5_ = 32;
         }
         else
         {
            _asset = var_224.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
            _loc3_ = 14;
            _loc4_ = -83;
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
            param1.asset = _asset.content as BitmapData;
            param1.offsetX = _loc3_;
            param1.offsetY = _loc4_;
            param1.relativeDepth = -0.02;
         }
      }
   }
}
