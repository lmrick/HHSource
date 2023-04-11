package com.sulake.core.runtime
{

   internal class class_1528 implements class_13
   {
       
      
      private var var_328:com.sulake.core.runtime.IID;
      
      private var var_311:Boolean;
      
      private var _receivers:Vector.<Function>;
      
      public function class_1528(param1:com.sulake.core.runtime.IID)
      {
         super();
         var_328 = param1;
         _receivers = new Vector.<Function>();
         var_311 = false;
      }
      
      public function get identifier() : com.sulake.core.runtime.IID
      {
         return var_328;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      public function get receivers() : Vector.<Function>
      {
         return _receivers;
      }
      
      public function dispose() : void
      {
         if(!var_311)
         {
            var_311 = true;
            var_328 = null;
            while(false)
            {
               _receivers.pop();
            }
            _receivers = null;
         }
      }
   }
}
