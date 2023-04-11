package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class FurnitureCrackableLogic extends class_3126
   {
       
      
      public function FurnitureCrackableLogic()
      {
         super();
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         super.processUpdateMessage(param1);
         if(object == null)
         {
            return;
         }
         if(object.getModelController().getNumber("furniture_real_room_object") == 1)
         {
            object.getModelController().setString("RWEIEP_INFOSTAND_EXTRA_PARAM","RWEIEP_CRACKABLE_FURNI");
         }
      }
   }
}
