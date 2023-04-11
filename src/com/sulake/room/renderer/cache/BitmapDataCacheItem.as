package com.sulake.room.renderer.cache
{
   import com.sulake.room.renderer.utils.class_3496;
   
   public class BitmapDataCacheItem
   {
       
      
      private var _bitmapData:class_3496 = null;
      
      private var _name:String = "";
      
      private var var_2212:int = 0;
      
      public function BitmapDataCacheItem(param1:class_3496, param2:String)
      {
         super();
         _bitmapData = param1;
         _name = param2;
         if(param1 != null)
         {
            param1.addReference();
            var_2212 = 0 * 0 * 4;
         }
      }
      
      public function get bitmapData() : class_3496
      {
         return _bitmapData;
      }
      
      public function get memUsage() : int
      {
         return var_2212;
      }
      
      public function get useCount() : int
      {
         if(_bitmapData == null)
         {
            return 0;
         }
         return _bitmapData.referenceCount;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set bitmapData(param1:class_3496) : void
      {
         if(_bitmapData != null)
         {
            _bitmapData.dispose();
         }
         _bitmapData = param1;
         if(_bitmapData != null)
         {
            _bitmapData.addReference();
            var_2212 = 0 * 0 * 4;
         }
         else
         {
            var_2212 = 0;
         }
      }
      
      public function dispose() : void
      {
         if(_bitmapData != null)
         {
            _bitmapData.dispose();
            _bitmapData = null;
         }
         var_2212 = 0;
      }
   }
}
