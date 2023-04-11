package com.sulake.habbo.window.widgets
{
   import com.sulake.core.window.class_3197;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   
   public interface IHoverBitmapWidget extends class_3197
   {
       
      
      function get bitmapWrapper() : IStaticBitmapWrapperWindow;
      
      function get normalAsset() : String;
      
      function set normalAsset(param1:String) : void;
      
      function get hoverAsset() : String;
      
      function set hoverAsset(param1:String) : void;
   }
}
