package com.sulake.habbo.toolbar.extensions.purse
{
   import com.sulake.core.window.class_3151;
   import flash.events.IEventDispatcher;
   
   public interface ICurrencyIndicator
   {
       
      
      function dispose() : void;
      
      function get window() : class_3151;
      
      function registerUpdateEvents(param1:IEventDispatcher) : void;
   }
}
