package com.sulake.habbo.session
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.class_24;
   import package_7.class_844;
   import package_76.class_630;
   
   public class UserDataManager implements class_3291
   {
      
      private static const TYPE_USER:int = 1;
      
      private static const TYPE_PET:int = 2;
      
      private static const const_993:int = 3;
      
      private static const const_893:int = 4;
       
      
      private var var_2378:class_24;
      
      private var var_2228:class_24;
      
      private var var_2451:class_24;
      
      private var _connection:IConnection;
      
      public function UserDataManager()
      {
         super();
         var_2378 = new class_24();
         var_2228 = new class_24();
         var_2451 = new class_24();
      }
      
      public function dispose() : void
      {
         _connection = null;
         var_2378.dispose();
         var_2378 = null;
         var_2228.dispose();
         var_2228 = null;
         var_2451.dispose();
         var_2451 = null;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function getUserData(param1:int) : class_3259
      {
         return getUserDataByType(param1,1);
      }
      
      public function getUserDataByType(param1:int, param2:int) : class_3259
      {
         var _loc3_:class_3259 = null;
         var _loc4_:class_24;
         if((_loc4_ = var_2378.getValue(param2)) != null)
         {
            _loc3_ = _loc4_.getValue(param1);
         }
         return _loc3_;
      }
      
      public function getUserDataByIndex(param1:int) : class_3259
      {
         return var_2228.getValue(param1);
      }
      
      public function getUserDataByName(param1:String) : class_3259
      {
         for each(var _loc2_ in var_2228)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getUserBadges(param1:int) : Array
      {
         if(_connection != null)
         {
            _connection.send(new class_844(param1));
         }
         var _loc2_:* = var_2451.getValue(param1) as Array;
         if(_loc2_ == null)
         {
            _loc2_ = [];
         }
         return _loc2_;
      }
      
      public function setUserData(param1:class_3259) : void
      {
         if(param1 == null)
         {
            return;
         }
         removeUserDataByRoomIndex(param1.roomObjectId);
         var _loc2_:class_24 = var_2378.getValue(param1.type);
         if(_loc2_ == null)
         {
            _loc2_ = new class_24();
            var_2378.add(param1.type,_loc2_);
         }
         _loc2_.add(param1.webID,param1);
         var_2228.add(param1.roomObjectId,param1);
      }
      
      public function removeUserDataByRoomIndex(param1:int) : void
      {
         var _loc4_:class_24 = null;
         var _loc3_:class_3259 = null;
         var _loc2_:class_3259 = var_2228.remove(param1);
         if(_loc2_ != null)
         {
            if((_loc4_ = var_2378.getValue(_loc2_.type)) != null)
            {
               _loc3_ = _loc4_.remove(_loc2_.webID);
               if(_loc3_ != null)
               {
               }
            }
         }
      }
      
      public function setUserBadges(param1:int, param2:Array) : void
      {
         var_2451.remove(param1);
         var_2451.add(param1,param2);
      }
      
      public function updateFigure(param1:int, param2:String, param3:String, param4:Boolean, param5:Boolean) : void
      {
         var _loc6_:class_3259;
         if((_loc6_ = getUserDataByIndex(param1)) != null)
         {
            _loc6_.figure = param2;
            _loc6_.sex = param3;
            _loc6_.hasSaddle = param4;
            _loc6_.isRiding = param5;
         }
      }
      
      public function updatePetLevel(param1:int, param2:int) : void
      {
         var _loc3_:class_3259 = getUserDataByIndex(param1);
         if(_loc3_ != null)
         {
            _loc3_.petLevel = param2;
         }
      }
      
      public function updatePetBreedingStatus(param1:int, param2:Boolean, param3:Boolean, param4:Boolean, param5:Boolean) : void
      {
         var _loc6_:class_3259;
         if((_loc6_ = getUserDataByIndex(param1)) != null)
         {
            _loc6_.canBreed = param2;
            _loc6_.canHarvest = param3;
            _loc6_.canRevive = param4;
            _loc6_.hasBreedingPermission = param5;
         }
      }
      
      public function updateCustom(param1:int, param2:String) : void
      {
         var _loc3_:class_3259 = getUserDataByIndex(param1);
         if(_loc3_ != null)
         {
            _loc3_.custom = param2;
         }
      }
      
      public function updateAchievementScore(param1:int, param2:int) : void
      {
         var _loc3_:class_3259 = getUserDataByIndex(param1);
         if(_loc3_ != null)
         {
            _loc3_.achievementScore = param2;
         }
      }
      
      public function updateNameByIndex(param1:int, param2:String) : void
      {
         var _loc3_:class_3259 = getUserDataByIndex(param1);
         if(_loc3_ != null)
         {
            _loc3_.name = param2;
         }
      }
      
      public function getPetUserData(param1:int) : class_3259
      {
         return getUserDataByType(param1,2);
      }
      
      public function getRentableBotUserData(param1:int) : class_3259
      {
         return getUserDataByType(param1,4);
      }
      
      public function requestPetInfo(param1:int) : void
      {
         var _loc2_:class_3259 = getPetUserData(param1);
         if(_loc2_ != null && _connection != null)
         {
            _connection.send(new class_630(_loc2_.webID));
         }
      }
      
      public function getAllUserIds() : Array
      {
         var _loc2_:* = [];
         for each(var _loc1_ in var_2228)
         {
            _loc2_.push(_loc1_.webID);
         }
         return _loc2_;
      }
   }
}
