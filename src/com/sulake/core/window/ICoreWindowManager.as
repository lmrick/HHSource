package com.sulake.core.window
{
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.components.class_3234;
   import com.sulake.core.window.utils.INotify;
   import flash.geom.Rectangle;
   
   public interface ICoreWindowManager
   {
       
      
      function create(param1:String, param2:uint, param3:uint, param4:uint, param5:Rectangle, param6:Function = null, param7:String = "", param8:uint = 0, param9:Array = null, param10:class_3127 = null, param11:Array = null, param12:String = "") : class_3127;
      
      function destroy(param1:class_3127) : void;
      
      function buildFromXML(param1:XML, param2:uint = 1, param3:class_24 = null) : class_3127;
      
      function windowToXMLString(param1:class_3127) : String;
      
      function getDesktop(param1:uint) : class_3234;
      
      function notify(param1:String, param2:String, param3:Function, param4:uint = 0) : INotify;
      
      function findWindowByName(param1:String) : class_3127;
      
      function findWindowByTag(param1:String) : class_3127;
      
      function groupWindowsWithTag(param1:String, param2:Array, param3:int = 0) : uint;
   }
}
