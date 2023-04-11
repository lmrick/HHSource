package com.sulake.core.assets.loaders
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.display.PNGEncoderOptions;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class BitmapFileLoader extends class_37 implements class_36
   {
       
      
      protected var var_90:String;
      
      protected var var_271:String;
      
      protected var var_16:Loader;
      
      protected var var_218:LoaderContext;
      
      private var var_247:int = -1;
      
      public function BitmapFileLoader(param1:String, param2:URLRequest = null, param3:int = -1)
      {
         super();
         var_90 = param2 == null ? "" : param2.url;
         var_271 = param1;
         var_16 = new Loader();
         var_218 = new LoaderContext();
         var_218.checkPolicyFile = false;
         var_16.contentLoaderInfo.addEventListener("complete",completeEventHandler);
         var_16.contentLoaderInfo.addEventListener("unload",loadEventHandler);
         var_16.contentLoaderInfo.addEventListener("httpStatus",loadEventHandler);
         var_16.contentLoaderInfo.addEventListener("progress",loadEventHandler);
         var_16.contentLoaderInfo.addEventListener("ioError",loadEventHandler);
         var_16.contentLoaderInfo.addEventListener("securityError",loadEventHandler);
         var_247 = param3;
         if(param2 != null && param2.url != null)
         {
            var_16.load(param2,var_218);
         }
      }
      
      public function get url() : String
      {
         return var_90;
      }
      
      public function get content() : Object
      {
         return !!var_16 ? var_16.content : null;
      }
      
      public function get bytes() : ByteArray
      {
         var _loc2_:Bitmap = content as Bitmap;
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc1_:BitmapData = _loc2_.bitmapData;
         return _loc1_.encode(_loc1_.rect,new PNGEncoderOptions());
      }
      
      public function get mimeType() : String
      {
         return var_271;
      }
      
      public function get bytesLoaded() : uint
      {
         return !!var_16 ? var_16.contentLoaderInfo.bytesLoaded : 0;
      }
      
      public function get bytesTotal() : uint
      {
         return !!var_16 ? var_16.contentLoaderInfo.bytesTotal : 0;
      }
      
      public function get loaderContext() : LoaderContext
      {
         return var_218;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function load(param1:URLRequest) : void
      {
         var_90 = param1.url;
         var_49 = 0;
         var_16.load(param1,var_218);
      }
      
      override protected function retry() : Boolean
      {
         if(!_disposed)
         {
            if(++var_49 <= var_1259)
            {
               try
               {
                  var_16.close();
                  var_16.unload();
               }
               catch(e:Error)
               {
               }
               var_16.load(new URLRequest(var_90 + (var_90.indexOf("?") == -1 ? "?" : "&") + "retry=" + var_49),var_218);
               return true;
            }
         }
         return false;
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            var_16.contentLoaderInfo.removeEventListener("complete",completeEventHandler);
            var_16.contentLoaderInfo.removeEventListener("unload",loadEventHandler);
            var_16.contentLoaderInfo.removeEventListener("httpStatus",loadEventHandler);
            var_16.contentLoaderInfo.removeEventListener("progress",loadEventHandler);
            var_16.contentLoaderInfo.removeEventListener("ioError",loadEventHandler);
            var_16.contentLoaderInfo.removeEventListener("securityError",loadEventHandler);
            try
            {
               var_16.close();
            }
            catch(e:*)
            {
            }
            var_16.unload();
            var_16 = null;
            var_271 = null;
            var_90 = null;
         }
      }
      
      private function completeEventHandler(param1:Event) : void
      {
         loadEventHandler(param1);
      }
   }
}
