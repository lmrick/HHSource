package com.sulake.room.renderer.cache
{
   import com.sulake.room.renderer.utils.class_3438;

   public class RoomObjectSortableSpriteCacheItem
   {
       
      
      private var var_1551:Array;
      
      private var _updateId1:int = -1;
      
      private var _updateId2:int = -1;
      
      private var var_3188:Boolean = false;
      
      public function RoomObjectSortableSpriteCacheItem()
      {
         var_1551 = [];
         super();
      }
      
      public function get spriteCount() : int
      {
         return var_1551.length;
      }
      
      public function get isEmpty() : Boolean
      {
         return var_3188;
      }
      
      public function dispose() : void
      {
         setSpriteCount(0);
      }
      
      public function addSprite(param1:class_3438) : void
      {
         var_1551.push(param1);
      }
      
      public function getSprite(param1:int) : class_3438
      {
         return var_1551[param1];
      }
      
      public function get sprites() : Array
      {
         return var_1551;
      }
      
      public function needsUpdate(param1:int, param2:int) : Boolean
      {
         if(param1 != _updateId1 || param2 != _updateId2)
         {
            _updateId1 = param1;
            _updateId2 = param2;
            return true;
         }
         return false;
      }
      
      public function setSpriteCount(param1:int) : void
      {
         var _loc3_:* = 0;
         var _loc2_:class_3438 = null;
         if(param1 < var_1551.length)
         {
            _loc3_ = param1;
            while(_loc3_ < var_1551.length)
            {
               _loc2_ = var_1551[_loc3_];
               if(_loc2_)
               {
                  _loc2_.dispose();
               }
               _loc3_++;
            }
            var_1551.splice(param1,0 - param1);
         }
         if(false)
         {
            var_3188 = true;
         }
         else
         {
            var_3188 = false;
         }
      }
   }
}
