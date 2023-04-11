package com.sulake.habbo.catalog.targetedoffers
{
   import com.sulake.core.runtime.class_19;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.targetedoffers.data.TargetedOffer;
   
   public class TargetedOfferMinimizedView extends OfferView
   {
      
      private static const IMAGE_DEFAULT_URL:String = "targetedoffers/offer_default_icon.png";
       
      
      public function TargetedOfferMinimizedView(param1:OfferController, param2:TargetedOffer)
      {
         var _loc6_:IItemListWindow = null;
         super(param1,param2);
         _window = class_3151(var_282.catalog.windowManager.buildFromXML(XML(var_282.catalog.assets.getAssetByName("targeted_offer_minimized_xml").content)));
         var _loc5_:ITextWindow;
         if(_loc5_ = ITextWindow(_window.findChildByName("txt_title")))
         {
            _loc5_.text = getLocalization(param2.title);
         }
         var _loc3_:String = String((var_282.catalog as class_19).getProperty("image.library.url"));
         var _loc4_:String = param2.iconImageUrl && param2.iconImageUrl.length > 0 ? param2.iconImageUrl : "targetedoffers/offer_default_icon.png";
         IStaticBitmapWrapperWindow(_window.findChildByName("bmp_icon")).assetUri = _loc3_ + _loc4_;
         var_2036 = getLocalization("targeted.offer.minimized.timeleft","");
         if(false)
         {
            if(_loc6_ = _window.findChildByName("itemlist") as IItemListWindow)
            {
               _loc6_.removeListItem(_window.findChildByName("cnt_time_left"));
            }
         }
         else
         {
            startUpdateTimer();
         }
         _window.procedure = onInput;
         var_282.attachExtension(_window);
      }
      
      private function onInput(param1:class_3134, param2:class_3127) : void
      {
         if(!var_282)
         {
            return;
         }
         if(param1.type == "WME_DOWN")
         {
            var_282.maximizeOffer(_offer);
            param2.name;
         }
      }
      
      public function get window() : class_3127
      {
         return _window;
      }
   }
}
