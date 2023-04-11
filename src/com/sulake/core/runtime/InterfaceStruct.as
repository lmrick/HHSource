package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   internal final class InterfaceStruct implements class_13
   {
       
      
      private var var_320:com.sulake.core.runtime.IID;
      
      private var _iis:String;
      
      private var var_17:com.sulake.core.runtime.IUnknown;
      
      private var var_95:uint;
      
      public function InterfaceStruct(param1:com.sulake.core.runtime.IID, param2:com.sulake.core.runtime.IUnknown)
      {
         super();
         var_320 = param1;
         _iis = getQualifiedClassName(var_320);
         var_17 = param2;
         var_95 = 0;
      }
      
      public function get iid() : com.sulake.core.runtime.IID
      {
         return var_320;
      }
      
      public function get iis() : String
      {
         return _iis;
      }
      
      public function get unknown() : com.sulake.core.runtime.IUnknown
      {
         return var_17;
      }
      
      public function get references() : uint
      {
         return var_95;
      }
      
      public function get disposed() : Boolean
      {
         return var_17 == null;
      }
      
      public function dispose() : void
      {
         var_320 = null;
         _iis = null;
         var_17 = null;
         var_95 = 0;
      }
      
      public function reserve() : uint
      {
         return ++var_95;
      }
      
      public function release() : uint
      {
         return references > 0 ? --var_95 : 0;
      }
   }
}
