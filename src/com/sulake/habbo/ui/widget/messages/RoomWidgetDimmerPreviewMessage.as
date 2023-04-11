package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetDimmerPreviewMessage extends RoomWidgetMessage
   {
      
      public static const PREVIEW:String = "RWDPM_PREVIEW_DIMMER_PRESET";
       
      
      private var _color:uint;
      
      private var var_3076:int;
      
      private var var_3890:Boolean;
      
      public function RoomWidgetDimmerPreviewMessage(param1:uint, param2:int, param3:Boolean)
      {
         super("RWDPM_PREVIEW_DIMMER_PRESET");
         _color = param1;
         var_3076 = param2;
         var_3890 = param3;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get brightness() : int
      {
         return var_3076;
      }
      
      public function get bgOnly() : Boolean
      {
         return var_3890;
      }
   }
}
