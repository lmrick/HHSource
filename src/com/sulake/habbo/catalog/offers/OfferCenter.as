package com.sulake.habbo.catalog.offers
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.runtime.class_19;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.window.class_1684;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import package_147.class_1083;
   import package_28.class_614;
   
   public class OfferCenter implements IOfferCenter, class_13
   {
      
      private static const PROVIDER_POLLING_FREQUENCY:int = 1800000;
       
      
      private var _disposed:Boolean;
      
      private var _windowManager:class_1684;
      
      private var _assets:class_21;
      
      private var _catalog:IHabboCatalog;
      
      private var _offerExtension:com.sulake.habbo.catalog.offers.IOfferExtension;
      
      private var _window:class_3151;
      
      private var var_2517:com.sulake.habbo.catalog.offers.IOfferProvider;
      
      private var _providers:Vector.<com.sulake.habbo.catalog.offers.IOfferProvider>;
      
      private var var_3155:Vector.<com.sulake.habbo.catalog.offers.OfferReward>;
      
      private var var_3104:class_3127;
      
      private var var_2230:Timer;
      
      private var _offerRewardDeliveredMessageEvent:class_614;
      
      public function OfferCenter(param1:class_1684, param2:class_21, param3:IHabboCatalog)
      {
         super();
         _windowManager = param1;
         _assets = param2;
         _catalog = param3;
         _offerRewardDeliveredMessageEvent = new class_614(onOfferRewardDelivered);
         _catalog.connection.addMessageEvent(_offerRewardDeliveredMessageEvent);
         _providers = new Vector.<com.sulake.habbo.catalog.offers.IOfferProvider>(0);
         _providers.push(new SupersonicProvider(this));
         _providers.push(new SponsorPayProvider(this));
         var_3155 = new Vector.<com.sulake.habbo.catalog.offers.OfferReward>(0);
         var_2230 = new Timer(1800000);
         var_2230.addEventListener("timer",onPollTimer);
         var_2230.start();
         onPollTimer(null);
      }
      
      private function onPollTimer(param1:TimerEvent) : void
      {
         if(_providers == null)
         {
            return;
         }
         for each(var _loc2_ in _providers)
         {
            if(_loc2_.enabled)
            {
               _loc2_.load();
            }
         }
      }
      
      private function getNextProvider() : com.sulake.habbo.catalog.offers.IOfferProvider
      {
         if(_providers == null)
         {
            return null;
         }
         for each(var _loc1_ in _providers)
         {
            if(_loc1_.enabled && _loc1_.videoAvailable)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function onOfferRewardDelivered(param1:class_614) : void
      {
         var _loc2_:class_1083 = param1.getParser();
         addReward(_loc2_.name,_loc2_.contentType,_loc2_.classId);
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(_providers != null)
         {
            for each(var _loc1_ in _providers)
            {
               _loc1_.dispose();
            }
            _providers = null;
         }
         if(var_2230 != null)
         {
            var_2230.stop();
            var_2230 = null;
         }
         _catalog.connection.removeMessageEvent(_offerRewardDeliveredMessageEvent);
         _offerRewardDeliveredMessageEvent = null;
         var_3155 = null;
         _offerExtension = null;
         _windowManager = null;
         _catalog = null;
         _assets = null;
         _disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set offerExtension(param1:com.sulake.habbo.catalog.offers.IOfferExtension) : void
      {
         _offerExtension = param1;
      }
      
      public function showRewards() : void
      {
         hide();
         _window = _windowManager.buildFromXML(_assets.getAssetByName("offer_center_xml").content as XML) as class_3151;
         _window.procedure = windowProcedure;
         _window.center();
         var_3104 = IItemListWindow(_window.findChildByName("reward_list")).removeListItemAt(0);
         populateRewardList();
      }
      
      public function showVideo() : void
      {
         if(var_2517 != null)
         {
            var_2517.showVideo();
         }
      }
      
      public function get showingVideo() : Boolean
      {
         return var_2517 != null && false;
      }
      
      private function windowProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK" || !visible)
         {
            return;
         }
         var _loc3_:* = param2.name;
         if("header_button_close" === _loc3_)
         {
            hide();
         }
      }
      
      private function hide() : void
      {
         if(_window != null)
         {
            var_3104.dispose();
            var_3104 = null;
            _window.dispose();
            _window = null;
         }
      }
      
      private function addReward(param1:String, param2:String, param3:int) : void
      {
         var _loc4_:com.sulake.habbo.catalog.offers.OfferReward = new com.sulake.habbo.catalog.offers.OfferReward(param1,param2,param3);
         var_3155.unshift(_loc4_);
         if(visible)
         {
            IItemListWindow(_window.findChildByName("reward_list")).addListItemAt(createRewardItem(_loc4_),0);
         }
         else if(_offerExtension != null)
         {
            _offerExtension.indicateRewards();
         }
      }
      
      public function get configuration() : class_19
      {
         return _catalog as class_19;
      }
      
      public function updateVideoStatus() : void
      {
         if(_offerExtension != null)
         {
            var_2517 = getNextProvider();
            _offerExtension.indicateVideoAvailable(var_2517 != null && false);
         }
      }
      
      private function populateRewardList() : void
      {
         if(!visible)
         {
            return;
         }
         var _loc2_:IItemListWindow = _window.findChildByName("reward_list") as IItemListWindow;
         _loc2_.destroyListItems();
         for each(var _loc1_ in var_3155)
         {
            _loc2_.addListItem(createRewardItem(_loc1_));
         }
      }
      
      private function createRewardItem(param1:com.sulake.habbo.catalog.offers.OfferReward) : class_3127
      {
         var _loc2_:class_3151 = var_3104.clone() as class_3151;
         _loc2_.findChildByName("reward_date").caption = new Date().toLocaleString();
         _loc2_.findChildByName("reward_name").caption = param1.name;
         _catalog.displayProductIcon(param1.contentType,param1.classId,class_3282(_loc2_.findChildByName("reward_icon")));
         return _loc2_;
      }
      
      private function get visible() : Boolean
      {
         return _window != null && true && false;
      }
      
      public function showSuccess() : void
      {
      }
   }
}
