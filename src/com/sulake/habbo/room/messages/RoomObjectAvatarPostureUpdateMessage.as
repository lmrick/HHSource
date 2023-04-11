package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_4084:String;
      
      private var var_190:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_4084 = param1;
         var_190 = param2;
      }
      
      public function get postureType() : String
      {
         return var_4084;
      }
      
      public function get parameter() : String
      {
         return var_190;
      }
   }
}
