package com.sulake.habbo.room.object.visualization.room.utils
{
   public class Randomizer
   {
      
      public static const DEFAULT_SEED:int = 1;
      
      public static const DEFAULT_MODULUS:int = 16777216;
      
      private static var var_1707:com.sulake.habbo.room.object.visualization.room.utils.Randomizer = null;
       
      
      private var var_3444:int = 1;
      
      private var _modulus:int = 16777216;
      
      private var var_4318:int = 69069;
      
      private var _increment:int = 5;
      
      public function Randomizer()
      {
         super();
      }
      
      public static function setSeed(param1:int = 1) : void
      {
         if(var_1707 == null)
         {
            var_1707 = new com.sulake.habbo.room.object.visualization.room.utils.Randomizer();
         }
         var_1707.seed = param1;
      }
      
      public static function setModulus(param1:int = 16777216) : void
      {
         if(var_1707 == null)
         {
            var_1707 = new com.sulake.habbo.room.object.visualization.room.utils.Randomizer();
         }
         var_1707.modulus = param1;
      }
      
      public static function getValues(param1:int, param2:int, param3:int) : Array
      {
         if(var_1707 == null)
         {
            var_1707 = new com.sulake.habbo.room.object.visualization.room.utils.Randomizer();
         }
         return var_1707.getRandomValues(param1,param2,param3);
      }
      
      public static function getArray(param1:int, param2:int) : Array
      {
         if(var_1707 == null)
         {
            var_1707 = new com.sulake.habbo.room.object.visualization.room.utils.Randomizer();
         }
         return var_1707.getRandomArray(param1,param2);
      }
      
      public function set seed(param1:int) : void
      {
         var_3444 = param1;
      }
      
      public function set modulus(param1:int) : void
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         _modulus = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getRandomValues(param1:int, param2:int, param3:int) : Array
      {
         var _loc4_:int = 0;
         var _loc5_:* = [];
         _loc4_ = 0;
         while(_loc4_ < param1)
         {
            _loc5_.push(iterateScaled(param2,param3 - param2));
            _loc4_++;
         }
         return _loc5_;
      }
      
      public function getRandomArray(param1:int, param2:int) : Array
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         if(param1 > param2 || param2 > 1000)
         {
            return null;
         }
         var _loc3_:* = [];
         _loc4_ = 0;
         while(_loc4_ <= param2)
         {
            _loc3_.push(_loc4_);
            _loc4_++;
         }
         var _loc7_:* = [];
         _loc6_ = 0;
         while(_loc6_ < param1)
         {
            _loc5_ = iterateScaled(0,_loc3_.length - 1);
            _loc7_.push(_loc3_[_loc5_]);
            _loc3_.splice(_loc5_,1);
            _loc6_++;
         }
         return _loc7_;
      }
      
      private function iterate() : int
      {
         var _loc1_:int = var_4318 * var_3444 + _increment;
         if(_loc1_ < 0)
         {
            _loc1_ = -_loc1_;
         }
         _loc1_ %= _modulus;
         var_3444 = _loc1_;
         return _loc1_;
      }
      
      private function iterateScaled(param1:int, param2:int) : int
      {
         var _loc3_:int = iterate();
         if(param2 < 1)
         {
            return param1;
         }
         return int(param1 + _loc3_ / _modulus * param2);
      }
   }
}
