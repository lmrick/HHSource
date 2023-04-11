package com.sulake.habbo.avatar.structure.animation
{
   public class AnimationFrame
   {
       
      
      private var var_3343:int;
      
      private var _assetPartDefinition:String;
      
      public function AnimationFrame(param1:XML)
      {
         super();
         var_3343 = parseInt(param1.@number);
         _assetPartDefinition = param1.@assetpartdefinition;
      }
      
      public function get number() : int
      {
         return var_3343;
      }
      
      public function get assetPartDefinition() : String
      {
         return _assetPartDefinition;
      }
   }
}
