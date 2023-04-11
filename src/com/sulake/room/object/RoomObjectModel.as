package com.sulake.room.object
{
   import com.sulake.core.utils.class_24;
   import flash.utils.Dictionary;
   import com.sulake.core.utils.Map;
   
   public class RoomObjectModel implements IRoomObjectModelController
   {
      
      private static const MAP_KEYS_PREFIX:String = "ROMC_MAP_KEYS_";
      
      private static const MAP_VALUES_PREFIX:String = "ROMC_MAP_VALUES_";
       
      
      private var var_2027:Dictionary;
      
      private var var_2100:Dictionary;
      
      private var var_2051:Dictionary;
      
      private var var_2089:Dictionary;
      
      private var var_2902:Array;
      
      private var var_2923:Array;
      
      private var var_2915:Array;
      
      private var var_3007:Array;
      
      private var var_1454:int;
      
      public function RoomObjectModel()
      {
         super();
         var_2027 = new Dictionary();
         var_2100 = new Dictionary();
         var_2051 = new Dictionary();
         var_2089 = new Dictionary();
         var_2902 = [];
         var_2923 = [];
         var_2915 = [];
         var_3007 = [];
         var_1454 = 0;
      }
      
      public function dispose() : void
      {
         var _loc1_:String = null;
         if(var_2027 != null)
         {
            for(_loc1_ in var_2027)
            {
               delete var_2027[_loc1_];
            }
            var_2027 = null;
         }
         if(var_2100 != null)
         {
            for(_loc1_ in var_2100)
            {
               delete var_2100[_loc1_];
            }
            var_2100 = null;
         }
         if(var_2051 != null)
         {
            for(_loc1_ in var_2051)
            {
               delete var_2051[_loc1_];
            }
            var_2051 = null;
         }
         if(var_2089 != null)
         {
            for(_loc1_ in var_2089)
            {
               delete var_2089[_loc1_];
            }
            var_2089 = null;
         }
         var_2923 = [];
         var_2902 = [];
         var_3007 = [];
         var_2915 = [];
      }
      
      public function hasNumber(param1:String) : Boolean
      {
         return false;
      }
      
      public function hasNumberArray(param1:String) : Boolean
      {
         return false;
      }
      
      public function hasString(param1:String) : Boolean
      {
         return false;
      }
      
      public function hasStringArray(param1:String) : Boolean
      {
         return false;
      }
      
      public function getNumber(param1:String) : Number
      {
         return var_2027[param1];
      }
      
      public function getString(param1:String) : String
      {
         return var_2100[param1];
      }
      
      public function getNumberArray(param1:String) : Array
      {
         var _loc2_:Array = var_2051[param1];
         if(_loc2_ != null)
         {
            _loc2_ = _loc2_.slice();
         }
         return _loc2_;
      }
      
      public function getStringArray(param1:String) : Array
      {
         var _loc2_:Array = var_2089[param1];
         if(_loc2_ != null)
         {
            _loc2_ = _loc2_.slice();
         }
         return _loc2_;
      }
      
      public function getStringToStringMap(param1:String) : Map
      {
         var _loc4_:int = 0;
         var _loc5_:Map = new class_24();
         var _loc2_:Array = getStringArray("ROMC_MAP_KEYS_" + param1);
         var _loc3_:Array = getStringArray("ROMC_MAP_VALUES_" + param1);
         if(_loc2_ != null && _loc3_ != null && _loc2_.length == _loc3_.length)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc2_.length)
            {
               _loc5_.add(_loc2_[_loc4_],_loc3_[_loc4_]);
               _loc4_++;
            }
         }
         return _loc5_;
      }
      
      public function setNumber(param1:String, param2:Number, param3:Boolean = false) : void
      {
         if(var_2902.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            var_2902.push(param1);
         }
         if(var_2027[param1] != param2)
         {
            var_2027[param1] = param2;
            var_1454++;
         }
      }
      
      public function setString(param1:String, param2:String, param3:Boolean = false) : void
      {
         if(var_2923.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            var_2923.push(param1);
         }
         if(var_2100[param1] != param2)
         {
            var_2100[param1] = param2;
            var_1454++;
         }
      }
      
      public function setNumberArray(param1:String, param2:Array, param3:Boolean = false) : void
      {
         if(param2 == null)
         {
            return;
         }
         if(var_2915.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            var_2915.push(param1);
         }
         var _loc6_:* = [];
         var _loc7_:int = 0;
         _loc7_ = 0;
         while(_loc7_ < param2.length)
         {
            if(param2[_loc7_] is Number)
            {
               _loc6_.push(param2[_loc7_]);
            }
            _loc7_++;
         }
         var _loc5_:Array = var_2051[param1];
         var _loc4_:Boolean = true;
         if(_loc5_ != null && _loc5_.length == _loc6_.length)
         {
            _loc7_ = _loc6_.length - 1;
            while(_loc7_ >= 0)
            {
               if(_loc6_[_loc7_] as Number != _loc5_[_loc7_] as Number)
               {
                  _loc4_ = false;
                  break;
               }
               _loc7_--;
            }
         }
         else
         {
            _loc4_ = false;
         }
         if(_loc4_)
         {
            return;
         }
         var_2051[param1] = _loc6_;
         var_1454++;
      }
      
      public function setStringArray(param1:String, param2:Array, param3:Boolean = false) : void
      {
         if(param2 == null)
         {
            return;
         }
         if(var_3007.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            var_3007.push(param1);
         }
         var _loc6_:* = [];
         var _loc7_:int = 0;
         _loc7_ = 0;
         while(_loc7_ < param2.length)
         {
            if(param2[_loc7_] is String)
            {
               _loc6_.push(param2[_loc7_]);
            }
            _loc7_++;
         }
         var _loc5_:Array = var_2089[param1];
         var _loc4_:Boolean = true;
         if(_loc5_ != null && _loc5_.length == _loc6_.length)
         {
            _loc7_ = _loc6_.length - 1;
            while(_loc7_ >= 0)
            {
               if(_loc6_[_loc7_] as String != _loc5_[_loc7_] as String)
               {
                  _loc4_ = false;
                  break;
               }
               _loc7_--;
            }
         }
         else
         {
            _loc4_ = false;
         }
         if(_loc4_)
         {
            return;
         }
         var_2089[param1] = _loc6_;
         var_1454++;
      }
      
      public function setStringToStringMap(param1:String, param2:Map, param3:Boolean = false) : void
      {
         if(param2 == null)
         {
            return;
         }
         setStringArray("ROMC_MAP_KEYS_" + param1,param2.getKeys(),param3);
         setStringArray("ROMC_MAP_VALUES_" + param1,param2.getValues(),param3);
      }
      
      public function getUpdateID() : int
      {
         return var_1454;
      }
   }
}
