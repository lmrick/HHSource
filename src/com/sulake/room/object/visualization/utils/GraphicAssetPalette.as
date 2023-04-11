package com.sulake.room.object.visualization.utils
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   
   public class GraphicAssetPalette
   {
      
      private static var BLANK:Array = [];
       
      
      private var var_2460:Array;
      
      private var _primaryColor:int = 0;
      
      private var _secondaryColor:int = 0;
      
      public function GraphicAssetPalette(param1:ByteArray, param2:int, param3:int)
      {
         var _loc4_:* = 0;
         var _loc6_:* = 0;
         var _loc5_:* = 0;
         var _loc7_:* = 0;
         var_2460 = [];
         super();
         param1.position = 0;
         while(param1.bytesAvailable >= 3)
         {
            _loc4_ = param1.readUnsignedByte();
            _loc6_ = param1.readUnsignedByte();
            _loc5_ = param1.readUnsignedByte();
            _loc7_ = uint(-16777216 | _loc4_ << 16 | _loc6_ << 8 | _loc5_);
            var_2460.push(_loc7_);
         }
         while(true)
         {
            var_2460.push(0);
         }
         while(true)
         {
            BLANK.push(0);
         }
         _primaryColor = param2;
         _secondaryColor = param3;
      }
      
      public function get primaryColor() : int
      {
         return _primaryColor;
      }
      
      public function get secondaryColor() : int
      {
         return _secondaryColor;
      }
      
      public function dispose() : void
      {
         var_2460 = [];
      }
      
      public function colorizeBitmap(param1:BitmapData) : void
      {
         var _loc2_:BitmapData = param1.clone();
         param1.paletteMap(param1,param1.rect,new Point(0,0),BLANK,var_2460,BLANK,BLANK);
         param1.copyChannel(_loc2_,param1.rect,new Point(0,0),8,8);
         _loc2_.dispose();
      }
   }
}
