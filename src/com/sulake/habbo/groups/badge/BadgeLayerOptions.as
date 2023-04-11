package com.sulake.habbo.groups.badge
{
   public class BadgeLayerOptions
   {
       
      
      private var var_2677:int = -1;
      
      private var var_3434:int = -1;
      
      private var var_3140:int = -1;
      
      private var var_2313:int = -1;
      
      private var var_2269:int = -1;
      
      public function BadgeLayerOptions()
      {
         super();
      }
      
      public function setGrid(param1:int) : void
      {
         var_2313 = Math.floor(param1 % 3);
         var_2269 = Math.floor(param1 / 3);
      }
      
      public function clone() : BadgeLayerOptions
      {
         var _loc1_:BadgeLayerOptions = new BadgeLayerOptions();
         _loc1_.var_2677 = var_2677;
         _loc1_.var_3434 = var_3434;
         _loc1_.var_3140 = var_3140;
         _loc1_.var_2313 = var_2313;
         _loc1_.var_2269 = var_2269;
         return _loc1_;
      }
      
      public function equalVisuals(param1:BadgeLayerOptions) : Boolean
      {
         if(param1 == null || var_2313 != param1.gridX || var_2269 != param1.gridY || var_3140 != param1.colorIndex)
         {
            return false;
         }
         if(var_2677 == 0 && param1.layerIndex != 0 || var_2677 != 0 && param1.layerIndex == 0)
         {
            return false;
         }
         return true;
      }
      
      public function isGridEqual(param1:BadgeLayerOptions) : Boolean
      {
         if(param1.gridX == var_2313 && param1.gridY == var_2269)
         {
            return true;
         }
         return false;
      }
      
      public function get layerIndex() : int
      {
         return var_2677;
      }
      
      public function set layerIndex(param1:int) : void
      {
         var_2677 = param1;
      }
      
      public function get partIndex() : int
      {
         return var_3434;
      }
      
      public function set partIndex(param1:int) : void
      {
         var_3434 = param1;
      }
      
      public function get colorIndex() : int
      {
         return var_3140;
      }
      
      public function set colorIndex(param1:int) : void
      {
         var_3140 = param1;
      }
      
      public function get gridX() : int
      {
         return var_2313;
      }
      
      public function set gridX(param1:int) : void
      {
         var_2313 = param1;
      }
      
      public function get gridY() : int
      {
         return var_2269;
      }
      
      public function set gridY(param1:int) : void
      {
         var_2269 = param1;
      }
      
      public function get position() : int
      {
         return gridY * 3 + gridX;
      }
   }
}
