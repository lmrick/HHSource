package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_427:String;
      
      private var var_3860:String;
      
      private var var_122:String;
      
      private var var_1018:Boolean;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null, param4:Boolean = false)
      {
         super();
         var_427 = param1;
         var_122 = param2;
         var_3860 = param3;
         var_1018 = param4;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function get race() : String
      {
         return var_3860;
      }
      
      public function get gender() : String
      {
         return var_122;
      }
      
      public function get isRiding() : Boolean
      {
         return var_1018;
      }
   }
}
