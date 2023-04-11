package com.sulake.habbo.inventory.events
{
   import flash.events.Event;
   import flash.utils.Dictionary;
   
   public class HabboUnseenItemsUpdatedEvent extends Event
   {
      
      public static const const_659:String = "HUIUE_UNSEEN_ITEMS_CHANGED";
       
      
      private var var_3919:int;
      
      private var var_3580:Dictionary;
      
      public function HabboUnseenItemsUpdatedEvent(param1:Boolean = false, param2:Boolean = false)
      {
         super("HUIUE_UNSEEN_ITEMS_CHANGED");
         var_3580 = new Dictionary();
      }
      
      public function setCategoryCount(param1:int, param2:int) : void
      {
         var_3580[param1.toString()] = param2;
      }
      
      public function getCategoryCount(param1:int) : int
      {
         return var_3580[param1.toString()];
      }
      
      public function set inventoryCount(param1:int) : void
      {
         var_3919 = param1;
      }
      
      public function get inventoryCount() : int
      {
         return var_3919;
      }
   }
}
