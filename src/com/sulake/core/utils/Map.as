package com.sulake.core.utils
{
   import com.sulake.core.runtime.class_13;
   import flash.utils.Dictionary;
   import flash.utils.Proxy;
   import flash.utils.flash_proxy;
   import com.sulake.core.runtime.IDisposable;
   
   public class Map extends Proxy implements IDisposable
   {
       
      
      private var _length:uint;
      
      private var var_40:Dictionary;
      
      private var var_20:Array;
      
      private var var_50:Array;
      
      public function Map()
      {
         super();
         _length = 0;
         var_40 = new Dictionary();
         var_20 = [];
         var_50 = [];
      }
      
      public function get length() : uint
      {
         return _length;
      }
      
      public function get disposed() : Boolean
      {
         return var_40 == null;
      }
      
      public function dispose() : void
      {
         var _loc1_:Object = null;
         if(var_40 != null)
         {
            for(_loc1_ in var_40)
            {
               delete var_40[_loc1_];
            }
            var_40 = null;
         }
         _length = 0;
         var_20 = null;
         var_50 = null;
      }
      
      public function reset() : void
      {
         var _loc1_:Object = null;
         for(_loc1_ in var_40)
         {
            delete var_40[_loc1_];
         }
         _length = 0;
         var_20 = [];
         var_50 = [];
      }
      
      public function unshift(param1:*, param2:*) : Boolean
      {
         if(false)
         {
            return false;
         }
         var_40[param1] = param2;
         var_20.unshift(param2);
         var_50.unshift(param1);
         _length++;
         return true;
      }
      
      public function add(param1:*, param2:*) : Boolean
      {
         if(false)
         {
            return false;
         }
         var_40[param1] = param2;
         var_20[_length] = param2;
         var_50[_length] = param1;
         _length++;
         return true;
      }
      
      public function remove(param1:*) : *
      {
         var _loc2_:Object = var_40[param1];
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc3_:int = var_20.indexOf(_loc2_);
         if(_loc3_ >= 0)
         {
            var_20.splice(_loc3_,1);
            var_50.splice(_loc3_,1);
            _length--;
         }
         delete var_40[param1];
         return _loc2_;
      }
      
      public function getWithIndex(param1:int) : *
      {
         if(param1 < 0 || param1 >= _length)
         {
            return null;
         }
         return var_20[param1];
      }
      
      public function getKey(param1:int) : *
      {
         if(param1 < 0 || param1 >= _length)
         {
            return null;
         }
         return var_50[param1];
      }
      
      public function getKeys() : Array
      {
         return var_50.slice();
      }
      
      public function hasKey(param1:*) : Boolean
      {
         return var_50.indexOf(param1) > -1;
      }
      
      public function getValue(param1:*) : *
      {
         return var_40[param1];
      }
      
      public function getValues() : Array
      {
         return var_20.slice();
      }
      
      public function hasValue(param1:*) : Boolean
      {
         return var_20.indexOf(param1) > -1;
      }
      
      public function indexOf(param1:*) : int
      {
         return var_20.indexOf(param1);
      }
      
      public function concatenate(param1:class_24) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:Array = param1.var_50;
         for each(_loc3_ in _loc2_)
         {
            add(_loc3_,param1[_loc3_]);
         }
      }
      
      public function clone() : class_24
      {
         var _loc1_:class_24 = new class_24();
         _loc1_.concatenate(this);
         return _loc1_;
      }
      
      override flash_proxy function getProperty(param1:*) : *
      {
         if(param1 is QName)
         {
            param1 = QName(param1).localName;
         }
         return var_40[param1];
      }
      
      override flash_proxy function setProperty(param1:*, param2:*) : void
      {
         if(param1 is QName)
         {
            param1 = QName(param1).localName;
         }
         var_40[param1] = param2;
         var _loc3_:int = var_50.indexOf(param1);
         if(_loc3_ == -1)
         {
            var_20[_length] = param2;
            var_50[_length] = param1;
            _length++;
         }
         else
         {
            var_20.splice(_loc3_,1,param2);
         }
      }
      
      override flash_proxy function nextNameIndex(param1:int) : int
      {
         return param1 < _length ? param1 + 1 : 0;
      }
      
      override flash_proxy function nextName(param1:int) : String
      {
         return var_50[param1 - 1];
      }
      
      override flash_proxy function nextValue(param1:int) : *
      {
         return var_20[param1 - 1];
      }
      
      override flash_proxy function callProperty(param1:*, ... rest) : *
      {
         return param1.localName == "toString" ? "Map" : null;
      }
   }
}
