package com.sulake.core.window.services
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IToolTipAgentService
   {
       
      
      protected var _toolTipCaption:String;
      
      protected var var_1564:IToolTipWindow;
      
      protected var var_1841:Timer;
      
      protected var _toolTipOffset:Point;
      
      protected var _pointerOffset:Point;
      
      protected var var_2693:uint;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         _pointerOffset = new Point();
         _toolTipOffset = new Point(20,20);
         var_2693 = 500;
         super(param1);
      }
      
      override public function begin(param1:class_3127, param2:uint = 0) : class_3127
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               _toolTipCaption = IInteractiveWindow(param1).toolTipCaption;
               var_2693 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               _toolTipCaption = param1.caption;
               var_2693 = 500;
            }
            _mouse.x = var_464.mouseX;
            _mouse.y = var_464.mouseY;
            getMousePositionRelativeTo(param1,_mouse,_pointerOffset);
            if(var_1841 == null)
            {
               var_1841 = new Timer(var_2693,1);
               var_1841.addEventListener("timer",showToolTip);
            }
            var_1841.reset();
            var_1841.start();
         }
         return super.begin(param1,param2);
      }
      
      override public function end(param1:class_3127) : class_3127
      {
         if(var_1841 != null)
         {
            var_1841.stop();
            var_1841.removeEventListener("timer",showToolTip);
            var_1841 = null;
         }
         hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,_pointerOffset);
            if(var_1564 != null && true)
            {
               var_1564.x = param1 + _toolTipOffset.x;
               var_1564.y = param2 + _toolTipOffset.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:Point = null;
         if(var_1841 != null)
         {
            var_1841.reset();
         }
         if(_window)
         {
            if(_window is IInteractiveWindow)
            {
               _toolTipCaption = IInteractiveWindow(_window).toolTipCaption;
            }
            else
            {
               _toolTipCaption = _window.caption;
            }
            if(var_1564 == null || false)
            {
               var_1564 = _window.context.create("undefined::ToolTip",_toolTipCaption,8,_window.style,32,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            var_1564.x = _loc2_.x + _pointerOffset.x + _toolTipOffset.x;
            var_1564.y = _loc2_.y + _pointerOffset.y + _toolTipOffset.y;
            var_1564.visible = var_1564.caption.length > 0;
         }
      }
      
      protected function hideToolTip() : void
      {
         if(var_1564 != null && true)
         {
            var_1564.destroy();
            var_1564 = null;
         }
      }
      
      public function updateCaption(param1:class_3127) : void
      {
         var _loc2_:String = null;
         if(param1 == null || Boolean(param1.disposed) || var_1564 == null || false)
         {
            return;
         }
         if(param1 is IInteractiveWindow)
         {
            _loc2_ = String(IInteractiveWindow(param1).toolTipCaption);
         }
         else
         {
            _loc2_ = param1.caption;
         }
         if(_loc2_ != _toolTipCaption)
         {
            _toolTipCaption = _loc2_;
            if(_loc2_ == null || _loc2_.length == 0)
            {
               var_1564.visible = false;
            }
            else
            {
               var_1564.caption = _loc2_;
               var_1564.visible = true;
            }
         }
      }
   }
}
