package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDataProvider;
   
   public class EffectListProxy implements IThumbListDataProvider
   {
       
      
      private var var_1443:com.sulake.habbo.inventory.effects.EffectsModel;
      
      private var var_979:int;
      
      public function EffectListProxy(param1:com.sulake.habbo.inventory.effects.EffectsModel, param2:int)
      {
         super();
         var_1443 = param1;
         var_979 = param2;
      }
      
      public function dispose() : void
      {
         var_1443 = null;
      }
      
      public function getDrawableList() : Array
      {
         return var_1443.getEffects(var_979);
      }
   }
}
