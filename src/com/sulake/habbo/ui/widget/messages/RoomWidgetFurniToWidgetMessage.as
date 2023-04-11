package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetFurniToWidgetMessage extends RoomWidgetMessage
   {
      
      public static const WIDGET_MESSAGE_REQUEST_CREDITFURNI_WIDGET:String = "RWFWM_MESSAGE_REQUEST_CREDITFURNI";
      
      public static const WIDGET_MESSAGE_REQUEST_STICKIE_WIDGET:String = "RWFWM_MESSAGE_REQUEST_STICKIE";
      
      public static const WIDGET_MESSAGE_REQUEST_PRESENT_WIDGET:String = "RWFWM_MESSAGE_REQUEST_PRESENT";
      
      public static const WIDGET_MESSAGE_REQUEST_TROPHY_WIDGET:String = "RWFWM_MESSAGE_REQUEST_TROPHY";
      
      public static const WIDGET_MESSAGE_REQUEST_TEASER_WIDGET:String = "RWFWM_MESSAGE_REQUEST_TEASER";
      
      public static const WIDGET_MESSAGE_REQUEST_ECOTRONBOX_WIDGET:String = "RWFWM_MESSAGE_REQUEST_ECOTRONBOX";
      
      public static const WIDGET_MESSAGE_REQUEST_DIMMER_WIDGET:String = "RWFWM_MESSAGE_REQUEST_DIMMER";
      
      public static const WIDGET_MESSAGE_REQUEST_PLACEHOLDER_WIDGET:String = "RWFWM_MESSAGE_REQUEST_PLACEHOLDER";
      
      public static const WIDGET_MESSAGE_REQUEST_CLOTHING_CHANGE_WIDGET:String = "RWFWM_MESSAGE_REQUEST_CLOTHING_CHANGE";
      
      public static const WIDGET_MESSAGE_REQUEST_PLAYLIST_EDITOR_WIDGET:String = "RWFWM_MESSAGE_REQUEST_PLAYLIST_EDITOR";
      
      public static const WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_ENGRAVING:String = "RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_ENGRAVING";
      
      public static const const_511:String = "RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_FAILED";
      
      public static const WIDGET_MESSAGE_REQUEST_BADGE_DISPLAY_ENGRAVING:String = "RWFWM_WIDGET_MESSAGE_REQUEST_BADGE_DISPLAY_ENGRAVING";
       
      
      private var var_247:int = 0;
      
      private var var_774:int = 0;
      
      private var var_354:int = 0;
      
      public function RoomWidgetFurniToWidgetMessage(param1:String, param2:int, param3:int, param4:int)
      {
         super(param1);
         var_247 = param2;
         var_774 = param3;
         var_354 = param4;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get category() : int
      {
         return var_774;
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
   }
}
