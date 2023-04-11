package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetDanceMessage extends RoomWidgetMessage
   {
      
      public static const const_959:String = "RWCM_MESSAGE_DANCE";
      
      public static const const_934:int = 0;
      
      public static const const_435:Array = [2,3,4];
       
      
      private var _style:int = 0;
      
      public function RoomWidgetDanceMessage(param1:int)
      {
         super("RWCM_MESSAGE_DANCE");
         _style = param1;
      }
      
      public function get style() : int
      {
         return _style;
      }
   }
}
