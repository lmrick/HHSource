package com.sulake.habbo.window.widgets
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.iterators.EmptyIterator;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   import com.sulake.habbo.window.utils.class_3443;
   
   public class LimitedItemPreviewOverlayWidget implements ILimitedItemPreviewOverlayWidget
   {
      
      public static const TYPE:String = "limited_item_overlay_preview";
       
      
      private var var_1547:class_3217;
      
      private var _windowManager:HabboWindowManagerComponent;
      
      private var var_464:class_3151;
      
      private var _serialNumber:int;
      
      private var var_3841:int;
      
      public function LimitedItemPreviewOverlayWidget(param1:class_3217, param2:HabboWindowManagerComponent)
      {
         super();
         var_1547 = param1;
         _windowManager = param2;
         var_464 = class_3151(_windowManager.buildFromXML(XML(_windowManager.assets.getAssetByName("unique_item_overlay_preview_xml").content)));
         var_1547.rootWindow = var_464;
      }
      
      public function set serialNumber(param1:int) : void
      {
         _serialNumber = param1;
         var _loc2_:class_3282 = class_3282(var_464.findChildByName("unique_item_serial_number_bitmap"));
         _loc2_.bitmap = class_3443.createBitmap(_windowManager.assets,serialNumber,_loc2_.width,_loc2_.height);
      }
      
      public function set seriesSize(param1:int) : void
      {
         var_3841 = param1;
         var _loc2_:class_3282 = class_3282(var_464.findChildByName("unique_item_edition_size_bitmap"));
         _loc2_.bitmap = class_3443.createBitmap(_windowManager.assets,param1,_loc2_.width,_loc2_.height);
      }
      
      public function get serialNumber() : int
      {
         return _serialNumber;
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
