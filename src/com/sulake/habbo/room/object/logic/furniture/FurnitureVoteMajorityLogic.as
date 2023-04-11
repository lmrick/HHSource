package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
   import com.sulake.habbo.room.object.data.class_1672;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class FurnitureVoteMajorityLogic extends FurnitureMultiStateLogic
   {
       
      
      public function FurnitureVoteMajorityLogic()
      {
         super();
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc2_:class_1672 = null;
         super.processUpdateMessage(param1);
         var _loc3_:RoomObjectDataUpdateMessage = param1 as RoomObjectDataUpdateMessage;
         if(_loc3_ != null)
         {
            _loc2_ = _loc3_.data as class_1672;
            if(_loc2_ != null)
            {
               object.getModelController().setNumber("furniture_vote_majority_result",_loc2_.result);
            }
         }
      }
   }
}
