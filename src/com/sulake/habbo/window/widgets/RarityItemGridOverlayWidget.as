package com.sulake.habbo.window.widgets
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.iterators.EmptyIterator;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   import com.sulake.habbo.window.utils.class_3443;
   
   public class RarityItemGridOverlayWidget implements IRarityItemGridOverlayWidget
   {
      
      public static const TYPE:String = "rarity_item_overlay_grid";
       
      
      private var var_1547:class_3217;
      
      private var _windowManager:HabboWindowManagerComponent;
      
      private var _disposed:Boolean;
      
      private var var_464:class_3151;
      
      private var var_784:int;
      
      private var var_4337:IStaticBitmapWrapperWindow;
      
      public function RarityItemGridOverlayWidget(param1:class_3217, param2:HabboWindowManagerComponent)
      {
         super();
         var_1547 = param1;
         _windowManager = param2;
         var_464 = class_3151(_windowManager.buildFromXML(XML(_windowManager.assets.getAssetByName("rarity_item_overlay_griditem_xml").content)));
         var_1547.rootWindow = var_464;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set rarityLevel(param1:int) : void
      {
         var_784 = param1;
         var _loc2_:class_3282 = class_3282(var_464.findChildByName("rarity_item_overlay_plaque_number_bitmap"));
         _loc2_.bitmap = class_3443.createBitmap(_windowManager.assets,rarityLevel,_loc2_.width,_loc2_.height);
      }
      
      public function get rarityLevel() : int
      {
         return var_784;
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
            if(var_1547 != null)
            {
               var_1547.rootWindow = null;
               var_1547 = null;
            }
            if(var_464 != null)
            {
               var_464.dispose();
               var_464 = null;
            }
            _windowManager = null;
            _disposed = true;
         }
      }
      
      public function get iterator() : IIterator
      {
         return EmptyIterator.INSTANCE;
      }
   }
}
