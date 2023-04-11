package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_519:int;
      
      private var var_3734:Number;
      
      private var _playLength:Number;
      
      private var _playRequestTime:int;
      
      private var var_3920:Number;
      
      private var var_4251:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2, param5:Number = 1)
      {
         super();
         var_519 = param1;
         var_3734 = param2;
         _playLength = param3;
         var_3920 = param4;
         var_4251 = param5;
         _playRequestTime = getTimer();
      }
      
      public function get songId() : int
      {
         return var_519;
      }
      
      public function get startPos() : Number
      {
         if(var_3734 < 0)
         {
            return 0;
         }
         return var_3734 + (getTimer() - _playRequestTime) / 1000;
      }
      
      public function get playLength() : Number
      {
         return _playLength;
      }
      
      public function get fadeInSeconds() : Number
      {
         return var_3920;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return var_4251;
      }
   }
}
