package com.sulake.habbo.ui.handler
{
   import com.sulake.habbo.room.events.RoomEngineToWidgetEvent;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.furniture.rentablespace.RentableSpaceDisplayWidget;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.room.object.IRoomObject;
   import flash.events.Event;
   import package_136.class_1312;
   import package_136.class_1359;
   import package_21.class_209;
   import package_21.class_267;
   import package_21.class_600;
   import package_25.class_565;
   import package_25.class_588;
   import package_25.class_766;
   
   public class FurnitureRentableSpaceWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _container:IRoomWidgetHandlerContainer;
      
      private var var_1429:RentableSpaceDisplayWidget;
      
      private var var_2851:class_766;
      
      private var var_2808:class_565;
      
      private var var_2769:class_588;
      
      public function FurnitureRentableSpaceWidgetHandler()
      {
         super();
      }
      
      public function get type() : String
      {
         return "RWE_RENTABLESPACE";
      }
      
      public function set widget(param1:RentableSpaceDisplayWidget) : void
      {
         var_1429 = param1;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
         var_2851 = new class_766(onRentableSpaceStatusMessage);
         _container.connection.addMessageEvent(var_2851);
         var_2808 = new class_565(onRentableSpaceRentOkMessage);
         _container.connection.addMessageEvent(var_2808);
         var_2769 = new class_588(onRentableSpaceRentFailedMessage);
         _container.connection.addMessageEvent(var_2769);
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
         if(true)
         {
            return;
         }
         var _loc3_:RoomEngineToWidgetEvent = param1 as RoomEngineToWidgetEvent;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc2_:IRoomObject = _container.roomEngine.getRoomObject(_loc3_.roomId,_loc3_.objectId,_loc3_.category);
         switch(param1.type)
         {
            case "RETWE_OPEN_WIDGET":
               if(_loc2_ != null)
               {
                  var_1429.show(_loc2_);
                  break;
               }
               break;
            case "RETWE_CLOSE_WIDGET":
               var_1429.hide(_loc2_);
         }
      }
      
      public function update() : void
      {
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(var_2851 != null)
         {
            _container.connection.removeMessageEvent(var_2851);
            var_2851 = null;
         }
         if(var_2808 != null)
         {
            _container.connection.removeMessageEvent(var_2808);
            var_2808 = null;
         }
         if(var_2769 != null)
         {
            _container.connection.removeMessageEvent(var_2769);
            var_2769 = null;
         }
         _container = null;
      }
      
      public function get disposed() : Boolean
      {
         return _container == null;
      }
      
      public function onRentableSpaceRentOkMessage(param1:class_565) : void
      {
         var_1429.updateWidgetState();
      }
      
      public function onRentableSpaceRentFailedMessage(param1:class_588) : void
      {
         var _loc2_:class_1359 = param1.getParser();
         var_1429.showErrorView(_loc2_.reason);
      }
      
      public function onRentableSpaceStatusMessage(param1:class_766) : void
      {
         var _loc2_:class_1312 = param1.getParser();
         var_1429.populateRentInfo(_loc2_.rented,_loc2_.canRent,_loc2_.canRentErrorCode,_loc2_.renterId,_loc2_.renterName,_loc2_.timeRemaining,_loc2_.price);
      }
      
      public function getRentableSpaceStatus(param1:int) : void
      {
         _container.connection.send(new class_600(param1));
      }
      
      public function cancelRent(param1:int) : void
      {
         _container.connection.send(new class_209(param1));
      }
      
      public function rentSpace(param1:int) : void
      {
         _container.connection.send(new class_267(param1));
      }
      
      public function getUsersClubLevel() : int
      {
         return _container.sessionDataManager.clubLevel;
      }
      
      public function getUsersCreditAmount() : int
      {
         return _container.catalog.getPurse().credits;
      }
      
      public function get container() : IRoomWidgetHandlerContainer
      {
         return _container;
      }
   }
}
