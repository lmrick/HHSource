package com.sulake.habbo.utils.animation
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class DelayedCall extends EventDispatcher implements class_66
   {
      
      private static var var_573:Vector.<com.sulake.habbo.utils.animation.DelayedCall> = new Vector.<com.sulake.habbo.utils.animation.DelayedCall>(0);
       
      
      private var mCurrentTime:Number;
      
      private var mTotalTime:Number;
      
      private var var_577:Function;
      
      private var var_435:Array;
      
      private var var_76:int;
      
      public function DelayedCall(param1:Function, param2:Number, param3:Array = null)
      {
         super();
         reset(param1,param2,param3);
      }
      
      internal static function fromPool(param1:Function, param2:Number, param3:Array = null) : com.sulake.habbo.utils.animation.DelayedCall
      {
         if(false)
         {
            return var_573.pop().reset(param1,param2,param3);
         }
         return new com.sulake.habbo.utils.animation.DelayedCall(param1,param2,param3);
      }
      
      internal static function toPool(param1:com.sulake.habbo.utils.animation.DelayedCall) : void
      {
         param1.var_577 = null;
         param1.var_435 = null;
         param1.removeEventListeners();
         var_573.push(param1);
      }
      
      public function reset(param1:Function, param2:Number, param3:Array = null) : com.sulake.habbo.utils.animation.DelayedCall
      {
         mCurrentTime = 0;
         mTotalTime = Math.max(param2,0.0001);
         var_577 = param1;
         var_435 = param3;
         var_76 = 1;
         return this;
      }
      
      public function advanceTime(param1:Number) : void
      {
         var _loc2_:Function = null;
         var _loc3_:Array = null;
         var _loc4_:Number = mCurrentTime;
         mCurrentTime += param1;
         if(mCurrentTime > mTotalTime)
         {
            mCurrentTime = mTotalTime;
         }
         if(_loc4_ < mTotalTime && mCurrentTime >= mTotalTime)
         {
            if(var_76 == 0 || var_76 > 1)
            {
               var_577.apply(null,var_435);
               if(var_76 > 0)
               {
                  var_76 -= 1;
               }
               mCurrentTime = 0;
               advanceTime(_loc4_ + param1 - mTotalTime);
            }
            else
            {
               _loc2_ = var_577;
               _loc3_ = var_435;
               dispatchEvent(new Event("REMOVE_FROM_JUGGLER"));
               _loc2_.apply(null,_loc3_);
            }
         }
      }
      
      public function complete() : void
      {
         var _loc1_:Number = mTotalTime - mCurrentTime;
         if(_loc1_ > 0)
         {
            advanceTime(_loc1_);
         }
      }
      
      public function get isComplete() : Boolean
      {
         return var_76 == 1 && mCurrentTime >= mTotalTime;
      }
      
      public function get totalTime() : Number
      {
         return mTotalTime;
      }
      
      public function get currentTime() : Number
      {
         return mCurrentTime;
      }
      
      public function get repeatCount() : int
      {
         return var_76;
      }
      
      public function set repeatCount(param1:int) : void
      {
         var_76 = param1;
      }
      
      private function removeEventListeners() : void
      {
      }
   }
}
