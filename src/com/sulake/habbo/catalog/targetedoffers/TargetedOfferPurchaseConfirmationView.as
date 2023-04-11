package com.sulake.habbo.catalog.targetedoffers
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3176;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.targetedoffers.data.TargetedOffer;
   
   public class TargetedOfferPurchaseConfirmationView extends OfferView
   {
       
      
      private var var_2187:int;
      
      public function TargetedOfferPurchaseConfirmationView(param1:OfferController, param2:TargetedOffer, param3:int)
      {
         super(param1,param2);
         var_2187 = param3;
         _window = class_3151(var_282.catalog.windowManager.buildFromXML(XML(var_282.catalog.assets.getAssetByName("targeted_offer_purchase_confirmation_xml").content)));
         var _loc4_:HabboCatalog;
         if((_loc4_ = var_282.catalog as HabboCatalog).getBoolean("disclaimer.credit_spending.enabled"))
         {
            setDisclaimerAccepted(false);
         }
         else
         {
            _window.findChildByName("disclaimer").dispose();
            setDisclaimerAccepted(true);
         }
         ITextWindow(_window.findChildByName("product_name")).text = getLocalization(param2.title);
         var _loc5_:class_3151 = _window.findChildByName("purchase_cost_box") as class_3151;
         _loc4_.utils.showPriceInContainer(_loc5_,param2,param3);
         var _loc6_:ITextWindow;
         if((_loc6_ = _window.findChildByName("quantity") as ITextWindow) != null)
         {
            if(param1.catalog.multiplePurchaseEnabled && var_2187 > 1)
            {
               _loc6_.text = "X " + var_2187;
            }
         }
         _window.procedure = onInput;
         _window.center();
      }
      
      private function setDisclaimerAccepted(param1:Boolean) : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc2_:class_3127 = _window.findChildByName("select_button");
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
      
      private function onInput(param1:class_3134, param2:class_3127) : void
      {
         if(!var_282)
         {
            return;
         }
         if(param1.type == "WME_DOWN")
         {
            switch(param2.name)
            {
               case "spending_disclaimer":
                  setDisclaimerAccepted(class_3176(param2).isSelected);
                  break;
               case "header_button_close":
               case "cancel_button":
                  var_282.maximizeOffer(_offer);
                  break;
               case "buy_button":
                  var_282.purchaseTargetedOffer(_offer,var_2187);
            }
         }
      }
   }
}
