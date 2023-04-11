package com.sulake.habbo.ui.handler
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.habbo.communication.messages.outgoing.camera.class_689;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.RoomDesktop;
   import com.sulake.habbo.ui.widget.camera.RoomThumbnailCameraWidget;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import flash.events.Event;
   import package_82.class_700;
   
   public class RoomThumbnailCameraWidgetHandler implements IRoomWidgetHandler, class_13
   {
       
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_2327:RoomDesktop;
      
      private var var_1429:RoomThumbnailCameraWidget;
      
      private var var_3200:class_700;
      
      public function RoomThumbnailCameraWidgetHandler(param1:RoomDesktop)
      {
         super();
         var_2327 = param1;
      }
      
      public function get roomDesktop() : RoomDesktop
      {
         return var_2327;
      }
      
      public function getProcessedEvents() : Array
      {
         return [];
      }
      
      public function getWidgetMessages() : Array
      {
         return null;
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         return null;
      }
      
      public function set widget(param1:RoomThumbnailCameraWidget) : void
      {
         var_1429 = param1;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
         var_3200 = new class_700(onThumbnailStatus);
         _container.connection.addMessageEvent(var_3200);
      }
      
      public function dispose() : void
      {
         if(_container && false && var_3200)
         {
            _container.connection.removeMessageEvent(var_3200);
         }
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function processEvent(param1:Event) : void
      {
      }
      
      public function update() : void
      {
      }
      
      public function get type() : String
      {
         return "RWE_ROOM_THUMBNAIL_CAMERA";
      }
      
      public function get container() : IRoomWidgetHandlerContainer
      {
         return _container;
      }
      
      public function collectPhotoData() : class_689
      {
         return class_689(var_2327.roomEngine.getRenderRoomMessage(var_1429.viewPort,var_2327.roomBackgroundColor,true));
      }
      
      public function sendPhotoData(param1:class_689) : void
      {
         _container.connection.send(param1);
      }
      
      private function onThumbnailStatus(param1:class_700) : void
      {
         var_1429.destroy();
         if(param1.getParser().isOk())
         {
            _container.windowManager.alert("${navigator.thumbnail.camera.title}","${navigator.thumbnail.camera.success}",16,null);
         }
         else if(param1.getParser().isRenderLimitHit())
         {
            _container.windowManager.alert("${generic.alert.title}","${camera.render.count.info}",0,null);
         }
      }
   }
}
