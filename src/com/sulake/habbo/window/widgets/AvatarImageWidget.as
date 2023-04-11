package com.sulake.habbo.window.widgets
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.iterators.EmptyIterator;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.habbo.avatar.class_1870;
   import com.sulake.habbo.avatar.class_3156;
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   import package_7.class_313;
   
   public class AvatarImageWidget implements class_3308, class_1870
   {
      
      public static const TYPE:String = "avatar_image";
      
      private static const FIGURE_KEY:String = "avatar_image:figure";
      
      private static const SCALE_KEY:String = "avatar_image:scale";
      
      private static const const_742:String = "avatar_image:only_head";
      
      private static const CROPPED_KEY:String = "avatar_image:cropped";
      
      private static const const_584:String = "avatar_image:direction";
      
      private static const const_416:Array = ["northeast","east","southeast","south","southwest","west","northwest","north"];
      
      private static const FIGURE_DEFAULT:PropertyStruct = new PropertyStruct("avatar_image:figure","hd-180-1.ch-210-66.lg-270-82.sh-290-81","String");
      
      private static const SCALE_DEFAULT:PropertyStruct = new PropertyStruct("avatar_image:scale","h","String",false,["sh","h"]);
      
      private static const ONLY_HEAD_DEFAULT:PropertyStruct = new PropertyStruct("avatar_image:only_head",false,"Boolean");
      
      private static const CROPPED_DEFAULT:PropertyStruct = new PropertyStruct("avatar_image:cropped",false,"Boolean");
      
      private static const DIRECTION_DEFAULT:PropertyStruct = new PropertyStruct("avatar_image:direction",const_416[2],"String",false,const_416);
       
      
      private var _disposed:Boolean;
      
      private var var_1547:class_3217;
      
      private var _windowManager:HabboWindowManagerComponent;
      
      private var var_464:class_3151;
      
      private var _bitmap:class_3282;
      
      private var _region:IRegionWindow;
      
      private var var_427:String;
      
      private var var_757:String;
      
      private var _onlyHead:Boolean;
      
      private var _cropped:Boolean;
      
      private var _direction:int;
      
      private var var_339:int;
      
      private const rc:Number = 0.3333333333333333;
      
      private const gc:Number = 0.3333333333333333;
      
      private const bc:Number = 0.3333333333333333;
      
      public function AvatarImageWidget(param1:class_3217, param2:HabboWindowManagerComponent)
      {
         var_427 = "null";
         var_757 = "null";
         _onlyHead = false;
         _cropped = false;
         _direction = const_416.indexOf("null");
         super();
         var_1547 = param1;
         _windowManager = param2;
         var_464 = _windowManager.buildFromXML(_windowManager.assets.getAssetByName("avatar_image_xml").content as XML) as class_3151;
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
         _loc1_.push(ONLY_HEAD_DEFAULT.withValue(_onlyHead));
         _loc1_.push(CROPPED_DEFAULT.withValue(_cropped));
         _loc1_.push(DIRECTION_DEFAULT.withValue(const_416[_direction]));
         return _loc1_;
      }
      
      public function set properties(param1:Array) : void
      {
         for each(var _loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case "avatar_image:figure":
                  figure = String(_loc2_.value);
                  break;
               case "avatar_image:scale":
                  scale = String(_loc2_.value);
                  break;
               case "avatar_image:only_head":
                  onlyHead = Boolean(_loc2_.value);
                  break;
               case "avatar_image:cropped":
                  cropped = Boolean(_loc2_.value);
                  break;
               case "avatar_image:direction":
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
      
      public function get scale() : String
      {
         return var_757;
      }
      
      public function set scale(param1:String) : void
      {
         var_757 = param1;
         refresh();
      }
      
      public function get onlyHead() : Boolean
      {
         return _onlyHead;
      }
      
      public function set onlyHead(param1:Boolean) : void
      {
         _onlyHead = param1;
         refresh();
      }
      
      public function get cropped() : Boolean
      {
         return _cropped;
      }
      
      public function set cropped(param1:Boolean) : void
      {
         _cropped = param1;
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
      
      public function get userId() : int
      {
         return var_339;
      }
      
      public function set userId(param1:int) : void
      {
         var_339 = param1;
         _region.visible = var_339 > 0;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         if(cleanupAvatarString(param1) == var_427)
         {
            refresh();
         }
      }
      
      private function refresh() : void
      {
         var _loc4_:Number = NaN;
         var _loc1_:class_3156 = null;
         var _loc2_:String = null;
         _bitmap.bitmap = null;
         var _loc3_:Boolean = false;
         var _loc5_:String;
         if((_loc5_ = var_427) == null || _loc5_.length == 0)
         {
            _loc3_ = true;
            _loc5_ = "null";
         }
         if(false)
         {
            _loc4_ = var_757 == "h" ? 1 : 0.5;
            _loc1_ = _windowManager.avatarRenderer.createAvatarImage(_loc5_,"h",null,this);
            if(_loc1_ != null)
            {
               _loc1_.setDirection(_onlyHead ? "head" : "full",_direction);
               if(_cropped)
               {
                  _bitmap.bitmap = _loc1_.getCroppedImage(_onlyHead ? "head" : "full",_loc4_);
               }
               else
               {
                  _bitmap.bitmap = _loc1_.getImage(_onlyHead ? "head" : "full",true,_loc4_);
               }
               if(_loc3_)
               {
                  greyBitmap(_bitmap);
               }
               _bitmap.disposesBitmap = true;
               _loc1_.dispose();
            }
         }
         if(true || _bitmap.bitmap.width < 2)
         {
            _loc2_ = "placeholder_avatar" + (var_757 == "sh" ? "_small" : "") + (_onlyHead ? "_head" : "") + (_cropped ? "_cropped" : "") + "_png";
            _bitmap.bitmap = _windowManager.assets.getAssetByName(_loc2_).content as BitmapData;
            _bitmap.disposesBitmap = false;
            greyBitmap(_bitmap);
         }
         _bitmap.invalidate();
         var_1547.width = _bitmap.bitmap.width;
         var_1547.height = _bitmap.bitmap.height;
      }
      
      private function greyBitmap(param1:class_3282) : void
      {
         _bitmap.bitmap.applyFilter(_bitmap.bitmap,_bitmap.bitmap.rect,new Point(),new ColorMatrixFilter([0.3333333333333333,0.3333333333333333,0.3333333333333333,0,0,0.3333333333333333,0.3333333333333333,0.3333333333333333,0,0,0.3333333333333333,0.3333333333333333,0.3333333333333333,0,0,0,0,0,1,0]));
      }
      
      private function cleanupAvatarString(param1:String) : String
      {
         return param1 == null ? "null" : param1.replace(/NaN/g,"");
      }
      
      private function onClick(param1:WindowMouseEvent) : void
      {
         if(var_339 > 0)
         {
            _windowManager.communication.connection.send(new class_313(var_339));
         }
      }
   }
}
