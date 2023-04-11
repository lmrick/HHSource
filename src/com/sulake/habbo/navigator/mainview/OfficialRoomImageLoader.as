package com.sulake.habbo.navigator.mainview
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.habbo.navigator.class_1686;
   import flash.display.BitmapData;
   import flash.net.URLRequest;
   
   public class OfficialRoomImageLoader implements class_13
   {
       
      
      private var _navigator:class_1686;
      
      private var var_1248:String;
      
      private var var_90:String;
      
      private var var_2022:class_3282;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomImageLoader(param1:class_1686, param2:String, param3:class_3282)
      {
         super();
         _navigator = param1;
         var_1248 = param2;
         var_2022 = param3;
         var _loc4_:String;
         var_90 = (_loc4_ = _navigator.getProperty("image.library.url")) + var_1248;
         class_14.log("[OFFICIAL ROOM ICON IMAGE DOWNLOADER] : " + var_90);
      }
      
      public function startLoad() : void
      {
         var _loc1_:URLRequest = null;
         var _loc2_:AssetLoaderStruct = null;
         if(_navigator.assets.hasAsset(var_1248))
         {
            setImage();
         }
         else
         {
            _loc1_ = new URLRequest(var_90);
            _loc2_ = _navigator.assets.loadAssetFromFile(var_1248,_loc1_,"image/gif");
            _loc2_.addEventListener("AssetLoaderEventComplete",onImageReady);
            _loc2_.addEventListener("AssetLoaderEventError",onLoadError);
         }
      }
      
      private function onImageReady(param1:AssetLoaderEvent) : void
      {
         if(_disposed)
         {
            return;
         }
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ == null)
         {
            class_14.log("Loading pic from url: " + var_90 + " failed. loaderStruct == null");
            return;
         }
         setImage();
      }
      
      private function setImage() : void
      {
         var _loc1_:BitmapData = null;
         if(_navigator && var_2022)
         {
            _loc1_ = _navigator.getButtonImage(var_1248,"");
            if(_loc1_)
            {
               var_2022.disposesBitmap = false;
               var_2022.bitmap = _loc1_;
               var_2022.width = _loc1_.width;
               var_2022.height = _loc1_.height;
               var_2022.visible = true;
            }
            else
            {
               class_14.log("OfficialRoomImageLoader - Image not found: " + var_1248);
            }
         }
         dispose();
      }
      
      private function onLoadError(param1:AssetLoaderEvent) : void
      {
         class_14.log("Error loading image: " + var_90 + ", " + param1);
         dispose();
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_2022 = null;
         _navigator = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
   }
}
