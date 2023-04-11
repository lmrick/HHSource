package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarMutedUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_3910:Boolean;
      
      public function RoomObjectAvatarMutedUpdateMessage(param1:Boolean = false)
      {
         super();
         var_3910 = param1;
      }
      
      public function get isMuted() : Boolean
      {
         return var_3910;
      }
   }
}
