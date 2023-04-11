package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetEcotronBoxOpenMessage extends RoomWidgetMessage
   {
      
      public static const const_763:String = "RWEBOM_OPEN_ECOTRONBOX";
       
      
      private var var_347:int;
      
      public function RoomWidgetEcotronBoxOpenMessage(param1:String, param2:int)
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
