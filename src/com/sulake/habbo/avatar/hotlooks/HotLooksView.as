package com.sulake.habbo.avatar.hotlooks
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.avatar.common.class_3414;
   import com.sulake.habbo.avatar.wardrobe.Outfit;
   
   public class HotLooksView implements class_3414
   {
       
      
      private var _window:class_3151;
      
      private var var_1443:com.sulake.habbo.avatar.hotlooks.HotLooksModel;
      
      private var var_2531:IItemGridWindow;
      
      public function HotLooksView(param1:com.sulake.habbo.avatar.hotlooks.HotLooksModel)
      {
         super();
         var_1443 = param1;
      }
      
      public function init() : void
      {
         if(var_2531)
         {
            var_2531.removeGridItems();
         }
         if(!_window)
         {
            _window = var_1443.controller.view.getCategoryContainer("hotlooks") as class_3151;
            var_2531 = _window.findChildByName("hotlooks") as IItemGridWindow;
            _window.visible = false;
         }
         update();
      }
      
      public function dispose() : void
      {
         var_2531.removeGridItems();
         _window = null;
         var_1443 = null;
      }
      
      public function update() : void
      {
         var _loc2_:class_3127 = null;
         var_2531.removeGridItems();
         for each(var _loc1_ in var_1443.hotLooks)
         {
            _loc2_ = _loc1_.view.window;
            var_2531.addGridItem(_loc2_);
            _loc2_.procedure = hotLooksEventProc;
         }
      }
      
      public function getWindowContainer() : class_3151
      {
         return _window;
      }
      
      private function hotLooksEventProc(param1:class_3134, param2:class_3127 = null) : void
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            param2 = param1.target as class_3127;
         }
         if(param1.type == "WME_CLICK")
         {
            _loc3_ = var_2531.getGridItemIndex(param2.parent);
            var_1443.selectHotLook(_loc3_);
         }
      }
      
      public function switchCategory(param1:String) : void
      {
      }
      
      public function showPalettes(param1:String, param2:int) : void
      {
      }
      
      public function reset() : void
      {
      }
   }
}
