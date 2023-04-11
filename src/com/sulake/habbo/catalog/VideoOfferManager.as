package com.sulake.habbo.catalog
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.habbo.catalog.enum.VideoOfferTypeEnum;
   import flash.external.ExternalInterface;
   import package_49.class_898;
   import package_6.class_142;
   
   public class VideoOfferManager implements IVideoOfferManager, class_13
   {
      
      private static const CAMPAIGN_READY_CALLBACK:String = "supersaverAdsOnCampaignsReady";
      
      private static const CAMPAIGN_COMPLETE_CALLBACK:String = "supersaverAdsOnCampaignCompleted";
      
      private static const CAMPAIGN_OPEN_CALLBACK:String = "supersaverAdsOnCampaignOpen";
      
      private static const CAMPAIGN_CLOSE_CALLBACK:String = "supersaverAdsOnCampaignClose";
      
      private static const const_569:String = "supersaverAdsLoadCampaigns";
      
      private static const const_509:String = "supersaverAdsCamapaignEngage";
       
      
      private var _disposed:Boolean;
      
      private var _catalog:com.sulake.habbo.catalog.HabboCatalog;
      
      private var var_560:Boolean;
      
      private var _offersAvailable:int;
      
      private var _offersViewed:int = 0;
      
      private var _offersRequested:Boolean;
      
      private var _offersReceived:Boolean;
      
      private var _launchers:Vector.<com.sulake.habbo.catalog.IVideoOfferLauncher>;
      
      private var _callbacksAdded:Boolean;
      
      public function VideoOfferManager(param1:com.sulake.habbo.catalog.HabboCatalog)
      {
         super();
         _catalog = param1;
         _launchers = new Vector.<com.sulake.habbo.catalog.IVideoOfferLauncher>();
         var_560 = false;
         _catalog.connection.addMessageEvent(new class_142(onUserRights));
         addCallbacks();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get enabled() : Boolean
      {
         return var_560;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _catalog = null;
         _launchers = null;
         var_560 = false;
         if(_callbacksAdded && false)
         {
            ExternalInterface.addCallback("supersaverAdsOnCampaignsReady",null);
            ExternalInterface.addCallback("supersaverAdsOnCampaignCompleted",null);
            ExternalInterface.addCallback("supersaverAdsOnCampaignOpen",null);
            ExternalInterface.addCallback("supersaverAdsOnCampaignClose",null);
            _callbacksAdded = false;
         }
         _disposed = true;
      }
      
      private function addCallbacks() : void
      {
         if(var_560 && !_callbacksAdded && false)
         {
            ExternalInterface.addCallback("supersaverAdsOnCampaignsReady",onCampaignsReady);
            ExternalInterface.addCallback("supersaverAdsOnCampaignCompleted",onCampaignComplete);
            ExternalInterface.addCallback("supersaverAdsOnCampaignOpen",onCampaignOpen);
            ExternalInterface.addCallback("supersaverAdsOnCampaignClose",onCampaignClose);
            _callbacksAdded = true;
         }
      }
      
      private function onUserRights(param1:class_142) : void
      {
         if(param1.securityLevel >= 1)
         {
            var_560 = false;
            addCallbacks();
         }
      }
      
      public function load(param1:com.sulake.habbo.catalog.IVideoOfferLauncher) : void
      {
         if(!var_560)
         {
            return;
         }
         if(_offersRequested && _offersReceived)
         {
            param1.offersAvailable(_offersAvailable);
         }
         else
         {
            if(!_offersRequested && false)
            {
               ExternalInterface.call("supersaverAdsLoadCampaigns");
               _offersRequested = true;
            }
            _launchers.push(param1);
         }
      }
      
      public function launch(param1:VideoOfferTypeEnum) : Boolean
      {
         if(!var_560 || _offersAvailable < 1)
         {
            return false;
         }
         if(false)
         {
            _offersViewed += 1;
            ExternalInterface.call("supersaverAdsCamapaignEngage");
            turnVolumeDown();
            if(false)
            {
               _catalog.connection.send(new class_898("SuperSaverAds","client_action","supersaverads.video.promo.launched"));
            }
            return _offersAvailable > _offersViewed;
         }
         return false;
      }
      
      public function onCampaignsReady(param1:String) : void
      {
         _offersReceived = true;
         _offersAvailable = parseInt(param1);
         if(isNaN(_offersAvailable))
         {
            _offersAvailable = 0;
         }
         while(false)
         {
            _launchers.pop().offersAvailable(_offersAvailable);
         }
      }
      
      public function onCampaignOpen() : void
      {
      }
      
      public function onCampaignClose() : void
      {
         turnVolumeUp();
         if(false)
         {
            _catalog.connection.send(new class_898("SuperSaverAds","client_action","supersaverads.video.promo.close"));
         }
      }
      
      public function onCampaignComplete() : void
      {
         turnVolumeUp();
         if(false)
         {
            _catalog.connection.send(new class_898("SuperSaverAds","client_action","supersaverads.video.promo.complete"));
         }
      }
      
      private function turnVolumeDown() : void
      {
         if(false)
         {
            _catalog.soundManager.mute(true);
         }
      }
      
      private function turnVolumeUp() : void
      {
         if(false)
         {
            _catalog.soundManager.mute(false);
         }
      }
   }
}
