package com.sulake.habbo.ui
{
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.ui.widget.IRoomWidget;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public interface IRoomDesktop
   {
       
      
      function get events() : IEventDispatcher;
      
      function processEvent(param1:Event) : void;
      
      function get roomSession() : IRoomSession;
      
      function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent;
      
      function getWidget(param1:String) : IRoomWidget;
   }
}
