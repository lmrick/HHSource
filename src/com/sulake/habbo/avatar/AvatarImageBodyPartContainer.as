package com.sulake.habbo.avatar
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class AvatarImageBodyPartContainer
   {
       
      
      private var var_973:BitmapData;
      
      private var _regPoint:Point;
      
      private var _offset:Point;
      
      private var var_3839:Boolean;
      
      public function AvatarImageBodyPartContainer(param1:BitmapData, param2:Point, param3:Boolean)
      {
         _offset = new Point(0,0);
         super();
         var_973 = param1;
         _regPoint = param2;
         var_3839 = param3;
         cleanPoints();
      }
      
      public function get isCacheable() : Boolean
      {
         return var_3839;
      }
      
      public function dispose() : void
      {
         if(var_973)
         {
            var_973.dispose();
         }
         var_973 = null;
         _regPoint = null;
         _offset = null;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(var_973 && var_973 != param1)
         {
            var_973.dispose();
         }
         var_973 = param1;
      }
      
      public function get image() : BitmapData
      {
         return var_973;
      }
      
      public function setRegPoint(param1:Point) : void
      {
         _regPoint = param1;
         cleanPoints();
      }
      
      public function get regPoint() : Point
      {
         return _regPoint.add(_offset);
      }
      
      public function set offset(param1:Point) : void
      {
         _offset = param1;
         cleanPoints();
      }
      
      private function cleanPoints() : void
      {
         _regPoint.x = 0;
         _regPoint.y = 0;
         _offset.x = 0;
         _offset.y = 0;
      }
   }
}
