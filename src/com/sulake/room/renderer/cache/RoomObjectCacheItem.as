package com.sulake.room.renderer.cache
{

   public class RoomObjectCacheItem
   {
       
      
      private var var_347:int;
      
      private var _location:com.sulake.room.renderer.cache.class_3421 = null;
      
      private var var_1551:com.sulake.room.renderer.cache.class_3445 = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         _location = new com.sulake.room.renderer.cache.class_3421(param1);
         var_1551 = new com.sulake.room.renderer.cache.class_3445();
      }
      
      public function get location() : com.sulake.room.renderer.cache.class_3421
      {
         return _location;
      }
      
      public function get sprites() : com.sulake.room.renderer.cache.class_3445
      {
         return var_1551;
      }
      
      public function dispose() : void
      {
         if(_location != null)
         {
            _location.dispose();
            _location = null;
         }
         if(var_1551 != null)
         {
            var_1551.dispose();
            var_1551 = null;
         }
      }
      
      public function set objectId(param1:int) : void
      {
         var_347 = param1;
      }
      
      public function get objectId() : int
      {
         return var_347;
      }
   }
}
