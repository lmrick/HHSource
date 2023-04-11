package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetConversionPointMessage extends RoomWidgetMessage
   {
      
      public static const const_620:String = "RWCPM_CONVERSION_POINT";
       
      
      private var var_774:String;
      
      private var var_4237:String;
      
      private var _action:String;
      
      private var _extraString:String;
      
      private var var_728:int;
      
      public function RoomWidgetConversionPointMessage(param1:String, param2:String, param3:String, param4:String, param5:String = "", param6:int = 0)
      {
         super(param1);
         var_774 = param2;
         var_4237 = param3;
         _action = param4;
         _extraString = !!param5 ? param5 : "";
         var_728 = !!param6 ? param6 : 0;
      }
      
      public function get category() : String
      {
         return var_774;
      }
      
      public function get pointType() : String
      {
         return var_4237;
      }
      
      public function get action() : String
      {
         return _action;
      }
      
      public function get extraString() : String
      {
         return _extraString;
      }
      
      public function get extraInt() : int
      {
         return var_728;
      }
   }
}
