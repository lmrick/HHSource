package com.sulake.habbo.ui.widget.roomtools
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.ui.handler.RoomToolsWidgetHandler;
   import com.sulake.habbo.window.class_1684;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomToolsCtrlBase
   {
      
      protected static const DISTANCE_FROM_BOTTOM:int = 55;
      
      protected static const TOOLBAR_X:int = -5;
      
      protected static const const_829:int = 100;
       
      
      protected var _window:class_3151;
      
      protected var var_1429:com.sulake.habbo.ui.widget.roomtools.RoomToolsWidget;
      
      protected var _windowManager:class_1684;
      
      protected var _assets:class_21;
      
      protected var var_1597:Boolean = true;
      
      protected var var_1837:Timer;
      
      protected var var_2767:Boolean;
      
      protected var var_3774:int;
      
      public function RoomToolsCtrlBase(param1:com.sulake.habbo.ui.widget.roomtools.RoomToolsWidget, param2:class_1684, param3:class_21)
      {
         super();
         var_1429 = param1;
         _windowManager = param2;
         _assets = param3;
         var_3774 = handler.container.config.getInteger("room.enter.info.collapse.delay",5000);
      }
      
      public function dispose() : void
      {
         if(_window)
         {
            _window.procedure = null;
            _window.dispose();
            _window = null;
         }
         if(var_1837)
         {
            var_1837.reset();
            var_1837 = null;
            var_2767 = false;
         }
         var_1429 = null;
      }
      
      public function setElementVisible(param1:String, param2:Boolean) : void
      {
         if(!_window || !_window.findChildByName(param1))
         {
            return;
         }
         _window.findChildByName(param1).visible = param2;
      }
      
      protected function collapseAfterDelay() : void
      {
         clearCollapseTimer();
         var_1837 = new Timer(var_3774,1);
         var_1837.addEventListener("timer",collapseTimerEventHandler);
         var_1837.start();
      }
      
      protected function collapseIfPending() : void
      {
         if(var_2767)
         {
            collapseAfterDelay();
         }
      }
      
      protected function clearCollapseTimer() : void
      {
         if(var_1837 != null)
         {
            var_1837.reset();
            var_1837 = null;
         }
         var_2767 = false;
      }
      
      private function collapseTimerEventHandler(param1:TimerEvent) : void
      {
         clearCollapseTimer();
         setCollapsed(true);
      }
      
      protected function cancelWindowCollapse() : void
      {
         if(var_1837 != null)
         {
            clearCollapseTimer();
            var_2767 = true;
         }
      }
      
      public function setCollapsed(param1:Boolean) : void
      {
      }
      
      public function get isCollapsed() : Boolean
      {
         return var_1597;
      }
      
      public function get window() : class_3151
      {
         return _window;
      }
      
      public function get handler() : RoomToolsWidgetHandler
      {
         return !!var_1429 ? var_1429.handler : null;
      }
   }
}
