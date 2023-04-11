package com.sulake.core.window.components
{
   import com.sulake.core.window.class_3127;
   import flash.display.BitmapData;
   
   public interface IBitmapWrapperWindow extends class_3127
   {
       
      
      function set bitmap(param1:BitmapData) : void;
      
      function get bitmap() : BitmapData;
      
      function get bitmapAssetName() : String;
      
      function set bitmapAssetName(param1:String) : void;
      
      function set disposesBitmap(param1:Boolean) : void;
      
      function get disposesBitmap() : Boolean;
   }
}
