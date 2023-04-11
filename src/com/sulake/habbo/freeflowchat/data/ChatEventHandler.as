package com.sulake.habbo.freeflowchat.data
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
   import com.sulake.habbo.game.events.GameChatEvent;
   import com.sulake.habbo.session.events.RoomSessionChatEvent;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.utils.IVector3d;
   import flash.utils.getTimer;
   
   public class ChatEventHandler implements class_13
   {
      
      public static const CHAT_STYLE_SNOWWAR_RED:int = 120;
      
      public static const CHAT_STYLE_SNOWWAR_BLUE:int = 121;
       
      
      private var var_1460:HabboFreeFlowChat;
      
      private var var_4146:uint = 0;
      
      private var var_3049:uint = 0;
      
      public function ChatEventHandler(param1:HabboFreeFlowChat)
      {
         super();
         var_1460 = param1;
         var_1460.roomSessionManager.events.addEventListener("RSCE_CHAT_EVENT",onRoomChat);
         if(false)
         {
            var_1460.gameManager.events.addEventListener("gce_game_chat",gameEventHandler);
         }
      }
      
      public function dispose() : void
      {
         if(!disposed)
         {
            if(var_1460)
            {
               var_1460.roomSessionManager.events.removeEventListener("RSCE_CHAT_EVENT",onRoomChat);
               var_1460.gameManager.events.removeEventListener("gce_game_chat",gameEventHandler);
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
         var _loc3_:IRoomObject = var_1460.roomEngine.getRoomObject(param1.session.roomId,param1.userId,100);
         var _loc4_:IVector3d = null;
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.getLocation();
         }
         var _loc2_:uint = uint(getTimer());
         if(_loc2_ == var_4146)
         {
            var_3049++;
         }
         else
         {
            var_3049 = 0;
         }
         var_1460.insertChat(new ChatItem(param1,_loc2_ + var_3049,_loc4_,param1.extraParam));
         var_4146 = _loc2_;
      }
      
      private function gameEventHandler(param1:GameChatEvent) : void
      {
         var _loc3_:int = param1.teamId == 1 ? 121 : 120;
         var _loc2_:RoomSessionChatEvent = new RoomSessionChatEvent("RSCE_CHAT_EVENT",null,param1.userId,param1.message,0,_loc3_);
         var_1460.insertChat(new ChatItem(_loc2_,getTimer(),null,0,param1.locX,param1.color,param1.figure,param1.name));
      }
   }
}
