package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetPetCommandsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const PET_COMMANDS:String = "RWPCUE_PET_COMMANDS";
      
      public static const OPEN_PET_TRAINING:String = "RWPCUE_OPEN_PET_TRAINING";
      
      public static const CLOSE_PET_TRAINING:String = "RWPCUE_CLOSE_PET_TRAINING";
       
      
      private var var_247:int;
      
      private var var_313:Array;
      
      private var var_243:Array;
      
      public function RoomWidgetPetCommandsUpdateEvent(param1:int, param2:Array, param3:Array, param4:Boolean = false, param5:Boolean = false)
      {
         super("RWPCUE_PET_COMMANDS",param4,param5);
         var_247 = param1;
         var_313 = param2;
         var_243 = param3;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get allCommands() : Array
      {
         return var_313;
      }
      
      public function get enabledCommands() : Array
      {
         return var_243;
      }
   }
}
