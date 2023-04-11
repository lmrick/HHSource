package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenProfileMessage extends RoomWidgetMessage
   {
      
      public static const const_764:String = "RWOPEM_OPEN_USER_PROFILE";
       
      
      private var var_339:int;
      
      private var _trackingLocation:String;
      
      public function RoomWidgetOpenProfileMessage(param1:String, param2:int, param3:String)
      {
         super(param1);
         var_339 = param2;
         _trackingLocation = param3;
      }
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function get trackingLocation() : String
      {
         return _trackingLocation;
      }
   }
}
