package com.sulake.habbo.catalog.targetedoffers
{
   import com.sulake.core.runtime.class_19;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.targetedoffers.data.HabboMallOffer;
   
   public class MallOfferDialogView
   {
       
      
      private var var_282:com.sulake.habbo.catalog.targetedoffers.OfferController;
      
      private var _window:class_3151;
      
      private var _offer:HabboMallOffer;
      
      public function MallOfferDialogView(param1:com.sulake.habbo.catalog.targetedoffers.OfferController, param2:HabboMallOffer)
      {
         var _loc3_:String = null;
         super();
         var_282 = param1;
         _offer = param2;
         _window = class_3151(var_282.catalog.windowManager.buildFromXML(XML(var_282.catalog.assets.getAssetByName("targeted_offer_habbomall_xml").content)));
         class_3281(_window).title.text = getLocalization(_offer.title);
         ITextWindow(_window.findChildByName("txt_title")).text = getLocalization(_offer.title);
         if(param2.imageUrl && param2.imageUrl.length > 0)
         {
            _loc3_ = String((var_282.catalog as class_19).getProperty("image.library.url"));
            IStaticBitmapWrapperWindow(_window.findChildByName("bmp_illustration")).assetUri = _loc3_ + param2.imageUrl;
         }
         _window.procedure = onInput;
         _window.center();
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      private function onInput(param1:class_3134, param2:class_3127) : void
      {
         if(!var_282 || !_offer)
         {
            return;
         }
         if(param1.type == "WME_DOWN")
         {
            switch(param2.name)
            {
               case "header_button_close":
                  var_282.onHabboMallOfferClosed(_offer);
                  break;
               case "btn_buy":
                  var_282.onHabboMallOfferOpened(_offer);
            }
         }
      }
      
      private function getLocalization(param1:String, param2:String = null) : String
      {
         return var_282.catalog.localization.getLocalization(param1,param2 || param1);
      }
   }
}
