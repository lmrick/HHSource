package com.sulake.habbo.navigator.view
{
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3213;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.navigator.HabboNewNavigator;
   import flash.utils.getTimer;
   
   public class LiftView implements class_41
   {
      
      private static const AUTO_CYCLE_TIMEOUT_MS:uint = 8000;
       
      
      private var _navigator:HabboNewNavigator;
      
      private var var_3090:class_3213;
      
      private var var_2910:IItemListWindow;
      
      private var var_3953:IRegionWindow;
      
      private var var_1616:int = -1;
      
      private var var_2646:uint;
      
      public function LiftView(param1:HabboNewNavigator)
      {
         var_2646 = getTimer();
         super();
         _navigator = param1;
         _navigator.registerUpdateReceiver(this,1000);
      }
      
      public function dispose() : void
      {
         _navigator.removeUpdateReceiver(this);
         _navigator = null;
      }
      
      public function get disposed() : Boolean
      {
         return _navigator == null;
      }
      
      public function set pagerIconTemplate(param1:IRegionWindow) : void
      {
         var_3953 = param1;
      }
      
      public function set borderWindow(param1:class_3213) : void
      {
         var_3090 = param1;
         var_2910 = IItemListWindow(var_3090.findChildByName("pager_itemlist"));
         IRegionWindow(var_3090.findChildByName("room_image_click_region")).procedure = goToRoomRegionProcedure;
      }
      
      public function refresh(param1:Boolean = true) : void
      {
         var _loc2_:int = 0;
         var_2910.destroyListItems();
         var_1616 = param1 ? 0 : var_1616;
         _loc2_ = 0;
         while(_loc2_ < _navigator.liftDataContainer.liftedRooms.length)
         {
            var_2910.addListItem(var_3953.clone());
            _loc2_++;
         }
         setPagerToSelectedPage();
         drawSelectedPage();
      }
      
      private function setPagerToSelectedPage() : void
      {
         var _loc1_:int = 0;
         var _loc2_:IRegionWindow = null;
         _loc1_ = 0;
         while(_loc1_ < var_2910.numListItems)
         {
            _loc2_ = IRegionWindow(var_2910.getListItemAt(_loc1_));
            IStaticBitmapWrapperWindow(_loc2_.findChildByName("icon")).assetUri = _loc1_ == var_1616 ? "progress_disk_flat_on" : "progress_disk_flat_off";
            _loc2_.id = _loc1_;
            _loc2_.procedure = pagerPageProcedure;
            _loc1_++;
         }
      }
      
      private function drawSelectedPage() : void
      {
         setPagerToSelectedPage();
         IStaticBitmapWrapperWindow(var_3090.findChildByName("room_image")).assetUri = _navigator.liftDataContainer.getUrlForLiftImageAtIndex(var_1616);
         if(var_1616 < _navigator.liftDataContainer.liftedRooms.length)
         {
            var_3090.findChildByName("caption_text").caption = _navigator.liftDataContainer.liftedRooms[var_1616].caption;
         }
      }
      
      private function autoCycleToNextPage() : void
      {
         var_1616++;
         if(var_1616 > _navigator.liftDataContainer.liftedRooms.length - 1)
         {
            var_1616 = 0;
         }
         refresh(false);
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:uint = uint(getTimer());
         if(var_2646 + 8000 < _loc2_)
         {
            autoCycleToNextPage();
            var_2646 = _loc2_;
         }
      }
      
      private function pagerPageProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            if(param2.id != var_1616)
            {
               var_1616 = param2.id;
               drawSelectedPage();
               var_2646 = getTimer();
               _navigator.trackEventLog("browse.promotion","Promotion","",var_1616);
            }
         }
      }
      
      private function goToRoomRegionProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            if(_navigator.liftDataContainer.liftedRooms.length > var_1616)
            {
               _navigator.goToRoom(_navigator.liftDataContainer.liftedRooms[var_1616].flatId,"promotion");
            }
         }
      }
   }
}
