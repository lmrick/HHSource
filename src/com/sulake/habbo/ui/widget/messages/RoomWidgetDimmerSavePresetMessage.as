package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const WIDGET_MESSAGE_SAVE_DIMMER_PRESET:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _presetNumber:int;
      
      private var var_1221:int;
      
      private var _color:uint;
      
      private var var_3076:int;
      
      private var var_4188:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super("RWSDPM_SAVE_PRESET");
         _presetNumber = param1;
         var_1221 = param2;
         _color = param3;
         var_3076 = param4;
         var_4188 = param5;
      }
      
      public function get presetNumber() : int
      {
         return _presetNumber;
      }
      
      public function get effectTypeId() : int
      {
         return var_1221;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get brightness() : int
      {
         return var_3076;
      }
      
      public function get apply() : Boolean
      {
         return var_4188;
      }
   }
}
