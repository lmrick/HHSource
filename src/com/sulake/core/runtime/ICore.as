package com.sulake.core.runtime
{
   import com.sulake.core.utils.class_68;
   import flash.events.IEventDispatcher;
   import flash.utils.Dictionary;

   public interface ICore extends class_31, class_19
   {
      
      function initialize() : void;
      
      function purge() : void;
      
      function hibernate(param1:int, param2:int = 1) : void;
      
      function resume() : void;
      
      function get fileProxy() : class_68;
      
      function writeDictionaryToProxy(param1:String, param2:Dictionary) : Boolean;
      
      function readDictionaryFromProxy(param1:String) : Dictionary;
      
      function writeXMLToProxy(param1:String, param2:XML) : Boolean;
      
      function readXMLFromProxy(param1:String) : XML;
      
      function readStringFromProxy(param1:String) : String;
      
      function writeStringToProxy(param1:String, param2:String) : Boolean;
      
      function readConfigDocument(param1:XML, param2:IEventDispatcher = null) : void;
      
      function getNumberOfFilesPending() : uint;
      
      function getNumberOfFilesLoaded() : uint;
      
      function setProfilerMode(param1:Boolean) : void;
      
      function get arguments() : Dictionary;
      
      function clearArguments() : void;
   }
}
