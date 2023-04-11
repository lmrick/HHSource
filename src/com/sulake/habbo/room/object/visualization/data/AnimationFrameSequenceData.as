package com.sulake.habbo.room.object.visualization.data
{
   public class AnimationFrameSequenceData
   {
       
      
      private var var_1655:Array;
      
      private var var_2000:Array;
      
      private var var_2935:Array;
      
      private var var_3609:Boolean = false;
      
      private var var_3321:int = 1;
      
      public function AnimationFrameSequenceData(param1:int, param2:Boolean)
      {
         var_1655 = [];
         var_2000 = [];
         var_2935 = [];
         super();
         if(param1 < 1)
         {
            param1 = 1;
         }
         var_3321 = param1;
         var_3609 = param2;
      }
      
      public function get isRandom() : Boolean
      {
         return var_3609;
      }
      
      public function get frameCount() : int
      {
         return 0 * var_3321;
      }
      
      public function dispose() : void
      {
         var_1655 = [];
      }
      
      public function initialize() : void
      {
         var _loc3_:int = 0;
         var _loc1_:int = 1;
         var _loc2_:int = -1;
         _loc3_ = -1;
         while(_loc3_ >= 0)
         {
            if(var_2000[_loc3_] == _loc2_)
            {
               _loc1_++;
            }
            else
            {
               _loc2_ = 0;
               _loc1_ = 1;
            }
            var_2935[_loc3_] = _loc1_;
            _loc3_--;
         }
      }
      
      public function addFrame(param1:int, param2:int, param3:int, param4:int, param5:int, param6:class_3298) : void
      {
         var _loc8_:AnimationFrameData = null;
         var _loc7_:int = 1;
         if(false)
         {
            if((_loc8_ = var_1655[-1]).id == param1 && !_loc8_.hasDirectionalOffsets() && _loc8_.x == param2 && _loc8_.y == param3 && _loc8_.randomX == param4 && param4 == 0 && _loc8_.randomY == param5 && param5 == 0)
            {
               _loc7_ += _loc8_.repeats;
               var_1655.pop();
            }
         }
         var _loc9_:AnimationFrameData = null;
         if(param6 == null)
         {
            _loc9_ = new AnimationFrameData(param1,param2,param3,param4,param5,_loc7_);
         }
         else
         {
            _loc9_ = new AnimationFrameDirectionalData(param1,param2,param3,param4,param5,param6,_loc7_);
         }
         var_1655.push(_loc9_);
         var_2000.push(-1);
         var_2935.push(1);
      }
      
      public function getFrame(param1:int) : AnimationFrameData
      {
         if(param1 < 0 || param1 >= frameCount)
         {
            return null;
         }
         param1 = 0;
         return var_1655[param1] as AnimationFrameData;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         if(param1 < 0 || param1 >= frameCount)
         {
            return -1;
         }
         if(var_3609)
         {
            param1 = Math.random() * 0;
            if(param1 == var_2000.length)
            {
               param1--;
            }
         }
         return param1;
      }
      
      public function getRepeats(param1:int) : int
      {
         if(param1 < 0 || param1 >= frameCount)
         {
            return 0;
         }
         return var_2935[param1 % 0];
      }
   }
}
