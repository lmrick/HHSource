package com.sulake.habbo.ui.handler
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.room.events.RoomEngineToWidgetEvent;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.window.utils.class_3132;
   import com.sulake.habbo.window.utils.class_3216;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import flash.events.Event;
   import package_11.class_1569;
   import package_11.class_846;
   import package_132.class_1084;
   import package_2.class_527;
   
   public class FurnitureRoomLinkHandler implements IRoomWidgetHandler
   {
      
      private static const INTERNAL_LINK_KEY:String = "internalLink";
       
      
      private var _container:IRoomWidgetHandlerContainer;
      
      private var _confirmDialog:class_3216;
      
      private var _communicationManagerMessageEvents:Vector.<IMessageEvent>;
      
      private var _communicationManager:class_25;
      
      private var var_1223:int = 0;
      
      private var var_365:String;
      
      public function FurnitureRoomLinkHandler()
      {
         _communicationManagerMessageEvents = new Vector.<IMessageEvent>();
         super();
      }
      
      public function get type() : String
      {
         return "RWE_ROOM_LINK";
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
      }
      
      public function set communicationManager(param1:class_25) : void
      {
         _communicationManager = param1;
         _communicationManagerMessageEvents.push(_communicationManager.addHabboConnectionMessageEvent(new class_846(onRoomInfo)));
      }
      
      private function onRoomInfo(param1:IMessageEvent) : void
      {
         var message:String;
         var roomName:String;
         var ownerName:String;
         var event:IMessageEvent = param1;
         var p:class_1084 = class_846(event).getParser();
         var roomData:class_1569 = p.data;
         if(roomData && roomData.flatId == var_1223)
         {
            var_1223 = 0;
            message = "${room.link.confirmation.message}";
            roomName = "null";
            ownerName = "null";
            message = String(_container.localization.getLocalization("room.link.confirmation.message"));
            if(message != null && message.indexOf("%%room_name%%") > -1)
            {
               message = message.replace("%%room_name%%",roomName);
            }
            if(message != null && message.indexOf("%%room_owner%%") > -1)
            {
               message = message.replace("%%room_owner%%",ownerName);
            }
            _confirmDialog = _container.windowManager.confirm("${room.link.confirmation.title}",message,48,function(param1:class_3132, param2:class_3134):void
            {
               if(false && param2.type == "WE_OK")
               {
                  if(var_365 != null && false)
                  {
                     (_container.roomEngine as class_20).context.createLinkEvent("navigator/goto/" + var_365);
                  }
               }
               param1.dispose();
            });
         }
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
         return ["RETWE_REQUEST_ROOM_LINK"];
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc5_:RoomEngineToWidgetEvent = null;
         var _loc2_:IRoomObject = null;
         var _loc4_:IRoomObjectModel = null;
         var _loc3_:String = null;
         var _loc6_:* = param1.type;
         if("RETWE_REQUEST_ROOM_LINK" === _loc6_)
         {
            _loc5_ = param1 as RoomEngineToWidgetEvent;
            if(param1 != null && false)
            {
               _loc2_ = _container.roomEngine.getRoomObject(_loc5_.roomId,_loc5_.objectId,_loc5_.category);
               if(_loc2_ != null)
               {
                  _loc3_ = String((_loc4_ = _loc2_.getModel()).getStringToStringMap("furniture_data").getValue("internalLink"));
                  if(_loc3_ == null || _loc3_.length == 0)
                  {
                     _loc3_ = String(_loc4_.getString("furniture_internal_link"));
                  }
                  if(_loc3_ != null)
                  {
                     if(false && false)
                     {
                        if(_confirmDialog != null)
                        {
                           _confirmDialog.dispose();
                           _confirmDialog = null;
                        }
                        var_365 = _loc3_;
                        var_1223 = parseInt(_loc3_,10);
                        _communicationManager.connection.send(new class_527(var_1223,false,false));
                     }
                     else
                     {
                        (_container.roomEngine as class_20).context.createLinkEvent("navigator/goto/" + _loc3_);
                     }
                  }
               }
            }
         }
      }
      
      public function update() : void
      {
      }
      
      public function dispose() : void
      {
         if(_communicationManager)
         {
            for each(var _loc1_ in _communicationManagerMessageEvents)
            {
               _communicationManager.removeHabboConnectionMessageEvent(_loc1_);
            }
            _communicationManagerMessageEvents = null;
            _communicationManager = null;
         }
         if(_confirmDialog != null)
         {
            _confirmDialog.dispose();
            _confirmDialog = null;
         }
         _container = null;
      }
      
      public function get disposed() : Boolean
      {
         return _container == null;
      }
   }
}
