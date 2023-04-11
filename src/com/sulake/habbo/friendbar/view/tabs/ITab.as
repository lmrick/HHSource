package com.sulake.habbo.friendbar.view.tabs
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3151;
   
   public interface ITab extends class_13
   {
       
      
      function get window() : class_3151;
      
      function get selected() : Boolean;
      
      function get recycled() : Boolean;
      
      function select(param1:Boolean) : void;
      
      function deselect(param1:Boolean) : void;
      
      function recycle() : void;
   }
}
