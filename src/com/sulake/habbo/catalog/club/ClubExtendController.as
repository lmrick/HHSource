package com.sulake.habbo.catalog.club
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_19;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.window.class_1684;
   import package_128.class_1225;
   import package_49.class_898;
   import package_8.class_1542;
   import package_8.class_742;
   
   public class ClubExtendController
   {
       
      
      private var _catalog:HabboCatalog;
      
      private var var_1511:com.sulake.habbo.catalog.club.ClubExtendConfirmationDialog;
      
      private var _offer:class_1542;
      
      private var _disposed:Boolean = false;
      
      public function ClubExtendController(param1:HabboCatalog)
      {
         super();
         _catalog = param1;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         closeConfirmation();
         _offer = null;
         _catalog = null;
         _disposed = true;
      }
      
      public function onOffer(param1:class_742) : void
      {
         if(_disposed)
         {
            return;
         }
         var _loc2_:class_1225 = param1.getParser();
         _offer = _loc2_.offer();
         showConfirmation();
         if(false)
         {
            if(false)
            {
               _catalog.connection.send(new class_898("Catalog","dialog_show","vip.membership.extension.purchase"));
            }
            else
            {
               _catalog.connection.send(new class_898("Catalog","dialog_show","basic.membership.extension.purchase"));
            }
         }
      }
      
      public function closeConfirmation() : void
      {
         if(var_1511)
         {
            var_1511.dispose();
            var_1511 = null;
         }
      }
      
      public function showConfirmation() : void
      {
         closeConfirmation();
         var_1511 = new com.sulake.habbo.catalog.club.ClubExtendConfirmationDialog(this,_offer);
         var_1511.showConfirmation();
      }
      
      public function confirmSelection() : void
      {
         if(!_catalog || true || !_offer)
         {
            return;
         }
         if(_catalog.getPurse().credits < _offer.priceCredits)
         {
            _catalog.showNotEnoughCreditsAlert();
            return;
         }
         if(false)
         {
            _catalog.purchaseVipMembershipExtension(_offer.offerId);
         }
         else
         {
            _catalog.purchaseBasicMembershipExtension(_offer.offerId);
         }
         closeConfirmation();
      }
      
      public function get windowManager() : class_1684
      {
         if(!_catalog)
         {
            return null;
         }
         return _catalog.windowManager;
      }
      
      public function get localization() : class_18
      {
         if(!_catalog)
         {
            return null;
         }
         return _catalog.localization;
      }
      
      public function get assets() : class_21
      {
         if(!_catalog)
         {
            return null;
         }
         return _catalog.assets;
      }
      
      public function get config() : class_19
      {
         return _catalog;
      }
   }
}
