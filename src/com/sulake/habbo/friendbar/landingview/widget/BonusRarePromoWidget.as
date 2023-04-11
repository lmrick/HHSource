package com.sulake.habbo.friendbar.landingview.widget
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
   import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
   import com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings;
   import com.sulake.habbo.friendbar.landingview.layout.WidgetContainerLayout;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.events.RoomEngineEvent;
   import com.sulake.habbo.session.product.class_1695;
   import com.sulake.habbo.session.product.class_3200;
   import flash.display.BitmapData;
   import package_23.class_641;
   import package_8.class_1027;
   
   public class BonusRarePromoWidget implements ILandingViewWidget, class_1695, ISettingsAwareWidget, class_3158
   {
       
      
      private var _landingView:HabboLandingView;
      
      private var _container:class_3151;
      
      private var var_358:String;
      
      private var var_531:int = -1;
      
      private var _totalCoinsForBonus:int;
      
      private var var_499:int;
      
      public function BonusRarePromoWidget(param1:HabboLandingView)
      {
         super();
         _landingView = param1;
      }
      
      public function dispose() : void
      {
         if(!disposed)
         {
            _landingView.roomEngine.events.removeEventListener("REE_ENGINE_INITIALIZED",onRoomEngineInitialized);
            _landingView.communicationManager.removeHabboConnectionMessageEvent(new class_1027(onBonusRareInfoMessage));
            _landingView = null;
            _container = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _container == null;
      }
      
      public function initialize() : void
      {
         _container = class_3151(_landingView.getXmlWindow("bonus_rare_promo"));
         _container.findChildByName("buy_button").procedure = onOpenCreditsPageButton;
         _container.visible = false;
         _landingView.communicationManager.addHabboConnectionMessageEvent(new class_1027(onBonusRareInfoMessage));
         _landingView.roomEngine.events.addEventListener("REE_ENGINE_INITIALIZED",onRoomEngineInitialized);
         requestBonusRareInfo();
      }
      
      private function requestBonusRareInfo() : void
      {
         _landingView.communicationManager.connection.send(new class_641());
      }
      
      public function refresh() : void
      {
         requestBonusRareInfo();
      }
      
      public function get container() : class_3127
      {
         return _container;
      }
      
      public function productDataReady() : void
      {
         refreshContent();
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         refreshContent();
      }
      
      public function imageFailed(param1:int) : void
      {
      }
      
      private function onRoomEngineInitialized(param1:RoomEngineEvent) : void
      {
         refreshContent();
      }
      
      private function refreshContent() : void
      {
         if(disposed)
         {
            return;
         }
         _container.visible = var_531 != -1;
         var _loc1_:class_3200 = _landingView.getProductData(var_358,this);
         if(_loc1_ != null)
         {
            IStaticBitmapWrapperWindow(_container.findChildByName("promo_image")).assetUri = _landingView.getProperty("landing.view.bonus.rare.image.uri");
            _container.findChildByName("header").caption = _landingView.localizationManager.getLocalizationWithParams("landing.view.bonus.rare.header","","rarename",_loc1_.name,"amount",_totalCoinsForBonus);
            _container.findChildByName("status").caption = _landingView.localizationManager.getLocalizationWithParams("landing.view.bonus.rare.status","","amount",var_499,"total",_totalCoinsForBonus);
            setProgress(_totalCoinsForBonus - var_499,_totalCoinsForBonus);
         }
      }
      
      private function onBonusRareInfoMessage(param1:class_1027) : void
      {
         var_358 = param1.getParser().productType;
         var_531 = param1.getParser().productClassId;
         _totalCoinsForBonus = param1.getParser().totalCoinsForBonus;
         var_499 = param1.getParser().coinsStillRequiredToBuy;
         refreshContent();
      }
      
      private function onOpenCreditsPageButton(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _landingView.tracking.trackGoogle("landingView","click_bonusRarePromoOpenCreditsPage");
            _landingView.catalog.openCreditsHabblet();
         }
      }
      
      public function set settings(param1:CommonWidgetSettings) : void
      {
         WidgetContainerLayout.applyCommonWidgetSettings(_container,param1);
      }
      
      private function setProgress(param1:int, param2:int) : void
      {
         var _loc5_:int = _container.findChildByName("bar_a_bkg").width;
         var _loc4_:int = _container.findChildByName("bar_a_bkg").x;
         var _loc3_:int = param1 / param2 * _loc5_;
         _container.findChildByName("bar_a_c").width = _loc3_;
         _container.findChildByName("bar_a_r").x = _loc3_ + _loc4_;
      }
   }
}
