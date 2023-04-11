package com.sulake.habbo.ui.widget.events
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomWidgetRoomViewUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const ROOM_VIEW_SIZE_CHANGED:String = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
      
      public static const ROOM_VIEW_SCALE_CHANGED:String = "RWRVUE_ROOM_VIEW_SCALE_CHANGED";
      
      public static const ROOM_VIEW_POSITION_CHANGED:String = "RWRVUE_ROOM_VIEW_POSITION_CHANGED";
       
      
      private var var_3551:Rectangle;
      
      private var var_3700:Point;
      
      private var var_757:Number = 0;
      
      public function RoomWidgetRoomViewUpdateEvent(param1:String, param2:Rectangle = null, param3:Point = null, param4:Number = 0, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         var_3551 = param2;
         var_3700 = param3;
         var_757 = param4;
      }
      
      public function get rect() : Rectangle
      {
         if(var_3551 != null)
         {
            return var_3551.clone();
         }
         return null;
      }
      
      public function get positionDelta() : Point
      {
         if(var_3700 != null)
         {
            return var_3700.clone();
         }
         return null;
      }
      
      public function get scale() : Number
      {
         return var_757;
      }
   }
}
