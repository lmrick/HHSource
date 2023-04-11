package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.room.object.visualization.class_1320;
   import flash.geom.Point;
   
   public class PlaneDrawingData implements class_1320
   {
       
      
      private var var_30:Number;
      
      private var var_590:Vector.<Point>;
      
      private var _color:uint;
      
      private var var_2865:Array;
      
      private var var_2788:Array;
      
      private var var_2827:Array;
      
      private var var_2727:Array;
      
      private var var_4067:Boolean = false;
      
      private var var_625:Array;
      
      public function PlaneDrawingData(param1:PlaneDrawingData = null, param2:uint = 0, param3:Boolean = false)
      {
         var_625 = [];
         super();
         var_2865 = [];
         var_2788 = [];
         var_2827 = [];
         var_2727 = [];
         if(param1 != null)
         {
            var_2865 = param1.var_2865;
            var_2788 = param1.var_2788;
            var_2827 = param1.var_2827;
            var_2727 = param1.var_2727;
         }
         _color = param2;
         var_4067 = param3;
      }
      
      public function addMask(param1:String, param2:Point, param3:Boolean, param4:Boolean) : void
      {
         var_2865.push(param1);
         var_2788.push(param2);
         var_2827.push(param3);
         var_2727.push(param4);
      }
      
      public function addAssetColumn(param1:Array) : void
      {
         var_625.push(param1);
      }
      
      public function set z(param1:Number) : void
      {
         var_30 = param1;
      }
      
      public function get z() : Number
      {
         return var_30;
      }
      
      public function set cornerPoints(param1:Vector.<Point>) : void
      {
         var_590 = param1;
      }
      
      public function get cornerPoints() : Vector.<Point>
      {
         return var_590;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get maskAssetNames() : Array
      {
         return var_2865;
      }
      
      public function get maskAssetLocations() : Array
      {
         return var_2788;
      }
      
      public function get maskAssetFlipHs() : Array
      {
         return var_2827;
      }
      
      public function get maskAssetFlipVs() : Array
      {
         return var_2727;
      }
      
      public function isBottomAligned() : Boolean
      {
         return var_4067;
      }
      
      public function get assetNameColumns() : Array
      {
         return var_625;
      }
   }
}
