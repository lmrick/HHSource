package com.sulake.habbo.ui.widget.camera
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   
   public class CameraFxPreloader
   {
      
      private static var ASSETS:Dictionary;
      
      private static var instance:com.sulake.habbo.ui.widget.camera.CameraFxPreloader;
      
      private static var _urls:Array;
      
      private static var var_138:String;
       
      
      private var var_16:Loader;
      
      private var var_3881:Boolean = false;
      
      public function CameraFxPreloader()
      {
         super();
         var_16 = new Loader();
         var_16.contentLoaderInfo.addEventListener("complete",assetLoaded);
         var_16.contentLoaderInfo.addEventListener("ioError",loadFailed);
         loadNextImage();
      }
      
      public static function init(param1:String, param2:Array) : void
      {
         if(!instance)
         {
            ASSETS = new Dictionary();
            var_138 = param1;
            _urls = param2;
            instance = new com.sulake.habbo.ui.widget.camera.CameraFxPreloader();
         }
      }
      
      public static function preloadFinished() : Boolean
      {
         return instance != null ? instance.var_3881 : false;
      }
      
      public static function getImage(param1:String) : BitmapData
      {
         return ASSETS != null ? ASSETS[param1] : null;
      }
      
      private function loadNextImage() : void
      {
         var _loc1_:String = null;
         if(false)
         {
            _loc1_ = var_138 + "Habbo-Stories/" + _urls[0] + ".png";
            var_16.load(new URLRequest(_loc1_));
         }
         else
         {
            var_3881 = true;
         }
      }
      
      private function assetLoaded(param1:Event) : void
      {
         ASSETS[_urls.shift()] = Bitmap(var_16.content).bitmapData.clone();
         loadNextImage();
      }
      
      private function loadFailed(param1:Event) : void
      {
         class_14.log("Camera Fx preloading failed for " + var_16.contentLoaderInfo.loaderURL);
         _urls.shift();
         loadNextImage();
      }
   }
}
