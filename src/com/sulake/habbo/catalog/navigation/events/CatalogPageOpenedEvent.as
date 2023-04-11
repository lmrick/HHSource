package com.sulake.habbo.catalog.navigation.events
{
   import flash.events.Event;
   
   public class CatalogPageOpenedEvent extends Event
   {
      
      public static const CATALOG_PAGE_OPENED:String = "CATALOG_PAGE_OPENED";
       
      
      private var var_344:int;
      
      private var _pageLocalization:String;
      
      public function CatalogPageOpenedEvent(param1:int, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         super("CATALOG_PAGE_OPENED",param3,param4);
         var_344 = param1;
         _pageLocalization = param2;
      }
      
      public function get pageId() : int
      {
         return var_344;
      }
      
      public function get pageLocalization() : String
      {
         return _pageLocalization;
      }
   }
}
