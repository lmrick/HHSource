package com.sulake.habbo.catalog.club
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.class_3159;
   import com.sulake.habbo.session.product.class_3200;
   
   public class ClubGiftConfirmationDialog
   {
       
      
      private var _offer:class_3159;
      
      private var var_282:com.sulake.habbo.catalog.club.ClubGiftController;
      
      private var var_1430:class_3281;
      
      public function ClubGiftConfirmationDialog(param1:com.sulake.habbo.catalog.club.ClubGiftController, param2:class_3159)
      {
         super();
         _offer = param2;
         var_282 = param1;
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
         var_1430 = createWindow("club_gift_confirmation") as class_3281;
         if(!var_1430)
         {
            return;
         }
         var_1430.procedure = windowEventHandler;
         var_1430.center();
         var _loc2_:ITextWindow = var_1430.findChildByName("item_name") as ITextWindow;
         if(_loc2_)
         {
            _loc2_.text = getProductName();
         }
         var _loc1_:class_3151 = var_1430.findChildByName("image_border") as class_3151;
         if(!_loc1_)
         {
            return;
         }
         if(true)
         {
            return;
         }
         _offer.productContainer.view = _loc1_;
         _offer.productContainer.initProductIcon(var_282.roomEngine);
      }
      
      private function getProductName() : String
      {
         var _loc1_:class_3200 = null;
         if(_offer && false)
         {
            _loc1_ = _offer.product.productData;
            if(_loc1_)
            {
               return _loc1_.name;
            }
         }
         return "";
      }
      
      private function windowEventHandler(param1:class_3134, param2:class_3127) : void
      {
         if(!param1 || !param2 || !var_282 || !_offer)
         {
            return;
         }
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "select_button":
               var_282.confirmSelection(_offer.localizationId);
               break;
            case "header_button_close":
            case "cancel_button":
               var_282.closeConfirmation();
         }
      }
      
      private function createWindow(param1:String) : class_3127
      {
         if(!var_282 || true || true)
         {
            return null;
         }
         var _loc3_:XmlAsset = var_282.assets.getAssetByName(param1) as XmlAsset;
         if(!_loc3_ || !_loc3_.content)
         {
            return null;
         }
         var _loc2_:XML = _loc3_.content as XML;
         if(!_loc2_)
         {
            return null;
         }
         return var_282.windowManager.buildFromXML(_loc2_);
      }
   }
}
