package com.sulake.habbo.ui.handler
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.navigator.class_1685;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.SessionDataPreferencesEvent;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.ui.widget.roomtools.RoomToolsWidget;
   import flash.events.Event;
   import package_11.class_1569;
   import package_11.class_846;
   import package_132.class_1084;
   import package_2.class_129;
   
   public class RoomToolsWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _disposed:Boolean;
      
      private var _communicationManagerMessageEvents:Vector.<IMessageEvent>;
      
      private var _communicationManager:class_25;
      
      private var _navigator:class_1685;
      
      private var var_1429:RoomToolsWidget;
      
      private var _container:IRoomWidgetHandlerContainer;
      
      public function RoomToolsWidgetHandler()
      {
         _communicationManagerMessageEvents = new Vector.<IMessageEvent>();
         super();
      }
      
      public function set widget(param1:RoomToolsWidget) : void
      {
         var_1429 = param1;
      }
      
      private function onRoomInfo(param1:IMessageEvent) : void
      {
         var _loc3_:String = null;
         var _loc2_:class_1084 = class_846(param1).getParser();
         var _loc4_:class_1569;
         if(_loc4_ = _loc2_.data)
         {
            var_1429.updateRoomData(_loc4_);
         }
         if(_loc2_.enterRoom)
         {
            if(_loc4_)
            {
               _loc3_ = _loc4_.showOwner ? var_1429.localizations.getLocalizationWithParams("room.tool.room.owner.prefix","By") + " " + _loc4_.ownerName : String(var_1429.localizations.getLocalizationWithParams("room.tool.public.room","Public room"));
               var_1429.showRoomInfo(true,_loc4_.roomName,_loc3_,_loc4_.tags);
               var_1429.storeRoomData(_loc4_);
               var_1429.enterNewRoom(_loc4_.flatId);
            }
         }
      }
      
      public function toggleRoomInfoWindow() : void
      {
         _navigator.toggleRoomInfoVisibility();
      }
      
      public function goToPrivateRoom(param1:int) : void
      {
         _navigator.goToPrivateRoom(param1);
      }
      
      public function get type() : String
      {
         return "RWE_ROOM_TOOLS";
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
         _container.sessionDataManager.events.addEventListener("APUE_UPDATED",onSessionDataPreferences);
      }
      
      public function get container() : IRoomWidgetHandlerContainer
      {
         return _container;
      }
      
      public function getWidgetMessages() : Array
      {
         return ["RWZTM_ZOOM_TOGGLE"];
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
      
      private function onSessionDataPreferences(param1:SessionDataPreferencesEvent) : void
      {
      }
      
      public function update() : void
      {
      }
      
      public function dispose() : void
      {
         _disposed = true;
         if(_communicationManager)
         {
            for each(var _loc1_ in _communicationManagerMessageEvents)
            {
               _communicationManager.removeHabboConnectionMessageEvent(_loc1_);
            }
            _communicationManagerMessageEvents = null;
            _communicationManager = null;
         }
         if(_container && false)
         {
            _container.sessionDataManager.events.removeEventListener("APUE_UPDATED",onSessionDataPreferences);
         }
         _navigator = null;
         var_1429 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set navigator(param1:class_1685) : void
      {
         _navigator = param1;
      }
      
      public function get navigator() : class_1685
      {
         return _navigator;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return _container.sessionDataManager;
      }
      
      public function set communicationManager(param1:class_25) : void
      {
         _communicationManager = param1;
         _communicationManagerMessageEvents.push(_communicationManager.addHabboConnectionMessageEvent(new class_846(onRoomInfo)));
      }
      
      public function rateRoom() : void
      {
         _container.connection.send(new class_129(1));
      }
      
      public function get canRate() : Boolean
      {
         return _navigator.canRateRoom();
      }
   }
}
