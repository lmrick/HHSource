package com.sulake.habbo.catalog.club
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.utils.class_24;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.catalog.purse.class_3160;
   import com.sulake.habbo.catalog.viewer.widgets.ClubGiftWidget;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.product.class_3200;
   import com.sulake.habbo.window.class_1684;
   import package_23.class_568;
   import package_23.class_712;
   
   public class ClubGiftController
   {
       
      
      private var var_1429:ClubGiftWidget;
      
      private var var_919:int;
      
      private var var_1146:int;
      
      private var _offers:Array;
      
      private var var_175:class_24;
      
      private var _catalog:HabboCatalog;
      
      private var var_1511:com.sulake.habbo.catalog.club.ClubGiftConfirmationDialog;
      
      public function ClubGiftController(param1:HabboCatalog)
      {
         super();
         _catalog = param1;
      }
      
      public function dispose() : void
      {
         _catalog = null;
         if(var_1511)
         {
            var_1511.dispose();
            var_1511 = null;
         }
      }
      
      public function set widget(param1:ClubGiftWidget) : void
      {
         var_1429 = param1;
         _catalog.connection.send(new class_712());
      }
      
      public function get daysUntilNextGift() : int
      {
         return var_919;
      }
      
      public function get giftsAvailable() : int
      {
         return var_1146;
      }
      
      public function setInfo(param1:int, param2:int, param3:Array, param4:class_24) : void
      {
         var_919 = param1;
         var_1146 = param2;
         _offers = param3;
         var_175 = param4;
         if(var_1429)
         {
            var_1429.update();
         }
      }
      
      public function selectGift(param1:class_3159) : void
      {
         closeConfirmation();
         var_1511 = new com.sulake.habbo.catalog.club.ClubGiftConfirmationDialog(this,param1);
      }
      
      public function confirmSelection(param1:String) : void
      {
         if(!param1 || !_catalog || true)
         {
            return;
         }
         _catalog.connection.send(new class_568(param1));
         var_1146--;
         var_1429.update();
         closeConfirmation();
      }
      
      public function closeConfirmation() : void
      {
         if(var_1511)
         {
            var_1511.dispose();
            var_1511 = null;
         }
      }
      
      public function getOffers() : Array
      {
         return _offers;
      }
      
      public function getGiftData() : class_24
      {
         return var_175;
      }
      
      public function get hasClub() : Boolean
      {
         if(!_catalog || !_catalog.getPurse())
         {
            return false;
         }
         return _catalog.getPurse().clubDays > 0;
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
      
      public function get roomEngine() : IRoomEngine
      {
         if(!_catalog)
         {
            return null;
         }
         return _catalog.roomEngine;
      }
      
      public function getProductData(param1:String) : class_3200
      {
         if(!_catalog)
         {
            return null;
         }
         return _catalog.getProductData(param1);
      }
      
      public function get purse() : class_3160
      {
         if(!_catalog)
         {
            return null;
         }
         return _catalog.getPurse();
      }
      
      public function get catalog() : HabboCatalog
      {
         return _catalog;
      }
   }
}
