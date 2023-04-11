package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetPurseUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const CREDIT_BALANCE:String = "RWPUE_CREDIT_BALANCE";
      
      public static const const_680:String = "RWPUE_PIXEL_BALANCE";
      
      public static const SHELL_BALANCE:String = "RWPUE_SHELL_BALANCE";
       
      
      private var var_1170:int;
      
      public function RoomWidgetPurseUpdateEvent(param1:String, param2:int, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         var_1170 = param2;
      }
      
      public function get balance() : int
      {
         return var_1170;
      }
   }
}
