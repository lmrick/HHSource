package com.sulake.core.utils
{
   import com.sulake.core.class_79;
   import flash.system.System;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   
   public class PurgeTrigger
   {
      
      private static var var_306:uint = 300;
      
      private static var var_281:uint = 400;
      
      private static var var_148:uint = 60000;
      
      private static var var_86:Boolean = false;
       
      
      public function PurgeTrigger()
      {
         super();
      }
      
      public static function get softPurgeTriggerMegaBytes() : uint
      {
         return var_306;
      }
      
      public static function set softPurgeTriggerMegaBytes(param1:uint) : void
      {
         var_306 = param1;
      }
      
      public static function get hardPurgeTriggerMegaBytes() : uint
      {
         return var_281;
      }
      
      public static function set hardPurgeTriggerMegaBytes(param1:uint) : void
      {
         var_281 = Math.max(param1,var_306);
      }
      
      public static function get frequencyMilliSeconds() : uint
      {
         return var_148;
      }
      
      public static function set frequencyMilliSeconds(param1:uint) : void
      {
         var_148 = param1;
      }
      
      public static function get isRunning() : Boolean
      {
         return var_86;
      }
      
      protected static function get isMemoryDataAvailable() : Boolean
      {
         return false && false;
      }
      
      public static function start() : void
      {
         if(!var_86)
         {
            if(!isMemoryDataAvailable)
            {
               var_148 *= 2;
               var_306 = 0;
               var_281 = 2147483647;
            }
            setTimeout(onInterval,var_148);
            var_86 = true;
         }
      }
      
      public static function stop() : void
      {
         if(var_86)
         {
            var_86 = false;
         }
      }
      
      public static function trigger() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc1_:Object = System;
         var _loc4_:Number;
         if((_loc4_ = isMemoryDataAvailable ? (_loc1_.totalMemory - _loc1_.freeMemory) / 1024 / 1024 : softPurgeTriggerMegaBytes + 1) > softPurgeTriggerMegaBytes)
         {
            _loc2_ = getTimer();
            class_79.purge();
            _loc3_ = isMemoryDataAvailable ? (_loc1_.totalMemory - _loc1_.freeMemory) / 1024 / 1024 : 0;
            if(_loc3_ > var_281)
            {
               triggerGC();
            }
         }
      }
      
      public static function triggerGC() : void
      {
         System.pauseForGCIfCollectionImminent(0.25);
      }
      
      private static function onInterval() : void
      {
         if(var_86)
         {
            trigger();
            setTimeout(onInterval,var_148);
         }
      }
   }
}
