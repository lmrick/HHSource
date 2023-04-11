package com.sulake.habbo.room
{
   import com.sulake.core.runtime.class_19;
   import com.sulake.habbo.room.utils.class_3155;
   import com.sulake.habbo.room.utils.class_3196;
   import com.sulake.habbo.room.utils.class_3280;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.room.IRoomInstance;
   import com.sulake.room.object.IRoomObjectController;

   public interface IRoomCreator extends class_1676
   {
       
      
      function initializeRoom(param1:int, param2:XML) : void;
      
      function getRoom(param1:int) : IRoomInstance;
      
      function disposeRoom(param1:int) : void;
      
      function setOwnUserId(param1:int, param2:int) : void;
      
      function setWorldType(param1:int, param2:String) : void;
      
      function getObjectRoom(param1:int) : IRoomObjectController;
      
      function setFurniStackingHeightMap(param1:int, param2:class_3196) : void;
      
      function getFurniStackingHeightMap(param1:int) : class_3196;
      
      function getLegacyGeometry(param1:int) : class_3155;
      
      function getTileObjectMap(param1:int) : class_3280;
      
      function getRoomNumberValue(param1:int, param2:String) : Number;
      
      function getRoomStringValue(param1:int, param2:String) : String;
      
      function setIsPlayingGame(param1:int, param2:Boolean) : void;
      
      function refreshTileObjectMap(param1:int, param2:String) : void;
      
      function get configuration() : class_19;
      
      function get roomSessionManager() : IRoomSessionManager;
      
      function get sessionDataManager() : ISessionDataManager;
   }
}
