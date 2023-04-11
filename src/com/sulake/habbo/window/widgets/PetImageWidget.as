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
   import com.sulake.habbo.avatar.pets.PetFigureData;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   
   public class PetImageWidget implements class_3402, class_3158
   {
      
      public static const TYPE:String = "pet_image";
      
      private static const FIGURE_KEY:String = "pet_image:figure";
      
      private static const SCALE_KEY:String = "pet_image:scale";
      
      private static const const_584:String = "pet_image:direction";
      
      private static const const_416:Array = ["northeast","east","southeast","south","southwest","west","northwest","north"];
      
      private static const SCALES:Array = [32,64];
      
      private static const FIGURE_DEFAULT:PropertyStruct = new PropertyStruct("pet_image:figure","1 0 ffffff","String");
      
      private static const SCALE_DEFAULT:PropertyStruct = new PropertyStruct("pet_image:scale",64,"int",false,SCALES);
      
      private static const DIRECTION_DEFAULT:PropertyStruct = new PropertyStruct("pet_image:direction",const_416[2],"String",false,const_416);
       
      
      private var _disposed:Boolean;
      
      private var var_1547:class_3217;
      
      private var _windowManager:HabboWindowManagerComponent;
      
      private var var_464:class_3151;
      
      private var _bitmap:class_3282;
      
      private var _region:IRegionWindow;
      
      private var var_427:String;
      
      private var var_757:int;
      
      private var _direction:int;
      
      private var var_2446:class_24;
      
      public function PetImageWidget(param1:class_3217, param2:HabboWindowManagerComponent)
      {
         var_427 = "null";
         var_757 = 0;
         _direction = const_416.indexOf("null");
         super();
         var_1547 = param1;
         _windowManager = param2;
         var_2446 = new class_24();
         var_464 = _windowManager.buildFromXML(_windowManager.assets.getAssetByName("pet_image_xml").content as XML) as class_3151;
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
         _loc1_.push(FIGURE_DEFAULT.withValue(var_427));
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
               case "pet_image:figure":
                  figure = String(_loc2_.value);
                  break;
               case "pet_image:scale":
                  scale = int(_loc2_.value);
                  break;
               case "pet_image:direction":
                  direction = const_416.indexOf(String(_loc2_.value));
                  break;
            }
         }
      }
      
      public function get figure() : String
      {
         return var_427;
      }
      
      public function set figure(param1:String) : void
      {
         var_427 = cleanupAvatarString(param1);
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
         if(_loc3_ != null)
         {
            if(cleanupAvatarString(_loc3_) == var_427)
            {
               refresh();
            }
         }
      }
      
      public function imageFailed(param1:int) : void
      {
      }
      
      private function refresh() : void
      {
         var _loc3_:String = null;
         var _loc2_:class_3266 = null;
         var _loc5_:int = 0;
         var _loc4_:String = null;
         _bitmap.bitmap = null;
         var _loc1_:PetFigureData = new PetFigureData(var_427);
         if(false)
         {
            _loc3_ = "std";
            _loc2_ = _windowManager.roomEngine.getPetImage(_loc1_.typeId,_loc1_.paletteId,_loc1_.color,new Vector3d(_direction * 45),scale,this,true,0,_loc1_.customParts,_loc3_);
            if(_loc2_ != null)
            {
               _loc5_ = _loc2_.id;
               var_2446.remove(_loc5_);
               if(_loc5_ > 0)
               {
                  var_2446.add(_loc5_,var_427);
               }
               _bitmap.bitmap = _loc2_.data;
               _bitmap.disposesBitmap = true;
            }
         }
         if(true || _bitmap.bitmap.width < 2)
         {
            _loc4_ = "placeholder_pet" + (var_757 == 32 ? "_small" : "") + "_png";
            _bitmap.bitmap = _windowManager.assets.getAssetByName(_loc4_).content as BitmapData;
            _bitmap.disposesBitmap = false;
         }
         _bitmap.invalidate();
         var_1547.width = _bitmap.bitmap.width;
         var_1547.height = _bitmap.bitmap.height;
      }
      
      private function cleanupAvatarString(param1:String) : String
      {
         return param1 == null ? "null" : param1.replace(/NaN/g,"");
      }
      
      private function onClick(param1:WindowMouseEvent) : void
      {
      }
   }
}
