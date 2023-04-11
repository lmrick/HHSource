package com.sulake.habbo.room.utils
{
   import com.sulake.core.utils.class_24;
   
   public class RoomInstanceData
   {
       
      
      private var var_354:int = 0;
      
      private var var_1947:com.sulake.habbo.room.utils.class_3196 = null;
      
      private var _legacyGeometry:com.sulake.habbo.room.utils.class_3155 = null;
      
      private var var_2285:com.sulake.habbo.room.utils.class_3280 = null;
      
      private var var_2756:com.sulake.habbo.room.utils.class_3138 = null;
      
      private var _selectedObject:com.sulake.habbo.room.utils.class_3190 = null;
      
      private var _placedObject:com.sulake.habbo.room.utils.class_3190 = null;
      
      private var var_3756:String = null;
      
      private var var_2065:class_24;
      
      private var var_2052:class_24;
      
      private var _mouseButtonCursorOwners:Array;
      
      public function RoomInstanceData(param1:int)
      {
         var_2065 = new class_24();
         var_2052 = new class_24();
         _mouseButtonCursorOwners = [];
         super();
         var_354 = param1;
         _legacyGeometry = new com.sulake.habbo.room.utils.class_3155();
         var_2756 = new com.sulake.habbo.room.utils.class_3138();
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
      
      public function get furniStackingHeightMap() : com.sulake.habbo.room.utils.class_3196
      {
         return var_1947;
      }
      
      public function set furniStackingHeightMap(param1:com.sulake.habbo.room.utils.class_3196) : void
      {
         if(var_1947 != null)
         {
            var_1947.dispose();
         }
         var_1947 = param1;
         if(var_2285)
         {
            var_2285.dispose();
         }
         if(var_1947)
         {
            var_2285 = new com.sulake.habbo.room.utils.class_3280(var_1947.width,var_1947.height);
         }
      }
      
      public function get legacyGeometry() : com.sulake.habbo.room.utils.class_3155
      {
         return _legacyGeometry;
      }
      
      public function get tileObjectMap() : com.sulake.habbo.room.utils.class_3280
      {
         return var_2285;
      }
      
      public function get roomCamera() : com.sulake.habbo.room.utils.class_3138
      {
         return var_2756;
      }
      
      public function get worldType() : String
      {
         return var_3756;
      }
      
      public function set worldType(param1:String) : void
      {
         var_3756 = param1;
      }
      
      public function get selectedObject() : com.sulake.habbo.room.utils.class_3190
      {
         return _selectedObject;
      }
      
      public function set selectedObject(param1:com.sulake.habbo.room.utils.class_3190) : void
      {
         if(_selectedObject != null)
         {
            _selectedObject.dispose();
         }
         _selectedObject = param1;
      }
      
      public function get placedObject() : com.sulake.habbo.room.utils.class_3190
      {
         return _placedObject;
      }
      
      public function set placedObject(param1:com.sulake.habbo.room.utils.class_3190) : void
      {
         if(_placedObject != null)
         {
            _placedObject.dispose();
         }
         _placedObject = param1;
      }
      
      public function dispose() : void
      {
         if(var_1947 != null)
         {
            var_1947.dispose();
            var_1947 = null;
         }
         if(_legacyGeometry != null)
         {
            _legacyGeometry.dispose();
            _legacyGeometry = null;
         }
         if(var_2756 != null)
         {
            var_2756.dispose();
            var_2756 = null;
         }
         if(_selectedObject != null)
         {
            _selectedObject.dispose();
            _selectedObject = null;
         }
         if(_placedObject != null)
         {
            _placedObject.dispose();
            _placedObject = null;
         }
         if(var_2065 != null)
         {
            var_2065.dispose();
            var_2065 = null;
         }
         if(var_2052 != null)
         {
            var_2052.dispose();
            var_2052 = null;
         }
         if(var_2285 != null)
         {
            var_2285.dispose();
            var_2285 = null;
         }
      }
      
      public function addFurnitureData(param1:class_3265) : void
      {
         if(param1 != null)
         {
            var_2065.remove(param1.id);
            var_2065.add(param1.id,param1);
         }
      }
      
      public function getFurnitureData() : class_3265
      {
         if(false)
         {
            return getFurnitureDataWithId(var_2065.getKey(0));
         }
         return null;
      }
      
      public function getFurnitureDataWithId(param1:int) : class_3265
      {
         return var_2065.remove(param1);
      }
      
      public function addWallItemData(param1:class_3265) : void
      {
         if(param1 != null)
         {
            var_2052.remove(param1.id);
            var_2052.add(param1.id,param1);
         }
      }
      
      public function getWallItemData() : class_3265
      {
         if(false)
         {
            return getWallItemDataWithId(var_2052.getKey(0));
         }
         return null;
      }
      
      public function getWallItemDataWithId(param1:int) : class_3265
      {
         return var_2052.remove(param1);
      }
      
      public function addButtonMouseCursorOwner(param1:String) : Boolean
      {
         var _loc2_:int = _mouseButtonCursorOwners.indexOf(param1);
         if(_loc2_ == -1)
         {
            _mouseButtonCursorOwners.push(param1);
            return true;
         }
         return false;
      }
      
      public function removeButtonMouseCursorOwner(param1:String) : Boolean
      {
         var _loc2_:int = _mouseButtonCursorOwners.indexOf(param1);
         if(_loc2_ > -1)
         {
            _mouseButtonCursorOwners.splice(_loc2_,1);
            return true;
         }
         return false;
      }
      
      public function hasButtonMouseCursorOwners() : Boolean
      {
         return false;
      }
   }
}
