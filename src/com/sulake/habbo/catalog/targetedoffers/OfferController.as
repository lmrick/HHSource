package com.sulake.habbo.catalog.targetedoffers
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.purse.PurseUpdateEvent;
   import com.sulake.habbo.catalog.targetedoffers.data.HabboMallOffer;
   import com.sulake.habbo.catalog.targetedoffers.data.TargetedOffer;
   import com.sulake.habbo.catalog.targetedoffers.util.MallOfferExternalInterfaceHelper;
   import com.sulake.habbo.session.product.class_1695;
   import package_128.class_1318;
   import package_23.class_473;
   import package_23.class_670;
   import package_23.class_850;
   import package_23.class_856;
   import package_49.class_898;
   import package_8.class_125;
   import package_8.class_726;
   
   public class OfferController implements class_1695
   {
       
      
      private var _offerDialog:com.sulake.habbo.catalog.targetedoffers.TargetedOfferDialogView;
      
      private var var_2779:com.sulake.habbo.catalog.targetedoffers.MallOfferDialogView;
      
      private var _extension:class_13;
      
      private var _confirmation:com.sulake.habbo.catalog.targetedoffers.TargetedOfferPurchaseConfirmationView;
      
      private var var_3096:MallOfferExternalInterfaceHelper;
      
      private var _catalog:HabboCatalog;
      
      private var _disposed:Boolean;
      
      public function OfferController(param1:HabboCatalog)
      {
         super();
         _catalog = param1;
         _catalog.connection.addMessageEvent(new class_125(onTargetedOffer));
         _catalog.connection.addMessageEvent(new class_726(onTargetedOfferNotFound));
         _catalog.events.addEventListener("catalog_purse_update",onPurseUpdate);
         _catalog.sessionDataManager.addProductsReadyEventListener(this);
      }
      
      public function get catalog() : HabboCatalog
      {
         return _catalog;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         destroyView();
         if(var_3096)
         {
            var_3096.dispose();
            var_3096 = null;
         }
      }
      
      public function productDataReady() : void
      {
         _catalog.connection.send(new class_850());
      }
      
      private function onTargetedOffer(param1:class_125) : void
      {
         var _loc3_:class_1318 = param1.getParser();
         var _loc2_:TargetedOffer = new TargetedOffer(_loc3_.data);
         if(_loc2_.trackingState == 4)
         {
            minimizeOffer(_loc2_);
         }
         else
         {
            maximizeOffer(_loc2_);
         }
      }
      
      private function onTargetedOfferNotFound(param1:class_726) : void
      {
         var_3096 = new MallOfferExternalInterfaceHelper(this);
      }
      
      public function onHabboMallOffer(param1:HabboMallOffer) : void
      {
         if(param1.trackingState == 2)
         {
            return;
         }
         switch(param1.trackingState)
         {
            case 0:
            case 5:
            case 6:
               maximizeMallOffer(param1);
               break;
            case 2:
               return;
            default:
               minimizeMallOffer(param1);
         }
      }
      
      public function maximizeMallOffer(param1:HabboMallOffer) : void
      {
         if(var_2779)
         {
            return;
         }
         destroyView();
         var_2779 = new com.sulake.habbo.catalog.targetedoffers.MallOfferDialogView(this,param1);
         _catalog.connection.send(new class_473(param1.targetedOfferId,6));
      }
      
      public function minimizeMallOffer(param1:HabboMallOffer, param2:Boolean = false) : void
      {
         destroyView();
         _extension = new MallOfferMinimizedView(this,param1);
      }
      
      public function onHabboMallOfferOpened(param1:HabboMallOffer) : void
      {
         _catalog.connection.send(new class_473(param1.targetedOfferId,1));
         _catalog.openCreditsHabblet();
         minimizeMallOffer(param1);
      }
      
      public function onHabboMallOfferClosed(param1:HabboMallOffer) : void
      {
         _catalog.connection.send(new class_473(param1.targetedOfferId,4));
         minimizeMallOffer(param1);
      }
      
      public function minimizeOffer(param1:TargetedOffer) : void
      {
         destroyView();
         _extension = new TargetedOfferMinimizedView(this,param1);
         _catalog.connection.send(new class_670(param1.id,4));
      }
      
      public function maximizeOffer(param1:TargetedOffer) : void
      {
         var _loc2_:String = null;
         if(_offerDialog)
         {
            return;
         }
         destroyView();
         if(!param1.isExpired())
         {
            _loc2_ = getLayoutOverride(param1);
            _offerDialog = new com.sulake.habbo.catalog.targetedoffers.TargetedOfferDialogView(this,param1);
            if(_loc2_ != null && _loc2_.length > 0 && Boolean(_catalog.assets.hasAsset(_loc2_)))
            {
               _offerDialog.buildWindow(_loc2_);
            }
            else
            {
               _offerDialog.buildWindow("targeted_offer_dialog_xml");
            }
            _catalog.connection.send(new class_670(param1.id,1));
         }
      }
      
      public function purchaseTargetedOffer(param1:TargetedOffer, param2:int) : void
      {
         _catalog.connection.send(new class_856(param1.id,param2));
         param1.purchased(param2);
         if(param1.purchaseLimit > 0)
         {
            minimizeOffer(param1);
         }
         else
         {
            destroyView();
         }
      }
      
      public function sendLogEvent(param1:String, param2:String = "") : void
      {
         if(!_catalog || true)
         {
            return;
         }
         _catalog.connection.send(new class_898("TargetedOffers","FLASH.UNKNOWN",param1,param2));
      }
      
      public function purchaseCredits(param1:TargetedOffer) : void
      {
         sendLogEvent("targeted.offer.open.credits.page.clicked",param1.identifier);
         _catalog.openCreditsHabblet();
      }
      
      public function attachExtension(param1:class_3127) : void
      {
         _catalog.toolbar.extensionView.attachExtension("targeted_offer",param1,13);
      }
      
      public function showConfirmation(param1:TargetedOffer, param2:int) : void
      {
         if(_confirmation)
         {
            return;
         }
         destroyView();
         _confirmation = new com.sulake.habbo.catalog.targetedoffers.TargetedOfferPurchaseConfirmationView(this,param1,param2);
      }
      
      private function onPurseUpdate(param1:PurseUpdateEvent) : void
      {
         if(_offerDialog)
         {
            _offerDialog.updateButtonStates();
         }
      }
      
      public function destroyView() : void
      {
         if(_offerDialog)
         {
            _offerDialog.dispose();
            _offerDialog = null;
         }
         if(var_2779)
         {
            var_2779.dispose();
            var_2779 = null;
         }
         if(_extension)
         {
            _catalog.toolbar.extensionView.detachExtension("targeted_offer");
            _extension.dispose();
            _extension = null;
         }
         if(_confirmation)
         {
            _confirmation.dispose();
            _confirmation = null;
         }
      }
      
      private function getLayoutOverride(param1:TargetedOffer) : String
      {
         return _catalog.getProperty("targeted.offer.override.layout." + param1.id);
      }
   }
}
