package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_1072:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const INVENTORY_EFFECTS:String = "inventory_effects";
      
      public static const INVENTORY_BADGES:String = "inventory_badges";
      
      public static const INVENTORY_CLOTHES:String = "inventory_clothes";
      
      public static const INVENTORY_FURNITURE:String = "inventory_furniture";
       
      
      private var var_4209:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super("RWGOI_MESSAGE_OPEN_INVENTORY");
         var_4209 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_4209;
      }
   }
}
