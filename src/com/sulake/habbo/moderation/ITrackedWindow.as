package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.components.class_3281;
   
   public interface ITrackedWindow extends class_13
   {
       
      
      function getType() : int;
      
      function getId() : String;
      
      function getFrame() : class_3281;
      
      function show() : void;
   }
}
