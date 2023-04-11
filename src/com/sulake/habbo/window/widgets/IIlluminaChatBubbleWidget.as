package com.sulake.habbo.window.widgets
{
   import com.sulake.core.window.class_3197;
   
   public interface IIlluminaChatBubbleWidget extends class_3197
   {
       
      
      function get flipped() : Boolean;
      
      function set flipped(param1:Boolean) : void;
      
      function get userName() : String;
      
      function set userName(param1:String) : void;
      
      function get userId() : int;
      
      function set userId(param1:int) : void;
      
      function get figure() : String;
      
      function set figure(param1:String) : void;
      
      function get message() : String;
      
      function set message(param1:String) : void;
      
      function get timeStamp() : Number;
      
      function set timeStamp(param1:Number) : void;
      
      function set friendOnlineStatus(param1:Boolean) : void;
   }
}
