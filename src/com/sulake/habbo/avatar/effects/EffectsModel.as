package com.sulake.habbo.avatar.effects
{
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.class_3356;
   import com.sulake.habbo.avatar.common.CategoryBaseModel;
   import com.sulake.habbo.avatar.common.class_3319;
   import com.sulake.habbo.inventory.class_3141;
   import flash.utils.Dictionary;
   
   public class EffectsModel extends CategoryBaseModel implements class_3319
   {
      
      public static const GRIDTYPE_EFFECTS:String = "effects";
       
      
      private var var_1829:Dictionary;
      
      private var var_3679:com.sulake.habbo.avatar.effects.EffectsParamView;
      
      public function EffectsModel(param1:HabboAvatarEditor)
      {
         var_1829 = new Dictionary();
         super(param1);
      }
      
      override protected function init() : void
      {
         super.init();
         var_1420 = true;
         if(!var_1430)
         {
            var_1430 = new EffectsView(this);
            var_3679 = new com.sulake.habbo.avatar.effects.EffectsParamView(this,controller.manager.windowManager,controller.manager.assets);
            if(var_1430)
            {
               var_1430.init();
            }
         }
      }
      
      public function get effects() : Array
      {
         if(controller.manager.inventory == null)
         {
            return [];
         }
         return controller.manager.inventory.getAvatarEffects();
      }
      
      override public function selectPart(param1:String, param2:int) : void
      {
         var _loc3_:class_3356 = null;
         setSelectionVisual(param1,var_1829[param1],false);
         var _loc5_:int = controller.figureData.avatarEffectType;
         if(param2 == -1 && _loc5_ != -1)
         {
            param2 = int(EffectsView(var_1430).getGridIndex(_loc5_));
            for each(var _loc4_ in effects)
            {
               if(_loc4_.type == _loc5_)
               {
                  _loc3_ = class_3356(_loc4_);
                  _loc3_.isSelected = true;
                  break;
               }
            }
         }
         else if(param2 == -1 && _loc5_ == -1 || param2 == 0)
         {
            param2 = 0;
            controller.setAvatarEffectType(-1);
            var_3679.updateView(null);
         }
         else
         {
            _loc3_ = class_3356(effects[param2 - 1]);
            _loc3_.isSelected = true;
            controller.setAvatarEffectType(_loc3_.type);
         }
         var_1829[param1] = param2;
         setSelectionVisual(param1,param2,true);
         var_3679.updateView(_loc3_);
      }
      
      private function setSelectionVisual(param1:String, param2:int, param3:Boolean) : void
      {
         EffectsView(var_1430).updateSelectionVisual(param1,param2,param3);
      }
   }
}
