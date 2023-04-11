package com.sulake.core.runtime
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.events.ILinkEventTracker;
   import com.sulake.core.utils.class_39;
   import flash.display.DisplayObjectContainer;
   import flash.events.IEventDispatcher;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;

   public interface IContext extends IUnknown
   {
       
      
      function get assets() : class_21;
      
      function get events() : IEventDispatcher;
      
      function get root() : IContext;
      
      function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void;
      
      function getLastErrorMessage() : String;
      
      function debug(param1:String) : void;
      
      function getLastDebugMessage() : String;
      
      function warning(param1:String) : void;
      
      function getLastWarningMessage() : String;
      
      function get displayObjectContainer() : DisplayObjectContainer;
      
      function loadFromFile(param1:URLRequest, param2:LoaderContext) : class_39;
      
      function attachComponent(param1:class_20, param2:Array) : void;
      
      function detachComponent(param1:class_20) : void;
      
      function prepareComponent(param1:Class, param2:uint = 0, param3:ApplicationDomain = null) : IUnknown;
      
      function prepareAssetLibrary(param1:XML, param2:Class) : Boolean;
      
      function registerUpdateReceiver(param1:class_41, param2:uint) : void;
      
      function removeUpdateReceiver(param1:class_41) : void;
      
      function toXMLString(param1:uint = 0) : String;
      
      function get configuration() : class_19;
      
      function set configuration(param1:class_19) : void;
      
      function addLinkEventTracker(param1:ILinkEventTracker) : void;
      
      function removeLinkEventTracker(param1:ILinkEventTracker) : void;
      
      function createLinkEvent(param1:String) : void;
      
      function get linkEventTrackers() : Vector.<ILinkEventTracker>;
   }
}
