package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_261:int;
      
      private var _itemName:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_261 = param1;
         _itemName = param2;
      }
      
      public function get itemType() : int
      {
         return var_261;
      }
      
      public function get itemName() : String
      {
         return _itemName;
      }
   }
}
