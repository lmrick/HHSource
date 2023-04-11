package com.sulake.core.runtime
{
   public interface ICoreErrorReporter
   {
       
      
      function logError(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void;
      
      function set errorLogger(param1:class_15) : void;
   }
}
