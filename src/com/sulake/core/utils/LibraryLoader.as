package com.sulake.core.utils
{
   import com.sulake.core.class_79;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.runtime.events.EventDispatcherWrapper;
   import flash.display.DisplayObject;
   import flash.display.FrameLabel;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.TimerEvent;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.system.System;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class LibraryLoader extends EventDispatcherWrapper implements class_13
   {
      
      protected static const STATE_EVENT_COMPLETE:uint = 1;
      
      protected static const STATE_EVENT_INIT:uint = 2;
      
      protected static const STATE_EVENT_FRAME:uint = 4;
      
      protected static const STATE_ANALYZE:uint = 3;
      
      protected static const STATE_READY:uint = 7;
      
      public static const DEFAULT_MAX_RETRIES:int = 5;
      
      public static const LIBRARY_LOADER_FINALIZE:String = "LIBRARY_LOADER_FINALIZE";
      
      public static const USE_DOWNLOAD_THROTTLING:Boolean = true;
      
      public static const MAX_SIMULTANEOUS_DOWNLOADS:int = 6;
      
      private static var var_322:Array = [];
      
      private static var var_206:Array = [];
       
      
      protected var var_16:Loader;
      
      protected var _context:LoaderContext;
      
      protected var _status:int = 0;
      
      protected var var_73:URLRequest;
      
      protected var var_62:XML;
      
      protected var var_101:Class;
      
      protected var var_55:uint = 0;
      
      protected var _name:String;
      
      protected var var_174:Boolean = false;
      
      protected var var_145:Boolean = false;
      
      protected var var_126:Boolean = false;
      
      protected var _errorMsg:String = "";
      
      protected var _debugMsg:String = "";
      
      protected var _downloadStartTime:int;
      
      protected var _downloadEndTime:int;
      
      protected var _downloadRetriesLeft:int;
      
      protected var var_1424:uint = 0;
      
      public function LibraryLoader(param1:LoaderContext = null, param2:Boolean = false, param3:Boolean = false)
      {
         super();
         if(param1 == null)
         {
            _context = new LoaderContext();
            _context.applicationDomain = ApplicationDomain.currentDomain;
         }
         else
         {
            _context = param1;
         }
         var_126 = param2;
         var_145 = param3;
         _status = 0;
         var_16 = new Loader();
         var_16.contentLoaderInfo.addEventListener("init",loadEventHandler);
         var_16.contentLoaderInfo.addEventListener("complete",loadEventHandler);
         var_16.contentLoaderInfo.addEventListener("progress",loadEventHandler);
         var_16.contentLoaderInfo.addEventListener("unload",loadEventHandler);
         var_16.contentLoaderInfo.addEventListener("httpStatus",loadEventHandler);
         var_16.contentLoaderInfo.addEventListener("ioError",loadEventHandler);
         var_16.contentLoaderInfo.addEventListener("securityError",loadEventHandler);
      }
      
      protected static function addRequestCounterToUrlRequest(param1:URLRequest, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc6_:String = null;
         if(param1.url == null || param1.url == "")
         {
            return;
         }
         var _loc4_:Array;
         var _loc5_:String = String((_loc4_ = param1.url.split("?"))[0]);
         var _loc9_:String = String(_loc4_.length > 1 ? _loc4_[1] : "");
         var _loc10_:Array = _loc9_.split("&");
         var _loc8_:Boolean = false;
         _loc3_ = 0;
         while(_loc3_ < _loc10_.length)
         {
            if((_loc6_ = String(_loc10_[_loc3_])).indexOf("counterparameter=") >= 0)
            {
               _loc6_ = "counterparameter=" + param2.toString();
               _loc10_[_loc3_] = _loc6_;
               _loc8_ = true;
               break;
            }
            _loc3_++;
         }
         if(!_loc8_)
         {
            _loc10_.push("counterparameter=" + param2);
         }
         _loc3_ = 0;
         while(_loc3_ < _loc10_.length)
         {
            _loc5_ += (_loc3_ == 0 ? "?" : "&") + _loc10_[_loc3_];
            _loc3_++;
         }
         param1.url = _loc5_;
      }
      
      protected static function parseNameFromUrl(param1:String) : String
      {
         var _loc2_:int = 0;
         _loc2_ = param1.indexOf("?",0);
         if(_loc2_ > -1)
         {
            param1 = param1.slice(0,_loc2_);
         }
         _loc2_ = param1.lastIndexOf(".");
         if(_loc2_ > -1)
         {
            param1 = param1.slice(0,_loc2_);
         }
         _loc2_ = param1.lastIndexOf("/");
         if(_loc2_ > -1)
         {
            param1 = param1.slice(_loc2_ + 1,param1.length);
         }
         return param1;
      }
      
      protected static function queue(param1:class_39) : void
      {
         if(var_322.indexOf(param1) == -1)
         {
            var_322.push(param1);
         }
         throttle();
      }
      
      protected static function throttle() : void
      {
         var _loc1_:class_39 = null;
         var _loc2_:int = 0;
         _loc2_ = -1;
         while(_loc2_ > -1)
         {
            _loc1_ = var_206[_loc2_] as class_39;
            if(_loc1_ && (_loc1_.ready || _loc1_.disposed))
            {
               var_206.splice(_loc2_,1);
            }
            _loc2_--;
         }
         while(false)
         {
            _loc1_ = var_322.shift() as class_39;
            if(!_loc1_.ready && !_loc1_.disposed)
            {
               var_206.push(_loc1_);
               _loc1_.var_16.load(_loc1_.var_73,_loc1_._context);
            }
         }
      }
      
      public function get url() : String
      {
         return !!var_73 ? var_73.url : null;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get ready() : Boolean
      {
         return var_174;
      }
      
      public function get status() : int
      {
         return _status;
      }
      
      public function get domain() : ApplicationDomain
      {
         return var_16.contentLoaderInfo.applicationDomain;
      }
      
      public function get request() : URLRequest
      {
         return var_73;
      }
      
      public function get resource() : Class
      {
         return var_101;
      }
      
      public function get manifest() : XML
      {
         return var_62;
      }
      
      public function get bytesTotal() : uint
      {
         return var_16.contentLoaderInfo.bytesTotal;
      }
      
      public function get bytesLoaded() : uint
      {
         return var_16.contentLoaderInfo.bytesLoaded;
      }
      
      public function get elapsedTime() : uint
      {
         return var_174 ? _downloadEndTime - _downloadStartTime : getTimer() - _downloadStartTime;
      }
      
      public function get paused() : Boolean
      {
         return var_126;
      }
      
      protected function get content() : DisplayObject
      {
         if(class_883.method_20(_name))
         {
            return class_883.method_20(_name) as DisplayObject;
         }
         return var_16.content;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            dispatchEvent(new class_43("LIBRARY_LOADER_EVENT_DISPOSE",_status,bytesTotal,bytesLoaded,elapsedTime));
            try
            {
               var_16.close();
            }
            catch(e:Error)
            {
            }
            try
            {
               var_16.unload();
            }
            catch(e:Error)
            {
            }
            var_16 = null;
            _context = null;
            var_101 = null;
            System.disposeXML(var_62);
            var_62 = null;
            super.dispose();
         }
      }
      
      public function load(param1:URLRequest, param2:int = 5) : void
      {
         var_73 = param1;
         _name = parseNameFromUrl(var_73.url);
         var_174 = false;
         _downloadRetriesLeft = param2;
         ErrorReportStorage.addDebugData("Library url","Library url " + param1.url);
         ErrorReportStorage.addDebugData("Library name","Library name " + _name);
         if(!var_126)
         {
            var_126 = true;
            resume();
         }
      }
      
      public function resume() : void
      {
         var _loc1_:Timer = null;
         if(var_126 && !_disposed)
         {
            var_126 = false;
            if(!var_174 && var_73)
            {
               _downloadEndTime = -1;
               _downloadStartTime = getTimer();
               if(hasDefinition(_name))
               {
                  class_14.log("[LibraryLoader] Found in AIR: " + _name);
                  _loc1_ = new Timer(10,1);
                  _loc1_.addEventListener("timer",loadEventHandler);
                  _loc1_.start();
                  return;
               }
               queue(this);
            }
         }
      }
      
      protected function retry() : Boolean
      {
         if(!var_174 && !_disposed && _downloadRetriesLeft > 0)
         {
            try
            {
               var_16.close();
               var_16.unload();
            }
            catch(e:Error)
            {
            }
            addRequestCounterToUrlRequest(var_73,5 - _downloadRetriesLeft);
            _downloadRetriesLeft--;
            var_55 = 0;
            var_16.load(var_73,_context);
            return true;
         }
         return false;
      }
      
      public function hasDefinition(param1:String) : Boolean
      {
         if(class_883.method_20(param1))
         {
            class_14.log("[LibraryLoader] Definition in resources: " + param1);
            return true;
         }
         var _loc2_:Boolean = false;
         try
         {
            _loc2_ = var_16.contentLoaderInfo.applicationDomain.hasDefinition(param1);
         }
         catch(e:Error)
         {
         }
         return _loc2_;
      }
      
      public function getDefinition(param1:String) : Object
      {
         if(class_883.method_20(param1))
         {
            return class_883.method_20(param1);
         }
         var _loc2_:Object = null;
         try
         {
            if(var_16.contentLoaderInfo.applicationDomain.hasDefinition(param1))
            {
               _loc2_ = var_16.contentLoaderInfo.applicationDomain.getDefinition(param1);
            }
         }
         catch(e:Error)
         {
         }
         return _loc2_;
      }
      
      protected function loadEventHandler(param1:Event) : void
      {
         var _loc3_:Timer = null;
         var _loc2_:Boolean = false;
         switch(param1.type)
         {
            case "init":
               debug("Load event INIT for file \"" + url + "\"");
               var_55 |= 2;
               break;
            case "complete":
               debug("Load event COMPLETE for file \"" + url + "\"");
               var_55 |= 1;
               break;
            case "enterFrame":
               break;
            case "httpStatus":
               _status = HTTPStatusEvent(param1).status;
               debug("Load event STATUS " + _status + " for file \"" + url + "\"");
               break;
            case "unload":
               debug("Load event UNLOAD for file \"" + url + "\"");
               dispatchEvent(new class_43("LIBRARY_LOADER_EVENT_UNLOAD",_status,bytesTotal,bytesLoaded,elapsedTime));
               break;
            case "progress":
               debug("Load event PROGRESS for file \"" + url + "\"  bytes: " + bytesLoaded + "/" + bytesTotal);
               dispatchEvent(new class_43("LIBRARY_LOADER_EVENT_PROGRESS",_status,bytesTotal,bytesLoaded,elapsedTime));
               break;
            case "ioError":
               debug("Load event IO ERROR for file \"" + url + "\"");
               if(!handleHttpStatus(_status))
               {
                  _downloadEndTime = getTimer();
                  failure("IO Error, send or load operation failed for file \"" + url + "\"");
                  removeEventListeners();
                  break;
               }
               break;
            case "securityError":
               _downloadEndTime = getTimer();
               failure("Security Error, security violation with file \"" + url + "\"");
               removeEventListeners();
               break;
            case "timer":
               _loc3_ = TimerEvent(param1).target as Timer;
               _loc3_.removeEventListener("timer",loadEventHandler);
               _loc3_.stop();
               if(!_disposed)
               {
                  var_55 = 7;
                  loadEventHandler(new Event("complete"));
               }
               return;
         }
         if(var_55 == 3)
         {
            if(analyzeLibrary())
            {
               var_55 |= 4;
            }
         }
         if(var_55 == 7)
         {
            _loc2_ = prepareLibrary();
            if(_loc2_)
            {
               var_174 = true;
               _downloadEndTime = getTimer();
               removeEventListeners();
               throttle();
               dispatchEvent(new class_43("LIBRARY_LOADER_EVENT_COMPLETE",_status,bytesTotal,bytesLoaded,elapsedTime));
               dispatchEvent(new Event("LIBRARY_LOADER_FINALIZE"));
            }
         }
      }
      
      protected function analyzeLibrary() : Boolean
      {
         var _loc1_:MovieClip = null;
         var _loc3_:FrameLabel = null;
         var _loc4_:Array = null;
         var _loc2_:* = 0;
         debug("Analyzing library \"" + _name + "\", content " + (content is MovieClip ? "is" : "is not") + " a MovieClip");
         if(content is MovieClip)
         {
            _loc1_ = content as MovieClip;
            _loc4_ = _loc1_.currentLabels;
            debug("\tLibrary \"" + _name + "\" is in frame " + _loc1_.currentFrame + "(" + _loc1_.currentLabel + ")");
            if(_loc4_.length > 1)
            {
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc3_ = _loc4_[_loc2_] as FrameLabel;
                  if(_loc3_.name == _name)
                  {
                     if(_loc3_.frame != _loc1_.currentFrame)
                     {
                        _loc1_.addEventListener("enterFrame",loadEventHandler);
                        return false;
                     }
                  }
                  _loc2_++;
               }
            }
         }
         return true;
      }
      
      [SecureSWF(controlFlow="0")]
      protected function prepareLibrary() : Boolean
      {
         var _loc3_:ByteArray = null;
         debug("Preparing library \"" + _name + "\"");
         var_101 = this.getDefinition(_name) as Class;
         if(var_101 == null)
         {
            if(!retry())
            {
               failure("Failed to find resource class \"" + _name + "\" from library " + var_73.url + "!");
            }
            return false;
         }
         var _loc1_:Boolean = true;
         var _loc2_:Class = null;
         try
         {
            _loc2_ = var_101.manifest as Class;
         }
         catch(e:Error)
         {
            if(!retry())
            {
               failure("Failed to find embedded manifest.xml from library undefined!");
            }
            _loc1_ = false;
         }
         if(_loc2_ == null || !_loc1_)
         {
            return false;
         }
         try
         {
            _loc3_ = new _loc2_() as ByteArray;
            var_62 = {_loc3_.readUTFBytes(_loc3_.length)};
         }
         catch(e:Error)
         {
            if(!retry())
            {
               failure("Failed to extract manifest.xml from library " + _name + "!\n" + e.message);
            }
            _loc1_ = false;
         }
         return _loc1_;
      }
      
      protected function handleHttpStatus(param1:int) : Boolean
      {
         if(param1 == 0 || param1 >= 400)
         {
            if(retry())
            {
               return true;
            }
            failure("HTTP Error " + param1 + " \"" + var_16.contentLoaderInfo.url + "\"");
            removeEventListeners();
         }
         return false;
      }
      
      protected function removeEventListeners() : void
      {
         if(var_16)
         {
            if(false)
            {
               var_16.content.removeEventListener("enterFrame",loadEventHandler);
            }
            var_16.contentLoaderInfo.removeEventListener("init",loadEventHandler);
            var_16.contentLoaderInfo.removeEventListener("complete",loadEventHandler);
            var_16.contentLoaderInfo.removeEventListener("progress",loadEventHandler);
            var_16.contentLoaderInfo.removeEventListener("unload",loadEventHandler);
            var_16.contentLoaderInfo.removeEventListener("httpStatus",loadEventHandler);
            var_16.contentLoaderInfo.removeEventListener("ioError",loadEventHandler);
            var_16.contentLoaderInfo.removeEventListener("securityError",loadEventHandler);
         }
      }
      
      protected function debug(param1:String) : void
      {
         class_79.debug(param1);
         _debugMsg = param1;
         if(var_145)
         {
            dispatchEvent(new class_43("LIBRARY_LOADER_EVENT_DEBUG",_status,bytesTotal,bytesLoaded,elapsedTime));
         }
      }
      
      protected function failure(param1:String) : void
      {
         class_79.warning(param1);
         _errorMsg = param1;
         throttle();
         dispatchEvent(new class_43("LIBRARY_LOADER_EVENT_ERROR",_status,bytesTotal,bytesLoaded,elapsedTime));
         dispatchEvent(new Event("LIBRARY_LOADER_FINALIZE"));
      }
      
      public function getLastDebugMessage() : String
      {
         return _debugMsg;
      }
      
      public function getLastErrorMessage() : String
      {
         return _errorMsg;
      }
   }
}
