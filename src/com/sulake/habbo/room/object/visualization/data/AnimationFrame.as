package com.sulake.habbo.room.object.visualization.data
{
   public class AnimationFrame
   {
      
      public static const FRAME_REPEAT_FOREVER:int = -1;
      
      public static const const_590:int = -1;
      
      private static const POOL_SIZE_LIMIT:int = 3000;
      
      private static const const_421:Array = [];
       
      
      private var var_247:int = 0;
      
      private var var_29:int = 0;
      
      private var var_28:int = 0;
      
      private var var_4207:int = 1;
      
      private var var_2935:int = 1;
      
      private var var_3607:int = 1;
      
      private var var_4303:int = -1;
      
      private var _activeSequenceOffset:int = 0;
      
      private var _isLastFrame:Boolean = false;
      
      private var var_3552:Boolean = false;
      
      public function AnimationFrame()
      {
         super();
      }
      
      public static function allocate(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:int = -1, param8:int = 0) : AnimationFrame
      {
         var _loc9_:AnimationFrame;
         (_loc9_ = const_421.length > 0 ? const_421.pop() : new AnimationFrame()).var_3552 = false;
         _loc9_.var_247 = param1;
         _loc9_.var_29 = param2;
         _loc9_.var_28 = param3;
         _loc9_._isLastFrame = param6;
         if(param4 < 1)
         {
            param4 = 1;
         }
         _loc9_.var_4207 = param4;
         if(param5 < 0)
         {
            param5 = -1;
         }
         _loc9_.var_2935 = param5;
         _loc9_.var_3607 = param5;
         if(param7 >= 0)
         {
            _loc9_.var_4303 = param7;
            _loc9_._activeSequenceOffset = param8;
         }
         return _loc9_;
      }
      
      public function get id() : int
      {
         if(var_247 >= 0)
         {
            return var_247;
         }
         return -var_247 * Math.random();
      }
      
      public function get x() : int
      {
         return var_29;
      }
      
      public function get y() : int
      {
         return var_28;
      }
      
      public function get repeats() : int
      {
         return var_4207;
      }
      
      public function get frameRepeats() : int
      {
         return var_2935;
      }
      
      public function get isLastFrame() : Boolean
      {
         return _isLastFrame;
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_2935 < 0)
         {
            return -1;
         }
         return var_3607;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_2935 > 0 && param1 > var_2935)
         {
            param1 = var_2935;
         }
         var_3607 = param1;
      }
      
      public function get activeSequence() : int
      {
         return var_4303;
      }
      
      public function get activeSequenceOffset() : int
      {
         return _activeSequenceOffset;
      }
      
      public function recycle() : void
      {
         if(!var_3552)
         {
            var_3552 = true;
            if(true)
            {
               const_421.push(this);
            }
         }
      }
   }
}
