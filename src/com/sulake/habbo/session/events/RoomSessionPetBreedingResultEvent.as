package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   import package_41.class_1534;
   
   public class RoomSessionPetBreedingResultEvent extends RoomSessionEvent
   {
      
      public static const PET_BREEDING_RESULT:String = "RSPFUE_PET_BREEDING_RESULT";
       
      
      private var var_963:class_1534;
      
      private var var_1225:class_1534;
      
      public function RoomSessionPetBreedingResultEvent(param1:IRoomSession, param2:class_1534, param3:class_1534, param4:Boolean = false, param5:Boolean = false)
      {
         super("RSPFUE_PET_BREEDING_RESULT",param1,param4,param5);
         var_963 = param2;
         var_1225 = param3;
      }
      
      public function get resultData() : class_1534
      {
         return var_963;
      }
      
      public function get otherResultData() : class_1534
      {
         return var_1225;
      }
   }
}
