package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPetFigureUpdateEvent extends RoomSessionEvent
   {
      
      public static const PET_FIGURE_UPDATE:String = "RSPFUE_PET_FIGURE_UPDATE";
       
      
      private var var_421:int;
      
      private var var_427:String;
      
      public function RoomSessionPetFigureUpdateEvent(param1:IRoomSession, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false)
      {
         super("RSPFUE_PET_FIGURE_UPDATE",param1,param4,param5);
         var_421 = param2;
         var_427 = param3;
      }
      
      public function get petId() : int
      {
         return var_421;
      }
      
      public function get figure() : String
      {
         return var_427;
      }
   }
}
