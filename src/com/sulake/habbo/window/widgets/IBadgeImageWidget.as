package com.sulake.habbo.window.widgets
{
   import com.sulake.core.window.class_3197;
   import com.sulake.core.window.utils.class_3268;
   
   public interface IBadgeImageWidget extends class_3197, class_3268
   {
       
      
      function get type() : String;
      
      function set type(param1:String) : void;
      
      function get badgeId() : String;
      
      function set badgeId(param1:String) : void;
      
      function get groupId() : int;
      
      function set groupId(param1:int) : void;
   }
}
