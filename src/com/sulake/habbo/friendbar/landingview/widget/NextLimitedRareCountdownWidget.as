package com.sulake.habbo.friendbar.landingview.widget
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
   import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
   import com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings;
   import com.sulake.habbo.friendbar.landingview.layout.WidgetContainerLayout;
   import com.sulake.habbo.session.product.class_1695;
   import com.sulake.habbo.window.widgets.class_3332;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import package_23.class_405;
   import package_8.class_693;
   
   public class NextLimitedRareCountdownWidget implements ILandingViewWidget, class_1695, ISettingsAwareWidget
   {
      
      private static const REFRESH_PERIOD_IN_MILLIS:Number = 30000;
       
      
      private var _landingView:HabboLandingView;
      
      private var _container:class_3151;
      
      private var var_337:int = 0;
      
      private var var_344:int;
      
      private var _offerId:int;
      
      private var var_358:String;
      
      private var _lastRequestTime:Date;
      
      private var var_1957:Timer;
      
      public function NextLimitedRareCountdownWidget(param1:HabboLandingView)
      {
         super();
         _landingView = param1;
      }
      
      public function dispose() : void
      {
         if(!disposed)
         {
            if(var_1957 != null)
            {
               var_1957.stop();
               var_1957 = null;
            }
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
         _container = class_3151(_landingView.getXmlWindow("next_ltd_available"));
         _container.findChildByName("get").procedure = onOpenCatalogButton;
         _container.findChildByName("catalogue_button").procedure = onOpenCatalogButton;
         _container.visible = false;
         _landingView.communicationManager.addHabboConnectionMessageEvent(new class_693(onLimitedOfferAppearingNextMessage));
         requestLimitedOfferAppearingNextMessage(null);
      }
      
      private function requestLimitedOfferAppearingNextMessage(param1:TimerEvent) : void
      {
         if(!_landingView.getBoolean("next.limited.rare.countdown.widget.disabled"))
         {
            _landingView.communicationManager.connection.send(new class_405());
         }
      }
      
      public function refresh() : void
      {
         if(_lastRequestTime == null || NaN < new Date().time)
         {
            requestLimitedOfferAppearingNextMessage(null);
            _lastRequestTime = new Date();
         }
      }
      
      public function get container() : class_3127
      {
         return _container;
      }
      
      public function productDataReady() : void
      {
         refreshContent();
      }
      
      private function refreshContent() : void
      {
         if(disposed)
         {
            return;
         }
         if(_landingView.getProductData(var_358,this) != null)
         {
            _container.findChildByName("get").caption = _landingView.getProductData(var_358,this).name;
         }
         if(var_344 >= 0)
         {
            _container.visible = true;
            _container.findChildByName("get").visible = true;
            _container.findChildByName("countdown").visible = false;
         }
         else if(var_337 > 0)
         {
            _container.visible = true;
            _container.findChildByName("get").visible = false;
            _container.findChildByName("countdown").visible = true;
         }
         else
         {
            _container.visible = false;
         }
         refreshTimer();
      }
      
      private function refreshTimer() : void
      {
         var _loc1_:class_3217 = class_3217(_container.findChildByName("countdown"));
         var _loc2_:class_3332 = class_3332(_loc1_.widget);
         _loc2_.seconds = var_337;
         _loc2_.running = true;
      }
      
      private function setModeSwitchTimer(param1:int) : void
      {
         if(param1 <= 0)
         {
            return;
         }
         if(var_1957 != null)
         {
            var_1957.stop();
            var_1957 = null;
         }
         var_1957 = new Timer((param1 + 1) * 1000,1);
         var_1957.addEventListener("timer",requestLimitedOfferAppearingNextMessage);
         var_1957.start();
      }
      
      private function onLimitedOfferAppearingNextMessage(param1:class_693) : void
      {
         var_337 = param1.getParser().appearsInSeconds;
         var_344 = param1.getParser().pageId;
         _offerId = param1.getParser().offerId;
         var_358 = param1.getParser().productType;
         refreshContent();
         setModeSwitchTimer(var_337);
      }
      
      private function onOpenCatalogButton(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _landingView.catalog.openCatalogPageById(var_344,_offerId,"NORMAL");
            _landingView.tracking.trackGoogle("landingView","click_goToNextLimitedCatalogPage");
         }
      }
      
      public function set settings(param1:CommonWidgetSettings) : void
      {
         WidgetContainerLayout.applyCommonWidgetSettings(_container,param1);
      }
   }
}
