package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const VISITOR_QUEUE_STATUS:String = "RWRQUE_VISITOR_QUEUE_STATUS";
      
      public static const SPECTATOR_QUEUE_STATUS:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
       
      
      private var _position:int;
      
      private var var_3879:Boolean;
      
      private var var_2105:Boolean;
      
      private var var_3524:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         _position = param2;
         var_3879 = param3;
         var_2105 = param4;
         var_3524 = param5;
      }
      
      public function get position() : int
      {
         return _position;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return var_3879;
      }
      
      public function get isActive() : Boolean
      {
         return var_2105;
      }
      
      public function get isClubQueue() : Boolean
      {
         return var_3524;
      }
   }
}
