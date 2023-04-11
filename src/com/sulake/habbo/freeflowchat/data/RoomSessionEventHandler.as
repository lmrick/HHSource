package com.sulake.habbo.freeflowchat.data
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   
   public class RoomSessionEventHandler implements class_13
   {
       
      
      private var var_1460:HabboFreeFlowChat;
      
      public function RoomSessionEventHandler(param1:HabboFreeFlowChat)
      {
         super();
         var_1460 = param1;
         var_1460.roomSessionManager.events.addEventListener("RSE_CREATED",onRoomSessionCreated);
         var_1460.roomSessionManager.events.addEventListener("RSE_ENDED",onRoomSessionEnded);
      }
      
      public function dispose() : void
      {
         if(!disposed)
         {
            if(var_1460)
            {
               var_1460.roomSessionManager.events.removeEventListener("RSE_CREATED",onRoomSessionCreated);
               var_1460.roomSessionManager.events.removeEventListener("RSE_ENDED",onRoomSessionEnded);
               var_1460 = null;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return var_1460 == null;
      }
      
      private function onRoomSessionCreated(param1:RoomSessionEvent) : void
      {
         var_1460.roomEntered();
      }
      
      private function onRoomSessionEnded(param1:RoomSessionEvent) : void
      {
         var_1460.roomLeft();
      }
   }
}
