package com.sulake.room.utils
{
   import flash.utils.getTimer;
   
   public class RoomEnterEffect
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
      
      private static var var_3217:int = 2000;
       
      
      public function RoomEnterEffect()
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
      
      public static function turnVisualizationOff() : void
      {
         var_3235 = false;
      }
      
      public static function isVisualizationOn() : Boolean
      {
         return var_3235 && isRunning();
      }
      
      public static function isRunning() : Boolean
      {
         if(var_159 == 1 || var_159 == 2)
         {
            return true;
         }
         return false;
      }
      
      public static function getDelta(param1:Number = 0, param2:Number = 1) : Number
      {
         return Math.min(Math.max(var_3179,param1),param2);
      }
      
      public static function get totalRunningTime() : int
      {
         return var_3052 + var_3217;
      }
   }
}
