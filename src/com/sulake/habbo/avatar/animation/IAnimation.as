package com.sulake.habbo.avatar.animation
{
   public interface IAnimation
   {
       
      
      function hasAvatarData() : Boolean;
      
      function hasDirectionData() : Boolean;
      
      function hasAddData() : Boolean;
      
      function get id() : String;
      
      function get spriteData() : Vector.<ISpriteDataContainer>;
      
      function get removeData() : Array;
      
      function get addData() : Array;
      
      function get resetOnToggle() : Boolean;
   }
}
