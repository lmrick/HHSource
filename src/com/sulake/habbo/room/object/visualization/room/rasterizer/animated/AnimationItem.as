package com.sulake.habbo.room.object.visualization.room.rasterizer.animated
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class AnimationItem
   {
       
      
      private var var_29:Number = 0;
      
      private var var_28:Number = 0;
      
      private var var_3019:Number = 0;
      
      private var var_2931:Number = 0;
      
      private var _bitmapData:BitmapData = null;
      
      public function AnimationItem(param1:Number, param2:Number, param3:Number, param4:Number, param5:BitmapData)
      {
         super();
         var_29 = param1;
         var_28 = param2;
         var_3019 = param3;
         var_2931 = param4;
         if(isNaN(var_29))
         {
            var_29 = 0;
         }
         if(isNaN(var_28))
         {
            var_28 = 0;
         }
         if(isNaN(var_3019))
         {
            var_3019 = 0;
         }
         if(isNaN(var_2931))
         {
            var_2931 = 0;
         }
         _bitmapData = param5;
      }
      
      public function get bitmapData() : BitmapData
      {
         return _bitmapData;
      }
      
      public function dispose() : void
      {
         _bitmapData = null;
      }
      
      public function getPosition(param1:int, param2:int, param3:Number, param4:Number, param5:int) : Point
      {
         var _loc6_:Number = var_29;
         var _loc7_:Number = var_28;
         if(param3 > 0)
         {
            _loc6_ += var_3019 / param3 * param5 / 1000;
         }
         if(param4 > 0)
         {
            _loc7_ += var_2931 / param4 * param5 / 1000;
         }
         var _loc8_:int = _loc6_ % 1 * param1;
         var _loc9_:int = _loc7_ % 1 * param2;
         return new Point(_loc8_,_loc9_);
      }
   }
}
