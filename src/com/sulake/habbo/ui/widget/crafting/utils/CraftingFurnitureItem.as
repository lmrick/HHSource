package com.sulake.habbo.ui.widget.crafting.utils
{
   import com.sulake.habbo.session.furniture.class_3148;
   import flash.events.EventDispatcher;
   
   public class CraftingFurnitureItem extends EventDispatcher
   {
       
      
      private var var_343:String;
      
      private var var_1807:class_3148;
      
      private var var_2462:Vector.<int>;
      
      private var var_3433:Vector.<int>;
      
      public function CraftingFurnitureItem(param1:String, param2:class_3148)
      {
         super();
         var_343 = param1;
         var_1807 = param2;
         var_2462 = new Vector.<int>(0);
         var_3433 = new Vector.<int>(0);
      }
      
      public function get furnitureData() : class_3148
      {
         return var_1807;
      }
      
      public function get productCode() : String
      {
         return var_343;
      }
      
      public function get typeId() : int
      {
         return !!var_1807 ? var_1807.id : -1;
      }
      
      public function get countInInventory() : int
      {
         return !!var_2462 ? var_2462.length : 0;
      }
      
      public function set inventoryIds(param1:Vector.<int>) : void
      {
         var_2462 = param1;
      }
      
      public function getItemToMixer() : int
      {
         if(countInInventory == 0)
         {
            return 0;
         }
         var _loc1_:int = var_2462.shift();
         var_3433.push(_loc1_);
         return _loc1_;
      }
      
      public function returnItemToInventory(param1:int) : void
      {
         var_2462.push(param1);
         var_3433.splice(var_3433.indexOf(param1),1);
      }
   }
}
