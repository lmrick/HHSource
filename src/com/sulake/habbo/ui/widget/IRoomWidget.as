package com.sulake.habbo.ui.widget
{
   import com.sulake.core.window.class_3127;
   import flash.events.IEventDispatcher;
   
   public interface IRoomWidget
   {
       
      
      function get state() : int;
      
      function initialize(param1:int = 0) : void;
      
      function dispose() : void;
      
      function set messageListener(param1:IRoomWidgetMessageListener) : void;
      
      function registerUpdateEvents(param1:IEventDispatcher) : void;
      
      function unregisterUpdateEvents(param1:IEventDispatcher) : void;
      
      function get mainWindow() : class_3127;
   }
}
