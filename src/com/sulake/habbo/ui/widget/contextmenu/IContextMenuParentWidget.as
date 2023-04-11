package com.sulake.habbo.ui.widget.contextmenu
{
   import com.sulake.core.assets.class_21;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.friendlist.class_1869;
   import com.sulake.habbo.ui.widget.IRoomWidgetMessageListener;
   import com.sulake.habbo.window.class_1684;
   
   public interface IContextMenuParentWidget
   {
       
      
      function get assets() : class_21;
      
      function get windowManager() : class_1684;
      
      function get messageListener() : IRoomWidgetMessageListener;
      
      function get catalog() : IHabboCatalog;
      
      function get friendList() : class_1869;
      
      function removeView(param1:ContextInfoView, param2:Boolean) : void;
   }
}
