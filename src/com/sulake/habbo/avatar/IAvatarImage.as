package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.class_13;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.animation.class_3292;
   import com.sulake.habbo.avatar.animation.class_3341;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.display.BitmapData;
   
   public interface IAvatarImage extends class_13
   {
       
      
      function getCroppedImage(param1:String, param2:Number = 1) : BitmapData;
      
      function getImage(param1:String, param2:Boolean, param3:Number = 1) : BitmapData;
      
      function getServerRenderData() : Array;
      
      function setDirection(param1:String, param2:int) : void;
      
      function setDirectionAngle(param1:String, param2:int) : void;
      
      function updateAnimationByFrames(param1:int = 1) : void;
      
      function getScale() : String;
      
      function getSprites() : Vector.<ISpriteDataContainer>;
      
      function getLayerData(param1:ISpriteDataContainer) : class_3292;
      
      function getAsset(param1:String) : BitmapDataAsset;
      
      function getDirection() : int;
      
      function getFigure() : class_3182;
      
      function getPartColor(param1:String) : IPartColor;
      
      function isAnimating() : Boolean;
      
      function getCanvasOffsets() : Array;
      
      function initActionAppends() : void;
      
      function endActionAppends() : void;
      
      function appendAction(param1:String, ... rest) : Boolean;
      
      function get avatarSpriteData() : class_3341;
      
      function isPlaceholder() : Boolean;
      
      function forceActionUpdate() : void;
      
      function get animationHasResetOnToggle() : Boolean;
      
      function resetAnimationFrameCounter() : void;
      
      function get mainAction() : String;
      
      function disposeInactiveActionCache() : void;
   }
}
