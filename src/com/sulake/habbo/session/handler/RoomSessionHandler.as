package com.sulake.habbo.session.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.habbo.session.IRoomHandlerListener;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.events.RoomSessionDoorbellEvent;
   import com.sulake.habbo.session.events.RoomSessionQueueEvent;
   import package_10.class_1038;
   import package_10.class_346;
   import package_10.class_538;
   import package_10.class_606;
   import package_10.class_847;
   import package_10.class_891;
   import package_11.class_975;
   import package_132.class_1441;
   import package_150.class_1089;
   import package_150.class_1134;
   import package_150.class_1369;
   import package_150.class_1421;
   import package_150.class_1516;
   import package_150.class_1530;
   
   public class RoomSessionHandler extends BaseHandler
   {
      
      public static const const_825:String = "RS_CONNECTED";
      
      public static const const_1162:String = "RS_READY";
      
      public static const const_606:String = "RS_DISCONNECTED";
       
      
      public function RoomSessionHandler(param1:IConnection, param2:IRoomHandlerListener)
      {
         super(param1,param2);
         if(param1 == null)
         {
            return;
         }
         param1.addMessageEvent(new class_1038(onRoomConnected));
         param1.addMessageEvent(new class_346(onFlatAccessible));
         param1.addMessageEvent(new class_847(onRoomReady));
         param1.addMessageEvent(new class_606(onRoomDisconnected));
         param1.addMessageEvent(new class_975(onFlatAccessDenied));
         param1.addMessageEvent(new class_891(onRoomQueueStatus));
         param1.addMessageEvent(new class_538(onYouAreSpectator));
      }
      
      private function onRoomConnected(param1:class_1038) : void
      {
         var _loc2_:class_1089 = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         if(listener)
         {
            listener.sessionUpdate(_loc2_.flatId,"RS_CONNECTED");
         }
      }
      
      private function onFlatAccessible(param1:class_346) : void
      {
         var _loc3_:IRoomSession = null;
         var _loc2_:class_1421 = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc4_:String;
         if((_loc4_ = _loc2_.userName) != null && _loc4_.length > 0)
         {
            if(listener && false)
            {
               _loc3_ = listener.getSession(_loc2_.flatId);
               if(_loc3_ != null)
               {
                  listener.events.dispatchEvent(new RoomSessionDoorbellEvent("RSDE_ACCEPTED",_loc3_,_loc4_));
               }
            }
         }
      }
      
      private function onRoomReady(param1:class_847) : void
      {
         var _loc2_:class_1134 = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = _loc2_.roomId;
         ErrorReportStorage.addDebugData("RoomID","Room id: " + _loc3_);
         if(listener)
         {
            listener.sessionReinitialize(_loc3_,_loc3_);
            listener.sessionUpdate(_loc3_,"RS_READY");
         }
      }
      
      private function onFlatAccessDenied(param1:class_975) : void
      {
         var _loc3_:IRoomSession = null;
         var _loc2_:class_1441 = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc4_:String;
         if((_loc4_ = _loc2_.userName) == null || _loc4_.length == 0)
         {
            if(listener)
            {
               listener.sessionUpdate(_loc2_.flatId,"RS_DISCONNECTED");
            }
         }
         else if(listener && false)
         {
            _loc3_ = listener.getSession(_loc2_.flatId);
            if(_loc3_ != null)
            {
               listener.events.dispatchEvent(new RoomSessionDoorbellEvent("RSDE_REJECTED",_loc3_,_loc4_));
            }
         }
      }
      
      private function onRoomDisconnected(param1:IMessageEvent) : void
      {
         var _loc2_:int = var_1459;
         ErrorReportStorage.addDebugData("RoomID","");
         if(listener)
         {
            listener.sessionUpdate(_loc2_,"RS_DISCONNECTED");
         }
      }
      
      private function onRoomQueueStatus(param1:class_891) : void
      {
         var _loc5_:class_1530 = null;
         var _loc6_:RoomSessionQueueEvent = null;
         var _loc2_:Array = null;
         if(listener == null || true)
         {
            return;
         }
         var _loc3_:class_1516 = param1.getParser();
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:IRoomSession;
         if((_loc4_ = listener.getSession(_loc3_.flatId)) == null)
         {
            return;
         }
         var _loc8_:Array = _loc3_.getQueueSetTargets();
         var _loc9_:int = _loc3_.activeTarget;
         for each(var _loc10_ in _loc8_)
         {
            _loc5_ = _loc3_.getQueueSet(_loc10_);
            _loc6_ = new RoomSessionQueueEvent(_loc4_,_loc5_.name,_loc5_.target,_loc5_.target == _loc9_);
            _loc2_ = _loc5_.queueTypes;
            for each(var _loc7_ in _loc2_)
            {
               _loc6_.addQueue(_loc7_,_loc5_.getQueueSize(_loc7_));
            }
            listener.events.dispatchEvent(_loc6_);
         }
      }
      
      private function onYouAreSpectator(param1:class_538) : void
      {
         if(listener == null)
         {
            return;
         }
         var _loc2_:class_1369 = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IRoomSession = listener.getSession(_loc2_.flatId);
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.isSpectatorMode = true;
      }
   }
}
