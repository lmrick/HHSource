package com.sulake.core.assets.loaders
{
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.utils.ByteArray;
   
   public class ZipFileLoader extends class_37 implements class_36
   {
       
      
      protected var var_90:String;
      
      protected var var_271:String;
      
      protected var var_33:URLStream;
      
      protected var var_45:ByteArray;
      
      private var var_247:int;
      
      public function ZipFileLoader(param1:String, param2:URLRequest = null, param3:int = -1)
      {
         super();
         var_90 = param2 == null ? "" : param2.url;
         var_271 = param1;
         var_33 = new URLStream();
         var_33.addEventListener("complete",loadEventHandler);
         var_33.addEventListener("httpStatus",loadEventHandler);
         var_33.addEventListener("ioError",loadEventHandler);
         var_33.addEventListener("open",loadEventHandler);
         var_33.addEventListener("progress",loadEventHandler);
         var_33.addEventListener("securityError",loadEventHandler);
         var_247 = param3;
         if(param2 != null)
         {
            this.load(param2);
         }
      }
      
      public function get url() : String
      {
         return var_90;
      }
      
      public function get content() : Object
      {
         return !!var_45 ? var_45 : var_33;
      }
      
      public function get bytes() : ByteArray
      {
         if(var_45)
         {
            return var_45;
         }
         var _loc1_:ByteArray = new ByteArray();
         var_33.readBytes(_loc1_);
         return _loc1_;
      }
      
      public function get mimeType() : String
      {
         return var_271;
      }
      
      public function get bytesLoaded() : uint
      {
         return var_33.bytesAvailable;
      }
      
      public function get bytesTotal() : uint
      {
         return var_33.bytesAvailable;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function load(param1:URLRequest) : void
      {
         var_90 = param1.url;
         var_33.load(param1);
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            var_33.removeEventListener("complete",loadEventHandler);
            var_33.removeEventListener("httpStatus",loadEventHandler);
            var_33.removeEventListener("ioError",loadEventHandler);
            var_33.removeEventListener("open",loadEventHandler);
            var_33.removeEventListener("progress",loadEventHandler);
            var_33.removeEventListener("securityError",loadEventHandler);
            var_33.close();
            var_33 = null;
            var_271 = null;
            var_90 = null;
         }
      }
   }
}
