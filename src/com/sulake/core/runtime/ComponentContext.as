package com.sulake.core.runtime
{
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.events.ErrorEvent;
   import com.sulake.core.runtime.events.ILinkEventTracker;
   import com.sulake.core.runtime.events.LockEvent;
   import com.sulake.core.runtime.events.WarningEvent;
   import com.sulake.core.runtime.exceptions.InvalidComponentException;
   import com.sulake.core.utils.class_39;
   import com.sulake.core.utils.class_43;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   

   public class ComponentContext extends com.sulake.core.runtime.class_20 implements class_31
   {
       
      
      private var _linkEventTrackers:Vector.<ILinkEventTracker>;
      
      protected var var_43:Vector.<com.sulake.core.runtime.class_20>;
      
      protected var var_74:Vector.<class_1528>;
      
      protected var _loaders:Vector.<class_39>;
      
      protected var var_145:Boolean = false;
      
      protected var var_69:DisplayObjectContainer;
      
      private var _configuration:com.sulake.core.runtime.class_19;
      
      public function ComponentContext(param1:class_31, param2:uint = 0, param3:class_21 = null)
      {
         var_69 = new Sprite();
         var_43 = new Vector.<com.sulake.core.runtime.class_20>();
         var_74 = new Vector.<class_1528>();
         _linkEventTrackers = new Vector.<ILinkEventTracker>(0);
         super(param1,param2 | 2,param3);
      }
      
      public function get root() : class_31
      {
         if(!context || context == this)
         {
            return this;
         }
         return context.root;
      }
      
      public function get displayObjectContainer() : DisplayObjectContainer
      {
         return var_69;
      }
      
      override public function purge() : void
      {
         super.purge();
         for each(var _loc1_ in var_43)
         {
            if(_loc1_ != this)
            {
               _loc1_.purge();
            }
         }
      }
      
      public function debug(param1:String) : void
      {
         var_1135 = param1;
         if(var_145 && events)
         {
            events.dispatchEvent(new Event("COMPONENT_EVENT_DEBUG"));
         }
      }
      
      public function getLastDebugMessage() : String
      {
         return var_1135;
      }
      
      public function warning(param1:String) : void
      {
         var_1313 = param1;
         if(events != null)
         {
            events.dispatchEvent(new WarningEvent("COMPONENT_EVENT_WARNING",param1));
         }
      }
      
      public function getLastWarningMessage() : String
      {
         return var_1313;
      }
      
      public function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void
      {
         _lastError = param1;
         if(events != null)
         {
            events.dispatchEvent(new ErrorEvent("COMPONENT_EVENT_ERROR",param1,param2,param3,param4));
         }
      }
      
      public function getLastErrorMessage() : String
      {
         return _lastError;
      }
      
      final public function loadFromFile(param1:URLRequest, param2:LoaderContext) : class_39
      {
         var _loc3_:class_39 = null;
         if(_loaders == null)
         {
            _loaders = new Vector.<class_39>();
         }
         for each(_loc3_ in _loaders)
         {
            if(_loc3_.url == param1.url)
            {
               return _loc3_;
            }
         }
         _loc3_ = new class_39(param2,var_145);
         _loc3_.addEventListener("LIBRARY_LOADER_EVENT_COMPLETE",loadReadyHandler,false);
         _loc3_.addEventListener("LIBRARY_LOADER_EVENT_ERROR",loadErrorHandler,false);
         _loc3_.addEventListener("LIBRARY_LOADER_EVENT_DEBUG",loadDebugHandler,false);
         _loc3_.load(param1);
         _loaders.push(_loc3_);
         return _loc3_;
      }
      
      final protected function loadReadyHandler(param1:class_43) : void
      {
         var _loc2_:class_39 = param1.target as class_39;
         removeLibraryLoader(_loc2_);
         prepareComponent(_loc2_.resource,0,_loc2_.domain);
      }
      
      protected function loadErrorHandler(param1:class_43) : void
      {
         var _loc2_:class_39 = null;
         _loc2_ = param1.target as class_39;
         var _loc3_:String = _loc2_.getLastErrorMessage();
         removeLibraryLoader(_loc2_);
         error("Failed to download component resource \"" + _loc2_.url + "\"!" + "\r" + _loc3_,true,5);
      }
      
      protected function loadDebugHandler(param1:class_43) : void
      {
         var _loc2_:class_39 = null;
         _loc2_ = param1.target as class_39;
         var _loc3_:String = _loc2_.getLastDebugMessage();
         debug(_loc3_);
      }
      
      protected function removeLibraryLoader(param1:class_39) : void
      {
         param1.removeEventListener("LIBRARY_LOADER_EVENT_COMPLETE",loadReadyHandler,false);
         param1.removeEventListener("LIBRARY_LOADER_EVENT_ERROR",loadReadyHandler,false);
         param1.dispose();
         var _loc2_:int = _loaders.indexOf(param1);
         if(_loc2_ > -1)
         {
            _loaders.splice(_loc2_,1);
         }
      }
      
      public function prepareAssetLibrary(param1:XML, param2:Class) : Boolean
      {
         return assets.loadFromResource(param1,param2);
      }
      
      final public function prepareComponent(param1:Class, param2:uint = 0, param3:ApplicationDomain = null) : IUnknown
      {
         var _loc11_:* = null;
         var _loc16_:Object = null;
         var _loc23_:ByteArray = null;
         var _loc8_:Class = null;
         var _loc4_:String = null;
         var _loc13_:XMLList = null;
         var _loc21_:com.sulake.core.runtime.class_20 = null;
         var _loc5_:* = null;
         var _loc9_:Class = null;
         var _loc7_:String = null;
         var _loc10_:IID = null;
         var _loc18_:String = null;
         var _loc19_:IUnknown = null;
         var _loc6_:XML = null;
         var _loc14_:* = 0;
         var _loc17_:XMLList = null;
         var _loc20_:XML = null;
         var _loc15_:* = 0;
         if(param3 == null)
         {
            param3 = ApplicationDomain.currentDomain;
         }
         try
         {
            if((_loc16_ = (param1 as Object).manifest) is XML)
            {
               _loc11_ = _loc16_ as XML;
            }
            else if(_loc16_ is Class)
            {
               _loc23_ = new (_loc16_ as Class)() as ByteArray;
               _loc11_ = {_loc23_.readUTFBytes(_loc23_.length)};
            }
         }
         catch(e:Error)
         {
            _loc11_ = null;
         }
         if(_loc11_ == null)
         {
            return null;
         }
         var _loc12_:XMLList = _loc11_.child("component");
         _loc14_ = 0;
         while(_loc14_ < _loc12_.length())
         {
            _loc18_ = (_loc6_ = _loc12_[_loc14_]).attribute("version");
            _loc4_ = _loc6_.attribute("class");
            _loc17_ = _loc6_.child("assets");
            var _loc22_:XMLList = _loc6_.child("aliases");
            var _loc24_:class_21 = null;
            if(_loc17_.length() > 0)
            {
               (_loc20_ = <manifest><library /></manifest>).library.appendChild(_loc17_);
               _loc20_.library.appendChild(_loc22_);
               (_loc24_ = new AssetLibrary("_assets@" + _loc4_,_loc20_)).loadFromResource(_loc20_,param1);
            }
            if((_loc8_ = param3.getDefinition(_loc4_) as Class) == null)
            {
               _loc8_ = getDefinitionByName(_loc4_) as Class;
            }
            if(_loc8_ == null)
            {
               error("Invalid component class " + _loc4_ + "!",true,4);
               return null;
            }
            if((_loc21_ = _loc24_ == null ? new _loc8_(this,param2) : new _loc8_(this,param2,_loc24_)) != null)
            {
               if(_loc24_ != null)
               {
                  if(_loc21_.assets != _loc24_)
                  {
                     _loc24_.dispose();
                     error("Component \"" + _loc4_ + "\" did not save provided asset library!",true,4);
                  }
               }
               _loc13_ = _loc6_.child("interface");
               _loc5_ = [];
               _loc15_ = 0;
               while(_loc15_ < _loc13_.length())
               {
                  _loc7_ = String(_loc13_[_loc15_].attribute("iid"));
                  if((_loc9_ = param3.getDefinition(_loc7_) as Class) == null)
                  {
                     _loc9_ = getDefinitionByName(_loc7_) as Class;
                  }
                  if(_loc9_ == null)
                  {
                     throw new InvalidComponentException("Identifier class defined in manifest not found: " + _loc7_);
                  }
                  _loc10_ = new _loc9_();
                  _loc19_ = _loc21_ as IUnknown;
                  getInterfaceStructList(_loc21_).insert(new InterfaceStruct(_loc10_,_loc21_));
                  _loc5_.push(_loc10_);
                  _loc15_++;
               }
               attachComponent(_loc21_,_loc5_);
            }
            _loc14_++;
         }
         return _loc21_ as IUnknown;
      }
      
      final public function attachComponent(param1:com.sulake.core.runtime.class_20, param2:Array) : void
      {
         var _loc6_:* = 0;
         var _loc4_:IID = null;
         var _loc3_:IID = null;
         if(var_43 == null)
         {
            return;
         }
         if(var_43.indexOf(param1) > -1)
         {
            error("Component " + param1 + " already attached to context!",false);
            return;
         }
         var_43.push(param1);
         if(param1.locked)
         {
            param1.events.addEventListener("_INTERNAL_EVENT_UNLOCKED",unlockEventHandler);
         }
         var _loc5_:uint = param2.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = param2[_loc6_];
            if(getInterfaceStructList(param1).find(_loc4_) == null)
            {
               getInterfaceStructList(param1).insert(new InterfaceStruct(_loc4_,param1));
            }
            getInterfaceStructList(this).insert(new InterfaceStruct(_loc4_,param1));
            _loc6_++;
         }
         if(!param1.locked)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               _loc3_ = param2[_loc6_];
               if(hasQueueForInterface(_loc3_))
               {
                  announceInterfaceAvailability(_loc3_,param1);
               }
               _loc6_++;
            }
         }
      }
      
      final public function detachComponent(param1:com.sulake.core.runtime.class_20) : void
      {
         var _loc2_:InterfaceStruct = null;
         var _loc4_:* = 0;
         var _loc5_:InterfaceStructList;
         var _loc3_:int = (_loc5_ = getInterfaceStructList(this)).getIndexByImplementor(param1);
         while(_loc3_ > -1)
         {
            _loc2_ = _loc5_.remove(_loc3_);
            _loc3_ = _loc5_.getIndexByImplementor(param1);
         }
         _loc4_ = 0;
         while(_loc4_ < var_43.length)
         {
            if(var_43[_loc4_] == param1)
            {
               var_43.splice(_loc4_,1);
               param1.events.removeEventListener("_INTERNAL_EVENT_UNLOCKED",unlockEventHandler);
               return;
            }
            _loc4_++;
         }
      }
      
      override public function queueInterface(param1:IID, param2:Function = null) : IUnknown
      {
         var _loc5_:IUnknown = null;
         var _loc4_:InterfaceStructList;
         if((_loc4_ = getInterfaceStructList(this)) == null)
         {
            return null;
         }
         var _loc3_:InterfaceStruct = _loc4_.getStructByInterface(param1);
         if(_loc3_ != null)
         {
            if(_loc3_.unknown == this && _loc3_.iis == getQualifiedClassName(param1))
            {
               return super.queueInterface(param1,param2);
            }
            if(_loc5_ = _loc3_.unknown.queueInterface(param1,param2))
            {
               return _loc5_;
            }
         }
         if(param2 != null)
         {
            addQueueeForInterface(param1,param2);
            if(context && context != this)
            {
               context.queueInterface(param1,announceInterfaceAvailability);
            }
         }
         return null;
      }
      
      final protected function addQueueeForInterface(param1:IID, param2:Function) : void
      {
         var _loc3_:class_1528 = null;
         if(hasQueueForInterface(param1))
         {
            _loc3_ = getQueueForInterface(param1);
         }
         else
         {
            _loc3_ = new class_1528(param1);
            var_74.push(_loc3_);
         }
         _loc3_.receivers.unshift(param2);
      }
      
      final protected function hasQueueForInterface(param1:IID) : Boolean
      {
         var _loc4_:* = 0;
         if(var_74 == null)
         {
            return false;
         }
         var _loc2_:String = getQualifiedClassName(param1);
         var _loc3_:Number = 0;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if(getQualifiedClassName(var_74[_loc4_].identifier) == _loc2_)
            {
               return true;
            }
            _loc4_++;
         }
         return false;
      }
      
      final protected function getQueueForInterface(param1:IID) : class_1528
      {
         var _loc5_:class_1528 = null;
         var _loc4_:* = 0;
         var _loc2_:String = getQualifiedClassName(param1);
         var _loc3_:Number = 0;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = var_74[_loc4_];
            if(getQualifiedClassName(_loc5_.identifier) == _loc2_)
            {
               return _loc5_;
            }
            _loc4_++;
         }
         return null;
      }
      
      final protected function announceInterfaceAvailability(param1:IID, param2:com.sulake.core.runtime.class_20) : void
      {
         var _loc6_:IUnknown = null;
         var _loc4_:* = 0;
         var _loc5_:class_1528;
         if((_loc5_ = getQueueForInterface(param1)) == null)
         {
            return;
         }
         var _loc3_:uint = _loc5_.receivers.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc6_ = param2.queueInterface(param1)) == null)
            {
               error("Interface " + param1 + " still unavailable!",true,6);
            }
            if(_loc5_.receivers != null)
            {
               _loc5_.receivers.pop()(param1,_loc6_);
            }
            _loc4_++;
         }
      }
      
      override public function dispose() : void
      {
         var _loc2_:* = 0;
         var _loc1_:class_39 = null;
         if(!disposed)
         {
            super.dispose();
            if(var_43 != null)
            {
               _loc2_ = 0;
               while(_loc2_-- > 0)
               {
                  IUnknown(var_43.pop()).dispose();
               }
               var_43 = null;
            }
            if(var_74 != null)
            {
               _loc2_ = 0;
               while(_loc2_-- > 0)
               {
                  class_13(var_74.pop()).dispose();
               }
               var_74 = null;
            }
            if(_loaders != null)
            {
               _loc2_ = 0;
               while(_loc2_-- > 0)
               {
                  _loc1_ = _loaders[0];
                  removeLibraryLoader(_loc1_);
                  _loc1_.dispose();
               }
               _loaders = null;
            }
         }
      }
      
      private function unlockEventHandler(param1:LockEvent) : void
      {
         var _loc2_:InterfaceStruct = null;
         var _loc4_:* = null;
         var _loc3_:com.sulake.core.runtime.class_20 = param1.unknown as com.sulake.core.runtime.class_20;
         if(!_loc3_.disposed)
         {
            _loc3_.events.removeEventListener("_INTERNAL_EVENT_UNLOCKED",unlockEventHandler);
         }
         if(!disposed)
         {
            _loc4_ = [];
            getInterfaceStructList(this).mapStructsByImplementor(_loc3_,_loc4_);
            while(_loc4_.length && !_loc3_.disposed && !disposed)
            {
               _loc2_ = _loc4_.pop();
               announceInterfaceAvailability(_loc2_.iid,_loc3_);
            }
            root.events.dispatchEvent(new Event("COMPONENT_EVENT_UNLOCKED"));
         }
      }
      
      override public function toXMLString(param1:uint = 0) : String
      {
         var _loc9_:* = 0;
         var _loc3_:InterfaceStruct = null;
         var _loc10_:* = 0;
         var _loc4_:com.sulake.core.runtime.class_20 = null;
         var _loc11_:* = 0;
         var _loc6_:String = "";
         _loc9_ = 0;
         while(_loc9_ < param1)
         {
            _loc6_ += "\t";
            _loc9_++;
         }
         var _loc7_:String = getQualifiedClassName(this);
         var _loc2_:String = "";
         _loc2_ += _loc6_ + "<context class=\"" + _loc7_ + "\" >\n";
         var _loc5_:* = [];
         var _loc8_:uint = getInterfaceStructList(this).mapStructsByImplementor(this,_loc5_);
         _loc10_ = 0;
         while(_loc10_ < _loc8_)
         {
            _loc3_ = _loc5_[_loc10_];
            _loc2_ += _loc6_ + "\t<interface iid=\"" + _loc3_.iis + "\" refs=\"" + _loc3_.references + "\"/>\n";
            _loc10_++;
         }
         _loc11_ = 0;
         while(_loc11_ < var_43.length)
         {
            if((_loc4_ = var_43[_loc11_] as com.sulake.core.runtime.class_20) != this)
            {
               _loc2_ += _loc4_.toXMLString(param1 + 1);
            }
            _loc11_++;
         }
         return _loc2_ + (_loc6_ + "</context>\n");
      }
      
      public function set configuration(param1:com.sulake.core.runtime.class_19) : void
      {
         _configuration = param1;
      }
      
      public function get configuration() : com.sulake.core.runtime.class_19
      {
         return _configuration;
      }
      
      public function addLinkEventTracker(param1:ILinkEventTracker) : void
      {
         if(_linkEventTrackers.indexOf(param1) < 0)
         {
            _linkEventTrackers.push(param1);
         }
      }
      
      public function removeLinkEventTracker(param1:ILinkEventTracker) : void
      {
         var _loc2_:int = _linkEventTrackers.indexOf(param1);
         if(_loc2_ > -1)
         {
            _linkEventTrackers.splice(_loc2_,1);
         }
      }
      
      public function createLinkEvent(param1:String) : void
      {
         for each(var _loc2_ in _linkEventTrackers)
         {
            if(_loc2_.linkPattern.length > 0)
            {
               if(param1.substr(0,_loc2_.linkPattern.length) == _loc2_.linkPattern)
               {
                  _loc2_.linkReceived(param1);
               }
            }
            else
            {
               _loc2_.linkReceived(param1);
            }
         }
      }
      
      public function get linkEventTrackers() : Vector.<ILinkEventTracker>
      {
         return _linkEventTrackers;
      }
   }
}
