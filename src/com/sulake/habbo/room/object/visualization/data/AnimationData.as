package com.sulake.habbo.room.object.visualization.data
{
   import com.sulake.core.utils.class_24;
   import com.sulake.room.utils.class_1667;
   
   public class AnimationData
   {
      
      public static const DEFAULT_FRAME_NUMBER:int = 0;
      
      private static const TRANSITION_TO_ANIMATION_OFFSET:int = 1000000;
      
      private static const TRANSITION_FROM_ANIMATION_OFFSET:int = 2000000;
       
      
      private var _layers:class_24 = null;
      
      private var var_1959:int = -1;
      
      private var var_3375:Boolean = false;
      
      private var var_3084:Array = null;
      
      public function AnimationData()
      {
         super();
         _layers = new class_24();
      }
      
      public static function getTransitionToAnimationId(param1:int) : int
      {
         return 1000000 + param1;
      }
      
      public static function getTransitionFromAnimationId(param1:int) : int
      {
         return 2000000 + param1;
      }
      
      public static function isTransitionToAnimation(param1:int) : Boolean
      {
         return param1 >= 1000000 && param1 < 2000000;
      }
      
      public static function isTransitionFromAnimation(param1:int) : Boolean
      {
         return param1 >= 2000000;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:AnimationLayerData = null;
         if(_layers != null)
         {
            _loc1_ = 0;
            while(_loc1_ < _layers.length)
            {
               _loc2_ = _layers.getWithIndex(_loc1_) as AnimationLayerData;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            _layers.dispose();
            _layers = null;
         }
         var_3084 = null;
      }
      
      public function setImmediateChanges(param1:Array) : void
      {
         var_3084 = param1;
      }
      
      public function isImmediateChange(param1:int) : Boolean
      {
         if(var_3084 != null && var_3084.indexOf(param1) >= 0)
         {
            return true;
         }
         return false;
      }
      
      public function getStartFrame(param1:int) : int
      {
         if(!var_3375)
         {
            return 0;
         }
         return Math.random() * var_1959;
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc8_:int = 0;
         var _loc11_:XML = null;
         var _loc9_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:* = false;
         var _loc6_:String = null;
         var _loc4_:String = null;
         var_3375 = false;
         if(int(param1.@randomStart) != 0)
         {
            var_3375 = true;
         }
         var _loc10_:* = ["id"];
         var _loc7_:XMLList = param1.animationLayer;
         _loc8_ = 0;
         while(_loc8_ < _loc7_.length())
         {
            _loc11_ = _loc7_[_loc8_];
            if(!class_1667.checkRequiredAttributes(_loc11_,_loc10_))
            {
               return false;
            }
            _loc9_ = int(_loc11_.@id);
            _loc5_ = 1;
            _loc2_ = 1;
            _loc3_ = false;
            if((_loc6_ = _loc11_.@loopCount).length > 0)
            {
               _loc5_ = int(_loc6_);
            }
            if((_loc4_ = _loc11_.@frameRepeat).length > 0)
            {
               _loc2_ = int(_loc4_);
            }
            _loc3_ = int(_loc11_.@random) != 0;
            if(!addLayer(_loc9_,_loc5_,_loc2_,_loc3_,_loc11_))
            {
               return false;
            }
            _loc8_++;
         }
         return true;
      }
      
      private function addLayer(param1:int, param2:int, param3:int, param4:Boolean, param5:XML) : Boolean
      {
         var _loc9_:int = 0;
         var _loc11_:XML = null;
         var _loc8_:int = 0;
         var _loc6_:Boolean = false;
         var _loc16_:String = null;
         var _loc14_:AnimationFrameSequenceData = null;
         var _loc12_:XMLList = null;
         var _loc10_:int = 0;
         var _loc23_:XML = null;
         var _loc7_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc24_:int = 0;
         var _loc17_:class_3298 = null;
         var _loc18_:AnimationLayerData = new AnimationLayerData(param2,param3,param4);
         var _loc15_:* = ["id"];
         var _loc22_:XMLList = param5.frameSequence;
         _loc9_ = 0;
         while(_loc9_ < _loc22_.length())
         {
            _loc11_ = _loc22_[_loc9_];
            _loc8_ = 1;
            _loc6_ = false;
            if((_loc16_ = _loc11_.@loopCount).length > 0)
            {
               _loc8_ = int(_loc16_);
            }
            if(int(_loc11_.@random) != 0)
            {
               _loc6_ = true;
            }
            _loc14_ = _loc18_.addFrameSequence(_loc8_,_loc6_);
            _loc12_ = _loc11_.frame;
            _loc10_ = 0;
            while(_loc10_ < _loc12_.length())
            {
               _loc23_ = _loc12_[_loc10_];
               if(!class_1667.checkRequiredAttributes(_loc23_,_loc15_))
               {
                  _loc18_.dispose();
                  return false;
               }
               _loc7_ = int(_loc23_.@id);
               _loc19_ = int(_loc23_.@x);
               _loc20_ = int(_loc23_.@y);
               _loc21_ = int(_loc23_.@randomX);
               _loc24_ = int(_loc23_.@randomY);
               _loc17_ = readDirectionalOffsets(_loc23_);
               _loc14_.addFrame(_loc7_,_loc19_,_loc20_,_loc21_,_loc24_,_loc17_);
               _loc10_++;
            }
            _loc14_.initialize();
            _loc9_++;
         }
         _loc18_.calculateLength();
         _layers.add(param1,_loc18_);
         var _loc13_:int;
         if((_loc13_ = _loc18_.frameCount) > var_1959)
         {
            var_1959 = _loc13_;
         }
         return true;
      }
      
      private function readDirectionalOffsets(param1:XML) : class_3298
      {
         var _loc7_:* = null;
         var _loc5_:XML = null;
         var _loc3_:XMLList = null;
         var _loc9_:int = 0;
         var _loc4_:XML = null;
         var _loc11_:int = 0;
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         var _loc2_:class_3298 = null;
         var _loc6_:XMLList;
         if((_loc6_ = param1.offsets).length() > 0)
         {
            _loc7_ = ["direction"];
            _loc3_ = (_loc5_ = _loc6_[0]).offset;
            _loc9_ = 0;
            while(_loc9_ < _loc3_.length())
            {
               _loc4_ = _loc3_[_loc9_];
               if(class_1667.checkRequiredAttributes(_loc4_,_loc7_))
               {
                  _loc11_ = int(_loc4_.@direction);
                  _loc8_ = int(_loc4_.@x);
                  _loc10_ = int(_loc4_.@y);
                  if(_loc2_ == null)
                  {
                     _loc2_ = new class_3298();
                  }
                  _loc2_.setOffset(_loc11_,_loc8_,_loc10_);
               }
               _loc9_++;
            }
         }
         return _loc2_;
      }
      
      public function getFrame(param1:int, param2:int, param3:int) : AnimationFrame
      {
         var _loc4_:AnimationLayerData;
         if((_loc4_ = _layers.getValue(param2) as AnimationLayerData) != null)
         {
            return _loc4_.getFrame(param1,param3);
         }
         return null;
      }
      
      public function getFrameFromSequence(param1:int, param2:int, param3:int, param4:int, param5:int) : AnimationFrame
      {
         var _loc6_:AnimationLayerData;
         if((_loc6_ = _layers.getValue(param2) as AnimationLayerData) != null)
         {
            return _loc6_.getFrameFromSequence(param1,param3,param4,param5);
         }
         return null;
      }
   }
}
