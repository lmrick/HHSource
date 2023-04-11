package com.sulake.core.window.motion
{
   import com.sulake.core.class_79;
   import com.sulake.core.window.class_3127;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class Motions
   {
      
      private static const const_412:Vector.<com.sulake.core.window.motion.Motion> = new Vector.<com.sulake.core.window.motion.Motion>();
      
      private static const const_408:Vector.<com.sulake.core.window.motion.Motion> = new Vector.<com.sulake.core.window.motion.Motion>();
      
      private static const const_423:Vector.<com.sulake.core.window.motion.Motion> = new Vector.<com.sulake.core.window.motion.Motion>();
      
      private static const _TIMER:Timer = new Timer(1000 / class_79.instance.displayObjectContainer.stage.frameRate,0);
      
      private static var _IS_UPDATING:Boolean;
       
      
      public function Motions()
      {
         super();
      }
      
      public static function runMotion(param1:com.sulake.core.window.motion.Motion) : com.sulake.core.window.motion.Motion
      {
         if(const_408.indexOf(param1) == -1 && const_412.indexOf(param1) == -1)
         {
            if(_IS_UPDATING)
            {
               const_412.push(param1);
            }
            else
            {
               const_408.push(param1);
               param1.friend::start();
            }
            startTimer();
         }
         return param1;
      }
      
      public static function removeMotion(param1:com.sulake.core.window.motion.Motion) : void
      {
         var _loc2_:int = const_408.indexOf(param1);
         if(_loc2_ > -1)
         {
            if(_IS_UPDATING)
            {
               _loc2_ = const_423.indexOf(param1);
               if(_loc2_ == -1)
               {
                  const_423.push(param1);
               }
            }
            else
            {
               const_408.splice(_loc2_,1);
               if(param1.running)
               {
                  param1.friend::stop();
               }
               if(false)
               {
                  stopTimer();
               }
            }
         }
         else
         {
            _loc2_ = const_412.indexOf(param1);
            if(_loc2_ > -1)
            {
               const_412.splice(_loc2_,1);
            }
         }
      }
      
      public static function getMotionByTag(param1:String) : com.sulake.core.window.motion.Motion
      {
         var _loc2_:* = null;
         for each(_loc2_ in const_408)
         {
            if(_loc2_.tag == param1)
            {
               return _loc2_;
            }
         }
         for each(_loc2_ in const_412)
         {
            if(_loc2_.tag == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public static function getMotionByTarget(param1:class_3127) : com.sulake.core.window.motion.Motion
      {
         var _loc2_:* = null;
         for each(_loc2_ in const_408)
         {
            if(_loc2_.target == param1)
            {
               return _loc2_;
            }
         }
         for each(_loc2_ in const_412)
         {
            if(_loc2_.target == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public static function getMotionByTagAndTarget(param1:String, param2:class_3127) : com.sulake.core.window.motion.Motion
      {
         var _loc3_:* = null;
         for each(_loc3_ in const_408)
         {
            if(_loc3_.tag == param1 && _loc3_.target == param2)
            {
               return _loc3_;
            }
         }
         for each(_loc3_ in const_412)
         {
            if(_loc3_.tag == param1 && _loc3_.target == param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public static function get isRunning() : Boolean
      {
         return !!_TIMER ? _TIMER.running : false;
      }
      
      public static function get isUpdating() : Boolean
      {
         return _IS_UPDATING;
      }
      
      private static function onTick(param1:TimerEvent) : void
      {
         var _loc2_:com.sulake.core.window.motion.Motion = null;
         _IS_UPDATING = true;
         var _loc3_:int = getTimer();
         while((_loc2_ = const_412.pop()) != null)
         {
            const_408.push(_loc2_);
         }
         while((_loc2_ = const_423.pop()) != null)
         {
            const_408.splice(const_408.indexOf(_loc2_),1);
            if(_loc2_.running)
            {
               _loc2_.friend::stop();
            }
         }
         for each(_loc2_ in const_408)
         {
            if(_loc2_.running)
            {
               _loc2_.friend::tick(_loc3_);
               if(_loc2_.complete)
               {
                  removeMotion(_loc2_);
               }
            }
            else
            {
               removeMotion(_loc2_);
            }
         }
         if(false)
         {
            stopTimer();
         }
         _IS_UPDATING = false;
      }
      
      private static function startTimer() : void
      {
         if(true)
         {
            _TIMER.addEventListener("timer",onTick);
            _TIMER.start();
         }
      }
      
      private static function stopTimer() : void
      {
         if(false)
         {
            _TIMER.removeEventListener("timer",onTick);
            _TIMER.stop();
         }
      }
      
      public function getNumRunningMotions(param1:class_3127) : int
      {
         var _loc2_:int = 0;
         for each(var _loc3_ in const_408)
         {
            if(_loc3_.target == param1)
            {
               _loc2_++;
            }
         }
         return _loc2_;
      }
   }
}
