package com.sulake.habbo.ui.handler
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.room.events.RoomEngineToWidgetEvent;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.furniture.video.YoutubeDisplayWidget;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.room.object.IRoomObject;
   import flash.events.Event;
   import package_136.class_1232;
   import package_136.class_1300;
   import package_136.class_1496;
   import package_21.class_153;
   import package_21.class_424;
   import package_21.class_566;
   import package_25.class_1030;
   import package_25.class_441;
   import package_25.class_864;
   
   public class FurnitureYoutubeDisplayWidgetHandler implements IRoomWidgetHandler
   {
      
      private static const CONTROL_COMMAND_PREVIOUS_VIDEO:int = 0;
      
      private static const CONTROL_COMMAND_NEXT_VIDEO:int = 1;
      
      private static const CONTROL_COMMAND_PAUSE_VIDEO:int = 2;
      
      private static const CONTROL_COMMAND_CONTINUE_VIDEO:int = 3;
       
      
      private var _container:IRoomWidgetHandlerContainer;
      
      private var var_1429:YoutubeDisplayWidget;
      
      private var name_1:Vector.<IMessageEvent>;
      
      public function FurnitureYoutubeDisplayWidgetHandler()
      {
         super();
      }
      
      public function get type() : String
      {
         return "RWE_YOUTUBE";
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
         addMessageEvent(new class_441(onVideo));
         addMessageEvent(new class_864(onPlaylists));
         addMessageEvent(new class_1030(onControlVideo));
      }
      
      private function addMessageEvent(param1:IMessageEvent) : void
      {
         if(name_1 == null)
         {
            name_1 = new Vector.<IMessageEvent>(0);
         }
         name_1.push(param1);
         _container.connection.addMessageEvent(param1);
      }
      
      private function removeEvents() : void
      {
         for each(var _loc1_ in name_1)
         {
            _container.connection.removeMessageEvent(_loc1_);
            _loc1_.dispose();
         }
      }
      
      private function onVideo(param1:class_441) : void
      {
         var _loc2_:class_1232 = param1.getParser();
         var_1429.showVideo(_loc2_.furniId,_loc2_.videoId,_loc2_.startAtSeconds,_loc2_.endAtSeconds,_loc2_.state);
      }
      
      private function onControlVideo(param1:class_1030) : void
      {
         var _loc2_:class_1496 = param1.getParser();
         var_1429.controlVideo(_loc2_.furniId,_loc2_.commandId);
      }
      
      private function onPlaylists(param1:class_864) : void
      {
         var _loc2_:class_1300 = param1.getParser();
         var_1429.populatePlaylists(_loc2_.furniId,_loc2_.playlists,_loc2_.selectedPlaylistId);
      }
      
      public function set widget(param1:YoutubeDisplayWidget) : void
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
         var _loc3_:Boolean = false;
         if(true)
         {
            return;
         }
         var _loc4_:RoomEngineToWidgetEvent;
         if((_loc4_ = param1 as RoomEngineToWidgetEvent) == null)
         {
            return;
         }
         var _loc2_:IRoomObject = _container.roomEngine.getRoomObject(_loc4_.roomId,_loc4_.objectId,_loc4_.category);
         switch(param1.type)
         {
            case "RETWE_OPEN_WIDGET":
               if(_loc2_ != null)
               {
                  _loc3_ = _container.isOwnerOfFurniture(_loc2_) || _container.sessionDataManager.hasSecurity(4);
                  var_1429.show(_loc2_,_loc3_);
                  _container.connection.send(new class_566(_loc2_.getId()));
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
         removeEvents();
         _container = null;
      }
      
      public function get disposed() : Boolean
      {
         return _container == null;
      }
      
      public function selectPlaylist(param1:int, param2:String) : void
      {
         _container.connection.send(new class_153(param1,param2));
      }
      
      public function switchToPreviousVideo(param1:int) : void
      {
         _container.connection.send(new class_424(param1,0));
      }
      
      public function switchToNextVideo(param1:int) : void
      {
         _container.connection.send(new class_424(param1,1));
      }
      
      public function pauseVideo(param1:int) : void
      {
         _container.connection.send(new class_424(param1,2));
      }
      
      public function continueVideo(param1:int) : void
      {
         _container.connection.send(new class_424(param1,3));
      }
   }
}
