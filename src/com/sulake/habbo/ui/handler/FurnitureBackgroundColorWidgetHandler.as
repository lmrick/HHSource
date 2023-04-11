package com.sulake.habbo.ui.handler
{
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.furniture.backgroundcolor.BackgroundColorFurniWidget;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import flash.events.Event;
   
   public class FurnitureBackgroundColorWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var var_311:Boolean = false;
      
      private var var_1429:BackgroundColorFurniWidget;
      
      private var _container:IRoomWidgetHandlerContainer;
      
      public function FurnitureBackgroundColorWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function dispose() : void
      {
         if(!var_311)
         {
            container = null;
            var_311 = true;
         }
      }
      
      public function get type() : String
      {
         return "RWE_ROOM_BACKGROUND_COLOR";
      }
      
      public function set widget(param1:BackgroundColorFurniWidget) : void
      {
         var_1429 = param1;
      }
      
      public function get container() : IRoomWidgetHandlerContainer
      {
         return _container;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
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
         var _loc1_:* = [];
         _loc1_.push("RETWE_REQUEST_BACKGROUND_COLOR");
         return _loc1_;
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc3_:RoomEngineObjectEvent = null;
         var _loc4_:IRoomObject = null;
         var _loc6_:IRoomObjectModel = null;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = param1.type;
         if("RETWE_REQUEST_BACKGROUND_COLOR" === _loc8_)
         {
            if(validateRights())
            {
               _loc3_ = param1 as RoomEngineObjectEvent;
               _loc5_ = int((_loc6_ = (_loc4_ = _container.roomEngine.getRoomObject(_loc3_.roomId,_loc3_.objectId,_loc3_.category)).getModel()).getNumber("furniture_room_background_color_hue"));
               _loc2_ = int(_loc6_.getNumber("furniture_room_background_color_saturation"));
               _loc7_ = int(_loc6_.getNumber("furniture_room_background_color_lightness"));
               var_1429.open(_loc4_.getId(),_loc5_,_loc2_,_loc7_);
            }
         }
      }
      
      private function validateRights() : Boolean
      {
         var _loc1_:Boolean = _container.roomSession.isRoomOwner;
         var _loc2_:* = _container.roomSession.roomControllerLevel >= 1;
         var _loc3_:Boolean = _container.sessionDataManager.isAnyRoomController;
         return _loc1_ || _loc3_ || _loc2_;
      }
      
      public function update() : void
      {
      }
   }
}
