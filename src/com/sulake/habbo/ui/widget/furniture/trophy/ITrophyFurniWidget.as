package com.sulake.habbo.ui.widget.furniture.trophy
{
   import com.sulake.core.assets.class_21;
   import com.sulake.habbo.window.class_1684;
   
   public interface ITrophyFurniWidget
   {
       
      
      function get assets() : class_21;
      
      function get name() : String;
      
      function get date() : String;
      
      function get color() : int;
      
      function get windowManager() : class_1684;
      
      function get message() : String;
   }
}
