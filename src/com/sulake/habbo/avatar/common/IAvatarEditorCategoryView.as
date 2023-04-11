package com.sulake.habbo.avatar.common
{
   import com.sulake.core.window.class_3151;
   
   public interface IAvatarEditorCategoryView
   {
      function dispose() : void;
      
      function init() : void;
      
      function reset() : void;
      
      function getWindowContainer() : class_3151;
      
      function switchCategory(param1:String) : void;
      
      function showPalettes(param1:String, param2:int) : void;
   }
}
