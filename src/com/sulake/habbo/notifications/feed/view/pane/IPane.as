package com.sulake.habbo.notifications.feed.view.pane
{
   import com.sulake.core.runtime.class_13;
   
   public interface IPane extends class_13
   {
       
      
      function get paneLevel() : int;
      
      function set isVisible(param1:Boolean) : void;
      
      function get isVisible() : Boolean;
   }
}
