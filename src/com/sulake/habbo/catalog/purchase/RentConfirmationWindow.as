package com.sulake.habbo.catalog.purchase
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.class_3158;
   import com.sulake.habbo.room.class_3266;
   import com.sulake.habbo.session.furniture.class_3148;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import package_136.class_1298;
   import package_21.class_279;
   import package_21.class_554;
   import package_21.class_942;
   import package_25.class_417;
   
   public class RentConfirmationWindow implements class_13, class_3158
   {
      
      private static const MODE_INFOSTAND:int = 1;
      
      private static const MODE_INVENTORY:int = 2;
      
      private static const MODE_CATALOGUE:int = 3;
       
      
      private var _disposed:Boolean;
      
      private var _offerMessageEvent:class_417;
      
      private var _window:class_3151;
      
      private var _isBuyout:Boolean;
      
      private var var_247:int = -1;
      
      private var _catalog:HabboCatalog;
      
      private var var_1489:class_3148;
      
      private var var_773:int;
      
      private var var_3572:int = -1;
      
      private var var_1201:int;
      
      public function RentConfirmationWindow(param1:HabboCatalog)
      {
         super();
         _catalog = param1;
         _offerMessageEvent = new class_417(onFurniRentOrBuyoutOffer);
         _catalog.connection.addMessageEvent(_offerMessageEvent);
      }
      
      private function onFurniRentOrBuyoutOffer(param1:class_417) : void
      {
         var _loc3_:class_3266 = null;
         if(var_1489 == null)
         {
            return;
         }
         var _loc2_:class_1298 = param1.getParser();
         if(var_1489.fullName != _loc2_.furniTypeName)
         {
            return;
         }
         _isBuyout = _loc2_.buyout;
         if(_catalog.getPurse().credits < _loc2_.priceInCredits)
         {
            _catalog.showNotEnoughCreditsAlert();
            return;
         }
         if(_catalog.getPurse().getActivityPointsForType(_loc2_.activityPointType) < _loc2_.priceInActivityPoints)
         {
            _catalog.showNotEnoughActivityPointsAlert(_loc2_.activityPointType);
            return;
         }
         _window = _catalog.windowManager.buildFromXML(_catalog.assets.getAssetByName("rent_confirmation").content as XML) as class_3151;
         if(_loc2_.priceInCredits > 0)
         {
            _window.findChildByName("price_amount").caption = _loc2_.priceInCredits.toString();
            IStaticBitmapWrapperWindow(_window.findChildByName("price_type")).assetUri = "toolbar_credit_icon_0";
         }
         else
         {
            _window.findChildByName("price_amount").caption = _loc2_.priceInActivityPoints.toString();
         }
         if(_isBuyout)
         {
            _window.caption = "${rent.confirmation.title.buyout}";
            _window.findChildByName("rental_description").visible = false;
            _window.findChildByName("ok_button").caption = "${catalog.purchase_confirmation.buy}";
         }
         _window.findChildByName("furni_name").caption = var_1489.localizedName;
         IItemListWindow(_window.findChildByName("content_list")).arrangeListItems();
         _window.center();
         _window.procedure = windowProcedure;
         switch(var_1489.type)
         {
            case "s":
               _loc3_ = roomEngine.getFurnitureImage(var_1489.id,new Vector3d(90,0,0),64,this);
               break;
            case "i":
               _loc3_ = roomEngine.getWallItemImage(var_1489.id,new Vector3d(90,0,0),64,this);
         }
         class_3282(_window.findChildByName("image")).bitmap = _loc3_.data;
         var_247 = _loc3_.id;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         close();
         if(_offerMessageEvent != null)
         {
            _catalog.connection.removeMessageEvent(_offerMessageEvent);
            _offerMessageEvent = null;
         }
         _disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function show(param1:class_3148, param2:Boolean, param3:int = -1, param4:int = -1, param5:Boolean = false) : void
      {
         close();
         var_1489 = param1;
         var_3572 = param3;
         var_1201 = param4;
         if(param5)
         {
            var_773 = 3;
         }
         else if(var_3572 > -1)
         {
            var_773 = 1;
         }
         else
         {
            var_773 = 2;
         }
         var _loc6_:* = param1.type == "i";
         _catalog.connection.send(new class_279(_loc6_,param1.fullName,param2));
      }
      
      private function get roomEngine() : IRoomEngine
      {
         return _catalog.roomEngine;
      }
      
      private function windowProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK" || _window == null)
         {
            return;
         }
         switch(param2.name)
         {
            case "cancel_button":
            case "header_button_close":
               close();
               break;
            case "ok_button":
               switch(var_773 - 1)
               {
                  case 0:
                     _catalog.connection.send(new class_942(false,var_3572,_isBuyout));
                     break;
                  case 1:
                     _catalog.connection.send(new class_554(var_1201,_isBuyout));
                     break;
                  case 2:
                     _catalog.purchaseOffer(var_1489.rentOfferId);
               }
               close();
         }
      }
      
      private function close() : void
      {
         if(_window == null)
         {
            return;
         }
         _window.dispose();
         _window = null;
         var_247 = -1;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(_window != null && param1 == var_247)
         {
            class_3282(_window.findChildByName("image")).bitmap = param2;
         }
      }
      
      public function imageFailed(param1:int) : void
      {
      }
   }
}
