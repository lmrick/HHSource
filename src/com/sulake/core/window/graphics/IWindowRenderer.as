package com.sulake.core.window.graphics
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3178;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   
   public interface IWindowRenderer extends class_13
   {
       
      function set debug(param1:Boolean) : void;
      
      function render() : void;
      
      function addToRenderQueue(param1:class_3127, param2:Rectangle, param3:uint) : void;
      
      function flushRenderQueue() : void;
      
      function invalidate(param1:class_3178, param2:Rectangle) : void;
      
      function getDrawBufferForRenderable(param1:class_3127) : BitmapData;
      
      function purge(param1:class_3127 = null, param2:Boolean = true) : void;
   }
}
