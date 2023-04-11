package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
   import com.sulake.room.events.RoomObjectEvent;
   
   public class FurniturePurchasableClothingLogic extends FurnitureMultiStateLogic
   {
       
      
      public function FurniturePurchasableClothingLogic()
      {
         super();
      }
      
      override public function get contextMenu() : String
      {
         return "PURCHASABLE_CLOTHING";
      }
      
      override public function getEventTypes() : Array
      {
         return getAllEventTypes(super.getEventTypes(),["ROWRE_PURCHASABLE_CLOTHING_CONFIRMATION_DIALOG"]);
      }
      
      override public function useObject() : void
      {
         var _loc1_:RoomObjectEvent = null;
         if(eventDispatcher != null && object != null)
         {
            _loc1_ = new RoomObjectWidgetRequestEvent("ROWRE_PURCHASABLE_CLOTHING_CONFIRMATION_DIALOG",object);
            eventDispatcher.dispatchEvent(_loc1_);
         }
      }
   }
}
