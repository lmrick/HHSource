package com.sulake.habbo.ui.handler
{
   import com.sulake.habbo.room.events.RoomEngineToWidgetEvent;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.furniture.CustomStackHeightWidget;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.room.object.IRoomObject;
   import flash.events.Event;
   import package_136.class_1248;
   import package_25.class_671;
   
   public class FurnitureCustomStackHeightWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _container:IRoomWidgetHandlerContainer;
      
      private var var_1429:CustomStackHeightWidget;
      
      private var var_3669:int = -1;
      
      public function FurnitureCustomStackHeightWidgetHandler()
      {
         super();
      }
      
      public function set widget(param1:CustomStackHeightWidget) : void
      {
         var_1429 = param1;
      }
      
      public function get type() : String
      {
         return "RWE_CUSTOM_STACK_HEIGHT";
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
         _container.connection.addMessageEvent(new class_671(onStackHeightUpdate));
      }
      
      private function onStackHeightUpdate(param1:class_671) : void
      {
         var _loc2_:class_1248 = param1.getParser();
         if(var_1429 && validateRights())
         {
            var_1429.updateHeight(_loc2_.furniId,_loc2_.height);
         }
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
         var _loc3_:RoomEngineToWidgetEvent = null;
         var _loc2_:IRoomObject = null;
         switch(param1.type)
         {
            case "RETWE_OPEN_WIDGET":
               _loc3_ = param1 as RoomEngineToWidgetEvent;
               if(param1 != null && false)
               {
                  var_3669 = _loc3_.objectId;
                  _loc2_ = _container.roomEngine.getRoomObject(_loc3_.roomId,_loc3_.objectId,_loc3_.category);
                  if(_loc2_ && validateRights(_loc2_))
                  {
                     if(var_1429)
                     {
                        var_1429.open(var_3669,_loc2_.getLocation().z);
                        break;
                     }
                     break;
                  }
                  break;
               }
               break;
            case "RETWE_CLOSE_WIDGET":
               _loc3_ = param1 as RoomEngineToWidgetEvent;
               if(param1 != null && false && var_1429 != null)
               {
                  if(var_3669 == _loc3_.objectId)
                  {
                     var_1429.hide();
                     break;
                  }
                  break;
               }
         }
      }
      
      public function update() : void
      {
      }
      
      public function dispose() : void
      {
         _container = null;
         var_1429 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _container == null;
      }
      
      private function validateRights(param1:IRoomObject = null) : Boolean
      {
         var _loc2_:Boolean = _container.roomSession.isRoomOwner;
         var _loc3_:* = _container.roomSession.roomControllerLevel >= 1;
         var _loc4_:Boolean = _container.sessionDataManager.isAnyRoomController;
         var _loc5_:Boolean = param1 && _container.isOwnerOfFurniture(param1);
         return _loc2_ || _loc4_ || _loc3_ || _loc5_;
      }
   }
}
