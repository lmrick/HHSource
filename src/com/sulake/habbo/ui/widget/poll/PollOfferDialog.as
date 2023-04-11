package com.sulake.habbo.ui.widget.poll
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetPollMessage;
   
   public class PollOfferDialog implements class_3419
   {
      
      public static const const_487:String = "POLL_OFFER_STATE_OK";
      
      public static const CANCEL:String = "POLL_OFFER_STATE_CANCEL";
      
      public static const UNKNOWN:String = "POLL_OFFER_STATE_UNKNOWN";
       
      
      private var _disposed:Boolean = false;
      
      private var _window:class_3281;
      
      private var var_159:String = "POLL_OFFER_STATE_UNKNOWN";
      
      private var var_1429:com.sulake.habbo.ui.widget.poll.PollWidget;
      
      private var var_247:int = -1;
      
      public function PollOfferDialog(param1:int, param2:String, param3:String, param4:com.sulake.habbo.ui.widget.poll.PollWidget)
      {
         var _loc9_:class_3127 = null;
         var _loc5_:class_3127 = null;
         var _loc7_:class_3127 = null;
         var _loc6_:class_3127 = null;
         var _loc8_:IItemListWindow = null;
         var _loc12_:ITextWindow = null;
         var _loc10_:ITextWindow = null;
         super();
         var_247 = param1;
         var_1429 = param4;
         var _loc11_:XmlAsset;
         if((_loc11_ = var_1429.assets.getAssetByName("poll_offer") as XmlAsset) != null)
         {
            _window = var_1429.windowManager.buildFromXML(_loc11_.content as XML) as class_3281;
            if(_window)
            {
               _window.center();
               if((_loc9_ = _window.findChildByName("poll_offer_button_ok")) != null)
               {
                  _loc9_.addEventListener("WME_CLICK",onOk);
               }
               if((_loc5_ = _window.findChildByName("poll_offer_button_cancel")) != null)
               {
                  _loc5_.addEventListener("WME_CLICK",onCancel);
               }
               if((_loc7_ = _window.findChildByName("poll_offer_button_later")) != null)
               {
                  _loc7_.addEventListener("WME_CLICK",onLater);
               }
               if((_loc6_ = _window.findChildByName("header_button_close")) != null)
               {
                  _loc6_.addEventListener("WME_CLICK",onClose);
               }
               if(_loc12_ = _window.findChildByName("poll_offer_headline") as ITextWindow)
               {
                  _loc12_.htmlText = param2;
                  if(_loc8_ = _window.findChildByName("poll_offer_headline_wrapper") as IItemListWindow)
                  {
                     _window.height += _loc8_.scrollableRegion.height - _loc8_.visibleRegion.height;
                  }
               }
               if(_loc10_ = _window.findChildByName("poll_offer_summary") as ITextWindow)
               {
                  _loc10_.htmlText = param3;
                  if(_loc8_ = _window.findChildByName("poll_offer_summary_wrapper") as IItemListWindow)
                  {
                     _window.height += _loc8_.scrollableRegion.height - _loc8_.visibleRegion.height;
                  }
               }
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get state() : String
      {
         return var_159;
      }
      
      public function start() : void
      {
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         var_1429 = null;
      }
      
      private function onOk(param1:class_3134) : void
      {
         if(var_159 != "POLL_OFFER_STATE_UNKNOWN")
         {
            return;
         }
         var_159 = "POLL_OFFER_STATE_OK";
         var_1429.messageListener.processWidgetMessage(new RoomWidgetPollMessage("RWPM_START",var_247));
      }
      
      private function onCancel(param1:class_3134) : void
      {
         if(var_159 != "POLL_OFFER_STATE_UNKNOWN")
         {
            return;
         }
         var_159 = "POLL_OFFER_STATE_CANCEL";
         var_1429.messageListener.processWidgetMessage(new RoomWidgetPollMessage("RWPM_REJECT",var_247));
         var_1429.pollCancelled(var_247);
      }
      
      private function onLater(param1:class_3134) : void
      {
         if(var_159 != "POLL_OFFER_STATE_UNKNOWN")
         {
            return;
         }
         var_159 = "POLL_OFFER_STATE_CANCEL";
         var_1429.pollCancelled(var_247);
      }
      
      private function onClose(param1:class_3134) : void
      {
         if(var_159 != "POLL_OFFER_STATE_UNKNOWN")
         {
            return;
         }
         var_159 = "POLL_OFFER_STATE_CANCEL";
         var_1429.messageListener.processWidgetMessage(new RoomWidgetPollMessage("RWPM_REJECT",var_247));
         var_1429.pollCancelled(var_247);
      }
   }
}
