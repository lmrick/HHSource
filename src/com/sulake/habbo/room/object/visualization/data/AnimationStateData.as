package com.sulake.habbo.room.object.visualization.data
{
   public class AnimationStateData
   {
       
      
      private var var_3509:int = -1;
      
      private var var_3820:int = 0;
      
      private var var_2714:Boolean = false;
      
      private var var_1967:int = 0;
      
      private var var_1655:Array;
      
      private var var_2375:Array;
      
      private var var_2278:Array;
      
      private var var_2182:int = 0;
      
      public function AnimationStateData()
      {
         var_1655 = [];
         var_2375 = [];
         var_2278 = [];
         super();
      }
      
      public function get animationOver() : Boolean
      {
         return var_2714;
      }
      
      public function set animationOver(param1:Boolean) : void
      {
         var_2714 = param1;
      }
      
      public function get frameCounter() : int
      {
         return var_1967;
      }
      
      public function set frameCounter(param1:int) : void
      {
         var_1967 = param1;
      }
      
      public function get animationId() : int
      {
         return var_3509;
      }
      
      public function set animationId(param1:int) : void
      {
         if(param1 != var_3509)
         {
            var_3509 = param1;
            resetAnimationFrames(false);
         }
      }
      
      public function get animationAfterTransitionId() : int
      {
         return var_3820;
      }
      
      public function set animationAfterTransitionId(param1:int) : void
      {
         var_3820 = param1;
      }
      
      public function dispose() : void
      {
         recycleFrames();
         var_1655 = null;
         var_2375 = null;
         var_2278 = null;
      }
      
      public function setLayerCount(param1:int) : void
      {
         var_2182 = param1;
         resetAnimationFrames();
      }
      
      public function resetAnimationFrames(param1:Boolean = true) : void
      {
         var _loc2_:int = 0;
         var _loc3_:AnimationFrame = null;
         if(param1 || var_1655 == null)
         {
            recycleFrames();
            var_1655 = [];
         }
         var_2375 = [];
         var_2278 = [];
         var_2714 = false;
         var_1967 = 0;
         _loc2_ = 0;
         while(_loc2_ < var_2182)
         {
            if(param1 || var_1655.length <= _loc2_)
            {
               var_1655[_loc2_] = null;
            }
            else
            {
               _loc3_ = var_1655[_loc2_];
               if(_loc3_ != null)
               {
                  _loc3_.recycle();
                  var_1655[_loc2_] = AnimationFrame.allocate(_loc3_.id,_loc3_.x,_loc3_.y,_loc3_.repeats,0,_loc3_.isLastFrame);
               }
            }
            var_2375[_loc2_] = false;
            var_2278[_loc2_] = false;
            _loc2_++;
         }
      }
      
      private function recycleFrames() : void
      {
         if(var_1655 != null)
         {
            for each(var _loc1_ in var_1655)
            {
               if(_loc1_ != null)
               {
                  _loc1_.recycle();
               }
            }
         }
      }
      
      public function getFrame(param1:int) : AnimationFrame
      {
         if(param1 >= 0 && param1 < var_2182)
         {
            return var_1655[param1];
         }
         return null;
      }
      
      public function setFrame(param1:int, param2:AnimationFrame) : void
      {
         var _loc3_:AnimationFrame = null;
         if(param1 >= 0 && param1 < var_2182)
         {
            _loc3_ = var_1655[param1];
            if(_loc3_ != null)
            {
               _loc3_.recycle();
            }
            var_1655[param1] = param2;
         }
      }
      
      public function getAnimationPlayed(param1:int) : Boolean
      {
         if(param1 >= 0 && param1 < var_2182)
         {
            return var_2278[param1];
         }
         return true;
      }
      
      public function setAnimationPlayed(param1:int, param2:Boolean) : void
      {
         if(param1 >= 0 && param1 < var_2182)
         {
            var_2278[param1] = param2;
         }
      }
      
      public function getLastFramePlayed(param1:int) : Boolean
      {
         if(param1 >= 0 && param1 < var_2182)
         {
            return var_2375[param1];
         }
         return true;
      }
      
      public function setLastFramePlayed(param1:int, param2:Boolean) : void
      {
         if(param1 >= 0 && param1 < var_2182)
         {
            var_2375[param1] = param2;
         }
      }
   }
}
