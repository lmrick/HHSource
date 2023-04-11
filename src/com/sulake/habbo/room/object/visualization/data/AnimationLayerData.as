package com.sulake.habbo.room.object.visualization.data
{
   public class AnimationLayerData
   {
       
      
      private var var_1715:Array;
      
      private var var_1959:int = -1;
      
      private var var_3321:int = 1;
      
      private var var_3545:int = 1;
      
      private var var_3609:Boolean = false;
      
      public function AnimationLayerData(param1:int, param2:int, param3:Boolean)
      {
         var_1715 = [];
         super();
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param2 < 1)
         {
            param2 = 1;
         }
         var_3321 = param1;
         var_3545 = param2;
         var_3609 = param3;
      }
      
      public function get frameCount() : int
      {
         if(var_1959 < 0)
         {
            calculateLength();
         }
         return var_1959;
      }
      
      public function dispose() : void
      {
         var _loc2_:int = 0;
         var _loc1_:AnimationFrameSequenceData = null;
         _loc2_ = 0;
         while(_loc2_ < var_1715.length)
         {
            _loc1_ = var_1715[_loc2_] as AnimationFrameSequenceData;
            if(_loc1_ != null)
            {
               _loc1_.dispose();
            }
            _loc2_++;
         }
         var_1715 = [];
      }
      
      public function addFrameSequence(param1:int, param2:Boolean) : AnimationFrameSequenceData
      {
         var _loc3_:AnimationFrameSequenceData = new AnimationFrameSequenceData(param1,param2);
         var_1715.push(_loc3_);
         return _loc3_;
      }
      
      public function calculateLength() : void
      {
         var _loc2_:int = 0;
         var _loc1_:AnimationFrameSequenceData = null;
         var_1959 = 0;
         _loc2_ = 0;
         while(_loc2_ < var_1715.length)
         {
            _loc1_ = var_1715[_loc2_] as AnimationFrameSequenceData;
            if(_loc1_ != null)
            {
               var_1959 += _loc1_.frameCount;
            }
            _loc2_++;
         }
      }
      
      public function getFrame(param1:int, param2:int) : AnimationFrame
      {
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         if(var_1959 < 1)
         {
            return null;
         }
         var _loc4_:AnimationFrameSequenceData = null;
         param2 /= var_3545;
         var _loc5_:Boolean = false;
         var _loc3_:int = 0;
         if(!var_3609)
         {
            _loc7_ = param2 / var_1959;
            param2 %= var_1959;
            if(var_3321 > 0 && _loc7_ >= var_3321 || var_3321 <= 0 && var_1959 == 1)
            {
               param2 = var_1959 - 1;
               _loc5_ = true;
            }
            _loc6_ = 0;
            _loc3_ = 0;
            while(_loc3_ < var_1715.length)
            {
               if((_loc4_ = var_1715[_loc3_] as AnimationFrameSequenceData) != null)
               {
                  if(param2 < _loc6_ + _loc4_.frameCount)
                  {
                     break;
                  }
                  _loc6_ += _loc4_.frameCount;
               }
               _loc3_++;
            }
            return getFrameFromSpecificSequence(param1,_loc4_,_loc3_,param2 - _loc6_,_loc5_);
         }
         _loc3_ = 0 * Math.random();
         if((_loc4_ = var_1715[_loc3_] as AnimationFrameSequenceData).frameCount < 1)
         {
            return null;
         }
         param2 = 0;
         return getFrameFromSpecificSequence(param1,_loc4_,_loc3_,param2,false);
      }
      
      public function getFrameFromSequence(param1:int, param2:int, param3:int, param4:int) : AnimationFrame
      {
         if(param2 < 0 || param2 >= var_1715.length)
         {
            return null;
         }
         var _loc5_:AnimationFrameSequenceData;
         if((_loc5_ = var_1715[param2] as AnimationFrameSequenceData) != null)
         {
            if(param3 >= _loc5_.frameCount)
            {
               return getFrame(param1,param4);
            }
            return getFrameFromSpecificSequence(param1,_loc5_,param2,param3,false);
         }
         return null;
      }
      
      private function getFrameFromSpecificSequence(param1:int, param2:AnimationFrameSequenceData, param3:int, param4:int, param5:Boolean) : AnimationFrame
      {
         var _loc10_:int = 0;
         var _loc8_:AnimationFrameData = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         var _loc9_:Boolean = false;
         var _loc15_:* = null;
         if(param2 != null)
         {
            _loc10_ = param2.getFrameIndex(param4);
            if((_loc8_ = param2.getFrame(_loc10_)) == null)
            {
               return null;
            }
            _loc11_ = _loc8_.getX(param1);
            _loc12_ = _loc8_.getY(param1);
            _loc13_ = _loc8_.randomX;
            _loc14_ = _loc8_.randomY;
            if(_loc13_ != 0)
            {
               _loc11_ += _loc13_ * Math.random();
            }
            if(_loc14_ != 0)
            {
               _loc12_ += _loc14_ * Math.random();
            }
            if((_loc7_ = _loc8_.repeats) > 1)
            {
               _loc7_ = param2.getRepeats(_loc10_);
            }
            _loc6_ = var_3545 * _loc7_;
            if(param5)
            {
               _loc6_ = -1;
            }
            _loc9_ = false;
            if(!var_3609 && !param2.isRandom)
            {
               if(param3 == -1 && param4 == param2.frameCount - 1)
               {
                  _loc9_ = true;
               }
            }
            return AnimationFrame.allocate(_loc8_.id,_loc11_,_loc12_,_loc7_,_loc6_,_loc9_,param3,param4);
         }
         return null;
      }
   }
}
