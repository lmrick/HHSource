package com.sulake.habbo.help.cfh.registry.chat
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.session.class_3259;
   import com.sulake.habbo.session.events.RoomSessionChatEvent;
   import package_11.class_1569;
   
   public class ChatEventHandler implements class_13
   {
       
      
      private var var_1460:HabboHelp;
      
      public function ChatEventHandler(param1:HabboHelp)
      {
         super();
         var_1460 = param1;
         var_1460.roomSessionManager.events.addEventListener("RSCE_CHAT_EVENT",onRoomChat);
      }
      
      public function dispose() : void
      {
         if(!disposed)
         {
            if(var_1460)
            {
               var_1460.roomSessionManager.events.removeEventListener("RSCE_CHAT_EVENT",onRoomChat);
               var_1460 = null;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return var_1460 == null;
      }
      
      private function onRoomChat(param1:RoomSessionChatEvent) : void
      {
         var _loc2_:class_3259 = var_1460.roomSessionManager.getSession(param1.session.roomId).userDataManager.getUserDataByIndex(param1.userId);
         var _loc3_:class_1569 = var_1460.navigator.enteredGuestRoomData;
         if(!_loc2_ || _loc2_.type != 1 || !_loc3_)
         {
            return;
         }
         var _loc4_:String = !!_loc3_ ? _loc3_.roomName : "Unknown Room";
         var_1460.chatRegistry.addItem(param1.session.roomId,_loc4_,_loc2_.webID,_loc2_.name,param1.text);
      }
   }
}
