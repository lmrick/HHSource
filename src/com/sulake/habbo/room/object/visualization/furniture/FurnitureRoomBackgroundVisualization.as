package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.habbo.room.object.visualization.data.class_3298;
   import com.sulake.room.object.IRoomObjectModel;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   
   public class FurnitureRoomBackgroundVisualization extends FurnitureRoomBrandingVisualization
   {
       
      
      private var var_2342:Dictionary;
      
      public function FurnitureRoomBackgroundVisualization()
      {
         super();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_2342 = null;
      }
      
      override protected function getAdClickUrl(param1:IRoomObjectModel) : String
      {
         return null;
      }
      
      override protected function imageReady(param1:BitmapData, param2:String) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         super.imageReady(param1,param2);
         if(param1 != null)
         {
            var_2342 = new Dictionary();
            _loc4_ = 64;
            _loc3_ = param1.width;
            _loc5_ = param1.height;
            addDirectionalOffsets(_loc4_,_loc5_,_loc3_);
            _loc4_ = 32;
            _loc3_ /= 2;
            _loc5_ /= 2;
            addDirectionalOffsets(_loc4_,_loc5_,_loc3_);
         }
      }
      
      private function addDirectionalOffsets(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:class_3298;
         (_loc4_ = new class_3298()).setOffset(1,0,-param2);
         _loc4_.setOffset(3,0,0);
         _loc4_.setOffset(5,-param3,0);
         _loc4_.setOffset(7,-param3,-param2);
         _loc4_.setOffset(4,-param3 / 2,-param2 / 2);
         var_2342[param1] = _loc4_;
      }
      
      override protected function getSpriteXOffset(param1:int, param2:int, param3:int) : int
      {
         var _loc5_:int = 0;
         var _loc4_:class_3298 = null;
         if(var_2342 != null)
         {
            _loc5_ = getSize(param1);
            if((_loc4_ = var_2342[_loc5_]) != null)
            {
               return _loc4_.getOffsetX(param2,0) + getScaledOffset(var_3399,param1);
            }
         }
         return super.getSpriteXOffset(param1,param2,param3) + getScaledOffset(var_3399,param1);
      }
      
      override protected function getSpriteYOffset(param1:int, param2:int, param3:int) : int
      {
         var _loc5_:int = 0;
         var _loc4_:class_3298 = null;
         if(var_2342 != null)
         {
            _loc5_ = getSize(param1);
            if((_loc4_ = var_2342[_loc5_]) != null)
            {
               return _loc4_.getOffsetY(param2,0) + getScaledOffset(var_3413,param1);
            }
         }
         return super.getSpriteYOffset(param1,param2,param3) + getScaledOffset(var_3413,param1);
      }
      
      override protected function getSpriteZOffset(param1:int, param2:int, param3:int) : Number
      {
         return super.getSpriteZOffset(param1,param2,param3) + var_3576 * -1;
      }
      
      override protected function getSpriteMouseCapture(param1:int, param2:int, param3:int) : Boolean
      {
         return false;
      }
      
      private function getScaledOffset(param1:int, param2:int) : Number
      {
         return param1 * param2 / 64;
      }
   }
}
