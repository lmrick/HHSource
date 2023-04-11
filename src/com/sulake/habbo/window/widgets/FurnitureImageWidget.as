package com.sulake.habbo.window.widgets
{
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.iterators.EmptyIterator;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   
   public class FurnitureImageWidget implements class_3371, class_3158
   {
      
      public static const TYPE:String = "furniture_image";
      
      private static const const_783:String = "furniture_image:furnitureType";
      
      private static const SCALE_KEY:String = "furniture_image:scale";
      
      private static const const_584:String = "furniture_image:direction";
      
      private static const const_416:Array = ["northeast","east","southeast","south","southwest","west","northwest","north"];
      
      private static const SCALES:Array = [32,64];
      
      private static const FURNITURE_TYPE_DEFAULT:PropertyStruct = new PropertyStruct("furniture_image:furnitureType","table_plasto_square","String",false);
      
      private static const SCALE_DEFAULT:PropertyStruct = new PropertyStruct("furniture_image:scale",64,"int",false,SCALES);
      
      private static const DIRECTION_DEFAULT:PropertyStruct = new PropertyStruct("furniture_image:direction",const_416[2],"String",false,const_416);
      
      private static const ITEM_TYPE_FLOOR:int = 0;
      
      private static const ITEM_TYPE_WALL:int = 1;
       
      
      private var _disposed:Boolean;
      
      private var var_1547:class_3217;
      
      private var _windowManager:HabboWindowManagerComponent;
      
      private var var_464:class_3151;
      
      private var _bitmap:class_3282;
      
      private var _region:IRegionWindow;
      
      private var var_2834:String = "table_plasto_square";
      
      private var var_757:int;
      
      private var _direction:int;
      
      private var var_2446:class_24;
      
      private var var_609:String;
      
      private var var_261:int = 0;
      
      private var var_921:IStuffData = null;
      
      public function FurnitureImageWidget(param1:class_3217, param2:HabboWindowManagerComponent)
      {
         var_757 = 0;
         _direction = const_416.indexOf("null");
         super();
         var_1547 = param1;
         _windowManager = param2;
         var_2446 = new class_24();
         var_464 = _windowManager.buildFromXML(_windowManager.assets.getAssetByName("furniture_image_xml").content as XML) as class_3151;
         _bitmap = var_464.findChildByName("bitmap") as class_3282;
         _region = var_464.findChildByName("region") as IRegionWindow;
         _region.addEventListener("WME_CLICK",onClick);
         refresh();
         var_1547.rootWindow = var_464;
         var_464.width = var_1547.width;
         var_464.height = var_1547.height;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(_region != null)
            {
               _region.removeEventListener("WME_CLICK",onClick);
               _region.dispose();
               _region = null;
            }
            _bitmap = null;
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
         return EmptyIterator.INSTANCE;
      }
      
      public function get properties() : Array
      {
         var _loc1_:* = [];
         if(_disposed)
         {
            return _loc1_;
         }
         _loc1_.push(FURNITURE_TYPE_DEFAULT.withValue(var_2834));
         _loc1_.push(SCALE_DEFAULT.withValue(var_757));
         _loc1_.push(DIRECTION_DEFAULT.withValue(const_416[_direction]));
         return _loc1_;
      }
      
      public function set properties(param1:Array) : void
      {
         for each(var _loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case "furniture_image:furnitureType":
                  furnitureType = String(_loc2_.value);
                  break;
               case "furniture_image:scale":
                  scale = int(_loc2_.value);
                  break;
               case "furniture_image:direction":
                  direction = const_416.indexOf(String(_loc2_.value));
                  break;
            }
         }
      }
      
      public function get furnitureType() : String
      {
         return var_2834;
      }
      
      public function set furnitureType(param1:String) : void
      {
         var_2834 = param1;
         refresh();
      }
      
      public function get scale() : int
      {
         return var_757;
      }
      
      public function set scale(param1:int) : void
      {
         var_757 = param1;
         refresh();
      }
      
      public function get direction() : int
      {
         return _direction;
      }
      
      public function set direction(param1:int) : void
      {
         _direction = param1;
         refresh();
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         var _loc3_:String = var_2446.getValue(param1);
         if(_loc3_ == var_2834)
         {
            refresh();
         }
      }
      
      public function imageFailed(param1:int) : void
      {
      }
      
      private function refresh() : void
      {
         var _loc1_:class_3266 = null;
         var _loc2_:String = null;
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:String = null;
         _bitmap.bitmap = null;
         if(false)
         {
            _loc2_ = "std";
            _loc5_ = _windowManager.roomEngine.getFurnitureTypeId(var_2834);
            if(var_261 == 0)
            {
               _loc1_ = _windowManager.roomEngine.getFurnitureImage(_loc5_,new Vector3d(_direction * 45,0,0),var_757,this,0,var_609,-1,-1,var_921);
            }
            else
            {
               _loc1_ = _windowManager.roomEngine.getWallItemImage(_loc5_,new Vector3d(_direction * 45,0,0),var_757,this,0,!!var_921 ? var_921.getLegacyString() : "");
            }
            if(_loc1_ != null)
            {
               _loc4_ = _loc1_.id;
               var_2446.remove(_loc4_);
               if(_loc4_ > 0)
               {
                  var_2446.add(_loc4_,var_2834);
               }
               _bitmap.bitmap = _loc1_.data;
               _bitmap.disposesBitmap = true;
            }
         }
         if(true || _bitmap.bitmap.width < 2)
         {
            _loc3_ = "placeholder_furni" + (var_757 == 32 ? "_small" : "") + "_png";
            _bitmap.bitmap = _windowManager.assets.getAssetByName(_loc3_).content as BitmapData;
            _bitmap.disposesBitmap = false;
         }
         _bitmap.invalidate();
         var_1547.width = _bitmap.bitmap.width;
         var_1547.height = _bitmap.bitmap.height;
      }
      
      private function onClick(param1:WindowMouseEvent) : void
      {
      }
   }
}
