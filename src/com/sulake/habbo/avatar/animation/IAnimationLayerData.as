package com.sulake.habbo.avatar.animation
{
   import com.sulake.habbo.avatar.actions.class_3311;
   
   public interface IAnimationLayerData
   {
      function get id() : String;
      
      function get action() : class_3311;
      
      function get animationFrame() : int;
      
      function get dx() : int;
      
      function get dy() : int;
      
      function get dz() : int;
      
      function get directionOffset() : int;
   }
}
