package com.sulake.core.runtime
{
   public class ComponentDependency
   {
       
      
      private var var_328:com.sulake.core.runtime.IID;
      
      private var var_792:Function;
      
      private var var_866:Boolean;
      
      private var _eventListeners:Array;
      
      public function ComponentDependency(param1:com.sulake.core.runtime.IID, param2:Function, param3:Boolean = true, param4:Array = null)
      {
         super();
         var_328 = param1;
         var_792 = param2;
         var_866 = param3;
         _eventListeners = param4;
      }
      
      internal function get identifier() : com.sulake.core.runtime.IID
      {
         return var_328;
      }
      
      internal function get dependencySetter() : Function
      {
         return var_792;
      }
      
      internal function get isRequired() : Boolean
      {
         return var_866;
      }
      
      internal function get eventListeners() : Array
      {
         return _eventListeners;
      }
   }
}
