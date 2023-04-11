package com.sulake.habbo.avatar.pets
{
   public class PetCustomPart
   {
       
      
      private var var_3326:int;
      
      private var var_896:int;
      
      private var var_785:int;
      
      public function PetCustomPart(param1:int, param2:int, param3:int)
      {
         super();
         var_3326 = param1;
         var_896 = param2;
         var_785 = param3;
      }
      
      public function get paletteId() : int
      {
         return var_785;
      }
      
      public function set paletteId(param1:int) : void
      {
         var_785 = param1;
      }
      
      public function get partId() : int
      {
         return var_896;
      }
      
      public function set partId(param1:int) : void
      {
         var_896 = param1;
      }
      
      public function get layerId() : int
      {
         return var_3326;
      }
      
      public function set layerId(param1:int) : void
      {
         var_3326 = param1;
      }
   }
}
