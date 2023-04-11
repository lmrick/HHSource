package com.sulake.habbo.ui.handler
{
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.events.RoomWidgetStickieDataUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetStickieSendUpdateMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import flash.events.Event;
   
   public class FurnitureStickieWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var var_311:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      public function FurnitureStickieWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function get type() : String
      {
         return "RWE_FURNI_STICKIE_WIDGET";
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
      }
      
      public function dispose() : void
      {
         var_311 = true;
         _container = null;
      }
      
      public function getWidgetMessages() : Array
      {
         return ["RWFWM_MESSAGE_REQUEST_STICKIE","RWSUM_STICKIE_SEND_DELETE","RWSUM_STICKIE_SEND_UPDATE"];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc6_:RoomWidgetFurniToWidgetMessage = null;
         var _loc4_:IRoomObject = null;
         var _loc10_:IRoomObjectModel = null;
         var _loc2_:String = null;
         var _loc5_:* = null;
         var _loc8_:String = null;
         var _loc3_:Boolean = false;
         var _loc9_:RoomWidgetStickieDataUpdateEvent = null;
         var _loc11_:RoomWidgetStickieSendUpdateMessage = null;
         var _loc7_:RoomWidgetStickieSendUpdateMessage = null;
         switch(param1.type)
         {
            case "RWFWM_MESSAGE_REQUEST_STICKIE":
               _loc6_ = param1 as RoomWidgetFurniToWidgetMessage;
               if((_loc4_ = _container.roomEngine.getRoomObject(_loc6_.roomId,_loc6_.id,_loc6_.category)) != null)
               {
                  if((_loc10_ = _loc4_.getModel()) != null)
                  {
                     _loc2_ = String(_loc10_.getString("furniture_itemdata"));
                     if(_loc2_.length < 6)
                     {
                        return null;
                     }
                     _loc8_ = "";
                     if(_loc2_.indexOf(" ") > 0)
                     {
                        _loc5_ = _loc2_.slice(0,_loc2_.indexOf(" "));
                        _loc8_ = _loc2_.slice(_loc2_.indexOf(" ") + 1,_loc2_.length);
                     }
                     else
                     {
                        _loc5_ = _loc2_;
                     }
                     _loc3_ = _container.roomSession.isRoomOwner || _container.sessionDataManager.isAnyRoomController;
                     _loc9_ = new RoomWidgetStickieDataUpdateEvent("RWSDUE_STICKIE_DATA",_loc6_.id,_loc4_.getType(),_loc8_,_loc5_,_loc3_);
                     _container.events.dispatchEvent(_loc9_);
                     break;
                  }
                  break;
               }
               break;
            case "RWSUM_STICKIE_SEND_UPDATE":
               if((_loc11_ = param1 as RoomWidgetStickieSendUpdateMessage) == null)
               {
                  return null;
               }
               if(_container != null && false)
               {
                  _container.roomEngine.modifyRoomObjectData(_loc11_.objectId,20,_loc11_.colorHex,_loc11_.text);
                  break;
               }
               break;
            case "RWSUM_STICKIE_SEND_DELETE":
               if((_loc7_ = param1 as RoomWidgetStickieSendUpdateMessage) == null)
               {
                  return null;
               }
               if(_container != null && false)
               {
                  _container.roomEngine.deleteRoomObject(_loc7_.objectId,20);
                  break;
               }
               break;
         }
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
   }
}
