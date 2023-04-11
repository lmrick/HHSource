package com.sulake.habbo.window.widgets
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class SeparatorWidget implements ISeparatorWidget
   {
      
      public static const TYPE:String = "separator";
      
      private static const VERTICAL_KEY:String = "separator:vertical";
      
      private static const VERTICAL_DEFAULT:PropertyStruct = new PropertyStruct("separator:vertical",false,"Boolean");
      
      private static const BORDER_IMAGE_HORIZONTAL:String = "illumina_light_separator_horizontal";
      
      private static const BORDER_IMAGE_VERTICAL:String = "illumina_light_separator_vertical";
       
      
      private var _disposed:Boolean;
      
      private var var_1547:class_3217;
      
      private var _windowManager:HabboWindowManagerComponent;
      
      private var var_464:class_3151;
      
      private var var_1492:class_3282;
      
      private var var_1651:BitmapData;
      
      private var _children:class_3151;
      
      private var var_2528:Boolean;
      
      public function SeparatorWidget(param1:class_3217, param2:HabboWindowManagerComponent)
      {
         var_2528 = false;
         super();
         var_1547 = param1;
         _windowManager = param2;
         var_464 = _windowManager.buildFromXML(_windowManager.assets.getAssetByName("separator_xml").content as XML) as class_3151;
         var_1492 = var_464.getChildByName("canvas") as class_3282;
         _children = var_464.getChildByName("children") as class_3151;
         var_1492.addEventListener("WE_RESIZE",onChange);
         var_1492.addEventListener("WE_RESIZED",onChange);
         _children.addEventListener("WE_CHILD_ADDED",onChange);
         _children.addEventListener("WE_CHILD_REMOVED",onChange);
         _children.addEventListener("WE_CHILD_RELOCATED",onChange);
         _children.addEventListener("WE_CHILD_RESIZED",onChange);
         var_1547.rootWindow = var_464;
         var_464.width = var_1547.width;
         var_464.height = var_1547.height;
      }
      
      private function onChange(param1:class_3134) : void
      {
         refresh();
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(var_1651 != null)
            {
               var_1651.dispose();
               var_1651 = null;
            }
            if(var_1492 != null)
            {
               var_1492.removeEventListener("WE_RESIZE",onChange);
               var_1492.removeEventListener("WE_RESIZED",onChange);
               var_1492 = null;
            }
            if(_children != null)
            {
               _children.removeEventListener("WE_CHILD_ADDED",onChange);
               _children.removeEventListener("WE_CHILD_REMOVED",onChange);
               _children.removeEventListener("WE_CHILD_RELOCATED",onChange);
               _children.removeEventListener("WE_CHILD_RESIZED",onChange);
               _children = null;
            }
            if(var_464 != null)
            {
               var_464.dispose();
               var_464 = null;
            }
            if(var_1547 != null)
            {
               var_1547.rootWindow = null;
               var_1547 = null;
            }
            _windowManager = null;
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get iterator() : IIterator
      {
         return _children.iterator;
      }
      
      public function get properties() : Array
      {
         var _loc1_:* = [];
         if(_disposed)
         {
            return _loc1_;
         }
         _loc1_.push(VERTICAL_DEFAULT.withValue(var_2528));
         return _loc1_;
      }
      
      public function set properties(param1:Array) : void
      {
         if(_disposed)
         {
            return;
         }
         for each(var _loc2_ in param1)
         {
            var _loc3_:* = _loc2_.key;
            if("separator:vertical" === _loc3_)
            {
               vertical = Boolean(_loc2_.value);
            }
         }
      }
      
      public function get vertical() : Boolean
      {
         return var_2528;
      }
      
      public function set vertical(param1:Boolean) : void
      {
         var_2528 = param1;
         refresh();
      }
      
      private function refresh() : void
      {
         var _loc1_:BitmapData = null;
         var _loc4_:Point = null;
         if(_disposed)
         {
            return;
         }
         if(var_1651 == null)
         {
            if(var_1651 != null)
            {
               var_1651.dispose();
            }
            var_1651 = new BitmapData(Math.max(1,var_1492.width),Math.max(1,var_1492.height),true,0);
            var_1492.bitmap = var_1651;
         }
         var_1651.lock();
         var_1651.fillRect(new Rectangle(0,0,var_1492.width,var_1492.height),0);
         var _loc3_:BitmapDataAsset = _windowManager.assets.getAssetByName(var_2528 ? "illumina_light_separator_vertical" : "illumina_light_separator_horizontal") as BitmapDataAsset;
         if(_loc3_ != null)
         {
            _loc1_ = _loc3_.content as BitmapData;
            if(var_2528)
            {
               _loc4_ = new Point(-1,0);
               while(_loc4_.y < var_1492.height)
               {
                  var_1651.copyPixels(_loc1_,_loc3_.rectangle,_loc4_);
                  _loc4_.y += _loc3_.rectangle.height;
               }
            }
            else
            {
               _loc4_ = new Point(0,-1);
               while(_loc4_.x < var_1492.width)
               {
                  var_1651.copyPixels(_loc1_,_loc3_.rectangle,_loc4_);
                  _loc4_.x += _loc3_.rectangle.width;
               }
            }
         }
         for each(var _loc2_ in _children.iterator)
         {
            if(_loc2_.visible)
            {
               var_1651.fillRect(_loc2_.rectangle,0);
            }
         }
         var_1651.unlock();
         var_1492.invalidate();
      }
   }
}
