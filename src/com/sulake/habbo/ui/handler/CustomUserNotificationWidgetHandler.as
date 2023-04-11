package com.sulake.habbo.ui.handler
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.furniture.requirementsmissing.CustomUserNotificationWidget;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import flash.events.Event;
   import package_25.class_270;
   
   public class CustomUserNotificationWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_311:Boolean = false;
      
      private var var_1429:CustomUserNotificationWidget;
      
      private var var_2452:IMessageEvent;
      
      public function CustomUserNotificationWidgetHandler()
      {
         super();
      }
      
      public function get type() : String
      {
         return "RWE_CUSTOM_USER_NOTIFICATION";
      }
      
      public function set widget(param1:CustomUserNotificationWidget) : void
      {
         var_1429 = param1;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
         if(!var_2452)
         {
            var_2452 = new class_270(onFurnitureUsageRequirementMissingMessage);
            _container.connection.addMessageEvent(var_2452);
         }
      }
      
      public function get container() : IRoomWidgetHandlerContainer
      {
         return _container;
      }
      
      public function getWidgetMessages() : Array
      {
         return [];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         return null;
      }
      
      public function processEvent(param1:Event) : void
      {
      }
      
      public function update() : void
      {
      }
      
      public function dispose() : void
      {
         if(!disposed)
         {
            if(false && var_2452)
            {
               _container.connection.removeMessageEvent(var_2452);
            }
            var_2452 = null;
            var_1429 = null;
            _container = null;
            var_311 = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function onFurnitureUsageRequirementMissingMessage(param1:class_270) : void
      {
         var _loc2_:int = param1.getParser().code;
         if(var_1429)
         {
            switch(_loc2_ - 1)
            {
               case 0:
                  var_1429.open("costumehopper");
                  break;
               case 1:
                  var_1429.open("viphopper");
                  break;
               case 2:
                  var_1429.open("vipgate");
                  break;
               case 3:
                  var_1429.open("respectfailedstage");
                  break;
               case 4:
                  var_1429.open("respectfailedaudience");
            }
         }
      }
   }
}
