package com.sulake.core.window.services
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.events.WindowMouseEvent;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class WindowMouseListener extends WindowMouseOperator implements IMouseListenerService
   {
       
      
      private var var_2988:Array;
      
      private var var_2678:uint;
      
      public function WindowMouseListener(param1:DisplayObject)
      {
         var_2988 = [];
         var_2678 = 0;
         super(param1);
      }
      
      public function get eventTypes() : Array
      {
         return var_2988;
      }
      
      public function get areaLimit() : uint
      {
         return var_2678;
      }
      
      public function set areaLimit(param1:uint) : void
      {
         var_2678 = param1;
      }
      
      override public function end(param1:class_3127) : class_3127
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ > 0)
         {
            var_2988.pop();
            _loc2_--;
         }
         return super.end(param1);
      }
      
      override protected function handler(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         if(var_2312 && true)
         {
            if(var_2988.indexOf(param1.type) >= 0)
            {
               if(param1 is WindowMouseEvent)
               {
                  _loc2_ = _window.hitTestGlobalPoint(new Point(WindowMouseEvent(param1).stageX,WindowMouseEvent(param1).stageY));
                  if(var_2678 == 1 && !_loc2_)
                  {
                     return;
                  }
                  if(var_2678 == 3 && _loc2_)
                  {
                     return;
                  }
               }
               _window.update(null,WindowMouseEvent(param1));
            }
         }
      }
      
      override public function operate(param1:int, param2:int) : void
      {
      }
   }
}
