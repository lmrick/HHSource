package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetSelectEffectMessage extends RoomWidgetMessage
   {
      
      public static const const_889:String = "RWCM_MESSAGE_SELECT_EFFECT";
      
      public static const const_835:String = "RWCM_MESSAGE_UNSELECT_EFFECT";
      
      public static const const_1184:String = "RWCM_MESSAGE_UNSELECT_ALL_EFFECTS";
       
      
      private var var_2371:int;
      
      public function RoomWidgetSelectEffectMessage(param1:String, param2:int = -1)
      {
         super(param1);
         var_2371 = param2;
      }
      
      public function get effectType() : int
      {
         return var_2371;
      }
   }
}
