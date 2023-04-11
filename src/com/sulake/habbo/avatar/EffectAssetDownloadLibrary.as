package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.class_79;
   import com.sulake.core.runtime.events.EventDispatcherWrapper;
   import com.sulake.core.utils.class_39;
   import com.sulake.core.utils.class_43;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import package_50.class_1631;
   
   public class EffectAssetDownloadLibrary extends EventDispatcherWrapper implements class_1631
   {
      
      private static var STATE_IDLE:int = 0;
      
      private static var STATE_DOWNLOADING:int = 1;
      
      private static var STATE_READY:int = 2;
       
      
      private var var_159:int;
      
      private var _name:String;
      
      private var _revision:String;
      
      private var _downloadUrl:String;
      
      private var _assets:class_21;
      
      private var _animation:XML;
      
      public function EffectAssetDownloadLibrary(param1:String, param2:String, param3:String, param4:class_21, param5:String)
      {
         super();
         var_159 = STATE_IDLE;
         _assets = param4;
         _name = param1;
         _revision = param2;
         _downloadUrl = param3 + param5;
         _downloadUrl = _downloadUrl.replace("%libname%",_name);
         _downloadUrl = _downloadUrl.replace("%revision%",_revision);
         var _loc7_:class_21;
         var _loc6_:AssetLibraryCollection;
         if((_loc7_ = (_loc6_ = _assets as AssetLibraryCollection).getAssetLibraryByUrl(_name + ".swf")) != null)
         {
            var_159 = STATE_READY;
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      public function startDownloading() : void
      {
         var_159 = STATE_DOWNLOADING;
         var _loc1_:URLRequest = new URLRequest(_downloadUrl);
         var _loc2_:class_39 = new class_39();
         _assets.loadFromFile(_loc2_,true);
         _loc2_.addEventListener("LIBRARY_LOADER_EVENT_COMPLETE",onLoaderComplete);
         _loc2_.addEventListener("LIBRARY_LOADER_EVENT_ERROR",onLoaderError);
         _loc2_.load(_loc1_);
      }
      
      private function onLoaderError(param1:class_43) : void
      {
         class_79.error("Could not load effect asset library " + _name + " from URL " + _downloadUrl + " HTTP status " + param1.status + " bytes loaded " + param1.bytesLoaded + "/" + param1.bytesTotal,false,2);
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var _loc5_:ByteArray = null;
         var _loc3_:ByteArray = null;
         var _loc2_:class_39 = param1.target as class_39;
         _loc2_.removeEventListener("LIBRARY_LOADER_EVENT_COMPLETE",onLoaderComplete);
         _loc2_.removeEventListener("LIBRARY_LOADER_EVENT_ERROR",onLoaderError);
         var _loc4_:Object;
         if((_loc4_ = (_loc2_.resource as Object).animation) is XML)
         {
            _animation = _loc4_ as XML;
         }
         else if(_loc4_ is Class)
         {
            _loc5_ = new (_loc4_ as Class)() as ByteArray;
            _animation = {_loc5_.readUTFBytes(_loc5_.length)};
         }
         else if(_loc4_ is ByteArray)
         {
            _loc3_ = _loc4_ as ByteArray;
            _animation = {_loc3_.readUTFBytes(_loc3_.length)};
         }
         var_159 = STATE_READY;
         dispatchEvent(new Event("complete"));
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get isReady() : Boolean
      {
         return var_159 == STATE_READY;
      }
      
      public function toString() : String
      {
         var _loc1_:String = _name;
         return _loc1_ + (isReady ? "[x]" : "[ ]");
      }
      
      public function get animation() : XML
      {
         return _animation;
      }
   }
}
