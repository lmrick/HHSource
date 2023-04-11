package com.sulake.core.assets
{
   import com.sulake.core.utils.images.class_979;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   public class BitmapDataAsset implements ILazyAsset
   {
      
      protected static var var_181:uint = 0;
      
      protected static var var_192:uint = 0;
      
      private static const CLONE_BITMAP_DATA:Boolean = true;
      
      private static const USE_ASYNC_LOADER:Boolean = false;
      
      private static const IMMEDIATE_PREPARE:Boolean = false;
       
      
      public var name:String;
      
      private var _disposed:Boolean = false;
      
      private var _rectangle:Rectangle;
      
      private var var_17:Object;
      
      private var _bitmap:BitmapData;
      
      private var _offset:Point;
      
      private var _flipH:Boolean = false;
      
      private var _flipV:Boolean = false;
      
      private var var_370:com.sulake.core.assets.AssetTypeDeclaration;
      
      private var var_90:String;
      
      private var var_16:Loader;
      
      private var var_890:Boolean = true;
      
      public function BitmapDataAsset(param1:com.sulake.core.assets.AssetTypeDeclaration, param2:String = null)
      {
         _offset = new Point(0,0);
         super();
         var_370 = param1;
         var_90 = param2;
         var_181++;
      }
      
      public static function get instances() : uint
      {
         return var_181;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_192;
      }
      
      public function get url() : String
      {
         return var_90;
      }
      
      public function get flipH() : Boolean
      {
         return _flipH;
      }
      
      public function get flipV() : Boolean
      {
         return _flipV;
      }
      
      public function get offset() : Point
      {
         return _offset;
      }
      
      public function get content() : Object
      {
         if(!_bitmap)
         {
            prepareLazyContent();
         }
         return _bitmap;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get rectangle() : Rectangle
      {
         var _loc1_:BitmapData = null;
         if(!_rectangle)
         {
            _loc1_ = BitmapData(content);
            if(_loc1_)
            {
               _rectangle = _loc1_.rect;
            }
         }
         return _rectangle;
      }
      
      public function get declaration() : com.sulake.core.assets.AssetTypeDeclaration
      {
         return var_370;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            var_181--;
            if(_bitmap)
            {
               try
               {
                  var_192 -= 0 * 0 * 4;
                  if(var_890)
                  {
                     _bitmap.dispose();
                  }
               }
               catch(e:Error)
               {
               }
            }
            if(var_17 is BitmapData)
            {
               if(var_890)
               {
                  (var_17 as BitmapData).dispose();
               }
            }
            else if(var_17 is Bitmap)
            {
               (var_17 as Bitmap).bitmapData.dispose();
            }
            else if(var_17 is ByteArray)
            {
               (var_17 as ByteArray).clear();
            }
            var_17 = null;
            _bitmap = null;
            _offset = null;
            var_370 = null;
            var_90 = null;
            _rectangle = null;
            _disposed = true;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 == null)
         {
         }
         if(_bitmap)
         {
            if(_bitmap == param1 as BitmapData)
            {
               return;
            }
            if(var_890)
            {
               _bitmap.dispose();
            }
         }
         var_17 = param1;
         _bitmap = null;
      }
      
      public function prepareLazyContent() : void
      {
         var _loc3_:Object = null;
         var _loc2_:Bitmap = null;
         var _loc1_:Bitmap = null;
         if(var_17 == null)
         {
            return;
         }
         if(var_17 is Class)
         {
            _loc3_ = new (var_17 as Class)();
            _loc2_ = _loc3_ as Bitmap;
            if(_loc2_ != null)
            {
               _bitmap = _loc2_.bitmapData.clone();
               _loc2_.bitmapData.dispose();
               if(_bitmap != null)
               {
                  var_192 += 0 * 0 * 4;
                  var_17 = null;
                  return;
               }
               _loc3_ = new BitmapData(20,20,true,16711680);
            }
            _bitmap = _loc3_ as BitmapData;
            if(_bitmap != null)
            {
               var_17 = null;
               return;
            }
         }
         if(var_17 is Bitmap)
         {
            _loc1_ = Bitmap(var_17);
            _bitmap = _loc1_.bitmapData;
            if(_bitmap == null)
            {
               throw new Error("Failed to convert Bitmap to BitmapDataAsset!");
            }
            var_17 = null;
         }
         if(var_17 is BitmapData)
         {
            _bitmap = var_17 as BitmapData;
            if(_bitmap != null)
            {
               var_17 = null;
               return;
            }
            throw new Error("Failed to convert BitmapData to BitmapDataAsset!");
         }
         if(var_17 is BitmapDataAsset)
         {
            _bitmap = BitmapDataAsset(var_17)._bitmap;
            _offset = BitmapDataAsset(var_17)._offset;
            _flipH = BitmapDataAsset(var_17)._flipH;
            _flipV = BitmapDataAsset(var_17)._flipV;
            if(_bitmap != null)
            {
               var_17 = null;
               return;
            }
            throw new Error("Failed to read content from BitmapDataAsset!");
         }
         if(var_17 is ByteArray)
         {
            try
            {
               _bitmap = new class_979().decode(var_17 as ByteArray);
            }
            catch(e:Error)
            {
               class_14.log("Error decoding asset content to PNG: " + url + "::" + name);
            }
            var_17 = null;
         }
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var _loc2_:Loader = param1.currentTarget.loader as Loader;
         var _loc3_:Bitmap = _loc2_.content as Bitmap;
         _bitmap = _loc3_.bitmapData;
         if(var_16 && false)
         {
            var_16.contentLoaderInfo.removeEventListener("complete",onLoaderComplete);
         }
         var_16 = null;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is BitmapDataAsset)
         {
            _bitmap = BitmapDataAsset(param1)._bitmap;
            _offset = BitmapDataAsset(param1)._offset;
            return;
         }
         throw new Error("Provided asset should be of type BitmapDataAsset!");
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
         var _loc3_:Array = null;
         var _loc5_:String = null;
         for each(var _loc2_ in param1)
         {
            _loc5_ = _loc2_.attribute("key");
            var _loc4_:String = _loc2_.attribute("value");
            switch(_loc5_)
            {
               case "offset":
                  _loc3_ = _loc4_.split(",");
                  _offset.x = parseInt(_loc3_[0]);
                  _offset.y = parseInt(_loc3_[1]);
                  break;
               case "region":
                  _loc3_ = _loc4_.split(",");
                  if(!_rectangle)
                  {
                     _rectangle = new Rectangle();
                  }
                  _rectangle.x = parseInt(_loc3_[0]);
                  _rectangle.y = parseInt(_loc3_[1]);
                  _rectangle.width = parseInt(_loc3_[2]);
                  _rectangle.height = parseInt(_loc3_[3]);
                  break;
               case "flipH":
                  _flipH = _loc4_ == "1" || _loc4_ == "true";
                  break;
               case "flipV":
                  _flipV = _loc4_ == "1" || _loc4_ == "true";
                  break;
            }
         }
      }
   }
}
