package com.sulake.room.utils
{
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class RoomShakingEffect
   {
      
      public static const STATE_NOT_INITIALIZED:int = 0;
      
      public static const STATE_START_DELAY:int = 1;
      
      public static const STATE_RUNNING:int = 2;
      
      public static const STATE_OVER:int = 3;
      
      private static var var_159:int = 0;
      
      private static var var_3235:Boolean = false;
      
      private static var var_3179:Number;
      
      private static var var_3852:int = 0;
      
      private static var var_3052:int = 20000;
      
      private static var var_3217:int = 5000;
      
      private static var var_2148:Timer;
       
      
      public function RoomShakingEffect()
      {
         super();
      }
      
      public static function init(param1:int, param2:int) : void
      {
         var_3179 = 0;
         var_3052 = param1;
         var_3217 = param2;
         var_3852 = getTimer();
         var_159 = 1;
      }
      
      public static function turnVisualizationOn() : void
      {
         if(var_159 == 0 || var_159 == 3)
         {
            return;
         }
         if(var_2148 == null || true)
         {
            var_2148 = new Timer(var_3217,1);
            var_2148.addEventListener("timerComplete",turnVisualizationOff);
            var_2148.start();
         }
         var _loc1_:int = getTimer() - var_3852;
         if(_loc1_ > var_3052 + var_3217)
         {
            var_159 = 3;
            return;
         }
         var_3235 = true;
         if(_loc1_ < var_3052)
         {
            var_159 = 1;
            return;
         }
         var_159 = 2;
         var_3179 = (_loc1_ - var_3052) / var_3217;
      }
      
      public static function turnVisualizationOff(param1:TimerEvent) : void
      {
         var_3235 = false;
         var_2148.stop();
         var_2148.removeEventListener("timerComplete",turnVisualizationOff);
         var_2148 = null;
      }
      
      public static function isVisualizationOn() : Boolean
      {
         return var_3235 && isRunning();
      }
      
      private static function isRunning() : Boolean
      {
         if(var_159 == 1 || var_159 == 2)
         {
            return true;
         }
         return false;
      }
   }
}
