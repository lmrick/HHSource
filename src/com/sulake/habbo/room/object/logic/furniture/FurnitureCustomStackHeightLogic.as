package com.sulake.habbo.room.object.logic.furniture
{
   public class FurnitureCustomStackHeightLogic extends FurnitureMultiStateLogic
   {
       
      
      public function FurnitureCustomStackHeightLogic()
      {
         super();
      }
      
      override public function get widget() : String
      {
         return "RWE_CUSTOM_STACK_HEIGHT";
      }
      
      override public function initialize(param1:XML) : void
      {
         super.initialize(param1);
         if(object != null && object.getModelController() != null)
         {
            object.getModelController().setNumber("furniture_always_stackable",1);
         }
      }
   }
}
