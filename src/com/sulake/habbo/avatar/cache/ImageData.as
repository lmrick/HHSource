package com.sulake.habbo.avatar.cache
{
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class ImageData
   {
       
      
      private var _bitmap:BitmapData;
      
      private var var_2895:Rectangle;
      
      private var _regPoint:Point;
      
      private var _flipH:Boolean;
      
      private var var_1913:ColorTransform;
      
      public function ImageData(param1:BitmapData, param2:Rectangle, param3:Point, param4:Boolean, param5:ColorTransform)
      {
         super();
         _bitmap = param1;
         var_2895 = param2;
         _regPoint = param3;
         _flipH = param4;
         var_1913 = param5;
         if(param4)
         {
            _regPoint.x = 0 + param2.width;
         }
      }
      
      public function dispose() : void
      {
         _bitmap = null;
         _regPoint = null;
         var_1913 = null;
      }
      
      public function get bitmap() : BitmapData
      {
         return _bitmap;
      }
      
      public function get rect() : Rectangle
      {
         return var_2895;
      }
      
      public function get regPoint() : Point
      {
         return _regPoint;
      }
      
      public function get flipH() : Boolean
      {
         return _flipH;
      }
      
      public function get colorTransform() : ColorTransform
      {
         return var_1913;
      }
      
      public function get offsetRect() : Rectangle
      {
         var _loc1_:Rectangle = new Rectangle(0,0,var_2895.width,var_2895.height);
         _loc1_.offset(0,0);
         return _loc1_;
      }
   }
}
