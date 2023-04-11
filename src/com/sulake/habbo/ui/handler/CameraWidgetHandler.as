package com.sulake.habbo.ui.handler
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.habbo.communication.messages.outgoing.camera.class_1009;
   import com.sulake.habbo.communication.messages.outgoing.camera.class_688;
   import com.sulake.habbo.communication.messages.outgoing.camera.class_860;
   import com.sulake.habbo.communication.messages.outgoing.camera.class_922;
   import com.sulake.habbo.communication.messages.outgoing.camera.class_943;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.RoomDesktop;
   import com.sulake.habbo.ui.widget.camera.CameraWidget;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import flash.events.Event;
   import package_82.class_1035;
   import package_82.class_333;
   import package_82.class_452;
   import package_82.class_507;
   import package_82.class_586;
   
   public class CameraWidgetHandler implements IRoomWidgetHandler, class_13
   {
       
      
      private var _disposed:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_1429:CameraWidget;
      
      private var var_3610:class_333;
      
      private var var_3595:class_1035;
      
      private var var_3732:class_452;
      
      private var var_3641:class_507;
      
      private var var_3703:class_586;
      
      private var var_2327:RoomDesktop;
      
      private var var_574:int = 999;
      
      private var var_419:int = 999;
      
      private var var_542:int = 999;
      
      public function CameraWidgetHandler(param1:RoomDesktop)
      {
         super();
         var_2327 = param1;
      }
      
      public function get creditPrice() : int
      {
         return var_574;
      }
      
      public function get ducketPrice() : int
      {
         return var_419;
      }
      
      public function get publishDucketPrice() : int
      {
         return var_542;
      }
      
      public function get type() : String
      {
         return "RWE_CAMERA";
      }
      
      public function get roomDesktop() : RoomDesktop
      {
         return var_2327;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         if(_container && false)
         {
            _container.toolbar.events.removeEventListener("HTE_ICON_CAMERA",onCameraRequested);
         }
         _container = param1;
         if(_container && false)
         {
            _container.toolbar.events.addEventListener("HTE_ICON_CAMERA",onCameraRequested);
         }
         var_3610 = new class_333(onCameraStorageUrlEvent);
         var_3595 = new class_1035(onPurchaseOK);
         var_3732 = new class_452(onPublishStatus);
         var_3641 = new class_507(onCompetitionStatus);
         var_3703 = new class_586(onInitCameraEvent);
         _container.connection.addMessageEvent(var_3610);
         _container.connection.addMessageEvent(var_3595);
         _container.connection.addMessageEvent(var_3732);
         _container.connection.addMessageEvent(var_3641);
         _container.connection.addMessageEvent(var_3703);
      }
      
      public function sendInitCameraMessage() : void
      {
         if(_container.sessionDataManager.isPerkAllowed("CAMERA"))
         {
            _container.connection.send(new class_860());
         }
      }
      
      private function onInitCameraEvent(param1:class_586) : void
      {
         var_574 = param1.getParser().getCreditPrice();
         var_419 = param1.getParser().getDucketPrice();
         var_542 = param1.getParser().getPublishDucketPrice();
      }
      
      private function onPurchaseOK(param1:class_1035) : void
      {
         if(var_1429)
         {
            var_1429.purchaseSuccessful();
         }
      }
      
      private function onPublishStatus(param1:class_452) : void
      {
         if(var_1429)
         {
            var_1429.publishingStatus(param1);
         }
      }
      
      private function onCompetitionStatus(param1:class_507) : void
      {
         if(var_1429)
         {
            var_1429.competitionStatus(param1);
         }
      }
      
      private function onCameraStorageUrlEvent(param1:class_333) : void
      {
         if(!var_1429)
         {
            return;
         }
         var _loc2_:String = param1.getParser().url;
         var_1429.setRenderedPhotoUrl(_loc2_);
      }
      
      public function get container() : IRoomWidgetHandlerContainer
      {
         return _container;
      }
      
      public function getWidgetMessages() : Array
      {
         return null;
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         return [];
      }
      
      public function processEvent(param1:Event) : void
      {
      }
      
      public function update() : void
      {
      }
      
      public function dispose() : void
      {
         if(_container && false)
         {
            _container.connection.removeMessageEvent(var_3610);
            _container.connection.removeMessageEvent(var_3595);
            _container.connection.removeMessageEvent(var_3732);
            _container.connection.removeMessageEvent(var_3641);
            _container.connection.removeMessageEvent(var_3703);
         }
         _disposed = true;
         _container = null;
         var_2327 = null;
         var_1429 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set widget(param1:CameraWidget) : void
      {
         var_1429 = param1;
      }
      
      private function onCameraRequested(param1:HabboToolbarEvent) : void
      {
         if(param1.type == "HTE_ICON_CAMERA")
         {
            if(var_1429)
            {
               var_1429.startTakingPhoto(param1.iconName);
            }
         }
      }
      
      public function addListenerToStage(param1:String, param2:Function) : void
      {
         var_2327.addListenerToStage(param1,param2);
      }
      
      public function removeListenerFromStage(param1:String, param2:Function) : void
      {
         var_2327.removeListenerFromStage(param1,param2);
      }
      
      public function confirmPhotoPurchase() : void
      {
         _container.connection.send(new class_943());
      }
      
      public function confirmPhotoPublish() : void
      {
         _container.connection.send(new class_1009());
      }
      
      public function confirmPhotoCompetitionSubmit() : void
      {
         _container.connection.send(new class_922());
      }
      
      public function collectPhotoData() : class_688
      {
         return var_2327.roomEngine.getRenderRoomMessage(var_1429.getViewPort(),var_2327.roomBackgroundColor) as class_688;
      }
      
      public function sendPhotoData(param1:class_688) : void
      {
         _container.connection.send(param1);
      }
   }
}
