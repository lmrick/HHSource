package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionFriendRequestEvent extends RoomSessionEvent
   {
      
      public static const FRIEND_REQUEST:String = "RSFRE_FRIEND_REQUEST";
       
      
      private var var_438:int = 0;
      
      private var var_339:int = 0;
      
      private var _userName:String;
      
      public function RoomSessionFriendRequestEvent(param1:IRoomSession, param2:int, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super("RSFRE_FRIEND_REQUEST",param1,param5,param6);
         var_438 = param2;
         var_339 = param3;
         _userName = param4;
      }
      
      public function get requestId() : int
      {
         return var_438;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
