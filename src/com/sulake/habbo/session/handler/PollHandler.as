package com.sulake.habbo.session.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.habbo.session.IRoomHandlerListener;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.events.RoomSessionPollEvent;
   import package_158.class_1127;
   import package_158.class_1195;
   import package_158.class_1414;
   import package_56.class_217;
   import package_56.class_445;
   import package_56.class_867;
   
   public class PollHandler extends BaseHandler
   {
       
      
      public function PollHandler(param1:IConnection, param2:IRoomHandlerListener)
      {
         super(param1,param2);
         if(!param1)
         {
            return;
         }
         param1.addMessageEvent(new class_217(onPollContentsEvent));
         param1.addMessageEvent(new class_867(onPollOfferEvent));
         param1.addMessageEvent(new class_445(onPollErrorEvent));
      }
      
      private function onPollOfferEvent(param1:class_867) : void
      {
         var _loc4_:RoomSessionPollEvent = null;
         if(!param1)
         {
            return;
         }
         var _loc3_:IRoomSession = listener.getSession(var_1459);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc2_:class_1414 = param1.getParser();
         (_loc4_ = new RoomSessionPollEvent("RSPE_POLL_OFFER",_loc3_,_loc2_.id)).summary = _loc2_.headline;
         _loc4_.summary = _loc2_.summary;
         listener.events.dispatchEvent(_loc4_);
      }
      
      private function onPollErrorEvent(param1:class_445) : void
      {
         var _loc4_:RoomSessionPollEvent = null;
         if(!param1)
         {
            return;
         }
         var _loc3_:IRoomSession = listener.getSession(var_1459);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc2_:class_1195 = param1.getParser();
         (_loc4_ = new RoomSessionPollEvent("RSPE_POLL_ERROR",_loc3_,-1)).headline = "???";
         _loc4_.summary = "???";
         listener.events.dispatchEvent(_loc4_);
      }
      
      private function onPollContentsEvent(param1:class_217) : void
      {
         var _loc4_:RoomSessionPollEvent = null;
         if(!param1)
         {
            return;
         }
         var _loc3_:IRoomSession = listener.getSession(var_1459);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc2_:class_1127 = param1.getParser();
         (_loc4_ = new RoomSessionPollEvent("RSPE_POLL_CONTENT",_loc3_,_loc2_.id)).startMessage = _loc2_.startMessage;
         _loc4_.endMessage = _loc2_.endMessage;
         _loc4_.numQuestions = _loc2_.numQuestions;
         _loc4_.questionArray = _loc2_.questionArray;
         _loc4_.npsPoll = _loc2_.npsPoll;
         listener.events.dispatchEvent(_loc4_);
      }
   }
}
