package com.sulake.habbo.room.messages
{
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectDataUpdateMessage extends RoomObjectUpdateMessage
   {
       
      
      private var var_159:int;
      
      private var var_45:IStuffData = null;
      
      private var var_609:Number = NaN;
      
      public function RoomObjectDataUpdateMessage(param1:int, param2:IStuffData, param3:Number = NaN)
      {
         super(null,null);
         var_159 = param1;
         var_45 = param2;
         var_609 = param3;
      }
      
      public function get state() : int
      {
         return var_159;
      }
      
      public function get data() : IStuffData
      {
         return var_45;
      }
      
      public function get extra() : Number
      {
         return var_609;
      }
   }
}
