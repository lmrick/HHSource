package com.sulake.habbo.ui.widget.infostand
{
   import flash.utils.Dictionary;
   
   public class CommandConfiguration
   {
       
      
      private var var_4166:Array;
      
      private var var_243:Dictionary;
      
      public function CommandConfiguration(param1:Array, param2:Array)
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var_243 = new Dictionary();
         super();
         var_4166 = param1;
         while(_loc3_ < param2.length)
         {
            _loc4_ = int(param2[_loc3_]);
            var_243[_loc4_] = true;
            _loc3_++;
         }
      }
      
      public function get allCommandIds() : Array
      {
         return var_4166;
      }
      
      public function isEnabled(param1:int) : Boolean
      {
         return false;
      }
   }
}
