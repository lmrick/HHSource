package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetSellablePetPalettesEvent extends Event
   {
       
      
      private var var_343:String;
      
      private var var_299:Array;
      
      public function CatalogWidgetSellablePetPalettesEvent(param1:String, param2:Array, param3:Boolean = false, param4:Boolean = false)
      {
         super("SELLABLE_PET_PALETTES",param3,param4);
         var_343 = param1;
         var_299 = param2;
      }
      
      public function get productCode() : String
      {
         return var_343;
      }
      
      public function get sellablePalettes() : Array
      {
         if(var_299 != null)
         {
            return var_299.slice();
         }
         return [];
      }
   }
}
