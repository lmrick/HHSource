package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.object.IRoomObject;
   
   public class RoomObjectMoveEvent extends RoomObjectEvent
   {
      
      public static const const_755:String = "ROME_POSITION_CHANGED";
      
      public static const const_1067:String = "ROME_OBJECT_REMOVED";
       
      
      public function RoomObjectMoveEvent(param1:String, param2:IRoomObject, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param2,param3,param4);
      }
   }
}
