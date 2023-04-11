package com.sulake.core.window
{
   import com.sulake.core.window.components.class_3234;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.utils.class_3337;
   import flash.geom.Rectangle;
   
   public interface IWindowContext
   {
       
      
      function getWindowServices() : IInternalWindowServices;
      
      function getWindowParser() : class_3337;
      
      function getDesktopWindow() : class_3234;
      
      function registerLocalizationListener(param1:String, param2:class_3127) : void;
      
      function removeLocalizationListener(param1:String, param2:class_3127) : void;
      
      function findWindowByName(param1:String) : class_3127;
      
      function findWindowByTag(param1:String) : class_3127;
      
      function groupChildrenWithTag(param1:String, param2:Array, param3:int = 0) : uint;
      
      function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:class_3127, param9:uint, param10:Array = null, param11:String = "", param12:Array = null) : class_3127;
      
      function destroy(param1:class_3127) : Boolean;
      
      function invalidate(param1:class_3127, param2:Rectangle, param3:uint) : void;
      
      function getLastError() : Error;
      
      function getLastErrorCode() : int;
      
      function flushError() : void;
      
      function addMouseEventTracker(param1:IInputEventTracker) : void;
      
      function removeMouseEventTracker(param1:IInputEventTracker) : void;
   }
}
