package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetPresentOpenMessage extends RoomWidgetMessage
   {
      
      public static const const_872:String = "RWPOM_OPEN_PRESENT";
       
      
      private var var_347:int;
      
      public function RoomWidgetPresentOpenMessage(param1:String, param2:int)
      {
         super(param1);
         var_347 = param2;
      }
      
      public function get objectId() : int
      {
         return var_347;
      }
   }
}
