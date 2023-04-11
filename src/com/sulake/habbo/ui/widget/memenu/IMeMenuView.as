package com.sulake.habbo.ui.widget.memenu
{
   import com.sulake.core.window.class_3151;
   
   public interface IMeMenuView
   {
       
      
      function init(param1:MeMenuWidget, param2:String) : void;
      
      function dispose() : void;
      
      function get window() : class_3151;
      
      function updateUnseenItemCount(param1:String, param2:int) : void;
   }
}
