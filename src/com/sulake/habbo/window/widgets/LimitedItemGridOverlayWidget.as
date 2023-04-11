package com.sulake.habbo.window.widgets
{
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.iterators.EmptyIterator;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   import com.sulake.habbo.window.utils.class_3443;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class LimitedItemGridOverlayWidget implements ILimitedItemGridOverlayWidget, class_41
   {
      
      public static const TYPE:String = "limited_item_overlay_grid";
       
      
      private const SHINE_INTERVAL_MS:uint = 10000;
      
      private const SHINE_LENGTH_MS:uint = 250;
      
      private var _disposed:Boolean = false;
      
      private var var_1547:class_3217;
      
      private var _windowManager:HabboWindowManagerComponent;
      
      private var var_464:class_3151;
      
      private var var_3108:BitmapData;
      
      private var var_2144:class_3282;
      
      private var _serialNumber:int;
      
      private var var_2384:uint;
      
      private var var_3057:uint;
      
      private var var_3361:Boolean = false;
      
      public function LimitedItemGridOverlayWidget(param1:class_3217, param2:HabboWindowManagerComponent)
      {
         var_2384 = getTimer();
         var_3057 = var_2384;
         super();
         var_1547 = param1;
         _windowManager = param2;
         var_3108 = BitmapData(_windowManager.assets.getAssetByName("unique_item_label_plaque_metal").content).clone();
         var_464 = class_3151(_windowManager.buildFromXML(XML(_windowManager.assets.getAssetByName("unique_item_overlay_griditem_xml").content)));
         var_2144 = class_3282(var_464.findChildByName("unique_item_overlay_plaque_background_bitmap"));
         var_2144.bitmap = var_3108;
         var_1547.rootWindow = var_464;
      }
      
      public function dispose() : void
      {
         if(!disposed)
         {
            if(var_3361)
            {
               _windowManager.removeUpdateReceiver(this);
            }
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
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set serialNumber(param1:int) : void
      {
         _serialNumber = param1;
         var _loc2_:class_3282 = class_3282(var_464.findChildByName("unique_item_overlay_plaque_number_bitmap"));
         _loc2_.bitmap = class_3443.createBitmap(_windowManager.assets,serialNumber,_loc2_.width,_loc2_.height);
      }
      
      public function set seriesSize(param1:int) : void
      {
      }
      
      public function get serialNumber() : int
      {
         return _serialNumber;
      }
      
      public function get seriesSize() : int
      {
         return 0;
      }
      
      public function get properties() : Array
      {
         return [];
      }
      
      public function set properties(param1:Array) : void
      {
      }
      
      public function get iterator() : IIterator
      {
         return EmptyIterator.INSTANCE;
      }
      
      public function get animated() : Boolean
      {
         return var_3361;
      }
      
      public function set animated(param1:Boolean) : void
      {
         var_3361 = param1;
         if(var_3361)
         {
            _windowManager.registerUpdateReceiver(this,5);
         }
         else
         {
            _windowManager.removeUpdateReceiver(this);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:BitmapData = null;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         if(!disposed)
         {
            var_2384 += param1;
            if(var_2384 - var_3057 > 10000)
            {
               _loc2_ = new BitmapData(var_2144.width,var_2144.height,false);
               _loc3_ = (var_2384 - var_3057 - 10000) / 250;
               if(_loc3_ < 1)
               {
                  _loc4_ = (0 - 0) * _loc3_;
                  _loc2_.copyPixels(var_3108,new Rectangle(0,_loc4_,var_2144.width,var_2144.height),new Point(0,0));
                  var_2144.bitmap = _loc2_;
               }
               else
               {
                  var_2144.bitmap = var_3108;
                  var_3057 = var_2384;
               }
            }
         }
      }
   }
}
