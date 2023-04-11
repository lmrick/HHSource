package com.sulake.habbo.window.widgets
{
   import com.sulake.core.window.class_3197;
   
   public interface IAvatarImageWidget extends class_3197
   {
       
      
      function get figure() : String;
      
      function set figure(param1:String) : void;
      
      function get scale() : String;
      
      function set scale(param1:String) : void;
      
      function get onlyHead() : Boolean;
      
      function set onlyHead(param1:Boolean) : void;
      
      function get cropped() : Boolean;
      
      function set cropped(param1:Boolean) : void;
      
      function get direction() : int;
      
      function set direction(param1:int) : void;
      
      function get userId() : int;
      
      function set userId(param1:int) : void;
   }
}
