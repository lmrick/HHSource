package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetEcotronBoxOpenedMessage extends RoomWidgetMessage
   {
      
      public static const const_568:String = "RWEBOM_ECOTRONBOX_OPENED";
       
      
      private var var_261:String;
      
      private var var_385:int;
      
      public function RoomWidgetEcotronBoxOpenedMessage(param1:String, param2:String, param3:int)
      {
         super(param1);
         var_261 = param2;
         var_385 = param3;
      }
      
      public function get itemType() : String
      {
         return var_261;
      }
      
      public function get classId() : int
      {
         return var_385;
      }
   }
}
