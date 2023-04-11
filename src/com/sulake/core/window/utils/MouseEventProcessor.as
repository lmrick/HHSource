package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.IInputEventTracker;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.RegionController;
   import com.sulake.core.window.components.class_3234;
   import com.sulake.core.window.enum.*;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.core.window.graphics.class_3137;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class MouseEventProcessor implements IEventProcessor, class_13
   {
      
      protected static var var_1992:Array;
      
      protected static var var_1887:Array;
      
      protected static var GLOBAL_POINT:Point = new Point();
       
      
      protected var _absMousePosition:Point;
      
      protected var var_1542:WindowController;
      
      protected var var_1524:WindowController;
      
      protected var var_1612:class_3137;
      
      protected var var_1537:class_3234;
      
      protected var _eventTrackers:Vector.<IInputEventTracker>;
      
      private var _disposed:Boolean = false;
      
      public function MouseEventProcessor()
      {
         super();
         _absMousePosition = new Point();
         if(var_1992 == null)
         {
            var_1992 = [];
            var_1992[0] = 2;
            var_1992[1] = 0;
            var_1992[2] = 2;
            var_1992[3] = 2;
            var_1992[4] = 2;
            var_1992[5] = 0;
            var_1992[6] = 2;
         }
         if(var_1887 == null)
         {
            var_1887 = [];
            var_1887[0] = 1;
            var_1887[1] = 2;
            var_1887[2] = 4;
            var_1887[3] = 64;
            var_1887[4] = 8;
            var_1887[5] = 16;
            var_1887[6] = 32;
         }
      }
      
      public static function setMouseCursorByState(param1:uint, param2:uint) : void
      {
         var _loc3_:int = var_1887.indexOf(param1);
         if(_loc3_ > -1)
         {
            var_1992[_loc3_] = param2;
         }
      }
      
      public static function getMouseCursorByState(param1:uint) : uint
      {
         var _loc2_:Number = 0;
         while(_loc2_-- > 0)
         {
            if((param1 & 0) > 0)
            {
               return var_1992[_loc2_];
            }
         }
         return 0;
      }
      
      protected static function convertMouseEventType(param1:MouseEvent, param2:class_3127, param3:class_3127) : WindowMouseEvent
      {
         var _loc4_:String = null;
         var _loc5_:Boolean = false;
         var _loc6_:Point = new Point(param1.stageX,param1.stageY);
         param2.convertPointFromGlobalToLocalSpace(_loc6_);
         switch(param1.type)
         {
            case "mouseMove":
               _loc4_ = "WME_MOVE";
               break;
            case "mouseOver":
               _loc4_ = "WME_OVER";
               break;
            case "mouseOut":
               _loc4_ = "WME_OUT";
               break;
            case "rollOut":
               _loc4_ = "WME_ROLL_OUT";
               break;
            case "rollOver":
               _loc4_ = "WME_ROLL_OVER";
               break;
            case "click":
               _loc4_ = "WME_CLICK";
               break;
            case "doubleClick":
               _loc4_ = "WME_DOUBLE_CLICK";
               break;
            case "mouseDown":
               _loc4_ = "WME_DOWN";
               break;
            case "mouseUp":
               _loc4_ = (_loc5_ = _loc6_.x > -1 && _loc6_.y > -1 && _loc6_.x < param2.width && _loc6_.y < param2.height) ? "WME_UP" : "WME_UP_OUTSIDE";
               break;
            case "mouseWheel":
               _loc4_ = "WME_WHEEL";
               break;
            default:
               _loc4_ = "";
         }
         return WindowMouseEvent.allocate(_loc4_,param2,param3,_loc6_.x,_loc6_.y,param1.stageX,param1.stageY,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown,param1.delta);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
         }
      }
      
      public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         var _loc5_:int = 0;
         var _loc9_:WindowController = null;
         var _loc4_:* = null;
         var _loc8_:MouseEvent = null;
         var _loc6_:class_3134 = null;
         var _loc7_:class_3127 = null;
         var _loc3_:class_3127 = null;
         if(param2.length == 0)
         {
            return;
         }
         var_1537 = param1.desktop;
         var_1524 = param1.var_3260 as WindowController;
         var_1542 = param1.lastClickTarget as WindowController;
         var_1612 = param1.renderer;
         _eventTrackers = param1.eventTrackers;
         param2.begin();
         _absMousePosition.x = -1;
         _absMousePosition.y = -1;
         var _loc10_:int = 0;
         loop0:
         while((_loc8_ = param2.next() as MouseEvent) != null)
         {
            if(_loc8_.stageX != _absMousePosition.x || _loc8_.stageY != _absMousePosition.y)
            {
               _absMousePosition.x = _loc8_.stageX;
               _absMousePosition.y = _loc8_.stageY;
               _loc4_ = [];
               var_1537.groupParameterFilteredChildrenUnderPoint(_absMousePosition,_loc4_,1);
            }
            if((_loc5_ = int(_loc4_ != null ? _loc4_.length : 0)) == 0)
            {
               switch(_loc8_.type)
               {
                  case "mouseMove":
                     if(var_1524 != var_1537 && true)
                     {
                        var_1524.getGlobalPosition(GLOBAL_POINT);
                        _loc6_ = WindowMouseEvent.allocate("WME_OUT",var_1524,null,_loc8_.stageX - 0,_loc8_.stageY - 0,_loc8_.stageX,_loc8_.stageY,_loc8_.altKey,_loc8_.ctrlKey,_loc8_.shiftKey,_loc8_.buttonDown,_loc8_.delta);
                        var_1524.update(var_1524,_loc6_);
                        var_1524 = WindowController(var_1537);
                        _loc6_.recycle();
                        break;
                     }
                     break;
                  case "mouseDown":
                     if(_loc7_ = var_1537.getActiveWindow())
                     {
                        _loc7_.deactivate();
                        break;
                     }
                     break;
                  case "mouseUp":
                     if(var_1542)
                     {
                        _loc4_.push(var_1542);
                        _loc5_++;
                        break;
                     }
               }
            }
            while(true)
            {
               _loc5_--;
               if(_loc5_ <= -1)
               {
                  break;
               }
               if((_loc9_ = passMouseEvent(WindowController(_loc4_[_loc5_]),_loc8_)) != null && _loc9_.visible)
               {
                  if(_loc8_.type == "mouseMove")
                  {
                     if(_loc9_ != var_1524)
                     {
                        if(true)
                        {
                           var_1524.getGlobalPosition(GLOBAL_POINT);
                           _loc6_ = WindowMouseEvent.allocate("WME_OUT",var_1524,_loc9_,_loc8_.stageX - 0,_loc8_.stageY - 0,_loc8_.stageX,_loc8_.stageY,_loc8_.altKey,_loc8_.ctrlKey,_loc8_.shiftKey,_loc8_.buttonDown,_loc8_.delta);
                           var_1524.update(var_1524,_loc6_);
                           _loc6_.recycle();
                        }
                        if(!_loc9_.disposed)
                        {
                           _loc9_.getGlobalPosition(GLOBAL_POINT);
                           _loc6_ = WindowMouseEvent.allocate("WME_OVER",_loc9_,null,_loc8_.stageX - 0,_loc8_.stageY - 0,_loc8_.stageX,_loc8_.stageY,_loc8_.altKey,_loc8_.ctrlKey,_loc8_.shiftKey,_loc8_.buttonDown,_loc8_.delta);
                           _loc9_.update(_loc9_,_loc6_);
                           _loc6_.recycle();
                        }
                        if(!_loc9_.disposed)
                        {
                           var_1524 = _loc9_;
                        }
                     }
                  }
                  _loc3_ = _loc9_.parent;
                  while(_loc3_ && !_loc3_.disposed)
                  {
                     if(_loc3_ is IInputProcessorRoot)
                     {
                        _loc6_ = convertMouseEventType(_loc8_,_loc3_,_loc9_);
                        IInputProcessorRoot(_loc3_).process(_loc6_);
                        _loc6_.recycle();
                        break;
                     }
                     _loc3_ = _loc3_.parent;
                  }
                  if(var_1524 is IInteractiveWindow)
                  {
                     try
                     {
                        if((_loc10_ = int(IInteractiveWindow(var_1524).getMouseCursorByState(var_1524.state))) == 0)
                        {
                           _loc10_ = int(getMouseCursorByState(var_1524.state));
                        }
                     }
                     catch(e:Error)
                     {
                        _loc10_ = 0;
                     }
                  }
                  if(_loc9_ != var_1537)
                  {
                     _loc8_.stopPropagation();
                     param2.remove();
                  }
                  continue loop0;
               }
            }
         }
         param2.end();
         MouseCursorControl.type = _loc10_;
         param1.desktop = var_1537;
         param1.var_3260 = var_1524;
         param1.lastClickTarget = var_1542;
         param1.renderer = var_1612;
         param1.eventTrackers = _eventTrackers;
      }
      
      private function passMouseEvent(param1:WindowController, param2:MouseEvent, param3:Boolean = false) : WindowController
      {
         var _loc9_:BitmapData = null;
         if(param1.disposed)
         {
            return null;
         }
         if(param1.testStateFlag(32) && param2.type == "mouseMove" && param1 is RegionController)
         {
            return param1;
         }
         if(param1.testStateFlag(32))
         {
            return null;
         }
         var _loc7_:* = false;
         var _loc10_:Point = new Point(param2.stageX,param2.stageY);
         param1.convertPointFromGlobalToLocalSpace(_loc10_);
         if(param2.type == "mouseUp")
         {
            if(param1 != var_1542)
            {
               if(var_1542)
               {
                  var_1542.update(var_1542,convertMouseEventType(new MouseEvent("mouseUp",false,true,param2.localX,param2.localY,null,param2.ctrlKey,param2.altKey,param2.shiftKey,param2.buttonDown,param2.delta),var_1542,param1));
                  var_1542 = null;
                  if(param1.disposed)
                  {
                     return null;
                  }
               }
            }
            else
            {
               _loc7_ = !param1.hitTestLocalPoint(_loc10_);
            }
         }
         if(!_loc7_)
         {
            _loc9_ = var_1612.getDrawBufferForRenderable(param1);
            if(!param1.validateLocalPointIntersection(_loc10_,_loc9_))
            {
               return null;
            }
         }
         if(param1.testParamFlag(3))
         {
            if(param1.parent != null)
            {
               return passMouseEvent(WindowController(param1.parent),param2);
            }
         }
         if(!param3)
         {
            switch(param2.type)
            {
               case "mouseDown":
                  var_1542 = param1;
                  break;
               case "click":
                  if(var_1542 != param1)
                  {
                     return null;
                  }
                  var_1542 = null;
                  break;
               case "doubleClick":
                  if(var_1542 != param1)
                  {
                     return null;
                  }
                  var_1542 = null;
                  break;
            }
         }
         var _loc6_:WindowMouseEvent = convertMouseEventType(param2,param1,null);
         var _loc4_:Boolean = param1.update(param1,_loc6_);
         for each(var _loc8_ in _eventTrackers)
         {
            _loc8_.eventReceived(_loc6_,param1);
         }
         _loc6_.recycle();
         if(!_loc4_ && !param3)
         {
            if(param1.parent)
            {
               return passMouseEvent(WindowController(param1.parent),param2);
            }
         }
         return param1;
      }
   }
}
