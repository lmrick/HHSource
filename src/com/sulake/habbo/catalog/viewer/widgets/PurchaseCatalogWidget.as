package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.catalog.viewer.class_3169;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetInitPurchaseEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetPurchaseOverrideEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSpinnerEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetToggleEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetRoomPreviewerStuffDataEvent;
   import com.sulake.habbo.catalog.viewer.widgets.utils.RentUtils;
   import com.sulake.habbo.room.IStuffData;
   import com.sulake.habbo.tracking.HabboTracking;
   import com.sulake.habbo.window.utils.class_3132;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements class_3321
   {
       
      
      private var _stubPurchaseVipXML:XML;
      
      private var var_2670:class_3151;
      
      private var _offer:class_3159;
      
      private var _additionalParameters:String = "";
      
      private var var_3486:IStuffData = null;
      
      private var var_2187:int = 1;
      
      private var _purchaseCallback:Function;
      
      private var _catalog:HabboCatalog;
      
      private var _noGiftOption:Boolean;
      
      private var var_4048:Boolean = false;
      
      private var var_560:Boolean = true;
      
      public function PurchaseCatalogWidget(param1:class_3151, param2:HabboCatalog)
      {
         super(param1);
         _catalog = param2;
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         events.removeEventListener("SELECT_PRODUCT",onSelectProduct);
         events.removeEventListener("CWE_SET_EXTRA_PARM",onSetParameter);
         events.removeEventListener("PURCHASE_OVERRIDE",onPurchaseOverride);
         events.removeEventListener("CWE_SET_PREVIEWER_STUFFDATA",onSetPreviewerStuffData);
         events.removeEventListener("CWE_TOGGLE",onToggleWidget);
         super.dispose();
      }
      
      private function onToggleWidget(param1:CatalogWidgetToggleEvent) : void
      {
         if(param1.widgetId == "purchaseWidget")
         {
            var_560 = param1.enabled;
            window.visible = var_560;
         }
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         if(false)
         {
            _window.visible = false;
            return true;
         }
         attachWidgetView("purchaseWidget");
         _window.findChildByName("selection_information").visible = true;
         _window.findChildByName("default_buttons").visible = false;
         _noGiftOption = false;
         if(window.tags.indexOf("ROOM_INITIATE_PURCHASE") > -1)
         {
            _catalog.sendRoomAdPurchaseInitiatedEvent();
         }
         _window.findChildByName("buy_button").addEventListener("WME_CLICK",onPurchase);
         var _loc2_:class_3140 = _window.findChildByName("gift_button") as class_3140;
         if(window.tags.indexOf("NO_GIFT_OPTION") > -1)
         {
            _noGiftOption = true;
            _loc2_.visible = false;
         }
         _loc2_.addEventListener("WME_CLICK",onGift);
         _loc2_.disable();
         var _loc1_:XmlAsset = _catalog.assets.getAssetByName("purchaseWidgetBuyVipStub") as XmlAsset;
         if(_loc1_ != null)
         {
            _stubPurchaseVipXML = _loc1_.content as XML;
         }
         events.addEventListener("SELECT_PRODUCT",onSelectProduct);
         events.addEventListener("CWE_SET_EXTRA_PARM",onSetParameter);
         events.addEventListener("PURCHASE_OVERRIDE",onPurchaseOverride);
         events.addEventListener("INIT_PURCHASE",initPurchase);
         events.addEventListener("CWE_SET_PREVIEWER_STUFFDATA",onSetPreviewerStuffData);
         events.addEventListener("CWSE_VALUE_CHANGED",onSpinnerValueChanged);
         events.addEventListener("CWE_EXTRA_PARAM_REQUIRED_FOR_BUY",onExtraParamRequired);
         events.addEventListener("CWE_TOGGLE",onToggleWidget);
         return true;
      }
      
      private function onPurchaseOverride(param1:CatalogWidgetPurchaseOverrideEvent) : void
      {
         _purchaseCallback = param1.callback;
      }
      
      private function attachStub(param1:class_3159) : void
      {
         if(var_2670 != null)
         {
            var_2670.visible = false;
            _window.removeChild(var_2670);
            var_2670.dispose();
            var_2670 = null;
         }
      }
      
      private function get extraParamRequirementsMet() : Boolean
      {
         return !(var_4048 && _additionalParameters == "");
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:class_3127 = null;
         var _loc3_:Boolean = false;
         var_2187 = 1;
         _offer = param1.offer;
         _window.findChildByName("selection_information").visible = false;
         _window.findChildByName("default_buttons").visible = true;
         attachStub(_offer);
         _catalog.purchaseWillBeGift(false);
         if(var_2670 == null)
         {
            enableBuyButton(extraParamRequirementsMet);
            enableGiftButton(extraParamRequirementsMet);
            RentUtils.updateBuyCaption(_offer,_window.findChildByName("purchase_label"));
            _loc2_ = _window.findChildByName("gift_button");
            if(_loc2_ != null)
            {
               _loc2_.visible = !_noGiftOption;
            }
            if(true)
            {
               enableGiftButton(false);
            }
            _loc3_ = isSoldOut(_offer);
            if(_loc3_)
            {
               enableBuyButton(false);
               enableGiftButton(false);
            }
            window.visible = var_560;
         }
         else
         {
            enableBuyButton(false);
            enableGiftButton(false);
         }
      }
      
      private function isSoldOut(param1:class_3159) : Boolean
      {
         var _loc2_:class_3169 = null;
         var _loc3_:Boolean = false;
         if(param1 != null)
         {
            if(param1.pricingModel == "pricing_model_single")
            {
               _loc2_ = _offer.product;
               if(_loc2_ != null && _loc2_.isUniqueLimitedItem)
               {
                  return _loc2_.uniqueLimitedItemsLeft == 0;
               }
            }
         }
         return false;
      }
      
      private function enableBuyButton(param1:Boolean) : void
      {
         if(_catalog.sessionDataManager.isAccountSafetyLocked())
         {
            param1 = false;
         }
         enableButton("buy_button",param1);
      }
      
      private function enableGiftButton(param1:Boolean) : void
      {
         if(_catalog.sessionDataManager.isAccountSafetyLocked())
         {
            param1 = false;
         }
         enableButton("gift_button",param1);
      }
      
      private function enableButton(param1:String, param2:Boolean) : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc3_:class_3127 = _window.findChildByName(param1);
         if(_loc3_ == null)
         {
            return;
         }
         if(param2)
         {
            _loc3_.enable();
            _loc3_.blend = 1;
         }
         else
         {
            _loc3_.disable();
            _loc3_.blend = 0.5;
         }
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         _additionalParameters = param1.parameter;
         enableBuyButton(extraParamRequirementsMet);
         enableGiftButton(_offer != null && false && extraParamRequirementsMet && var_2187 == 1);
      }
      
      private function onPurchase(param1:WindowMouseEvent, param2:Boolean = false) : void
      {
         var event:WindowMouseEvent = param1;
         var isGift:Boolean = param2;
         if(!_catalog.verifyClubLevel(_offer.clubLevel))
         {
            _catalog.openClubCenter();
            return;
         }
         _catalog.purchaseWillBeGift(isGift);
         if(_purchaseCallback == null)
         {
            if(_offer != null)
            {
               if(false && _catalog.roomAdPurchaseData.offerId == _offer.offerId)
               {
                  if(_catalog.roomAdPurchaseData.flatId == 0)
                  {
                     _catalog.windowManager.alert("${roomad.error.title}","${roomad.alert.no.available.room}",0,function(param1:class_3132, param2:class_3134):void
                     {
                        param1.dispose();
                     });
                     return;
                  }
                  if(_catalog.roomAdPurchaseData.name == null || _catalog.roomAdPurchaseData.name.length < 5 || _catalog.roomAdPurchaseData.name.substr(0,1) == " ")
                  {
                     _catalog.windowManager.alert("${roomad.error.title}","${roomad.alert.name.empty}",0,function(param1:class_3132, param2:class_3134):void
                     {
                        param1.dispose();
                     });
                     return;
                  }
               }
               _catalog.showPurchaseConfirmation(_offer,page.pageId,_additionalParameters,var_2187,var_3486,null,true,null);
            }
         }
         else
         {
            _purchaseCallback(event);
         }
      }
      
      private function onGift(param1:WindowMouseEvent) : void
      {
         onPurchase(param1,true);
         HabboTracking.getInstance().trackEventLog("Catalog","click","client.buy_as_gift.clicked");
      }
      
      private function initPurchase(param1:CatalogWidgetInitPurchaseEvent) : void
      {
         if(_offer != null)
         {
            _catalog.showPurchaseConfirmation(_offer,page.pageId,_additionalParameters,var_2187,var_3486,null,true,null);
         }
      }
      
      private function onBuyClub(param1:WindowMouseEvent) : void
      {
         _catalog.rememberPageDuringVipPurchase(page.pageId);
         _catalog.openClubCenter();
         HabboTracking.getInstance().trackEventLog("Catalog","click","BUY_CLUB");
      }
      
      private function onSetPreviewerStuffData(param1:SetRoomPreviewerStuffDataEvent) : void
      {
         var_3486 = param1.stuffData;
      }
      
      private function onSpinnerValueChanged(param1:CatalogWidgetSpinnerEvent) : void
      {
         var_2187 = param1.value;
         if(var_2187 > 1)
         {
            enableGiftButton(false);
         }
         else if(_offer != null && extraParamRequirementsMet)
         {
            enableGiftButton(_offer.giftable);
         }
      }
      
      private function onExtraParamRequired(param1:CatalogWidgetEvent) : void
      {
         var_4048 = true;
         enableBuyButton(extraParamRequirementsMet);
         enableGiftButton(_offer != null && extraParamRequirementsMet && var_2187 == 1);
      }
   }
}
