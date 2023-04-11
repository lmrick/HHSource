package com.sulake.habbo.ui.handler
{
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.session.events.RoomSessionPresentEvent;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.events.RoomWidgetEcotronBoxDataUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetEcotronBoxOpenMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class FurnitureEcotronBoxWidgetHandler implements IRoomWidgetHandler, class_3158
   {
       
      
      private var var_311:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_347:int = -1;
      
      private var _name:String = "";
      
      public function FurnitureEcotronBoxWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function get type() : String
      {
         return "RWE_FURNI_ECOTRONBOX_WIDGET";
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
         return ["RWFWM_MESSAGE_REQUEST_ECOTRONBOX","RWEBOM_OPEN_ECOTRONBOX","RWEBOM_ECOTRONBOX_OPENED"];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc7_:RoomWidgetFurniToWidgetMessage = null;
         var _loc5_:IRoomObject = null;
         var _loc11_:IRoomObjectModel = null;
         var _loc10_:String = null;
         var _loc6_:int = 0;
         var _loc9_:class_3148 = null;
         var _loc8_:String = null;
         var _loc2_:Boolean = false;
         var _loc3_:RoomWidgetEcotronBoxDataUpdateEvent = null;
         var _loc4_:RoomWidgetEcotronBoxOpenMessage = null;
         switch(param1.type)
         {
            case "RWFWM_MESSAGE_REQUEST_ECOTRONBOX":
               _loc7_ = param1 as RoomWidgetFurniToWidgetMessage;
               if((_loc5_ = _container.roomEngine.getRoomObject(_loc7_.roomId,_loc7_.id,_loc7_.category)) != null)
               {
                  if((_loc11_ = _loc5_.getModel()) != null)
                  {
                     var_347 = _loc7_.id;
                     if((_loc10_ = String(_loc11_.getString("furniture_data"))) == null)
                     {
                        return null;
                     }
                     _loc6_ = int(_loc11_.getNumber("furniture_type_id"));
                     _loc8_ = (_loc9_ = _container.sessionDataManager.getFloorItemData(_loc6_)) != null ? _loc9_.className : "";
                     _loc2_ = _container.roomSession.isRoomOwner || _container.sessionDataManager.isAnyRoomController;
                     _loc3_ = new RoomWidgetEcotronBoxDataUpdateEvent("RWEBDUE_PACKAGEINFO",_loc7_.id,_loc10_,_loc8_,_loc2_);
                     _container.events.dispatchEvent(_loc3_);
                     break;
                  }
                  break;
               }
               break;
            case "RWEBOM_OPEN_ECOTRONBOX":
               if((_loc4_ = param1 as RoomWidgetEcotronBoxOpenMessage).objectId != var_347)
               {
                  return null;
               }
               if(_container != null && false)
               {
                  _container.roomSession.sendPresentOpenMessage(_loc4_.objectId);
                  break;
               }
               break;
         }
         return null;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(disposed)
         {
            return;
         }
         var _loc3_:RoomWidgetEcotronBoxDataUpdateEvent = new RoomWidgetEcotronBoxDataUpdateEvent("RWEBDUE_CONTENTS",0,_name,"",false,param2);
         _container.events.dispatchEvent(_loc3_);
      }
      
      public function imageFailed(param1:int) : void
      {
      }
      
      public function getProcessedEvents() : Array
      {
         return ["RSPE_PRESENT_OPENED"];
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc5_:RoomSessionPresentEvent = null;
         var _loc4_:class_3266 = null;
         var _loc2_:class_3148 = null;
         var _loc3_:RoomWidgetEcotronBoxDataUpdateEvent = null;
         if(param1 == null)
         {
            return;
         }
         if(_container != null && false && param1 != null)
         {
            var _loc6_:* = param1.type;
            if("RSPE_PRESENT_OPENED" === _loc6_)
            {
               if((_loc5_ = param1 as RoomSessionPresentEvent) != null)
               {
                  _loc4_ = null;
                  _name = "";
                  if(_loc5_.itemType == "s")
                  {
                     _loc4_ = _container.roomEngine.getFurnitureIcon(_loc5_.classId,this);
                     _loc2_ = _container.sessionDataManager.getFloorItemData(_loc5_.classId);
                  }
                  else if(_loc5_.itemType == "i")
                  {
                     _loc4_ = _container.roomEngine.getWallItemIcon(_loc5_.classId,this);
                     _loc2_ = _container.sessionDataManager.getWallItemData(_loc5_.classId);
                  }
                  if(_loc2_ != null)
                  {
                     _name = _loc2_.localizedName;
                  }
                  if(_loc4_ != null)
                  {
                     _loc3_ = new RoomWidgetEcotronBoxDataUpdateEvent("RWEBDUE_CONTENTS",0,_name,"",false,_loc4_.data);
                     _container.events.dispatchEvent(_loc3_);
                  }
               }
            }
         }
      }
      
      public function update() : void
      {
      }
   }
}
