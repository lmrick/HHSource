package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetPetLevelUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const PET_LEVEL_UPDATE:String = "RWPLUE_PET_LEVEL_UPDATE";
       
      
      private var var_421:int;
      
      private var var_262:int;
      
      public function RoomWidgetPetLevelUpdateEvent(param1:int, param2:int, param3:Boolean = false, param4:Boolean = false)
      {
         super("RWPLUE_PET_LEVEL_UPDATE",param3,param4);
         var_421 = param1;
         var_262 = param2;
      }
      
      public function get petId() : int
      {
         return var_421;
      }
      
      public function get level() : int
      {
         return var_262;
      }
   }
}
