package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPresentEvent extends RoomSessionEvent
   {
      
      public static const ROOM_SESSION_PRESENT_OPENED:String = "RSPE_PRESENT_OPENED";
       
      
      private var var_385:int = 0;
      
      private var var_261:String = "";
      
      private var var_343:String;
      
      private var var_1101:int = 0;
      
      private var var_1278:String = "";
      
      private var _placedInRoom:Boolean;
      
      private var _petFigureString:String;
      
      public function RoomSessionPresentEvent(param1:String, param2:IRoomSession, param3:int, param4:String, param5:String, param6:int, param7:String, param8:Boolean, param9:String, param10:Boolean = false, param11:Boolean = false)
      {
         super(param1,param2,param10,param11);
         var_385 = param3;
         var_261 = param4;
         var_343 = param5;
         var_1101 = param6;
         var_1278 = param7;
         _placedInRoom = param8;
         _petFigureString = param9;
      }
      
      public function get classId() : int
      {
         return var_385;
      }
      
      public function get itemType() : String
      {
         return var_261;
      }
      
      public function get productCode() : String
      {
         return var_343;
      }
      
      public function get placedItemId() : int
      {
         return var_1101;
      }
      
      public function get placedInRoom() : Boolean
      {
         return _placedInRoom;
      }
      
      public function get placedItemType() : String
      {
         return var_1278;
      }
      
      public function get petFigureString() : String
      {
         return _petFigureString;
      }
   }
}
