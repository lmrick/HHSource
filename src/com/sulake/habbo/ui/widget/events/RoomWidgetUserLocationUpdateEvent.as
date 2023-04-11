package com.sulake.habbo.ui.widget.events
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomWidgetUserLocationUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const USER_LOCATION_UPDATE:String = "RWULUE_USER_LOCATION_UPDATE";
       
      
      private var var_339:int;
      
      private var var_2895:Rectangle;
      
      private var _screenLocation:Point;
      
      public function RoomWidgetUserLocationUpdateEvent(param1:int, param2:Rectangle, param3:Point, param4:Boolean = false, param5:Boolean = false)
      {
         super("RWULUE_USER_LOCATION_UPDATE",param4,param5);
         var_339 = param1;
         var_2895 = param2;
         _screenLocation = param3;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get rectangle() : Rectangle
      {
         return var_2895;
      }
      
      public function get screenLocation() : Point
      {
         return _screenLocation;
      }
   }
}
