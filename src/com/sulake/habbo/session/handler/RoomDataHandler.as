package com.sulake.habbo.session.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.session.IRoomHandlerListener;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.session.events.RoomSessionPropertyUpdateEvent;
   import package_11.class_1569;
   import package_11.class_846;
   import package_132.class_1084;
   
   public class RoomDataHandler extends BaseHandler
   {
       
      
      public function RoomDataHandler(param1:IConnection, param2:IRoomHandlerListener)
      {
         super(param1,param2);
         if(param1 == null)
         {
            return;
         }
         param1.addMessageEvent(new class_846(onRoomResult));
      }
      
      private function onRoomResult(param1:IMessageEvent) : void
      {
         var _loc5_:class_846;
         if((_loc5_ = param1 as class_846) == null)
         {
            return;
         }
         var _loc2_:class_1084 = _loc5_.getParser();
         if(_loc2_.roomForward)
         {
            return;
         }
         var _loc3_:IRoomSession = listener.getSession(var_1459);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:class_1569 = _loc2_.data;
         _loc3_.tradeMode = _loc4_.tradeMode;
         _loc3_.isGuildRoom = _loc4_.habboGroupId != 0;
         _loc3_.doorMode = _loc4_.doorMode;
         _loc3_.arePetsAllowed = _loc4_.allowPets;
         _loc3_.roomModerationSettings = _loc2_.roomModerationSettings;
         listener.events.dispatchEvent(new RoomSessionPropertyUpdateEvent("RSDUE_ALLOW_PETS",_loc3_));
         listener.events.dispatchEvent(new RoomSessionEvent("RSE_ROOM_DATA",_loc3_));
      }
   }
}
