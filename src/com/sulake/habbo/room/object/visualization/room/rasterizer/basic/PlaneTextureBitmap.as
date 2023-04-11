package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
   import flash.display.BitmapData;
   
   public class PlaneTextureBitmap
   {
      
      public static const const_424:Number = -1;
      
      public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;
       
      
      private var _bitmap:BitmapData = null;
      
      private var var_3875:Number = -1;
      
      private var var_4152:Number = 1;
      
      private var var_3850:Number = -1;
      
      private var var_3885:Number = 1;
      
      private var _assetName:String = null;
      
      public function PlaneTextureBitmap(param1:BitmapData, param2:Number = -1, param3:Number = 1, param4:Number = -1, param5:Number = 1, param6:String = null)
      {
         super();
         var_3875 = param2;
         var_4152 = param3;
         var_3850 = param4;
         var_3885 = param5;
         _assetName = param6;
         _bitmap = param1;
      }
      
      public function get bitmap() : BitmapData
      {
         return _bitmap;
      }
      
      public function get normalMinX() : Number
      {
         return var_3875;
      }
      
      public function get normalMaxX() : Number
      {
         return var_4152;
      }
      
      public function get normalMinY() : Number
      {
         return var_3850;
      }
      
      public function get normalMaxY() : Number
      {
         return var_3885;
      }
      
      public function get assetName() : String
      {
         return _assetName;
      }
      
      public function dispose() : void
      {
         _bitmap = null;
      }
   }
}
