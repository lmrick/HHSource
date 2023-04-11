package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.room.object.IRoomObjectModelController;
   
   public class FurnitureCraftingGizmoLogic extends class_3126
   {
       
      
      public function FurnitureCraftingGizmoLogic()
      {
         super();
      }
      
      override public function get widget() : String
      {
         return "RWE_CRAFTING";
      }
      
      override public function useObject() : void
      {
         super.useObject();
      }
      
      public function setAnimationState(param1:int) : void
      {
         if(object == null)
         {
            return;
         }
         var _loc2_:IRoomObjectModelController = object.getModelController();
         if(_loc2_ != null)
         {
            _loc2_.setNumber("furniture_automatic_state_index",param1,false);
         }
      }
   }
}
