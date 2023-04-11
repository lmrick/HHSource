package com.sulake.habbo.avatar.effects
{
   import com.sulake.core.window.class_3151;
   import com.sulake.habbo.avatar.common.CategoryBaseView;
   import com.sulake.habbo.avatar.common.class_3319;
   import com.sulake.habbo.avatar.common.class_3414;
   
   public class EffectsView extends CategoryBaseView implements class_3414
   {
       
      
      public function EffectsView(param1:class_3319)
      {
         super(param1);
      }
      
      override public function init() : void
      {
         if(!_window)
         {
            _window = var_1443.controller.view.getCategoryContainer("effects") as class_3151;
            _window.visible = false;
         }
         if(var_1443 && var_1508 == "")
         {
            var_1443.switchCategory("effects");
         }
         var_1420 = true;
         updateGridView(var_1508);
      }
      
      override public function reset() : void
      {
         updateGridView(var_1508);
         var_1443.selectPart(var_1508,-1);
      }
      
      public function switchCategory(param1:String) : void
      {
         if(_window == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         param1 = param1 == "" ? var_1508 : param1;
         var_1508 = param1;
         if(!var_1420)
         {
            init();
         }
         updateGridView(var_1508);
      }
      
      public function updateSelectionVisual(param1:String, param2:int, param3:Boolean) : void
      {
         AvatarEditorGridViewEffects(var_1443.controller.view.effectsGridView).updateSelection(param2,param3);
      }
      
      public function getGridIndex(param1:int) : int
      {
         return AvatarEditorGridViewEffects(var_1443.controller.view.effectsGridView).getGridIndex(param1);
      }
      
      override protected function updateGridView(param1:String) : void
      {
         var_1443.controller.view.effectsGridView.initFromList(var_1443,param1);
      }
   }
}
