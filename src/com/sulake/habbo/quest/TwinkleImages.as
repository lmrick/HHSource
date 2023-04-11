package com.sulake.habbo.quest
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.runtime.class_20;
   import flash.display.BitmapData;
   
   public class TwinkleImages implements class_13
   {
      
      private static const IMAGE_COUNT:int = 6;
       
      
      private var _questEngine:com.sulake.habbo.quest.HabboQuestEngine;
      
      public function TwinkleImages(param1:com.sulake.habbo.quest.HabboQuestEngine)
      {
         var _loc2_:int = 0;
         super();
         _questEngine = param1;
         _loc2_ = 1;
         while(_loc2_ <= 6)
         {
            _questEngine.windowManager.resourceManager.retrieveAsset(getImageUri(_loc2_),null);
            _loc2_++;
         }
      }
      
      private static function getImageUri(param1:int) : String
      {
         return "${image.library.questing.url}ach_twinkle" + param1 + ".png";
      }
      
      public function getImage(param1:int) : BitmapData
      {
         var _loc2_:IAsset = null;
         if(_questEngine != null)
         {
            _loc2_ = class_20(_questEngine.windowManager).assets.getAssetByName(_questEngine.interpolate(getImageUri(param1)));
            if(_loc2_ != null && _loc2_ is BitmapDataAsset)
            {
               return _loc2_.content as BitmapData;
            }
         }
         return null;
      }
      
      public function dispose() : void
      {
         _questEngine = null;
      }
      
      public function get disposed() : Boolean
      {
         return _questEngine != null;
      }
   }
}
