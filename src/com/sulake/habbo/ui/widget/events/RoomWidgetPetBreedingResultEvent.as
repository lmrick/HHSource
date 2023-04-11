package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetPetBreedingResultEvent extends RoomWidgetUpdateEvent
   {
      
      public static const PET_BREEDING_RESULT:String = "RWPBRE_PET_BREEDING_RESULT";
       
      
      private var var_963:com.sulake.habbo.ui.widget.events.PetBreedingResultEventData;
      
      private var _resultData2:com.sulake.habbo.ui.widget.events.PetBreedingResultEventData;
      
      public function RoomWidgetPetBreedingResultEvent(param1:com.sulake.habbo.ui.widget.events.PetBreedingResultEventData, param2:com.sulake.habbo.ui.widget.events.PetBreedingResultEventData, param3:Boolean = false, param4:Boolean = false)
      {
         super("RWPBRE_PET_BREEDING_RESULT",param3,param4);
         var_963 = param1;
         _resultData2 = param2;
      }
      
      public function get resultData() : com.sulake.habbo.ui.widget.events.PetBreedingResultEventData
      {
         return var_963;
      }
      
      public function get resultData2() : com.sulake.habbo.ui.widget.events.PetBreedingResultEventData
      {
         return _resultData2;
      }
   }
}
