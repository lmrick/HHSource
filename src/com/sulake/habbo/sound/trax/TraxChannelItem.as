package com.sulake.habbo.sound.trax
{
   public class TraxChannelItem
   {
       
      
      private var var_247:int;
      
      private var _length:int;
      
      public function TraxChannelItem(param1:int, param2:int)
      {
         super();
         var_247 = param1;
         _length = param2;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get length() : int
      {
         return _length;
      }
   }
}
