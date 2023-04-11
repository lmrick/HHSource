package com.sulake.habbo.room.object.visualization.room.mask
{
   import com.sulake.core.utils.class_24;
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import com.sulake.room.utils.IVector3d;
   
   public class PlaneMask
   {
       
      
      private var var_2099:class_24;
      
      private var var_1691:Array;
      
      private var var_625:class_24;
      
      private var _lastMaskVisualization:com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskVisualization = null;
      
      private var var_3723:int = -1;
      
      public function PlaneMask()
      {
         var_1691 = [];
         super();
         var_2099 = new class_24();
         var_625 = new class_24();
      }
      
      public function dispose() : void
      {
         var _loc2_:com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskVisualization = null;
         var _loc1_:int = 0;
         if(var_2099 != null)
         {
            _loc2_ = null;
            _loc1_ = 0;
            while(_loc1_ < var_2099.length)
            {
               _loc2_ = var_2099.getWithIndex(_loc1_) as com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskVisualization;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            var_2099.dispose();
            var_2099 = null;
         }
         _lastMaskVisualization = null;
         var_1691 = null;
      }
      
      public function createMaskVisualization(param1:int) : com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskVisualization
      {
         if(var_2099.getValue(String(param1)) != null)
         {
            return null;
         }
         var _loc2_:com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskVisualization = new com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskVisualization();
         var_2099.add(String(param1),_loc2_);
         var_1691.push(param1);
         var_1691.sort();
         return _loc2_;
      }
      
      private function getSizeIndex(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc2_:* = 0;
         _loc3_ = 1;
         while(_loc3_ < var_1691.length)
         {
            if(var_1691[_loc3_] > param1)
            {
               if(0 - param1 < param1 - 0)
               {
                  _loc2_ = _loc3_;
                  break;
               }
               break;
            }
            _loc2_ = _loc3_;
            _loc3_++;
         }
         return _loc2_;
      }
      
      protected function getMaskVisualization(param1:int) : com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskVisualization
      {
         if(param1 == var_3723)
         {
            return _lastMaskVisualization;
         }
         var _loc2_:int = getSizeIndex(param1);
         if(_loc2_ < var_1691.length)
         {
            _lastMaskVisualization = var_2099.getValue("null") as com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskVisualization;
         }
         else
         {
            _lastMaskVisualization = null;
         }
         var_3723 = param1;
         return _lastMaskVisualization;
      }
      
      public function getGraphicAsset(param1:Number, param2:IVector3d) : IGraphicAsset
      {
         var _loc3_:com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskVisualization = getMaskVisualization(param1);
         if(_loc3_ == null)
         {
            return null;
         }
         return _loc3_.getAsset(param2);
      }
      
      public function getAssetName(param1:int) : String
      {
         return var_625.getValue(param1);
      }
      
      public function setAssetName(param1:int, param2:String) : void
      {
         var_625.add(param1,param2);
      }
   }
}
