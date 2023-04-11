package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const TYPING_STATUS:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_418:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super("RWCTM_TYPING_STATUS");
         var_418 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return var_418;
      }
   }
}
