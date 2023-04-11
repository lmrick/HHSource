package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.catalog.viewer.class_3229;
   import flash.events.IEventDispatcher;
   
   public interface ICatalogWidget
   {
       
      
      function set page(param1:class_3229) : void;
      
      function set events(param1:IEventDispatcher) : void;
      
      function get window() : class_3151;
      
      function get events() : IEventDispatcher;
      
      function get page() : class_3229;
      
      function dispose() : void;
      
      function init() : Boolean;
      
      function closed() : void;
   }
}
