package com.sulake.habbo.friendbar.landingview.widget
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
   import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
   import com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings;
   import com.sulake.habbo.friendbar.landingview.layout.WidgetContainerLayout;
   import com.sulake.habbo.window.widgets.class_3332;
   import package_128.class_1518;
   import package_23.class_174;
   import package_8.class_682;
   
   public class ExpiringCatalogPageSmallWidget implements ILandingViewWidget, ISettingsAwareWidget
   {
      
      private static const REFRESH_PERIOD_IN_MILLIS:Number = 30000;
       
      
      private var _landingView:HabboLandingView;
      
      private var _container:class_3151;
      
      private var _pageName:String = "";
      
      private var _lastRequestTime:Date;
      
      private var var_965:int;
      
      public function ExpiringCatalogPageSmallWidget(param1:HabboLandingView)
      {
         super();
         _landingView = param1;
      }
      
      public function get container() : class_3127
      {
         return _container;
      }
      
      public function dispose() : void
      {
         _landingView = null;
         _container = null;
      }
      
      public function initialize() : void
      {
         _container = class_3151(_landingView.getXmlWindow("expiring_catalog_page_small"));
         _container.findChildByName("open_catalog_button").procedure = onOpenCatalogButton;
         _container.visible = false;
         _landingView.communicationManager.addHabboConnectionMessageEvent(new class_682(onCatalogPage));
      }
      
      public function refresh() : void
      {
         if(_lastRequestTime == null || NaN < new Date().time)
         {
            _landingView.send(new class_174());
            _lastRequestTime = new Date();
         }
      }
      
      private function refreshContent() : void
      {
         if(_pageName == "")
         {
            _container.visible = false;
            return;
         }
         _container.visible = true;
         _container.findChildByName("page_header_txt").caption = getText("landing.view.pageexpiry.page." + _pageName + ".header");
         _container.findChildByName("page_desc_txt").caption = getText("landing.view.pageexpiry.page." + _pageName + ".desc");
         var _loc1_:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(_container.findChildByName("promo_bitmap"));
         _loc1_.assetUri = "${image.library.url}reception/catalog_teaser_" + _pageName + ".png";
         refreshTimer();
      }
      
      private function getText(param1:String) : String
      {
         return "${" + param1 + "}";
      }
      
      private function onOpenCatalogButton(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _landingView.catalog.openCatalogPage(_pageName);
            _landingView.tracking.trackGoogle("landingView","click_goToExpiringCatalogPage");
         }
      }
      
      public function get disposed() : Boolean
      {
         return _landingView == null;
      }
      
      private function refreshTimer() : void
      {
         var _loc1_:class_3217 = class_3217(_container.findChildByName("countdown_widget"));
         var _loc2_:class_3332 = class_3332(_loc1_.widget);
         _loc2_.seconds = var_965;
      }
      
      private function onCatalogPage(param1:IMessageEvent) : void
      {
         var _loc2_:class_1518 = class_1518(param1.parser);
         _pageName = _loc2_.pageName;
         var_965 = _loc2_.secondsToExpiry;
         refreshContent();
      }
      
      public function set settings(param1:CommonWidgetSettings) : void
      {
         WidgetContainerLayout.applyCommonWidgetSettings(_container,param1);
      }
   }
}
