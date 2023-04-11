package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarExpressionUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_515:int = -1;
      
      public function RoomObjectAvatarExpressionUpdateMessage(param1:int = -1)
      {
         super();
         var_515 = param1;
      }
      
      public function get expressionType() : int
      {
         return var_515;
      }
   }
}
