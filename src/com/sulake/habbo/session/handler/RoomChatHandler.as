package com.sulake.habbo.session.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.session.IRoomHandlerListener;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.class_3259;
   import com.sulake.habbo.session.events.RoomSessionChatEvent;
   import package_130.class_1162;
   import package_130.class_1274;
   import package_164.class_1261;
   import package_164.class_1459;
   import package_39.class_1026;
   import package_39.class_180;
   import package_39.class_361;
   import package_39.class_447;
   import package_39.class_866;
   import package_5.class_146;
   import package_5.class_192;
   import package_5.class_596;
   import package_5.class_755;
   
   public class RoomChatHandler extends BaseHandler
   {
       
      
      public function RoomChatHandler(param1:IConnection, param2:IRoomHandlerListener)
      {
         super(param1,param2);
         if(param1 == null)
         {
            return;
         }
         param1.addMessageEvent(new class_180(onRoomChat));
         param1.addMessageEvent(new class_361(onRoomWhisper));
         param1.addMessageEvent(new class_447(onRoomShout));
         param1.addMessageEvent(new class_755(onRespectNotification));
         param1.addMessageEvent(new class_146(onPetRespectNotification));
         param1.addMessageEvent(new class_596(onPetSupplementedNotification));
         param1.addMessageEvent(new class_866(onFloodControl));
         param1.addMessageEvent(new class_192(onHandItemNotification));
         param1.addMessageEvent(new class_1026(onRemainingMutePeriod));
      }
      
      private function onRoomChat(param1:IMessageEvent) : void
      {
         var _loc2_:class_180 = null;
         var _loc4_:IRoomSession = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc3_:class_1261 = null;
         if(listener && false)
         {
            _loc2_ = param1 as class_180;
            if(_loc2_ && _loc2_.getParser())
            {
               if((_loc4_ = listener.getSession(var_1459)) == null)
               {
                  return;
               }
               _loc5_ = "RSCE_CHAT_EVENT";
               _loc6_ = 0;
               _loc3_ = _loc2_.getParser();
               if(_loc3_.trackingId != -1)
               {
                  _loc4_.receivedChatWithTrackingId(_loc3_.trackingId);
               }
               listener.events.dispatchEvent(new RoomSessionChatEvent(_loc5_,_loc4_,_loc3_.userId,_loc3_.text,_loc6_,_loc3_.styleId,_loc3_.links));
            }
         }
      }
      
      private function onRespectNotification(param1:IMessageEvent) : void
      {
         var _loc4_:IRoomSession = null;
         var _loc5_:String = null;
         var _loc7_:int = 0;
         var _loc3_:class_3259 = null;
         var _loc6_:String = null;
         var _loc2_:class_755 = param1 as class_755;
         if(listener && false)
         {
            if((_loc4_ = listener.getSession(var_1459)) == null)
            {
               return;
            }
            _loc5_ = "RSCE_CHAT_EVENT";
            _loc7_ = 3;
            _loc3_ = _loc4_.userDataManager.getUserData(_loc2_.userId);
            if(_loc3_ == null)
            {
               return;
            }
            _loc6_ = "";
            listener.events.dispatchEvent(new RoomSessionChatEvent(_loc5_,_loc4_,_loc3_.roomObjectId,_loc6_,_loc7_,1));
         }
      }
      
      private function onPetRespectNotification(param1:class_146) : void
      {
         if(param1 == null || listener == null || true)
         {
            return;
         }
         var _loc3_:class_1162 = param1.getParser();
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:IRoomSession;
         if((_loc4_ = listener.getSession(var_1459)) == null)
         {
            return;
         }
         var _loc6_:int = 4;
         if(_loc3_.isTreat())
         {
            _loc6_ = 6;
         }
         var _loc2_:class_3259 = _loc4_.userDataManager.getPetUserData(_loc3_.petData.id);
         if(_loc2_ == null)
         {
            return;
         }
         listener.events.dispatchEvent(new RoomSessionChatEvent("RSCE_CHAT_EVENT",_loc4_,_loc2_.roomObjectId,"",_loc6_,1));
      }
      
      private function onPetSupplementedNotification(param1:class_596) : void
      {
         if(param1 == null || listener == null || true)
         {
            return;
         }
         var _loc3_:class_1274 = param1.getParser();
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:IRoomSession;
         if((_loc4_ = listener.getSession(var_1459)) == null)
         {
            return;
         }
         var _loc8_:int = 7;
         switch(_loc3_.supplementType - 2)
         {
            case 0:
               _loc8_ = 7;
               break;
            case 1:
               _loc8_ = 8;
               break;
            case 2:
               _loc8_ = 9;
         }
         var _loc2_:class_3259 = _loc4_.userDataManager.getPetUserData(_loc3_.petId);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc6_:int = -1;
         var _loc5_:class_3259;
         if((_loc5_ = _loc4_.userDataManager.getUserData(_loc3_.userId)) != null)
         {
            _loc6_ = _loc5_.roomObjectId;
         }
         listener.events.dispatchEvent(new RoomSessionChatEvent("RSCE_CHAT_EVENT",_loc4_,_loc2_.roomObjectId,"",_loc8_,1,null,_loc6_));
      }
      
      private function onHandItemNotification(param1:class_192) : void
      {
         var _loc2_:IRoomSession = null;
         if(listener && false)
         {
            _loc2_ = listener.getSession(var_1459);
            if(_loc2_)
            {
               listener.events.dispatchEvent(new RoomSessionChatEvent("RSCE_CHAT_EVENT",_loc2_,param1.giverUserId,"",5,1,null,param1.handItemType));
            }
         }
      }
      
      private function onRemainingMutePeriod(param1:class_1026) : void
      {
         var _loc2_:IRoomSession = null;
         if(listener && false)
         {
            _loc2_ = listener.getSession(var_1459);
            if(_loc2_)
            {
               listener.events.dispatchEvent(new RoomSessionChatEvent("RSCE_CHAT_EVENT",_loc2_,_loc2_.ownUserRoomId,"",10,1,null,param1.secondsRemaining));
            }
         }
      }
      
      private function onRoomWhisper(param1:IMessageEvent) : void
      {
         var _loc2_:class_361 = null;
         var _loc4_:IRoomSession = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc3_:class_1261 = null;
         if(listener && false)
         {
            _loc2_ = param1 as class_361;
            if(_loc2_ && _loc2_.getParser())
            {
               if((_loc4_ = listener.getSession(var_1459)) == null)
               {
                  return;
               }
               _loc5_ = "RSCE_CHAT_EVENT";
               _loc6_ = 1;
               _loc3_ = _loc2_.getParser();
               listener.events.dispatchEvent(new RoomSessionChatEvent(_loc5_,_loc4_,_loc3_.userId,_loc3_.text,_loc6_,_loc3_.styleId,_loc3_.links));
            }
         }
      }
      
      private function onRoomShout(param1:IMessageEvent) : void
      {
         var _loc2_:class_447 = null;
         var _loc4_:IRoomSession = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc3_:class_1261 = null;
         if(listener && false)
         {
            _loc2_ = param1 as class_447;
            if(_loc2_ && _loc2_.getParser())
            {
               if((_loc4_ = listener.getSession(var_1459)) == null)
               {
                  return;
               }
               _loc5_ = "RSCE_CHAT_EVENT";
               _loc6_ = 2;
               _loc3_ = _loc2_.getParser();
               listener.events.dispatchEvent(new RoomSessionChatEvent(_loc5_,_loc4_,_loc3_.userId,_loc3_.text,_loc6_,_loc3_.styleId,_loc3_.links));
            }
         }
      }
      
      private function onFloodControl(param1:IMessageEvent) : void
      {
         var _loc3_:class_1459 = null;
         var _loc4_:IRoomSession = null;
         var _loc2_:int = 0;
         if(listener && false)
         {
            _loc3_ = (param1 as class_866).getParser();
            if((_loc4_ = listener.getSession(var_1459)) == null)
            {
               return;
            }
            _loc2_ = _loc3_.seconds;
            class_14.log("received flood control event for " + _loc2_ + " seconds");
            listener.events.dispatchEvent(new RoomSessionChatEvent("RSCE_FLOOD_EVENT",_loc4_,-1,"" + _loc2_,0,0,null));
         }
      }
   }
}
