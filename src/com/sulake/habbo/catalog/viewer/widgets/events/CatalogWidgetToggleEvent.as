package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetToggleEvent extends Event
   {
       
      
      private var var_3968:String;
      
      private var var_560:Boolean;
      
      public function CatalogWidgetToggleEvent(param1:String, param2:Boolean, param3:Boolean = false, param4:Boolean = false)
      {
         super("CWE_TOGGLE",param3,param4);
         var_3968 = param1;
         var_560 = param2;
      }
      
      public function get widgetId() : String
      {
         return var_3968;
      }
      
      public function get enabled() : Boolean
      {
         return var_560;
      }
   }
}
