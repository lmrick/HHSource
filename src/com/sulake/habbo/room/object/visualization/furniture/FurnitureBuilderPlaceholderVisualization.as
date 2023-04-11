package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.room.object.IRoomObjectModel;
   
   public class FurnitureBuilderPlaceholderVisualization extends FurnitureVisualization
   {
       
      
      private var var_801:int = -1;
      
      private var var_1088:int = -1;
      
      public function FurnitureBuilderPlaceholderVisualization()
      {
         super();
      }
      
      override protected function updateModel(param1:Number) : Boolean
      {
         var _loc4_:Boolean = super.updateModel(param1);
         var _loc3_:IRoomObjectModel = object.getModel();
         var _loc2_:int = int(_loc3_.getNumber("furniture_size_x"));
         var _loc5_:int = int(_loc3_.getNumber("furniture_size_y"));
         if(_loc2_ != var_801 || _loc5_ != var_1088)
         {
            var_801 = _loc2_;
            var_1088 = _loc5_;
            instantiateSprites(param1);
         }
         return _loc4_;
      }
      
      private function instantiateSprites(param1:Number) : void
      {
         updateLayerCount(data.getLayerCount(param1));
         createSprites(data.getLayerCount(param1) * var_801 * var_1088);
         updateSprites(param1,true,0);
      }
      
      override protected function updateLayerCount(param1:int) : void
      {
         var_2182 = param1;
         if(var_801 * var_1088 > 1)
         {
            var_2182 *= var_801 * var_1088;
         }
      }
      
      override protected function getAdditionalSpriteCount() : int
      {
         return 0;
      }
      
      override protected function getSpriteTag(param1:int, param2:int, param3:int) : String
      {
         return super.getSpriteTag(param1,param2,getIndex(param1,param3));
      }
      
      override protected function getSpriteAlpha(param1:int, param2:int, param3:int) : int
      {
         return super.getSpriteAlpha(param1,param2,getIndex(param1,param3));
      }
      
      override protected function getSpriteColor(param1:int, param2:int, param3:int) : int
      {
         return super.getSpriteColor(param1,getIndex(param1,param2),param3);
      }
      
      override protected function getSpriteAssetName(param1:int, param2:int) : String
      {
         return super.getSpriteAssetName(param1,getIndex(param1,param2));
      }
      
      override protected function getSpriteXOffset(param1:int, param2:int, param3:int) : int
      {
         var _loc5_:int = super.getSpriteXOffset(param1,param2,getIndex(param1,param3));
         var _loc4_:int;
         var _loc6_:int = (_loc4_ = param3 / data.getLayerCount(param1)) % var_1088;
         var _loc7_:int = _loc4_ / var_1088;
         return _loc5_ + (_loc6_ - _loc7_) * param1 / 2;
      }
      
      override protected function getSpriteYOffset(param1:int, param2:int, param3:int) : int
      {
         var _loc5_:int = super.getSpriteYOffset(param1,param2,getIndex(param1,param3));
         var _loc4_:int;
         var _loc6_:int = (_loc4_ = param3 / data.getLayerCount(param1)) % var_1088;
         var _loc7_:int = _loc4_ / var_1088;
         return _loc5_ + (_loc6_ + _loc7_) * param1 / 4;
      }
      
      override protected function getSpriteMouseCapture(param1:int, param2:int, param3:int) : Boolean
      {
         return super.getSpriteMouseCapture(param1,param2,getIndex(param1,param3));
      }
      
      override protected function getSpriteInk(param1:int, param2:int, param3:int) : int
      {
         return super.getSpriteInk(param1,param2,getIndex(param1,param3));
      }
      
      override protected function getSpriteZOffset(param1:int, param2:int, param3:int) : Number
      {
         return super.getSpriteZOffset(param1,param2,getIndex(param1,param3));
      }
      
      private function getIndex(param1:int, param2:int) : int
      {
         return data != null ? param2 % data.getLayerCount(param1) : param2;
      }
   }
}
