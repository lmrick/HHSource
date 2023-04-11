package com.sulake.room.renderer.cache
{
   import com.sulake.core.utils.class_24;
   import com.sulake.room.renderer.utils.class_3496;
   import flash.display.BitmapData;
   
   public class BitmapDataCache
   {
       
      
      private var var_1895:class_24;
      
      private var var_2212:int = 0;
      
      private var var_2288:int = 0;
      
      private var var_3568:int = 0;
      
      private var var_2995:int = 0;
      
      public function BitmapDataCache(param1:int, param2:int, param3:int = 1)
      {
         super();
         var_1895 = new class_24();
         var_2288 = param1 * 1024 * 1024;
         var_3568 = param2 * 1024 * 1024;
         var_2995 = param3 * 1024 * 1024;
         if(var_2995 < 0)
         {
            var_2995 = 0;
         }
      }
      
      public function get memUsage() : int
      {
         return var_2212;
      }
      
      public function get memLimit() : int
      {
         return var_2288;
      }
      
      public function dispose() : void
      {
         var _loc1_:Array = null;
         if(var_1895 != null)
         {
            _loc1_ = var_1895.getKeys();
            for each(var _loc2_ in _loc1_)
            {
               if(!removeItem(_loc2_))
               {
                  class_14.log("Failed to remove item " + _loc2_ + " from room canvas bitmap cache!");
               }
            }
            var_1895.dispose();
            var_1895 = null;
         }
      }
      
      public function compress() : void
      {
         var _loc1_:Array = null;
         var _loc2_:class_3522 = null;
         var _loc3_:int = 0;
         if(memUsage > memLimit)
         {
            _loc1_ = var_1895.getValues();
            _loc1_.sortOn("useCount",16);
            _loc1_.reverse();
            _loc3_ = _loc1_.length - 1;
            while(_loc3_ >= 0)
            {
               _loc2_ = _loc1_[_loc3_] as class_3522;
               if(_loc2_.useCount > 1)
               {
                  break;
               }
               removeItem(_loc2_.name);
               _loc3_--;
            }
            increaseMemoryLimit();
         }
      }
      
      private function increaseMemoryLimit() : void
      {
         var_2288 += var_2995;
         if(var_2288 > var_3568)
         {
            var_2288 = var_3568;
         }
      }
      
      private function removeItem(param1:String) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:class_3522 = var_1895.getValue(param1) as class_3522;
         if(_loc2_ != null)
         {
            if(_loc2_.useCount <= 1)
            {
               var_1895.remove(_loc2_.name);
               var_2212 -= _loc2_.memUsage;
               _loc2_.dispose();
               return true;
            }
            return false;
         }
         return false;
      }
      
      public function getBitmapData(param1:String) : class_3496
      {
         var _loc2_:class_3522 = var_1895.getValue(param1) as class_3522;
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.bitmapData;
      }
      
      public function addBitmapData(param1:String, param2:class_3496) : void
      {
         var _loc4_:BitmapData = null;
         if(param2 == null)
         {
            return;
         }
         var _loc3_:class_3522 = var_1895.getValue(param1) as class_3522;
         if(_loc3_ != null)
         {
            if((_loc4_ = _loc3_.bitmapData) != null)
            {
               var_2212 -= _loc4_.width * _loc4_.height * 4;
            }
            _loc3_.bitmapData = param2;
         }
         else
         {
            _loc3_ = new class_3522(param2,param1);
            var_1895.add(param1,_loc3_);
         }
         var_2212 += param2.width * param2.height * 4;
      }
   }
}
