package com.sulake.habbo.window.widgets
{
   import com.sulake.core.window.class_3197;
   
   public interface ICountdownWidget extends class_3197
   {
       
      
      function get colorStyle() : int;
      
      function set colorStyle(param1:int) : void;
      
      function get running() : Boolean;
      
      function set running(param1:Boolean) : void;
      
      function get digits() : uint;
      
      function set digits(param1:uint) : void;
      
      function get seconds() : int;
      
      function set seconds(param1:int) : void;
   }
}
