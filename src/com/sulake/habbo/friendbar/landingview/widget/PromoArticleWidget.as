package com.sulake.habbo.friendbar.landingview.widget
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.class_41;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.communication.messages.outgoing.landingview.class_771;
   import com.sulake.habbo.friendbar.landingview.HabboLandingView;
   import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
   import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
   import com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings;
   import com.sulake.habbo.friendbar.landingview.layout.WidgetContainerLayout;
   import com.sulake.habbo.utils.HabboWebTools;
   import package_26.class_159;
   import package_26.class_1627;
   
   public class PromoArticleWidget implements ILandingViewWidget, ISettingsAwareWidget, class_41
   {
      
      private static const REFRESH_PERIOD_IN_MILLIS:Number = 600000;
      
      private static const FADE_LENGTH:Number = 500;
      
      private static const MAX_ARTICLES:int = 10;
       
      
      private var _landingView:HabboLandingView;
      
      private var _container:class_3151;
      
      private var var_1971:int = 0;
      
      private var var_637:Array;
      
      private var _lastRequestTime:Date;
      
      private var var_2574:IMessageEvent;
      
      private var var_2358:uint = 0;
      
      public function PromoArticleWidget(param1:HabboLandingView)
      {
         var_637 = [];
         super();
         _landingView = param1;
      }
      
      public function initialize() : void
      {
         _container = class_3151(_landingView.getXmlWindow("promo_article"));
         _container.procedure = onMouse;
         var_2574 = new class_159(onPromoArticles);
         _landingView.communicationManager.addHabboConnectionMessageEvent(var_2574);
      }
      
      public function refresh() : void
      {
         if(_lastRequestTime == null || NaN < new Date().time)
         {
            _landingView.send(new class_771());
            _lastRequestTime = new Date();
         }
         else
         {
            goToArticle(var_1971);
         }
      }
      
      public function get container() : class_3127
      {
         return _container;
      }
      
      public function dispose() : void
      {
         if(var_2574 && _landingView)
         {
            _landingView.communicationManager.removeHabboConnectionMessageEvent(var_2574);
            var_2574.dispose();
            var_2574 = null;
         }
         if(_container)
         {
            _container.dispose();
            _container = null;
         }
         _landingView = null;
      }
      
      public function get disposed() : Boolean
      {
         return _landingView == null;
      }
      
      public function set settings(param1:CommonWidgetSettings) : void
      {
         WidgetContainerLayout.applyCommonWidgetSettings(_container,param1);
      }
      
      private function refreshContent() : void
      {
         setArticleContent();
         setNavigationDisks();
      }
      
      private function setArticleContent() : void
      {
         var _loc1_:class_1627 = var_637[var_1971];
         if(_loc1_)
         {
            _container.findChildByName("promo_title").caption = _loc1_.title;
            _container.findChildByName("promo_text").caption = _loc1_.bodyText;
            _container.findChildByName("button").visible = !(_loc1_.linkType == 2 || _loc1_.linkType == 0 && _loc1_.linkContent == "");
            _container.findChildByName("button").immediateClickMode = true;
            _container.findChildByName("button").caption = _loc1_.buttonText;
            _container.findChildByName("promo_image").visible = _loc1_.imageUrl != "";
            try
            {
               IStaticBitmapWrapperWindow(_container.findChildByName("promo_image")).assetUri = "${image.library.url}" + _loc1_.imageUrl;
            }
            catch(e:Error)
            {
               _landingView.context.warning("Missing image url for promo article with title: " + _loc1_.title);
            }
         }
      }
      
      private function setNavigationDisks() : void
      {
         var _loc3_:int = 0;
         var _loc4_:IRegionWindow = null;
         var _loc2_:IStaticBitmapWrapperWindow = null;
         var _loc1_:class_3151 = class_3151(_container.findChildByName("navigation"));
         _loc3_ = 0;
         while(_loc3_ < 10)
         {
            _loc4_ = IRegionWindow(_loc1_.getChildAt(_loc3_));
            if(var_637.length > _loc3_)
            {
               _loc2_ = IStaticBitmapWrapperWindow(_loc4_.getChildAt(0));
               _loc2_.assetUri = "progress_disk_flat_" + (var_1971 == _loc3_ ? "on" : "off");
               _loc4_.visible = true;
            }
            else
            {
               _loc4_.visible = false;
            }
            _loc3_++;
         }
      }
      
      private function goToArticle(param1:int) : void
      {
         var _loc2_:* = param1 == var_1971;
         if(false)
         {
            return;
         }
         if(param1 < 0)
         {
            var_1971 = -1;
         }
         else if(param1 >= var_637.length)
         {
            var_1971 = 0;
         }
         else
         {
            var_1971 = param1;
         }
         if(_loc2_)
         {
            refreshContent();
         }
         else
         {
            startFade();
         }
      }
      
      private function startFade() : void
      {
         var_2358 = 0;
         _landingView.registerUpdateReceiver(this,1);
      }
      
      private function stopFade() : void
      {
         _landingView.removeUpdateReceiver(this);
         setBlend(1);
      }
      
      private function followLink() : void
      {
         var _loc1_:class_1627 = var_637[var_1971];
         switch(_loc1_.linkType)
         {
            case 0:
               HabboWebTools.openWebPage(_loc1_.linkContent);
               break;
            case 1:
               _landingView.context.createLinkEvent(_loc1_.linkContent);
         }
      }
      
      private function onMouse(param1:class_3134, param2:class_3127) : void
      {
         if(param2.name == "article_navigation")
         {
            if(param1.type == "WME_OVER")
            {
               hoverOverNavigation(param2,true);
            }
            else if(param1.type == "WME_OUT" && param2.id != var_1971)
            {
               hoverOverNavigation(param2,false);
            }
         }
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "button":
               followLink();
               break;
            case "article_navigation":
               goToArticle(param2.id);
         }
      }
      
      private function hoverOverNavigation(param1:class_3127, param2:Boolean) : void
      {
         var _loc3_:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(class_3151(param1).getChildAt(0));
         if(!_loc3_)
         {
            return;
         }
         _loc3_.assetUri = "progress_disk_flat_" + (param2 ? "on" : "off");
      }
      
      private function onPromoArticles(param1:class_159) : void
      {
         var_637 = [];
         for each(var _loc2_ in param1.getParser().articles)
         {
            var_637.push(_loc2_);
         }
         refresh();
      }
      
      private function setBlend(param1:Number) : void
      {
         _container.findChildByName("promo_title").blend = param1;
         _container.findChildByName("promo_text").blend = param1;
         _container.findChildByName("button").blend = param1;
         _container.findChildByName("promo_image").blend = param1;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:uint = var_2358 + param1;
         if(var_2358 < 500)
         {
            setBlend(Math.max(0,1 - var_2358 / 500));
            if(_loc2_ >= 500)
            {
               refreshContent();
            }
         }
         else
         {
            setBlend(Math.min(1,(var_2358 - 500) / 500));
         }
         var_2358 = _loc2_;
         if(var_2358 >= 1000)
         {
            stopFade();
         }
      }
   }
}
