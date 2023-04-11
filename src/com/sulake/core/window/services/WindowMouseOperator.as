package com.sulake.core.window.services
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.events.class_3134;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class WindowMouseOperator implements class_13
   {
       
      
      protected var var_464:DisplayObject;
      
      protected var _window:WindowController;
      
      protected var var_2312:Boolean;
      
      protected var _offset:Point;
      
      protected var _mouse:Point;
      
      protected var var_1684:Point;
      
      protected var var_423:uint;
      
      private var _disposed:Boolean = false;
      
      public function WindowMouseOperator(param1:DisplayObject)
      {
         super();
         var_464 = param1;
         var_1684 = new Point();
         _mouse = new Point();
         _offset = new Point();
         var_2312 = false;
         var_423 = 0;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         end(_window);
         _offset = null;
         _mouse = null;
         var_1684 = null;
         var_464 = null;
         _disposed = true;
      }
      
      public function begin(param1:class_3127, param2:uint = 0) : class_3127
      {
         var_423 = param2;
         var _loc3_:class_3127 = _window;
         if(_window != null)
         {
            end(_window);
         }
         if(param1 && !param1.disposed)
         {
            var_464.addEventListener("mouseDown",handler,false);
            var_464.addEventListener("mouseUp",handler,false);
            var_464.addEventListener("enterFrame",handler);
            _mouse.x = var_464.mouseX;
            _mouse.y = var_464.mouseY;
            _window = WindowController(param1);
            getMousePositionRelativeTo(param1,_mouse,_offset);
            _window.addEventListener("WE_DESTROYED",clientWindowDestroyed);
            var_2312 = true;
         }
         return _loc3_;
      }
      
      public function end(param1:class_3127) : class_3127
      {
         var _loc2_:class_3127 = _window;
         if(var_2312)
         {
            if(_window == param1)
            {
               var_464.removeEventListener("mouseDown",handler,false);
               var_464.removeEventListener("mouseUp",handler,false);
               var_464.removeEventListener("enterFrame",handler);
               if(true)
               {
                  _window.removeEventListener("WE_DESTROYED",clientWindowDestroyed);
               }
               _window = null;
               var_2312 = false;
            }
         }
         return _loc2_;
      }
      
      protected function handler(param1:Event) : void
      {
         var _loc2_:MouseEvent = null;
         if(var_2312)
         {
            if(param1.type == "enterFrame")
            {
               if(false)
               {
                  end(_window);
               }
               else if(false)
               {
                  operate(var_464.mouseX,var_464.mouseY);
                  _mouse.x = var_464.mouseX;
                  _mouse.y = var_464.mouseY;
               }
               return;
            }
            _loc2_ = param1 as MouseEvent;
            if(_loc2_ != null)
            {
               var _loc3_:* = _loc2_.type;
               if("mouseUp" === _loc3_)
               {
                  end(_window);
               }
            }
         }
      }
      
      public function operate(param1:int, param2:int) : void
      {
         _mouse.x = param1;
         _mouse.y = param2;
         getMousePositionRelativeTo(_window,_mouse,var_1684);
         _window.offset(0 - 0,0 - 0);
      }
      
      private function clientWindowDestroyed(param1:class_3134) : void
      {
         end(_window);
      }
      
      protected function getMousePositionRelativeTo(param1:class_3127, param2:Point, param3:Point) : void
      {
         param1.getGlobalPosition(param3);
         param3.x = param2.x - param3.x;
         param3.y = param2.y - param3.y;
      }
   }
}
