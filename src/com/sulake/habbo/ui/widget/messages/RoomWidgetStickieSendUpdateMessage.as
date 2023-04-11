package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetStickieSendUpdateMessage extends RoomWidgetMessage
   {
      
      public static const const_971:String = "RWSUM_STICKIE_SEND_UPDATE";
      
      public static const const_721:String = "RWSUM_STICKIE_SEND_DELETE";
       
      
      private var var_347:int;
      
      private var _text:String;
      
      private var var_962:String;
      
      public function RoomWidgetStickieSendUpdateMessage(param1:String, param2:int, param3:String = "", param4:String = "")
      {
         super(param1);
         var_347 = param2;
         _text = param3;
         var_962 = param4;
      }
      
      public function get objectId() : int
      {
         return var_347;
      }
      
      public function get text() : String
      {
         return _text;
      }
      
      public function get colorHex() : String
      {
         return var_962;
      }
   }
}
