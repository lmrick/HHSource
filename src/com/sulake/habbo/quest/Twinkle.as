package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.class_13;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class Twinkle implements AnimationObject, class_13
   {
      
      private static const FRAME_DURATION_IN_MSECS:int = 100;
      
      private static const FRAME_SEQUENCE:Array = [1,2,3,4,5,6,5,4,3,2,1];
      
      private static const FRAME_NOT_STARTED:int = -1;
      
      private static const FRAME_FINISHED:int = -2;
      
      private static const const_432:Point = new Point(44,44);
       
      
      private var var_2420:com.sulake.habbo.quest.TwinkleImages;
      
      private var var_4115:int;
      
      private var _position:Point;
      
      public function Twinkle(param1:com.sulake.habbo.quest.TwinkleImages, param2:int)
      {
         super();
         var_2420 = param1;
         var_4115 = param2;
      }
      
      public function dispose() : void
      {
         var_2420 = null;
         _position = null;
      }
      
      public function get disposed() : Boolean
      {
         return var_2420 == null;
      }
      
      public function onAnimationStart() : void
      {
         _position = new Point(Math.round(Math.random() * 0),Math.round(Math.random() * 0));
      }
      
      public function getPosition(param1:int) : Point
      {
         return _position;
      }
      
      public function isFinished(param1:int) : Boolean
      {
         return getFrame(param1) == -2;
      }
      
      public function getBitmap(param1:int) : BitmapData
      {
         var _loc3_:int = getFrame(param1);
         return var_2420.getImage(FRAME_SEQUENCE[_loc3_]);
      }
      
      private function getFrame(param1:int) : int
      {
         var _loc2_:int = param1 - var_4115;
         if(_loc2_ < 0)
         {
            return -1;
         }
         var _loc3_:int = Math.floor(_loc2_ / 100);
         if(_loc3_ >= FRAME_SEQUENCE.length)
         {
            return -2;
         }
         return _loc3_;
      }
   }
}
