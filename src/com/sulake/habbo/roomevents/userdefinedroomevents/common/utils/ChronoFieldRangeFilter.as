package com.sulake.habbo.roomevents.userdefinedroomevents.common.utils
{
   public class ChronoFieldRangeFilter
   {
       
      
      private var _name:String;
      
      private var var_4286:Boolean;
      
      private var _min:int;
      
      private var var_4260:int;
      
      private var var_4298:int;
      
      public function ChronoFieldRangeFilter(param1:String, param2:Boolean, param3:int, param4:int, param5:int = 0)
      {
         super();
         this._name = param1;
         this.var_4286 = param2;
         this._min = param3;
         this.var_4260 = param4;
         this.var_4298 = param5;
      }
      
      public function get defaultValue() : int
      {
         return var_4298;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get useFilter() : Boolean
      {
         return var_4286;
      }
      
      public function get min() : int
      {
         return _min;
      }
      
      public function get max() : int
      {
         return var_4260;
      }
   }
}
