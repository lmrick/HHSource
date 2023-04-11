package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetPetStatusUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const PET_STATUS_UPDATE:String = "RWPIUE_PET_STATUS_UPDATE";
       
      
      private var var_421:int;
      
      private var var_883:Boolean;
      
      private var var_712:Boolean;
      
      private var var_878:Boolean;
      
      private var _hasBreedingPermission:Boolean;
      
      public function RoomWidgetPetStatusUpdateEvent(param1:int, param2:Boolean, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super("RWPIUE_PET_STATUS_UPDATE",param6,param7);
         var_421 = param1;
         var_883 = param2;
         var_712 = param3;
         var_878 = param4;
         _hasBreedingPermission = param5;
      }
      
      public function get petId() : int
      {
         return var_421;
      }
      
      public function get canBreed() : Boolean
      {
         return var_883;
      }
      
      public function get canHarvest() : Boolean
      {
         return var_712;
      }
      
      public function get canRevive() : Boolean
      {
         return var_878;
      }
      
      public function get hasBreedingPermission() : Boolean
      {
         return _hasBreedingPermission;
      }
   }
}
