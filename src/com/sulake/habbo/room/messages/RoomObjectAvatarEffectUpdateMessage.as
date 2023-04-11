package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarEffectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1556:int;
      
      private var var_1080:int;
      
      public function RoomObjectAvatarEffectUpdateMessage(param1:int = 0, param2:int = 0)
      {
         super();
         var_1556 = param1;
         var_1080 = param2;
      }
      
      public function get effect() : int
      {
         return var_1556;
      }
      
      public function get delayMilliSeconds() : int
      {
         return var_1080;
      }
   }
}
