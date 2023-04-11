package com.sulake.habbo.ui
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.class_19;
   import com.sulake.habbo.avatar.class_1690;
   import com.sulake.habbo.avatar.class_1753;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.freeflowchat.class_1692;
   import com.sulake.habbo.friendlist.class_1869;
   import com.sulake.habbo.game.class_1688;
   import com.sulake.habbo.groups.class_1752;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.inventory.class_1697;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.messenger.class_1689;
   import com.sulake.habbo.moderation.IHabboModeration;
   import com.sulake.habbo.navigator.class_1685;
   import com.sulake.habbo.quest.class_2047;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.roomevents.IHabboUserDefinedRoomEvents;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.class_3259;
   import com.sulake.habbo.sound.class_2089;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.tracking.class_1693;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.room.object.IRoomObject;
   import flash.events.IEventDispatcher;
   import flash.geom.Rectangle;
   
   public interface IRoomWidgetHandlerContainer
   {
       
      
      function get habboTracking() : class_1693;
      
      function get roomSession() : IRoomSession;
      
      function get sessionDataManager() : ISessionDataManager;
      
      function get events() : IEventDispatcher;
      
      function get roomEngine() : IRoomEngine;
      
      function get friendList() : class_1869;
      
      function get avatarRenderManager() : class_1690;
      
      function get inventory() : class_1697;
      
      function get toolbar() : IHabboToolbar;
      
      function get navigator() : class_1685;
      
      function get habboGroupsManager() : class_1752;
      
      function get roomWidgetFactory() : IRoomWidgetFactory;
      
      function get roomSessionManager() : IRoomSessionManager;
      
      function get avatarEditor() : class_1753;
      
      function get catalog() : IHabboCatalog;
      
      function get localization() : class_18;
      
      function get habboHelp() : IHabboHelp;
      
      function get config() : class_19;
      
      function get soundManager() : class_2089;
      
      function get messenger() : class_1689;
      
      function get moderation() : IHabboModeration;
      
      function get windowManager() : class_1684;
      
      function get userDefinedRoomEvents() : IHabboUserDefinedRoomEvents;
      
      function get connection() : IConnection;
      
      function get gameManager() : class_1688;
      
      function get questEngine() : class_2047;
      
      function get freeFlowChat() : class_1692;
      
      function get layoutManager() : class_3360;
      
      function setRoomViewColor(param1:uint, param2:int) : void;
      
      function getFirstCanvasId() : int;
      
      function getRoomViewRect() : Rectangle;
      
      function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent;
      
      function addUpdateListener(param1:IRoomWidgetHandler) : void;
      
      function removeUpdateListener(param1:IRoomWidgetHandler) : void;
      
      function isOwnerOfFurniture(param1:IRoomObject) : Boolean;
      
      function getFurnitureOwnerId(param1:IRoomObject) : int;
      
      function isOwnerOfPet(param1:class_3259) : Boolean;
      
      function setRoomBackgroundColor(param1:int, param2:int, param3:int) : void;
   }
}
