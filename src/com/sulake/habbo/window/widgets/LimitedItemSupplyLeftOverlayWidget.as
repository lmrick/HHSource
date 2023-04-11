package com.sulake.habbo.window.widgets
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.iterators.EmptyIterator;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   
   public class LimitedItemSupplyLeftOverlayWidget implements ILimitedItemSupplyLeftOverlayWidget
   {
      
      public static const TYPE:String = "limited_item_overlay_supply";
       
      
      private var var_1547:class_3217;
      
      private var _windowManager:HabboWindowManagerComponent;
      
      private var var_464:class_3151;
      
      private var var_4220:int;
      
      private var var_3841:int;
      
      public function LimitedItemSupplyLeftOverlayWidget(param1:class_3217, param2:HabboWindowManagerComponent)
      {
         super();
         var_1547 = param1;
         _windowManager = param2;
         var_464 = class_3151(_windowManager.buildFromXML(XML(_windowManager.assets.getAssetByName("unique_item_overlay_supply_xml").content)));
         var_1547.rootWindow = var_464;
      }
      
      public function set supplyLeft(param1:int) : void
      {
         var_4220 = param1;
         var _loc3_:ITextWindow = var_464.findChildByName("items_left_count") as ITextWindow;
         _loc3_.text = param1.toString();
         var_464.findChildByName("unique_item_sold_out_bitmap").visible = false;
      }
      
      public function get supplyLeft() : int
      {
         return var_4220;
      }
      
      public function set serialNumber(param1:int) : void
      {
      }
      
      public function set seriesSize(param1:int) : void
      {
         var_3841 = param1;
         var _loc2_:ITextWindow = var_464.findChildByName("items_total_count") as ITextWindow;
         _loc2_.text = param1.toString();
      }
      
      public function get serialNumber() : int
      {
         return 0;
      }
      
      public function get seriesSize() : int
      {
         return var_3841;
      }
      
      public function get properties() : Array
      {
         return [];
      }
      
      public function set properties(param1:Array) : void
      {
      }
      
      public function dispose() : void
      {
         if(!disposed)
         {
            if(var_464 != null)
            {
               var_464.dispose();
               var_464 = null;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return var_464 == null;
      }
      
      public function get iterator() : IIterator
      {
         return EmptyIterator.INSTANCE;
      }
   }
}
