package com.sulake.habbo.window.widgets
{
   import com.sulake.core.window.class_3197;
   
   public interface IUpdatingTimeStampWidget extends class_3197
   {
       
      
      function reset() : void;
      
      function get timeStamp() : Number;
      
      function set timeStamp(param1:Number) : void;
      
      function set align(param1:String) : void;
   }
}
