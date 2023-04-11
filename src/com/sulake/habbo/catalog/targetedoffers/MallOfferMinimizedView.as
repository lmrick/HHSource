package com.sulake.habbo.catalog.targetedoffers
{
   import com.sulake.core.runtime.class_19;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.targetedoffers.data.HabboMallOffer;
   
   public class MallOfferMinimizedView extends OfferView
   {
      
      private static const IMAGE_DEFAULT_URL:String = "targetedoffers/offer_default_icon.png";
       
      
      private var var_3779:HabboMallOffer;
      
      public function MallOfferMinimizedView(param1:OfferController, param2:HabboMallOffer)
      {
         super(param1,null);
         var_3779 = param2;
         _window = class_3151(var_282.catalog.windowManager.buildFromXML(XML(var_282.catalog.assets.getAssetByName("targeted_offer_minimized_xml").content)));
         var _loc4_:ITextWindow;
         if(_loc4_ = ITextWindow(_window.findChildByName("txt_title")))
         {
            _loc4_.text = getLocalization(param2.title);
         }
         var _loc3_:String = String((var_282.catalog as class_19).getProperty("image.library.url"));
         IStaticBitmapWrapperWindow(_window.findChildByName("bmp_icon")).assetUri = _loc3_ + "targetedoffers/offer_default_icon.png";
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
            var_282.maximizeMallOffer(var_3779);
            param2.name;
         }
      }
      
      public function get window() : class_3127
      {
         return _window;
      }
   }
}
