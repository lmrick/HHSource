package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetConfirmPetBreedingEvent extends RoomWidgetUpdateEvent
   {
      
      public static const CONFIRM_PET_BREEDING:String = "RWPPBE_CONFIRM_PET_BREEDING_";
       
      
      private var var_440:int;
      
      private var _pet1:com.sulake.habbo.ui.widget.events.ConfirmPetBreedingPetData;
      
      private var _pet2:com.sulake.habbo.ui.widget.events.ConfirmPetBreedingPetData;
      
      private var var_498:Array;
      
      private var var_3798:int;
      
      public function RoomWidgetConfirmPetBreedingEvent(param1:int, param2:com.sulake.habbo.ui.widget.events.ConfirmPetBreedingPetData, param3:com.sulake.habbo.ui.widget.events.ConfirmPetBreedingPetData, param4:Array, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super("RWPPBE_CONFIRM_PET_BREEDING_",param6,param7);
         var_440 = param1;
         _pet1 = param2;
         _pet2 = param3;
         var_498 = param4;
         var_3798 = param5;
      }
      
      public function get rarityCategories() : Array
      {
         return var_498;
      }
      
      public function get nestId() : int
      {
         return var_440;
      }
      
      public function get pet1() : com.sulake.habbo.ui.widget.events.ConfirmPetBreedingPetData
      {
         return _pet1;
      }
      
      public function get pet2() : com.sulake.habbo.ui.widget.events.ConfirmPetBreedingPetData
      {
         return _pet2;
      }
      
      public function get resultPetTypeId() : int
      {
         return var_3798;
      }
   }
}
