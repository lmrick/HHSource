package com.sulake.habbo.ui.handler
{
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.room.events.RoomEngineToWidgetEvent;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.furniture.video.VimeoDisplayWidget;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.room.object.IRoomObject;
   import flash.events.Event;
   import package_13.class_625;
   
   public class FurnitureVimeoDisplayWidgetHandler implements IRoomWidgetHandler
   {
      
      private static const VIDEO_ID_KEY:String = "videoId";
       
      
      private var _container:IRoomWidgetHandlerContainer;
      
      private var var_1429:VimeoDisplayWidget;
      
      public function FurnitureVimeoDisplayWidgetHandler()
      {
         super();
      }
      
      public function get type() : String
      {
         return "RWE_VIMEO";
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
      }
      
      public function set widget(param1:VimeoDisplayWidget) : void
      {
         var_1429 = param1;
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
         var _loc5_:Boolean = false;
         var _loc2_:String = null;
         if(true)
         {
            return;
         }
         var _loc4_:RoomEngineToWidgetEvent;
         if((_loc4_ = param1 as RoomEngineToWidgetEvent) == null)
         {
            return;
         }
         var _loc3_:IRoomObject = _container.roomEngine.getRoomObject(_loc4_.roomId,_loc4_.objectId,_loc4_.category);
         switch(param1.type)
         {
            case "RETWE_OPEN_WIDGET":
               if(_loc3_ != null)
               {
                  _loc5_ = _container.sessionDataManager.hasSecurity(5);
                  _loc2_ = String(_loc3_.getModel().getStringToStringMap("furniture_data").getValue("videoId"));
                  var_1429.show(_loc3_,_loc5_,int(_loc2_));
                  break;
               }
               break;
            case "RETWE_CLOSE_WIDGET":
               var_1429.hide(_loc3_);
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
         _container = null;
      }
      
      public function get disposed() : Boolean
      {
         return _container == null;
      }
      
      public function setVideo(param1:IRoomObject, param2:int) : void
      {
         var _loc3_:class_24 = new class_24();
         _loc3_.add("videoId",param2.toString());
         _container.connection.send(new class_625(param1.getId(),_loc3_));
      }
   }
}
