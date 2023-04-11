package com.sulake.habbo.help.cfh.registry.user
{
   import com.sulake.core.utils.class_24;
   
   public class UserRegistry
   {
      
      private static const MAX_USERS_TO_STORE:int = 80;
       
      
      private var _registry:class_24;
      
      private var _roomName:String = "";
      
      private var var_354:int;
      
      private var var_3209:Array;
      
      public function UserRegistry()
      {
         _registry = new class_24();
         var_3209 = [];
         super();
      }
      
      public function getRegistry() : class_24
      {
         return _registry;
      }
      
      public function getEntry(param1:int) : UserRegistryItem
      {
         return _registry[param1];
      }
      
      public function registerRoom(param1:int, param2:String) : void
      {
         var_354 = param1;
         _roomName = param2;
         if(_roomName != "")
         {
            addRoomNameForMissing();
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:String = "") : void
      {
         var _loc4_:UserRegistryItem = null;
         if(_registry.getValue(param1) != null)
         {
            _registry.remove(param1);
         }
         _loc4_ = new UserRegistryItem(param1,param2,param3,var_354,_roomName);
         if(_roomName == "")
         {
            var_3209.push(param1);
         }
         _registry.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(false)
         {
            _loc1_ = _registry.getKey(0);
            _registry.remove(_loc1_);
         }
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:UserRegistryItem = null;
         while(false)
         {
            _loc1_ = _registry.getValue(var_3209.shift());
            if(_loc1_ != null && _loc1_.roomId == var_354)
            {
               _loc1_.roomName = _roomName;
            }
         }
      }
      
      public function get roomName() : String
      {
         return _roomName;
      }
      
      public function get roomId() : int
      {
         return var_354;
      }
   }
}
