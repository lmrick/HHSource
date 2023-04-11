package com.sulake.habbo.toolbar.offers
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.offers.IOfferCenter;
   import com.sulake.habbo.catalog.offers.IOfferExtension;
   import com.sulake.habbo.toolbar.HabboToolbar;
   import com.sulake.habbo.window.class_1684;
   
   public class OfferExtension implements IOfferExtension, class_13
   {
       
      
      private var _disposed:Boolean;
      
      private var _window:class_3151;
      
      private var _toolbar:HabboToolbar;
      
      private var _offerCenter:IOfferCenter;
      
      private var var_19:IItemListWindow;
      
      public function OfferExtension(param1:HabboToolbar, param2:class_1684, param3:class_21, param4:IHabboCatalog)
      {
         super();
         _toolbar = param1;
         _window = param2.buildFromXML(param3.getAssetByName("offer_extension_xml").content as XML) as class_3151;
         _window.procedure = windowProcedure;
         _window.visible = false;
         var_19 = _window.findChildByName("list") as IItemListWindow;
         _offerCenter = param4.getOfferCenter(this);
         param1.extensionView.attachExtension("video_offers",window,8);
         refresh();
      }
      
      private function windowProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "start_video":
               _offerCenter.showVideo();
               break;
            case "check_rewards":
               _offerCenter.showRewards();
         }
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         var_19 = null;
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         _toolbar = null;
         _disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get window() : class_3151
      {
         return _window;
      }
      
      public function indicateRewards() : void
      {
         if(_window != null)
         {
            _window.visible = true;
            _window.findChildByName("check_rewards").visible = true;
            refresh();
         }
      }
      
      public function indicateVideoAvailable(param1:Boolean) : void
      {
         var _loc2_:class_3127 = null;
         if(_window != null)
         {
            _window.visible = false || param1;
            _loc2_ = _window.findChildByName("start_video");
            _loc2_.visible = param1;
            if(false)
            {
               _loc2_.disable();
               _loc2_.color = 10066329;
            }
            else
            {
               _loc2_.enable();
               _loc2_.color = 12932417;
            }
            refresh();
         }
      }
      
      private function refresh() : void
      {
         var_19.arrangeListItems();
         _window.visible = var_19.getListItemAt(0).visible || var_19.getListItemAt(1).visible;
         _toolbar.extensionView.refreshItemWindow();
      }
   }
}
