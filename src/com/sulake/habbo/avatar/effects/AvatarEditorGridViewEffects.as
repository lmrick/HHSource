package com.sulake.habbo.avatar.effects
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.avatar.class_3356;
   import com.sulake.habbo.avatar.common.*;
   
   public class AvatarEditorGridViewEffects implements class_3392
   {
       
      
      private var var_1430:class_3151;
      
      private var var_3960:Boolean = true;
      
      private var var_1443:class_3319;
      
      private var var_415:String;
      
      private var var_1858:IItemGridWindow;
      
      private var _effectItems:Vector.<com.sulake.habbo.avatar.effects.AvatarEditorGridItemEffect>;
      
      private var _notification:class_3127;
      
      private var var_462:class_3127;
      
      public function AvatarEditorGridViewEffects(param1:class_3151)
      {
         super();
         var_1430 = param1;
         var_1858 = var_1430.findChildByName("thumbs") as IItemGridWindow;
         _notification = var_1430.findChildByName("content_notification");
         var_462 = var_1430.findChildByName("content_title");
      }
      
      public function dispose() : void
      {
         if(var_1858)
         {
            var_1858.dispose();
            var_1858 = null;
         }
         var_1443 = null;
         if(var_1430)
         {
            var_1430.dispose();
            var_1430 = null;
         }
      }
      
      public function get window() : class_3151
      {
         return var_1430;
      }
      
      public function initFromList(param1:class_3319, param2:String) : void
      {
         var _loc5_:com.sulake.habbo.avatar.effects.AvatarEditorGridItemEffect = null;
         var_1443 = param1;
         var_415 = param2;
         var_1430.visible = true;
         var _loc3_:Array = EffectsModel(var_1443).effects;
         var_1858.removeGridItems();
         _effectItems = new Vector.<com.sulake.habbo.avatar.effects.AvatarEditorGridItemEffect>();
         if(_loc3_.length == 0)
         {
            var_462.visible = true;
            _notification.visible = true;
         }
         else
         {
            _notification.visible = false;
            var_462.visible = false;
            _loc5_ = new com.sulake.habbo.avatar.effects.AvatarEditorGridItemEffect(null,var_1443.controller.manager.windowManager,var_1443.controller.manager.assets);
            addGridItem(_loc5_);
            for each(var _loc4_ in _loc3_)
            {
               _loc5_ = new com.sulake.habbo.avatar.effects.AvatarEditorGridItemEffect(_loc4_,var_1443.controller.manager.windowManager,var_1443.controller.manager.assets);
               addGridItem(_loc5_);
            }
         }
         showPalettes(0);
         var_3960 = false;
      }
      
      private function addGridItem(param1:com.sulake.habbo.avatar.effects.AvatarEditorGridItemEffect) : void
      {
         param1.window.procedure = partEventProc;
         _effectItems.push(param1);
         var_1858.addGridItem(param1.window);
      }
      
      public function showPalettes(param1:int) : void
      {
         var _loc3_:class_3127 = var_1430.findChildByName("palette0");
         var _loc2_:class_3127 = var_1430.findChildByName("palette1");
         _loc3_.visible = false;
         _loc2_.visible = false;
      }
      
      public function get firstView() : Boolean
      {
         return var_3960;
      }
      
      public function updateSelection(param1:int, param2:Boolean) : void
      {
         if(param1 >= 0 && param1 < _effectItems.length)
         {
            _effectItems[param1].selected = param2;
         }
      }
      
      public function getGridIndex(param1:int) : int
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < _effectItems.length)
         {
            if(_effectItems[_loc2_].effectType == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      private function partEventProc(param1:class_3134, param2:class_3127) : void
      {
         var _loc3_:int = 0;
         if(param1.type == "WME_DOWN")
         {
            _loc3_ = var_1858.getGridItemIndex(param1.window);
            var_1443.selectPart(var_415,_loc3_);
         }
      }
   }
}
