package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPetStatusUpdateEvent extends RoomSessionEvent
   {
      
      public static const PET_STATUS_UPDATE:String = "RSPFUE_PET_STATUS_UPDATE";
       
      
      private var var_421:int;
      
      private var var_883:Boolean;
      
      private var var_712:Boolean;
      
      private var var_878:Boolean;
      
      private var _hasBreedingPermission:Boolean;
      
      public function RoomSessionPetStatusUpdateEvent(param1:IRoomSession, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super("RSPFUE_PET_STATUS_UPDATE",param1,param7,param8);
         var_421 = param2;
         var_883 = param3;
         var_712 = param4;
         var_878 = param5;
         _hasBreedingPermission = param6;
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
