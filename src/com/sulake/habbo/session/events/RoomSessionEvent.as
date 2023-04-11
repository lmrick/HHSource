package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   import flash.events.Event;
   
   public class RoomSessionEvent extends Event
   {
      
      public static const const_646:String = "RSE_CREATED";
      
      public static const const_1099:String = "RSE_STARTED";
      
      public static const const_1026:String = "RSE_ENDED";
      
      public static const SESSION_ROOM_DATA:String = "RSE_ROOM_DATA";
       
      
      private var _session:IRoomSession;
      
      private var var_3810:Boolean;
      
      public function RoomSessionEvent(param1:String, param2:IRoomSession, param3:Boolean = true, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         _session = param2;
         var_3810 = param3;
      }
      
      public function get session() : IRoomSession
      {
         return _session;
      }
      
      public function get openLandingPage() : Boolean
      {
         return var_3810;
      }
   }
}
