package com.sulake.habbo.ui.widget.events
{
   public class ChooserItem
   {
       
      
      private var var_247:int;
      
      private var var_774:int;
      
      private var _name:String;
      
      public function ChooserItem(param1:int, param2:int, param3:String)
      {
         super();
         var_247 = param1;
         var_774 = param2;
         _name = param3;
      }
      
      public function get id() : int
      {
         return var_247;
      }
      
      public function get category() : int
      {
         return var_774;
      }
      
      public function get name() : String
      {
         return _name;
      }
   }
}
