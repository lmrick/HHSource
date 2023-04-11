package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   import package_41.class_1576;
   
   public class RoomSessionConfirmPetBreedingEvent extends RoomSessionEvent
   {
      
      public static const CONFIRM_PET_BREEDING:String = "RSPFUE_CONFIRM_PET_BREEDING";
       
      
      private var var_440:int;
      
      private var _pet1:class_1576;
      
      private var _pet2:class_1576;
      
      private var var_498:Array;
      
      private var var_3798:int;
      
      public function RoomSessionConfirmPetBreedingEvent(param1:IRoomSession, param2:int, param3:class_1576, param4:class_1576, param5:Array, param6:int, param7:Boolean = false, param8:Boolean = false)
      {
         super("RSPFUE_CONFIRM_PET_BREEDING",param1,param7,param8);
         var_440 = param2;
         _pet1 = param3;
         _pet2 = param4;
         var_498 = param5;
         var_3798 = param6;
      }
      
      public function get rarityCategories() : Array
      {
         return var_498;
      }
      
      public function get nestId() : int
      {
         return var_440;
      }
      
      public function get pet1() : class_1576
      {
         return _pet1;
      }
      
      public function get pet2() : class_1576
      {
         return _pet2;
      }
      
      public function get resultPetTypeId() : int
      {
         return var_3798;
      }
   }
}
