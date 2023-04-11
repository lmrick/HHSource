package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var var_247:String;
      
      private var var_3196:String;
      
      private var var_632:String;
      
      private var var_3717:String;
      
      private var var_2092:Number = 1;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         var_247 = String(param1.@id);
         var_3196 = String(param1.@align);
         var_632 = String(param1.@base);
         var_3717 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            var_2092 = Number(_loc2_);
            if(var_2092 > 1)
            {
               var_2092 /= 100;
            }
         }
      }
      
      public function get id() : String
      {
         return var_247;
      }
      
      public function get align() : String
      {
         return var_3196;
      }
      
      public function get base() : String
      {
         return var_632;
      }
      
      public function get ink() : String
      {
         return var_3717;
      }
      
      public function get blend() : Number
      {
         return var_2092;
      }
      
      public function get isBlended() : Boolean
      {
         return var_2092 != 1;
      }
   }
}
