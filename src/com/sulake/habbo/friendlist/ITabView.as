package com.sulake.habbo.friendlist
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   
   public interface ITabView
   {
       
      
      function init(param1:HabboFriendList) : void;
      
      function fillFooter(param1:class_3151) : void;
      
      function fillList(param1:IItemListWindow) : void;
      
      function getEntryCount() : int;
      
      function tabClicked(param1:int) : void;
   }
}
