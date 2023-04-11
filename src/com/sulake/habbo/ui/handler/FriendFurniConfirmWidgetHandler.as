package com.sulake.habbo.ui.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.furniture.friendfurni.FriendFurniConfirmWidget;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import flash.events.Event;
   import package_100.class_443;
   import package_100.class_516;
   import package_100.class_944;
   import package_94.class_380;
   
   public class FriendFurniConfirmWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _disposed:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_1429:FriendFurniConfirmWidget;
      
      private var _connection:IConnection;
      
      private var var_2994:IMessageEvent = null;
      
      private var var_3507:IMessageEvent = null;
      
      private var var_3546:IMessageEvent = null;
      
      public function FriendFurniConfirmWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
      }
      
      public function set widget(param1:FriendFurniConfirmWidget) : void
      {
         var_1429 = param1;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(_connection && var_2994)
            {
               _connection.removeMessageEvent(var_2994);
               _connection.removeMessageEvent(var_3507);
               _connection.removeMessageEvent(var_3546);
               _connection = null;
            }
            var_1429 = null;
            _container = null;
            _disposed = true;
         }
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
         if(!var_2994)
         {
            var_2994 = new class_443(onStartConfirmation);
            var_3507 = new class_944(onOtherLockConfirmed);
            var_3546 = new class_516(onCancelLock);
            _connection.addMessageEvent(var_2994);
            _connection.addMessageEvent(var_3507);
            _connection.addMessageEvent(var_3546);
         }
      }
      
      public function sendLockConfirm(param1:int, param2:Boolean) : void
      {
         _connection.send(new class_380(param1,param2));
      }
      
      private function onStartConfirmation(param1:class_443) : void
      {
         var_1429.open(param1.getParser().stuffId,param1.getParser().isOwner);
      }
      
      private function onOtherLockConfirmed(param1:class_944) : void
      {
         var_1429.otherConfirmed(param1.getParser().stuffId);
      }
      
      private function onCancelLock(param1:class_516) : void
      {
         var_1429.close(param1.getParser().stuffId);
      }
      
      public function get type() : String
      {
         return "";
      }
      
      public function getProcessedEvents() : Array
      {
         return null;
      }
      
      public function processEvent(param1:Event) : void
      {
      }
      
      public function getWidgetMessages() : Array
      {
         return [];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         return null;
      }
      
      public function update() : void
      {
      }
   }
}
