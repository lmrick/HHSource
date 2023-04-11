package com.sulake.core.assets.loaders
{
   import flash.media.Sound;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   
   public class SoundFileLoader extends class_37 implements class_36
   {
       
      
      protected var var_90:String;
      
      protected var var_271:String;
      
      protected var var_34:Sound;
      
      private var var_247:int;
      
      public function SoundFileLoader(param1:String, param2:URLRequest = null, param3:int = -1)
      {
         super();
         var_90 = param2 == null ? "" : param2.url;
         var_271 = param1;
         var_34 = new Sound(null,null);
         var_34.addEventListener("id3",loadEventHandler);
         var_34.addEventListener("open",loadEventHandler);
         var_34.addEventListener("complete",loadEventHandler);
         var_34.addEventListener("ioError",loadEventHandler);
         var_34.addEventListener("progress",loadEventHandler);
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
         return var_34;
      }
      
      public function get bytes() : ByteArray
      {
         var _loc1_:ByteArray = new ByteArray();
         var_34.extract(_loc1_,var_34.length);
         return _loc1_;
      }
      
      public function get mimeType() : String
      {
         return var_271;
      }
      
      public function get bytesLoaded() : uint
      {
         return !!var_34 ? var_34.bytesLoaded : 0;
      }
      
      public function get bytesTotal() : uint
      {
         return !!var_34 ? var_34.bytesTotal : 0;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            var_34.removeEventListener("id3",loadEventHandler);
            var_34.removeEventListener("open",loadEventHandler);
            var_34.removeEventListener("complete",loadEventHandler);
            var_34.removeEventListener("ioError",loadEventHandler);
            var_34.removeEventListener("progress",loadEventHandler);
            var_34 = null;
            var_271 = null;
            var_90 = null;
            super.dispose();
         }
      }
      
      public function load(param1:URLRequest) : void
      {
         var_90 = param1.url;
         var_34.load(param1,null);
      }
   }
}
