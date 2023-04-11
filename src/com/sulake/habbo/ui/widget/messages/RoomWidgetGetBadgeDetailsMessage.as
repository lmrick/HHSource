package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetGetBadgeDetailsMessage extends RoomWidgetMessage
   {
      
      public static const WIDGET_MESSAGE_GET_BADGE_DETAILS:String = "RWGOI_MESSAGE_GET_BADGE_DETAILS";
       
      
      private var var_3826:Boolean;
      
      private var _groupId:int = 0;
      
      public function RoomWidgetGetBadgeDetailsMessage(param1:Boolean, param2:int)
      {
         super("RWGOI_MESSAGE_GET_BADGE_DETAILS");
         var_3826 = param1;
         _groupId = param2;
      }
      
      public function get own() : Boolean
      {
         return var_3826;
      }
      
      public function get groupId() : int
      {
         return _groupId;
      }
   }
}
