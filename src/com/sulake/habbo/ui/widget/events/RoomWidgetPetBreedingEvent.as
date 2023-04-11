package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetPetBreedingEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_762:int = 0;
      
      public static const const_734:int = 1;
      
      public static const TYPE_ACCEPT:int = 2;
      
      public static const TYPE_REQUEST:int = 3;
      
      public static const PET_BREEDING:String = "RWPPBE_PET_BREEDING_";
       
      
      private var var_159:int;
      
      private var var_1002:int;
      
      private var var_1226:int;
      
      public function RoomWidgetPetBreedingEvent(param1:Boolean = false, param2:Boolean = false)
      {
         super("RWPPBE_PET_BREEDING_",param1,param2);
      }
      
      public function get state() : int
      {
         return var_159;
      }
      
      public function set state(param1:int) : void
      {
         var_159 = param1;
      }
      
      public function get ownPetId() : int
      {
         return var_1002;
      }
      
      public function set ownPetId(param1:int) : void
      {
         var_1002 = param1;
      }
      
      public function get otherPetId() : int
      {
         return var_1226;
      }
      
      public function set otherPetId(param1:int) : void
      {
         var_1226 = param1;
      }
   }
}
