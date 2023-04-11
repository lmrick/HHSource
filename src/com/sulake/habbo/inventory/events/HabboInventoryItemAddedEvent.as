package com.sulake.habbo.inventory.events
{
   import flash.events.Event;
   
   public class HabboInventoryItemAddedEvent extends Event
   {
      
      public static const HABBO_INVENTORY_ITEM_ADDED:String = "HABBO_INVENTORY_ITEM_ADDED";
       
      
      private var var_385:int;
      
      private var var_1201:int;
      
      private var var_774:int;
      
      public function HabboInventoryItemAddedEvent(param1:int, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false)
      {
         super("HABBO_INVENTORY_ITEM_ADDED",param4,param5);
         var_385 = param1;
         var_1201 = param2;
         var_774 = param3;
      }
      
      public function get classId() : int
      {
         return var_385;
      }
      
      public function get stripId() : int
      {
         return var_1201;
      }
      
      public function get category() : int
      {
         return var_774;
      }
   }
}
