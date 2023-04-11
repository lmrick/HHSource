package com.sulake.habbo.configuration
{
   import com.sulake.core.runtime.class_19;
   import flash.events.IEventDispatcher;
   
   public interface IHabboConfigurationManager extends class_19
   {
       
      
      function isInitialized() : Boolean;
      
      function updateEnvironmentId(param1:String) : void;
      
      function resetAll() : void;
      
      function initConfigurationDownload() : void;
      
      function get events() : IEventDispatcher;
   }
}
