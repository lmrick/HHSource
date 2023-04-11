package com.sulake.room
{
   import com.sulake.room.object.IRoomObjectController;
   import com.sulake.room.object.RoomObject;
   import com.sulake.core.utils.Map;
   
   public class RoomObjectManager implements IRoomObjectManager
   {
       
      
      private var var_129:Map;
      
      private var var_1952:Map;
      
      public function RoomObjectManager()
      {
         super();
         var_129 = new Map();
         var_1952 = new Map();
      }
      
      public function dispose() : void
      {
         reset();
         if(var_129 != null)
         {
            var_129.dispose();
            var_129 = null;
         }
         if(var_1952 != null)
         {
            var_1952.dispose();
            var_1952 = null;
         }
      }
      
      public function createObject(param1:int, param2:uint, param3:String) : IRoomObjectController
      {
         var _loc4_:RoomObject = new RoomObject(param1,param2,param3);
         return addObject(String(param1),param3,_loc4_);
      }
      
      private function addObject(param1:String, param2:String, param3:IRoomObjectController) : IRoomObjectController
      {
         if(var_129.getValue(param1) != null)
         {
            param3.dispose();
            return null;
         }
         var_129.add(param1,param3);
         var _loc4_:Map;
         (_loc4_ = getObjectsForType(param2)).add(param1,param3);
         return param3;
      }
      
      private function getObjectsForType(param1:String, param2:Boolean = true) : Map
      {
         var _loc3_:Map = var_1952.getValue(param1);
         if(_loc3_ == null && param2)
         {
            _loc3_ = new class_24();
            var_1952.add(param1,_loc3_);
         }
         return _loc3_;
      }
      
      public function getObject(param1:int) : IRoomObjectController
      {
         return var_129.getValue(String(param1)) as IRoomObjectController;
      }
      
      public function getObjects() : Array
      {
         return var_129.getValues();
      }
      
      public function getObjectWithIndex(param1:int) : IRoomObjectController
      {
         return var_129.getWithIndex(param1) as IRoomObjectController;
      }
      
      public function getObjectCount() : int
      {
         return var_129.length;
      }
      
      public function getObjectCountForType(param1:String) : int
      {
         var _loc2_:Map = getObjectsForType(param1,false);
         if(_loc2_ != null)
         {
            return _loc2_.length;
         }
         return 0;
      }
      
      public function getObjectWithIndexAndType(param1:int, param2:String) : IRoomObjectController
      {
         var _loc4_:* = null;
         var _loc3_:Map = getObjectsForType(param2,false);
         if(_loc3_ != null)
         {
            return _loc3_.getWithIndex(param1) as IRoomObjectController;
         }
         return null;
      }
      
      public function disposeObject(param1:int) : Boolean
      {
         var _loc4_:String = null;
         var _loc2_:Map = null;
         var _loc3_:String = String(param1);
         var _loc5_:RoomObject;
         if((_loc5_ = var_129.remove(_loc3_) as RoomObject) != null)
         {
            _loc4_ = _loc5_.getType();
            _loc2_ = getObjectsForType(_loc4_,false);
            if(_loc2_ != null)
            {
               _loc2_.remove(_loc3_);
            }
            _loc5_.dispose();
            return true;
         }
         return false;
      }
      
      public function reset() : void
      {
         var _loc2_:int = 0;
         var _loc4_:IRoomObjectController = null;
         var _loc3_:int = 0;
         var _loc1_:Map = null;
         if(var_129 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < var_129.length)
            {
               if((_loc4_ = var_129.getWithIndex(_loc2_) as IRoomObjectController) != null)
               {
                  _loc4_.dispose();
               }
               _loc2_++;
            }
            var_129.reset();
         }
         if(var_1952 != null)
         {
            _loc3_ = 0;
            while(_loc3_ < var_1952.length)
            {
               _loc1_ = var_1952.getWithIndex(_loc3_) as class_24;
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
               _loc3_++;
            }
            var_1952.reset();
         }
      }
   }
}
