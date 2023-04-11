package com.sulake.habbo.avatar.structure.parts
{
   public class ActivePartSet
   {
       
      
      private var var_247:String;
      
      private var var_1668:Array;
      
      public function ActivePartSet(param1:XML)
      {
         super();
         var_247 = String(param1.@id);
         var_1668 = [];
         for each(var _loc2_ in param1.activePart)
         {
            var_1668.push(String(_loc2_["set-type"]));
         }
      }
      
      public function get parts() : Array
      {
         return var_1668;
      }
   }
}
