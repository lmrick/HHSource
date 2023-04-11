package com.sulake.habbo.ui.widget
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.events.EventDispatcherWrapper;
   import com.sulake.core.window.class_3127;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.window.class_1684;
   import flash.events.IEventDispatcher;
   
   public class RoomWidgetBase implements IRoomWidget
   {
       
      
      private var _disposed:Boolean = false;
      
      private var name_1:EventDispatcherWrapper;
      
      private var var_79:com.sulake.habbo.ui.widget.IRoomWidgetMessageListener;
      
      private var _windowManager:class_1684;
      
      protected var _assets:class_21;
      
      protected var var_44:class_18;
      
      protected var var_1453:IRoomWidgetHandler;
      
      public function RoomWidgetBase(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21 = null, param4:class_18 = null)
      {
         super();
         var_1453 = param1;
         _windowManager = param2;
         _assets = param3;
         var_44 = param4;
      }
      
      public function get state() : int
      {
         return 0;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function initialize(param1:int = 0) : void
      {
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         var_79 = null;
         _windowManager = null;
         if(name_1 != null && true)
         {
            unregisterUpdateEvents(name_1);
         }
         if(var_1453)
         {
            var_1453.dispose();
            var_1453 = null;
         }
         name_1 = null;
         _assets = null;
         var_44 = null;
         _disposed = true;
      }
      
      public function set messageListener(param1:com.sulake.habbo.ui.widget.IRoomWidgetMessageListener) : void
      {
         var_79 = param1;
      }
      
      public function get messageListener() : com.sulake.habbo.ui.widget.IRoomWidgetMessageListener
      {
         return var_79;
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get assets() : class_21
      {
         return _assets;
      }
      
      public function get localizations() : class_18
      {
         return var_44;
      }
      
      public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 is EventDispatcherWrapper)
         {
            name_1 = param1 as EventDispatcherWrapper;
         }
      }
      
      public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
      }
      
      public function get mainWindow() : class_3127
      {
         return null;
      }
   }
}
