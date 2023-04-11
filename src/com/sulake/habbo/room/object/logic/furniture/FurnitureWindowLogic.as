package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.room.utils.class_1667;
   
   public class FurnitureWindowLogic extends FurnitureMultiStateLogic
   {
       
      
      public function FurnitureWindowLogic()
      {
         super();
      }
      
      override public function initialize(param1:XML) : void
      {
         var _loc4_:XML = null;
         var _loc2_:String = null;
         super.initialize(param1);
         if(param1 == null)
         {
            return;
         }
         var _loc3_:XMLList = param1.mask;
         if(_loc3_.length() > 0)
         {
            _loc4_ = _loc3_[0];
            if(class_1667.checkRequiredAttributes(_loc4_,["type"]))
            {
               _loc2_ = _loc4_.@type;
               object.getModelController().setNumber("furniture_uses_plane_mask",1,true);
               object.getModelController().setString("furniture_plane_mask_type",_loc2_,true);
            }
         }
      }
   }
}
