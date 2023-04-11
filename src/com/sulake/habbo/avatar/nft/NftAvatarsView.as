package com.sulake.habbo.avatar.nft
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.avatar.common.class_3414;
   import com.sulake.habbo.avatar.wardrobe.NftOutfit;
   
   public class NftAvatarsView implements class_3414
   {
       
      
      private var _window:class_3151;
      
      private var var_1443:com.sulake.habbo.avatar.nft.NftAvatarsModel;
      
      private var var_2533:IItemGridWindow;
      
      public function NftAvatarsView(param1:com.sulake.habbo.avatar.nft.NftAvatarsModel)
      {
         super();
         var_1443 = param1;
      }
      
      public function init() : void
      {
         if(var_2533)
         {
            var_2533.removeGridItems();
         }
         if(!_window)
         {
            _window = var_1443.controller.view.getCategoryContainer("nfts") as class_3151;
            var_2533 = _window.findChildByName("nfts") as IItemGridWindow;
            _window.visible = false;
         }
         update();
      }
      
      public function dispose() : void
      {
         var_2533.removeGridItems();
         _window = null;
         var_1443 = null;
      }
      
      public function update() : void
      {
         var _loc2_:class_3127 = null;
         var_2533.removeGridItems();
         for each(var _loc1_ in var_1443.nftAvatars)
         {
            _loc2_ = _loc1_.view.window;
            var_2533.addGridItem(_loc2_);
            _loc2_.procedure = nftAvatarsEventProc;
         }
      }
      
      public function getWindowContainer() : class_3151
      {
         return _window;
      }
      
      private function nftAvatarsEventProc(param1:class_3134, param2:class_3127 = null) : void
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            param2 = param1.target as class_3127;
         }
         if(param1.type == "WME_CLICK")
         {
            _loc3_ = var_2533.getGridItemIndex(param2.parent);
            var_1443.selectNftAvatar(_loc3_);
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
