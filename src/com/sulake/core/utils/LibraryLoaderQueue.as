package com.sulake.core.utils
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.runtime.events.EventDispatcherWrapper;
   
   public class LibraryLoaderQueue extends EventDispatcherWrapper implements class_13
   {
      
      protected static const MAX_SIMULTANEOUS_DOWNLOADS:int = 4;
       
      
      private var var_145:Boolean = false;
      
      private var var_80:Array;
      
      private var _loaders:Array;
      
      public function LibraryLoaderQueue(param1:Boolean = false)
      {
         var_80 = [];
         _loaders = [];
         var_145 = param1;
         super();
      }
      
      public function get length() : int
      {
         return NaN;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!disposed)
         {
            for each(_loc1_ in _loaders)
            {
               _loc1_.dispose();
            }
            for each(_loc1_ in var_80)
            {
               _loc1_.dispose();
            }
            _loaders = null;
            var_80 = null;
            super.dispose();
         }
      }
      
      public function push(param1:class_39) : void
      {
         if(!disposed && !isUrlInQueue(param1.url) && !findLibraryLoaderByURL(param1.url))
         {
            if(param1.paused)
            {
               var_80.push(param1);
            }
            else
            {
               _loaders.push(param1);
            }
            param1.addEventListener("LIBRARY_LOADER_EVENT_COMPLETE",libraryLoadedHandler);
            param1.addEventListener("LIBRARY_LOADER_EVENT_PROGRESS",loadProgressHandler);
            param1.addEventListener("LIBRARY_LOADER_EVENT_DISPOSE",loaderDisposeHandler);
            param1.addEventListener("LIBRARY_LOADER_EVENT_ERROR",loadErrorHandler);
            next();
         }
      }
      
      private function next() : void
      {
         var _loc1_:class_39 = null;
         if(!disposed)
         {
            while(false)
            {
               _loc1_ = var_80.shift();
               _loaders.push(_loc1_);
               _loc1_.resume();
            }
         }
      }
      
      private function libraryLoadedHandler(param1:class_43) : void
      {
         var _loc2_:class_39 = param1.target as class_39;
         if(_loc2_)
         {
            removeLoader(_loc2_);
         }
         next();
      }
      
      private function loadProgressHandler(param1:class_43) : void
      {
         var _loc2_:class_39 = param1.target as class_39;
      }
      
      private function loaderDisposeHandler(param1:class_43) : void
      {
         var _loc2_:class_39 = param1.target as class_39;
         removeLoader(_loc2_);
         next();
      }
      
      private function loadErrorHandler(param1:class_43) : void
      {
         var _loc2_:class_39 = param1.target as class_39;
         if(_loc2_)
         {
            removeLoader(_loc2_);
         }
         next();
      }
      
      private function removeLoader(param1:class_39) : void
      {
         var _loc2_:int = 0;
         param1.removeEventListener("LIBRARY_LOADER_EVENT_COMPLETE",libraryLoadedHandler);
         param1.removeEventListener("LIBRARY_LOADER_EVENT_PROGRESS",loadProgressHandler);
         param1.removeEventListener("LIBRARY_LOADER_EVENT_DISPOSE",loaderDisposeHandler);
         param1.removeEventListener("LIBRARY_LOADER_EVENT_ERROR",loadErrorHandler);
         try
         {
            _loc2_ = var_80.indexOf(param1);
            if(_loc2_ > -1)
            {
               var_80.splice(_loc2_,1);
            }
            _loc2_ = _loaders.indexOf(param1);
            if(_loc2_ > -1)
            {
               _loaders.splice(_loc2_,1);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private function isUrlInQueue(param1:String, param2:Boolean = true) : Boolean
      {
         if(!disposed)
         {
            if(param2 && param1.indexOf("?") > -1)
            {
               param1 = param1.slice(0,param1.indexOf("?"));
            }
            for each(var _loc3_ in var_80)
            {
               if(param2)
               {
                  if(_loc3_.url.indexOf(param1) == 0)
                  {
                     return true;
                  }
               }
               else if(_loc3_.url == param1)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function findLibraryLoaderByURL(param1:String, param2:Boolean = true) : class_39
      {
         if(!disposed)
         {
            if(param2 && param1.indexOf("?") > -1)
            {
               param1 = param1.slice(0,param1.indexOf("?"));
            }
            for each(var _loc3_ in _loaders)
            {
               if(param2)
               {
                  if(_loc3_.url.indexOf(param1) == 0)
                  {
                     return _loc3_;
                  }
               }
               else if(_loc3_.url == param1)
               {
                  return _loc3_;
               }
            }
         }
         return null;
      }
   }
}
