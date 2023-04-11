package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPetLevelUpdateEvent extends RoomSessionEvent
   {
      
      public static const PET_LEVEL_UPDATE:String = "RSPLUE_PET_LEVEL_UPDATE";
       
      
      private var var_421:int;
      
      private var var_262:int;
      
      public function RoomSessionPetLevelUpdateEvent(param1:IRoomSession, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false)
      {
         super("RSPLUE_PET_LEVEL_UPDATE",param1,param4,param5);
         var_421 = param2;
         var_262 = param3;
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
