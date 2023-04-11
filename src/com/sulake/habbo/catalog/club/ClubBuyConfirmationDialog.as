package com.sulake.habbo.catalog.club
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3176;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.purse.class_3160;
   import com.sulake.habbo.localization.class_18;
   
   public class ClubBuyConfirmationDialog
   {
       
      
      private var _offer:com.sulake.habbo.catalog.club.ClubBuyOfferData;
      
      private var var_282:com.sulake.habbo.catalog.club.ClubBuyController;
      
      private var var_1430:class_3281;
      
      private var var_344:int;
      
      public function ClubBuyConfirmationDialog(param1:com.sulake.habbo.catalog.club.ClubBuyController, param2:com.sulake.habbo.catalog.club.ClubBuyOfferData, param3:int)
      {
         super();
         _offer = param2;
         var_282 = param1;
         var_344 = param3;
         showConfirmation();
      }
      
      public function dispose() : void
      {
         var_282 = null;
         _offer = null;
         if(var_1430)
         {
            var_1430.dispose();
            var_1430 = null;
         }
      }
      
      public function showConfirmation() : void
      {
         if(!_offer || !var_282)
         {
            return;
         }
         var_1430 = var_282.catalog.utils.createWindow("club_buy_confirmation") as class_3281;
         if(!var_1430)
         {
            return;
         }
         var_1430.procedure = windowEventHandler;
         var_1430.center();
         if(var_282.catalog.getBoolean("disclaimer.credit_spending.enabled"))
         {
            setDisclaimerAccepted(false);
         }
         else
         {
            var_1430.findChildByName("disclaimer").dispose();
            setDisclaimerAccepted(true);
         }
         var _loc1_:class_18 = var_282.localization;
         var _loc4_:class_3160;
         var _loc5_:String = (_loc4_ = var_282.getPurse()).hasClubLeft && _loc4_.isVIP ? "extension." : "subscription.";
         var _loc3_:String = _offer.months == 0 ? "days" : "months";
         var _loc2_:String = "catalog.vip.buy.confirm." + _loc5_ + _loc3_;
         _loc1_.registerParameter(_loc2_,"num_" + _loc3_,String(_offer.months == 0 ? _offer.extraDays : _offer.months));
         var_1430.findChildByName("subscription_name").caption = _loc1_.getLocalization(_loc2_);
         _loc1_.registerParameter("catalog.vip.buy.confirm.end_date","day","null");
         _loc1_.registerParameter("catalog.vip.buy.confirm.end_date","month","null");
         _loc1_.registerParameter("catalog.vip.buy.confirm.end_date","year","null");
         var_282.catalog.utils.showPriceInContainer(var_1430.findChildByName("purchase_cost_box") as class_3151,_offer);
      }
      
      private function setDisclaimerAccepted(param1:Boolean) : void
      {
         if(var_1430 == null)
         {
            return;
         }
         var _loc2_:class_3127 = var_1430.findChildByName("select_button");
         if(_loc2_ == null)
         {
            return;
         }
         if(param1)
         {
            _loc2_.enable();
         }
         else
         {
            _loc2_.disable();
         }
      }
      
      private function windowEventHandler(param1:class_3134, param2:class_3127) : void
      {
         if(!param1 || !param2 || !var_282 || !_offer)
         {
            return;
         }
         if(param1.type != "WME_CLICK" && param1.type != "WME_DOUBLE_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "spending_disclaimer":
               setDisclaimerAccepted(class_3176(param2).isSelected);
               break;
            case "select_button":
               var_282.catalog.doNotCloseAfterVipPurchase();
               var_282.confirmSelection(_offer,var_344);
               break;
            case "header_button_close":
            case "cancel_button":
               var_282.catalog.forgetPageDuringVipPurchase();
               var_282.closeConfirmation();
         }
      }
   }
}
