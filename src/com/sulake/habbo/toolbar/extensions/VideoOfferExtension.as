package com.sulake.habbo.toolbar.extensions
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3282;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.IVideoOfferLauncher;
   import com.sulake.habbo.catalog.enum.VideoOfferTypeEnum;
   import com.sulake.habbo.inventory.events.HabboInventoryHabboClubEvent;
   import com.sulake.habbo.toolbar.HabboToolbar;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import package_49.class_898;
   
   public class VideoOfferExtension implements IVideoOfferLauncher
   {
      
      private static const const_598:String = "video_offer";
      
      private static const LINK_COLOR_NORMAL:uint = 16777215;
      
      private static const LINK_COLOR_HIGHLIGHT:uint = 12247545;
      
      private static const CLOSE_COLOR_NORMAL:uint = 6710886;
      
      private static const CLOSE_COLOR_OVER:uint = 13421772;
       
      
      private var _toolbar:HabboToolbar;
      
      private var var_1430:class_3151;
      
      private var _textRegion:IRegionWindow;
      
      private var _closeButton:IIconWindow;
      
      private var var_3656:Boolean = false;
      
      public function VideoOfferExtension(param1:HabboToolbar)
      {
         super();
         _toolbar = param1;
      }
      
      public function get window() : class_3127
      {
         return var_1430;
      }
      
      public function onClubChanged(param1:HabboInventoryHabboClubEvent) : void
      {
         if(_toolbar.inventory.clubIsExpiring && !var_1430 && isClubExtensionEnabled())
         {
            _toolbar.extensionView.detachExtension("video_offer");
            destroyWindow();
            return;
         }
         if(!var_3656 && !var_1430)
         {
            _toolbar.catalog.videoOffers.load(this);
         }
      }
      
      private function isClubExtensionEnabled() : Boolean
      {
         return _toolbar.inventory.clubLevel == 2 && _toolbar.getBoolean("club.membership.extend.vip.promotion.enabled");
      }
      
      public function offersAvailable(param1:int) : void
      {
         if(_toolbar == null)
         {
            return;
         }
         if(param1 <= 0 || var_3656 || _toolbar.inventory.clubIsExpiring && isClubExtensionEnabled())
         {
            if(var_1430)
            {
               destroyWindow();
            }
            return;
         }
         if(!var_1430)
         {
            var_1430 = createWindow();
         }
      }
      
      private function createWindow() : class_3151
      {
         var _loc2_:String = null;
         var _loc6_:ITextWindow = null;
         var _loc7_:ITextWindow = null;
         var _loc4_:BitmapDataAsset = null;
         var _loc5_:BitmapData = null;
         var _loc8_:class_3282 = null;
         var _loc1_:class_3151 = null;
         var _loc3_:XmlAsset = _toolbar.assets.getAssetByName("video_offer_promotion_xml") as XmlAsset;
         if(_loc3_)
         {
            _loc1_ = _toolbar.windowManager.buildFromXML(_loc3_.content as XML,1) as class_3151;
            if(_loc1_)
            {
               _loc2_ = String(_toolbar.localization.getLocalization("supersaverads.video.promo.offer","Watch a video and earn a credit!"));
               _loc6_ = _loc1_.findChildByName("promo_text") as ITextWindow;
               _loc7_ = _loc1_.findChildByName("promo_text_shadow") as ITextWindow;
               if(_loc6_)
               {
                  _loc6_.text = _loc2_;
               }
               if(_loc7_)
               {
                  _loc7_.text = _loc2_;
               }
               if((_loc4_ = _toolbar.assets.getAssetByName("offer_icon_png") as BitmapDataAsset) != null)
               {
                  _loc5_ = _loc4_.content as BitmapData;
                  _loc8_ = _loc1_.findChildByName("promo_icon") as class_3282;
                  if(_loc5_ != null && _loc8_ != null)
                  {
                     _loc8_.bitmap = new BitmapData(_loc8_.width,_loc8_.height,true,0);
                     _loc8_.bitmap.copyPixels(_loc5_,_loc5_.rect,new Point(0,0));
                  }
               }
               _textRegion = _loc1_.findChildByName("text_region") as IRegionWindow;
               if(_textRegion)
               {
                  _textRegion.addEventListener("WME_CLICK",onTextRegionClicked);
                  _textRegion.addEventListener("WME_OVER",onTextRegionMouseOver);
                  _textRegion.addEventListener("WME_OUT",onTextRegionMouseOut);
               }
               _closeButton = _loc1_.findChildByName("promo_close_icon") as IIconWindow;
               if(_closeButton)
               {
                  _closeButton.addEventListener("WME_CLICK",onCloseClicked);
                  _closeButton.addEventListener("WME_OVER",onCloseMouseOver);
                  _closeButton.addEventListener("WME_OUT",onCloseMouseOut);
               }
               _toolbar.extensionView.attachExtension("video_offer",_loc1_,10);
            }
         }
         return _loc1_;
      }
      
      private function destroyWindow() : void
      {
         if(var_1430)
         {
            if(_textRegion)
            {
               _textRegion.removeEventListener("WME_CLICK",onTextRegionClicked);
               _textRegion.removeEventListener("WME_OVER",onTextRegionMouseOver);
               _textRegion.removeEventListener("WME_OUT",onTextRegionMouseOut);
               _textRegion = null;
            }
            if(_closeButton)
            {
               _closeButton.removeEventListener("WME_CLICK",onCloseClicked);
               _closeButton.removeEventListener("WME_OVER",onCloseMouseOver);
               _closeButton.removeEventListener("WME_OUT",onCloseMouseOut);
               _closeButton = null;
            }
            var_1430.dispose();
            var_1430 = null;
         }
      }
      
      public function dispose() : void
      {
         if(_toolbar == null)
         {
            return;
         }
         _toolbar.extensionView.detachExtension("video_offer");
         destroyWindow();
         _toolbar = null;
      }
      
      private function onCloseClicked(param1:WindowMouseEvent) : void
      {
         var_3656 = true;
         destroyWindow();
         _toolbar.connection.send(new class_898("SuperSaverAds","client_action","supersaverads.video.promo.close_clicked"));
      }
      
      private function onCloseMouseOver(param1:WindowMouseEvent) : void
      {
         if(_closeButton)
         {
            _closeButton.color = 13421772;
         }
      }
      
      private function onCloseMouseOut(param1:WindowMouseEvent) : void
      {
         if(_closeButton)
         {
            _closeButton.color = 6710886;
         }
      }
      
      private function onTextRegionClicked(param1:WindowMouseEvent) : void
      {
         if(!_toolbar.catalog.videoOffers.launch(VideoOfferTypeEnum.CREDIT))
         {
            destroyWindow();
         }
      }
      
      private function onTextRegionMouseOver(param1:WindowMouseEvent) : void
      {
         var _loc2_:ITextWindow = null;
         if(var_1430)
         {
            _loc2_ = var_1430.findChildByName("promo_text") as ITextWindow;
            _loc2_.textColor = 12247545;
         }
      }
      
      private function onTextRegionMouseOut(param1:WindowMouseEvent) : void
      {
         var _loc2_:ITextWindow = null;
         if(var_1430)
         {
            _loc2_ = var_1430.findChildByName("promo_text") as ITextWindow;
            _loc2_.textColor = 16777215;
         }
      }
   }
}
