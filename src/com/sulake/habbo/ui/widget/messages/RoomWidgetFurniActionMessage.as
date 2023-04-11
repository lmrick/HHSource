package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const ROTATE:String = "RWFUAM_ROTATE";
      
      public static const MOVE:String = "RWFAM_MOVE";
      
      public static const const_536:String = "RWFAM_PICKUP";
      
      public static const const_886:String = "RWFAM_EJECT";
      
      public static const USE:String = "RWFAM_USE";
      
      public static const SAVE_STUFF_DATA:String = "RWFAM_SAVE_STUFF_DATA";
       
      
      private var var_490:int = 0;
      
      private var var_3799:int = 0;
      
      private var _offerId:int;
      
      private var var_4082:String;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int, param4:int = -1, param5:String = null)
      {
         super(param1);
         var_490 = param2;
         var_3799 = param3;
         _offerId = param4;
         var_4082 = param5;
      }
      
      public function get furniId() : int
      {
         return var_490;
      }
      
      public function get furniCategory() : int
      {
         return var_3799;
      }
      
      public function get objectData() : String
      {
         return var_4082;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
   }
}
