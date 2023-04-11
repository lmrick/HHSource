package com.sulake.habbo.avatar.wardrobe
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.habbo.avatar.common.ISideContentView;
   
   public class WardrobeView implements ISideContentView
   {
       
      
      private var _window:class_3151;
      
      private var var_1443:com.sulake.habbo.avatar.wardrobe.WardrobeModel;
      
      private var var_2622:IItemListWindow;
      
      private var var_3134:IItemListWindow;
      
      private var var_3212:class_3127;
      
      public function WardrobeView(param1:com.sulake.habbo.avatar.wardrobe.WardrobeModel)
      {
         super();
         var_1443 = param1;
         var _loc2_:XmlAsset = var_1443.controller.manager.assets.getAssetByName("avatareditor_wardrobe_base") as XmlAsset;
         _window = var_1443.controller.manager.windowManager.buildFromXML(_loc2_.content as XML) as class_3151;
         var_2622 = _window.findChildByName("hc_slots") as IItemListWindow;
         var_3134 = _window.findChildByName("vip_slots") as IItemListWindow;
         var_3212 = _window.findChildByName("slot_template");
         if(var_3212)
         {
            _window.removeChild(var_3212);
         }
         _window.visible = false;
      }
      
      public function get slotWindowTemplate() : class_3127
      {
         return var_3212;
      }
      
      public function dispose() : void
      {
         var_1443 = null;
         var_2622 = null;
       
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function update() : void
      {
         var _loc3_:WardrobeSlot = null;
         var _loc2_:int = 0;
      
         if(var_2622)
         {
            var_2622.removeListItems();
         }
      
         if(var_3134)
         {
            var_3134.removeListItems();
         }
       
         var _loc1_:Array = var_1443.slots;
         _loc2_ = 0;
      
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = _loc1_[_loc2_];
          
            if(_loc2_ < 5)
            {
               if(var_2622)
               {
                  var_2622.addListItem(_loc3_.view);
                  _loc3_.view.visible = true;
               }
            }
         
            else if(var_3134)
            {
               var_3134.addListItem(_loc3_.view);
               _loc3_.view.visible = true;
            }
            _loc2_++;
         }
      }
      
      public function getWindowContainer() : class_3151
      {
         return _window;
      }

   }
}
