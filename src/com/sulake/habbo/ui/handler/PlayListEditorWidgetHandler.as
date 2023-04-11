package com.sulake.habbo.ui.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.room.events.RoomEngineSoundMachineEvent;
   import com.sulake.habbo.sound.events.NowPlayingEvent;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPlayListEditorEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPlayListEditorNowPlayingEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetPlayListModificationMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetPlayListPlayStateMessage;
   import com.sulake.room.object.IRoomObject;
   import flash.events.Event;
   import package_13.class_560;
   import package_15.class_140;
   import package_15.class_877;
   import package_55.class_216;
   import package_55.class_367;
   import package_55.class_426;
   
   public class PlayListEditorWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _disposed:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer;
      
      private var _connection:IConnection = null;
      
      private var var_3113:IMessageEvent;
      
      private var var_3657:IMessageEvent;
      
      private var var_2408:IMessageEvent;
      
      public function PlayListEditorWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get type() : String
      {
         return "RWE_PLAYLIST_EDITOR_WIDGET";
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
         if(false)
         {
            _container.soundManager.events.addEventListener("SDIR_SONG_DISK_INVENTORY_RECEIVENT_EVENT",processSoundManagerEvent);
            _container.soundManager.events.addEventListener("PLUE_PLAY_LIST_UPDATED",processSoundManagerEvent);
            _container.soundManager.events.addEventListener("PLUE_PLAY_LIST_FULL",processSoundManagerEvent);
            _container.soundManager.events.addEventListener("NPE_SONG_CHANGED",processSoundManagerEvent);
            _container.soundManager.events.addEventListener("NPE_USER_PLAY_SONG",processSoundManagerEvent);
            _container.soundManager.events.addEventListener("NPW_USER_STOP_SONG",processSoundManagerEvent);
         }
      }
      
      public function set connection(param1:IConnection) : void
      {
         var_3113 = new class_216(onFurniListUpdated);
         var_3657 = new class_426(onFurniListUpdated);
         var_2408 = new class_367(onFurniListUpdated);
         _connection = param1;
         _connection.addMessageEvent(var_3113);
         _connection.addMessageEvent(var_3657);
         _connection.addMessageEvent(var_2408);
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            if(_connection)
            {
               _connection.removeMessageEvent(var_3113);
               _connection.removeMessageEvent(var_3657);
               _connection.removeMessageEvent(var_2408);
            }
            _connection = null;
            var_3113 = null;
            if(_container)
            {
               if(false)
               {
                  if(_container.soundManager.events)
                  {
                     _container.soundManager.events.removeEventListener("SDIR_SONG_DISK_INVENTORY_RECEIVENT_EVENT",processSoundManagerEvent);
                     _container.soundManager.events.removeEventListener("PLUE_PLAY_LIST_UPDATED",processSoundManagerEvent);
                     _container.soundManager.events.removeEventListener("PLUE_PLAY_LIST_FULL",processSoundManagerEvent);
                     _container.soundManager.events.removeEventListener("NPE_SONG_CHANGED",processSoundManagerEvent);
                     _container.soundManager.events.removeEventListener("NPE_USER_PLAY_SONG",processSoundManagerEvent);
                     _container.soundManager.events.removeEventListener("NPW_USER_STOP_SONG",processSoundManagerEvent);
                  }
               }
               _container = null;
            }
         }
      }
      
      public function getWidgetMessages() : Array
      {
         return ["RWFWM_MESSAGE_REQUEST_PLAYLIST_EDITOR","RWPLAM_ADD_TO_PLAYLIST","RWPLAM_REMOVE_FROM_PLAYLIST","RWPLPS_TOGGLE_PLAY_PAUSE","RWPLUA_OPEN_CATALOGUE_BUTTON_PRESSED"];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc5_:RoomWidgetFurniToWidgetMessage = null;
         var _loc4_:IRoomObject = null;
         var _loc7_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:RoomWidgetPlayListEditorEvent = null;
         var _loc8_:RoomWidgetPlayListModificationMessage = null;
         var _loc9_:RoomWidgetPlayListModificationMessage = null;
         var _loc6_:RoomWidgetPlayListPlayStateMessage = null;
         switch(param1.type)
         {
            case "RWFWM_MESSAGE_REQUEST_PLAYLIST_EDITOR":
               _loc5_ = param1 as RoomWidgetFurniToWidgetMessage;
               if((_loc4_ = _container.roomEngine.getRoomObject(_loc5_.roomId,_loc5_.id,_loc5_.category)) != null)
               {
                  _loc7_ = _container.isOwnerOfFurniture(_loc4_);
                  _loc2_ = _container.roomSession.isRoomOwner || _container.roomSession.roomControllerLevel >= 1 || _container.sessionDataManager.isAnyRoomController;
                  if(_loc7_)
                  {
                     _loc3_ = new RoomWidgetPlayListEditorEvent("RWPLEE_SHOW_PLAYLIST_EDITOR",_loc5_.id);
                     _container.events.dispatchEvent(_loc3_);
                     break;
                  }
                  if(_loc2_)
                  {
                     if(_connection != null)
                     {
                        _connection.send(new class_560(_loc4_.getId(),-2));
                        break;
                     }
                     break;
                  }
                  break;
               }
               break;
            case "RWPLAM_ADD_TO_PLAYLIST":
               _loc8_ = param1 as RoomWidgetPlayListModificationMessage;
               if(_connection != null)
               {
                  _connection.send(new class_140(_loc8_.diskId,_loc8_.slotNumber));
                  break;
               }
               break;
            case "RWPLAM_REMOVE_FROM_PLAYLIST":
               _loc9_ = param1 as RoomWidgetPlayListModificationMessage;
               if(_connection != null)
               {
                  _connection.send(new class_877(_loc9_.slotNumber));
                  break;
               }
               break;
            case "RWPLPS_TOGGLE_PLAY_PAUSE":
               _loc6_ = param1 as RoomWidgetPlayListPlayStateMessage;
               if(_connection != null)
               {
                  _connection.send(new class_560(_loc6_.furniId,_loc6_.position));
                  break;
               }
               break;
            case "RWPLUA_OPEN_CATALOGUE_BUTTON_PRESSED":
               _container.habboTracking.trackGoogle("playlistEditorPanelOpenCatalogue","click");
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         var _loc1_:* = [];
         _loc1_.push("ROSM_JUKEBOX_DISPOSE");
         return _loc1_;
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc2_:RoomEngineSoundMachineEvent = null;
         var _loc3_:RoomWidgetPlayListEditorEvent = null;
         var _loc4_:* = param1.type;
         if("ROSM_JUKEBOX_DISPOSE" === _loc4_)
         {
            _loc2_ = param1 as RoomEngineSoundMachineEvent;
            _loc3_ = new RoomWidgetPlayListEditorEvent("RWPLEE_HIDE_PLAYLIST_EDITOR",_loc2_.objectId);
            _container.events.dispatchEvent(_loc3_);
         }
      }
      
      public function update() : void
      {
      }
      
      private function onFurniListUpdated(param1:IMessageEvent) : void
      {
         var _loc2_:class_216 = param1 as class_216;
         if(_loc2_ && _loc2_.getParser().fragmentNo == 0)
         {
            if(_container != null)
            {
               if(false)
               {
                  _container.events.dispatchEvent(new RoomWidgetPlayListEditorEvent("RWPLEE_INVENTORY_UPDATED",-1));
               }
            }
         }
      }
      
      private function processSoundManagerEvent(param1:Event) : void
      {
         var _loc2_:NowPlayingEvent = null;
         switch(param1.type)
         {
            case "SDIR_SONG_DISK_INVENTORY_RECEIVENT_EVENT":
               _container.events.dispatchEvent(new RoomWidgetPlayListEditorEvent("RWPLEE_SONG_DISK_INVENTORY_UPDATED"));
               break;
            case "PLUE_PLAY_LIST_UPDATED":
               _container.events.dispatchEvent(new RoomWidgetPlayListEditorEvent("RWPLEE_PLAY_LIST_UPDATED"));
               break;
            case "PLUE_PLAY_LIST_FULL":
               _container.events.dispatchEvent(new RoomWidgetPlayListEditorEvent("RWPLEE_PLAY_LIST_FULL"));
               break;
            case "NPE_SONG_CHANGED":
               _loc2_ = param1 as NowPlayingEvent;
               _container.events.dispatchEvent(new RoomWidgetPlayListEditorNowPlayingEvent("RWPLENPE_SONG_CHANGED",_loc2_.id,_loc2_.position,_loc2_.priority));
               break;
            case "NPE_USER_PLAY_SONG":
               _loc2_ = param1 as NowPlayingEvent;
               _container.events.dispatchEvent(new RoomWidgetPlayListEditorNowPlayingEvent("RWPLENPE_USER_PLAY_SONG",_loc2_.id,_loc2_.position,_loc2_.priority));
               break;
            case "NPW_USER_STOP_SONG":
               _loc2_ = param1 as NowPlayingEvent;
               _container.events.dispatchEvent(new RoomWidgetPlayListEditorNowPlayingEvent("RWPLENPW_USER_STOP_SONG",_loc2_.id,_loc2_.position,_loc2_.priority));
         }
      }
   }
}
