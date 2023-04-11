package com.sulake.habbo.toolbar
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.class_3134;
   import flash.geom.Point;
   
   public class BottomBackgroundBorder implements class_13
   {
       
      
      private var _window:class_3151;
      
      private var _disposed:Boolean = false;
      
      public function BottomBackgroundBorder(param1:HabboToolbar)
      {
         super();
         _window = param1.windowManager.buildFromXML(param1.assets.getAssetByName("bottom_background_border_xml").content as XML) as class_3151;
         _window.procedure = onWindowEvent;
         updatePosition();
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
      }
      
      private function onWindowEvent(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WE_PARENT_RESIZED")
         {
            updatePosition();
         }
      }
      
      private function updatePosition() : void
      {
         _window.position = new Point(-10,_window.desktop.height - -3);
         _window.width = _window.desktop.width + 20;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
   }
}
