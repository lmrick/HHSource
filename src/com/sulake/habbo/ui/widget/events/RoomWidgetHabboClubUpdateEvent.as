package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_452:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_4202:int = 0;
      
      private var var_4174:int = 0;
      
      private var var_4060:int = 0;
      
      private var var_4005:Boolean = false;
      
      private var var_689:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super("RWBIUE_HABBO_CLUB",param6,param7);
         var_4202 = param1;
         var_4174 = param2;
         var_4060 = param3;
         var_4005 = param4;
         var_689 = param5;
      }
      
      public function get daysLeft() : int
      {
         return var_4202;
      }
      
      public function get periodsLeft() : int
      {
         return var_4174;
      }
      
      public function get pastPeriods() : int
      {
         return var_4060;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_4005;
      }
      
      public function get clubLevel() : int
      {
         return var_689;
      }
   }
}
