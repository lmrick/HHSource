package com.sulake.core.window.utils
{
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class MouseEventQueue extends GenericEventQueue
   {
       
      
      protected var _mousePosition:Point;
      
      public function MouseEventQueue(param1:IEventDispatcher)
      {
         super(param1);
         _mousePosition = new Point();
         var_172.addEventListener("click",mouseEventListener,false);
         var_172.addEventListener("doubleClick",mouseEventListener,false);
         var_172.addEventListener("mouseDown",mouseEventListener,false);
         var_172.addEventListener("mouseMove",mouseEventListener,false);
         var_172.addEventListener("mouseUp",mouseEventListener,false);
         var_172.addEventListener("mouseWheel",mouseEventListener,false);
      }
      
      public function get mousePosition() : Point
      {
         return _mousePosition;
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            var_172.removeEventListener("click",mouseEventListener,false);
            var_172.removeEventListener("doubleClick",mouseEventListener,false);
            var_172.removeEventListener("mouseDown",mouseEventListener,false);
            var_172.removeEventListener("mouseMove",mouseEventListener,false);
            var_172.removeEventListener("mouseUp",mouseEventListener,false);
            var_172.removeEventListener("mouseWheel",mouseEventListener,false);
            super.dispose();
         }
      }
      
      private function mouseEventListener(param1:MouseEvent) : void
      {
         _mousePosition.x = param1.stageX;
         _mousePosition.y = param1.stageY;
         _eventArray.push(param1);
      }
   }
}
