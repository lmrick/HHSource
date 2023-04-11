package com.sulake.habbo.window
{
   import com.sulake.core.assets.IResourceManager;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.IInputEventTracker;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.class_3178;
   import com.sulake.habbo.window.utils.IModalDialog;
   import com.sulake.habbo.window.utils.class_3132;
   import com.sulake.habbo.window.utils.class_3144;
   import com.sulake.habbo.window.utils.class_3216;
   import flash.geom.Rectangle;
   import flash.text.StyleSheet;
   
   public interface IHabboWindowManager extends IUnknown, ICoreWindowManager
   {
       
      
      function createWindow(param1:String, param2:String = "", param3:uint = 0, param4:uint = 0, param5:uint = 0, param6:Rectangle = null, param7:Function = null, param8:uint = 0, param9:uint = 1, param10:String = "") : class_3127;
      
      function removeWindow(param1:String, param2:uint = 1) : void;
      
      function getWindowByName(param1:String, param2:uint = 1) : class_3127;
      
      function getActiveWindow(param1:uint = 1) : class_3127;
      
      function toggleFullScreen() : void;
      
      function getWindowContext(param1:uint) : class_3178;
      
      function alert(param1:String, param2:String, param3:uint, param4:Function) : class_3132;
      
      function alertWithModal(param1:String, param2:String, param3:uint, param4:Function) : class_3132;
      
      function alertWithLink(param1:String, param2:String, param3:String, param4:String, param5:uint, param6:Function) : class_3144;
      
      function confirm(param1:String, param2:String, param3:uint, param4:Function) : class_3216;
      
      function confirmWithModal(param1:String, param2:String, param3:uint, param4:Function) : class_3216;
      
      function registerLocalizationParameter(param1:String, param2:String, param3:String, param4:String = "%") : void;
      
      function addMouseEventTracker(param1:IInputEventTracker) : void;
      
      function removeMouseEventTracker(param1:IInputEventTracker) : void;
      
      function createUnseenItemCounter() : class_3151;
      
      function get resourceManager() : IResourceManager;
      
      function buildModalDialogFromXML(param1:XML) : IModalDialog;
      
      function simpleAlert(param1:String, param2:String, param3:String, param4:String = null, param5:String = null, param6:class_24 = null, param7:String = null, param8:Function = null, param9:Function = null) : void;
      
      function get assets() : class_21;
      
      function registerHintWindow(param1:String, param2:class_3127, param3:int = 1) : void;
      
      function unregisterHintWindow(param1:String) : void;
      
      function showHint(param1:String, param2:Rectangle = null) : void;
      
      function hideHint() : void;
      
      function displayFloorPlanEditor() : void;
      
      function openHelpPage(param1:String) : void;
      
      function get habboPagesStyleSheet() : StyleSheet;
      
      function hideMatchingHint(param1:String) : void;
   }
}
