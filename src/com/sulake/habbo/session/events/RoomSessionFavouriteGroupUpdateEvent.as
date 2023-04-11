package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionFavouriteGroupUpdateEvent extends RoomSessionEvent
   {
      
      public static const const_1081:String = "rsfgue_favourite_group_update";
       
      
      private var var_783:int;
      
      private var var_771:int;
      
      private var _habboGroupName:String;
      
      private var _status:int;
      
      public function RoomSessionFavouriteGroupUpdateEvent(param1:IRoomSession, param2:int, param3:int, param4:int, param5:String, param6:Boolean = false, param7:Boolean = false)
      {
         super("rsfgue_favourite_group_update",param1,param6,param7);
         var_783 = param2;
         var_771 = param3;
         _habboGroupName = param5;
         _status = param4;
      }
      
      public function get roomIndex() : int
      {
         return var_783;
      }
      
      public function get habboGroupId() : int
      {
         return var_771;
      }
      
      public function get habboGroupName() : String
      {
         return _habboGroupName;
      }
      
      public function get status() : int
      {
         return _status;
      }
   }
}
