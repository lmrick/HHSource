package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetGetObjectLocationMessage extends RoomWidgetMessage
   {
      
      public static const const_521:String = "RWGOI_MESSAGE_GET_OBJECT_LOCATION";
      
      public static const const_697:String = "RWGOI_MESSAGE_GET_GAME_OBJECT_LOCATION";
       
      
      private var var_347:int;
      
      private var var_3053:int;
      
      public function RoomWidgetGetObjectLocationMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         var_347 = param2;
         var_3053 = param3;
      }
      
      public function get objectId() : int
      {
         return var_347;
      }
      
      public function get objectType() : int
      {
         return var_3053;
      }
   }
}
