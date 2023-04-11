package com.sulake.habbo.ui.widget.effects
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IScrollableListWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.handler.class_3396;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.memenu.class_3289;
   import com.sulake.habbo.window.class_1684;
   import flash.geom.Rectangle;
   
   public class EffectsWidget extends RoomWidgetBase
   {
      
      private static const LIST_HEIGHT_MAX:int = 320;
      
      private static const LIST_HEIGHT_MIN:int = 48;
      
      private static const TOOLBAR_MARGIN:int = 2;
       
      
      private var var_1430:class_3151;
      
      private var var_19:IScrollableListWindow;
      
      private var var_1909:class_24;
      
      public function EffectsWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21)
      {
         super(param1,param2,param3);
         this.handler.widget = this;
         var_1909 = new class_24();
      }
      
      public function get handler() : class_3396
      {
         return var_1453 as class_3396;
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(var_1909)
         {
            for each(var _loc1_ in var_1909)
            {
               _loc1_.dispose();
            }
            var_1909.dispose();
            var_1909 = null;
         }
         var_19 = null;
         if(var_1430)
         {
            var_1430.dispose();
            var_1430 = null;
         }
         super.dispose();
      }
      
      public function open() : void
      {
         var _loc2_:XmlAsset = null;
         var _loc1_:Rectangle = null;
         var _loc3_:class_3127 = null;
         if(!var_1430)
         {
            _loc2_ = assets.getAssetByName("effects_widget") as XmlAsset;
            var_1430 = windowManager.buildFromXML(_loc2_.content as XML) as class_3151;
            _loc1_ = handler.container.toolbar.getRect();
            var_1430.x = _loc1_.right + 2;
            var_1430.y = _loc1_.bottom - 0;
            var_19 = var_1430.findChildByName("list") as IScrollableListWindow;
            _loc3_ = var_1430.findChildByName("close");
            _loc3_.addEventListener("WME_CLICK",onClose);
         }
         update();
         var_1430.visible = true;
      }
      
      public function update() : void
      {
         var _loc1_:EffectView = null;
         var _loc4_:int = 0;
         var _loc2_:Array = this.handler.container.inventory.getAvatarEffects();
         for each(var _loc3_ in _loc2_)
         {
            _loc1_ = var_1909.getValue(_loc3_.type) as EffectView;
            if(_loc1_)
            {
               _loc1_.update();
            }
            else
            {
               _loc1_ = new EffectView(this,_loc3_);
               var_1909.add(_loc3_.type,_loc1_);
               var_19.addListItem(_loc1_.window);
            }
         }
         _loc4_ = -1;
         while(_loc4_ >= 0)
         {
            _loc1_ = var_1909.getWithIndex(_loc4_);
            if(_loc2_.indexOf(_loc1_.effect) == -1)
            {
               var_19.removeListItem(_loc1_.window);
               var_1909.remove(var_1909.getKey(_loc4_));
               _loc1_.dispose();
            }
            _loc4_--;
         }
         var _loc5_:int = int(var_19.scrollableRegion.height);
         var_19.height = Math.max(Math.min(_loc5_,320),48);
         var_1430.findChildByName("no_effects").visible = _loc2_.length == 0;
      }
      
      public function selectEffect(param1:int, param2:Boolean) : void
      {
         if(param2)
         {
            handler.container.inventory.setEffectDeselected(param1);
         }
         else
         {
            handler.container.inventory.setEffectSelected(param1);
         }
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         var_1430.visible = false;
      }
   }
}
