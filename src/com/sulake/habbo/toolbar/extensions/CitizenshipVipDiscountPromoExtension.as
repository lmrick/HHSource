package com.sulake.habbo.toolbar.extensions
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.components.class_3213;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.inventory.events.HabboInventoryHabboClubEvent;
   import com.sulake.habbo.toolbar.HabboToolbar;
   import com.sulake.habbo.toolbar.IExtensionView;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import package_23.class_873;
   import package_49.class_898;
   
   public class CitizenshipVipDiscountPromoExtension
   {
       
      
      private var _toolbar:HabboToolbar;
      
      private var var_1430:class_3213;
      
      private var _expanded:Boolean = true;
      
      private var var_4135:int = 216;
      
      private var var_2216:Timer;
      
      public function CitizenshipVipDiscountPromoExtension(param1:HabboToolbar)
      {
         super();
         _toolbar = param1;
      }
      
      private function createWindow() : class_3213
      {
         var _loc1_:class_3213 = null;
         var _loc2_:IAsset = _toolbar.assets.getAssetByName("vip_discount_promotion_v2_xml");
         if(_loc2_)
         {
            _loc1_ = _toolbar.windowManager.buildFromXML(_loc2_.content as XML,1) as class_3213;
            if(_loc1_)
            {
               class_3140(_loc1_.findChildByName("extend_button").addEventListener("WME_CLICK",onButtonClicked));
               IRegionWindow(_loc1_.findChildByName("minimize_region")).addEventListener("WME_CLICK",onMinMax);
               IRegionWindow(_loc1_.findChildByName("maximize_region")).addEventListener("WME_CLICK",onMinMax);
               var_4135 = _loc1_.height;
            }
         }
         return _loc1_;
      }
      
      private function destroyWindow() : void
      {
         if(var_1430)
         {
            var_1430.dispose();
            var_1430 = null;
         }
         destroyExpirationTimer();
      }
      
      private function get extensionView() : IExtensionView
      {
         return _toolbar.extensionView;
      }
      
      public function dispose() : void
      {
         if(_toolbar == null)
         {
            return;
         }
         if(extensionView != null)
         {
            extensionView.detachExtension("club_promo");
         }
         destroyWindow();
         _toolbar = null;
      }
      
      private function onButtonClicked(param1:WindowMouseEvent) : void
      {
         if(_toolbar.inventory.clubLevel == 2)
         {
            _toolbar.connection.send(new class_898("DiscountPromo","citizenshipdiscount","client.club.extend.discount.clicked"));
            _toolbar.connection.send(new class_873());
         }
      }
      
      private function assignState() : void
      {
         var_1430.findChildByName("content_itemlist").visible = _expanded;
         var_1430.findChildByName("promo_img").visible = _expanded;
         var_1430.height = _expanded ? var_4135 : 33;
      }
      
      public function onClubChanged(param1:HabboInventoryHabboClubEvent) : void
      {
         if(_toolbar.inventory.citizenshipVipIsExpiring && var_1430 == null && isExtensionEnabled())
         {
            var_1430 = createWindow();
            if(var_2216 != null)
            {
               destroyExpirationTimer();
            }
            if(_toolbar.inventory.clubMinutesUntilExpiration < 1440 && _toolbar.inventory.clubMinutesUntilExpiration > 0)
            {
               var_2216 = new Timer(_toolbar.inventory.clubMinutesUntilExpiration * 60 * 1000,1);
               var_2216.addEventListener("timerComplete",onExtendOfferExpire);
               var_2216.start();
            }
            assignState();
            if(!_toolbar.extensionView.hasExtension("vip_quests"))
            {
               _toolbar.extensionView.attachExtension("club_promo",var_1430,10);
            }
         }
         else
         {
            _toolbar.extensionView.detachExtension("vip_quests");
            destroyWindow();
         }
      }
      
      private function destroyExpirationTimer() : void
      {
         if(var_2216)
         {
            var_2216.stop();
            var_2216.removeEventListener("timerComplete",onExtendOfferExpire);
            var_2216 = null;
         }
      }
      
      private function onExtendOfferExpire(param1:TimerEvent) : void
      {
         _toolbar.extensionView.detachExtension("club_promo");
         destroyWindow();
      }
      
      private function isExtensionEnabled() : Boolean
      {
         return _toolbar.inventory.clubLevel == 2 && _toolbar.getBoolean("club.membership.extend.vip.promotion.enabled");
      }
      
      private function onMinMax(param1:WindowMouseEvent) : void
      {
         _expanded = !_expanded;
         assignState();
      }
   }
}
