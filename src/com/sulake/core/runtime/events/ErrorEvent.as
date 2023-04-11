package com.sulake.core.runtime.events
{
   public class ErrorEvent extends WarningEvent
   {
       
      
      protected var var_774:int;
      
      protected var var_1151:Boolean;
      
      protected var var_161:Error;
      
      public function ErrorEvent(param1:String, param2:String, param3:Boolean, param4:int, param5:Error = null)
      {
         var_1151 = param3;
         var_774 = param4;
         var_161 = param5;
         super(param1,param2);
      }
      
      public function get category() : int
      {
         return var_774;
      }
      
      public function get critical() : Boolean
      {
         return var_1151;
      }
      
      public function get error() : Error
      {
         return var_161;
      }
   }
}
