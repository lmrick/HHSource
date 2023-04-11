package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetSpamWallPostItFinishEditingMessage extends RoomWidgetMessage
   {
      
      public static const SEND_POSTIT_DATA:String = "RWSWPFEE_SEND_POSTIT_DATA";
       
      
      private var var_347:int;
      
      private var _location:String;
      
      private var _text:String;
      
      private var var_962:String;
      
      public function RoomWidgetSpamWallPostItFinishEditingMessage(param1:String, param2:int, param3:String, param4:String, param5:String)
      {
         super(param1);
         var_347 = param2;
         _location = param3;
         _text = param4;
         var_962 = param5;
      }
      
      public function get location() : String
      {
         return _location;
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
