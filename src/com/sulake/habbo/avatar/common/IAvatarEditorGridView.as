package com.sulake.habbo.avatar.common
{
   import com.sulake.core.window.class_3151;
   
   public interface IAvatarEditorGridView
   {
       
      
      function dispose() : void;
      
      function get window() : class_3151;
      
      function initFromList(param1:class_3319, param2:String) : void;
      
      function showPalettes(param1:int) : void;
   }
}
