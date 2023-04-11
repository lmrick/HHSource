package com.sulake.habbo.freeflowchat
{
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.freeflowchat.style.class_3278;
   import flash.display.DisplayObject;
   
   public interface IHabboFreeFlowChat extends IUnknown
   {
       
      
      function get displayObject() : DisplayObject;
      
      function get chatStyleLibrary() : class_3278;
      
      function get isDisabledInPreferences() : Boolean;
      
      function set isDisabledInPreferences(param1:Boolean) : void;
      
      function get preferedChatStyle() : int;
      
      function set preferedChatStyle(param1:int) : void;
      
      function clear() : void;
      
      function toggleVisibility() : void;
   }
}
