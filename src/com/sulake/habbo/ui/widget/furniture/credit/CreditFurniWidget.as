package com.sulake.habbo.ui.widget.furniture.credit
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetCreditFurniUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetCreditFurniRedeemMessage;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.class_1684;
   import flash.events.IEventDispatcher;
   import flash.geom.Rectangle;
   
   public class CreditFurniWidget extends RoomWidgetBase
   {
      
      private static const const_782:Number = 100;
      
      private static const const_693:Number = 100;
       
      
      private var _window:class_3151;
      
      private var var_2841:int = -1;
      
      private var var_3184:Number;
      
      public function CreditFurniWidget(param1:IRoomWidgetHandler, param2:class_1684, param3:class_21, param4:class_18)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         hideInterface();
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener("RWCFUE_CREDIT_FURNI_UPDATE",onObjectUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener("RWCFUE_CREDIT_FURNI_UPDATE",onObjectUpdate);
      }
      
      private function onObjectUpdate(param1:RoomWidgetCreditFurniUpdateEvent) : void
      {
         hideInterface();
         var_2841 = param1.objectId;
         var_3184 = param1.creditValue;
         showInterface();
      }
      
      private function showInterface() : void
      {
         var _loc2_:class_3127 = null;
         if(var_2841 == -1)
         {
            return;
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         windowManager.registerLocalizationParameter("widgets.furniture.credit.redeem.value","value",String(var_3184));
         var _loc3_:IAsset = assets.getAssetByName("credit_redeem");
         var _loc1_:XmlAsset = XmlAsset(_loc3_);
         if(_loc1_ == null)
         {
            return;
         }
         _window = windowManager.createWindow("creditfurniui_container","",4,0,131073,new Rectangle(100,100,2,2),null,0) as class_3151;
         _window.buildFromXML(XML(_loc1_.content));
         _window.background = true;
         _window.color = 33554431;
         _loc2_ = _window.findChildByName("cancel");
         if(_loc2_ != null)
         {
            _loc2_.addEventListener("WME_CLICK",onMouseEvent);
         }
         _loc2_ = _window.findChildByName("exchange");
         if(_loc2_ != null)
         {
            _loc2_.addEventListener("WME_CLICK",onMouseEvent);
         }
         _loc2_ = _window.findChildByName("link");
         if(_loc2_ != null)
         {
            _loc2_.addEventListener("WME_CLICK",onMouseEvent);
         }
         _loc2_ = _window.findChildByTag("close");
         if(_loc2_ != null)
         {
            _loc2_.procedure = onWindowClose;
         }
         _window.addEventListener("WME_CLICK",onMouseEvent);
      }
      
      private function hideInterface() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         var_2841 = -1;
         var_3184 = 0;
      }
      
      private function sendRedeemMessage() : void
      {
         var _loc1_:RoomWidgetCreditFurniRedeemMessage = null;
         if(var_2841 == -1)
         {
            return;
         }
         if(messageListener != null)
         {
            _loc1_ = new RoomWidgetCreditFurniRedeemMessage("RWFCRM_REDEEM",var_2841);
            messageListener.processWidgetMessage(_loc1_);
            hideInterface();
         }
      }
      
      private function onMouseEvent(param1:WindowMouseEvent) : void
      {
         var _loc4_:String = null;
         var _loc2_:class_3127 = param1.target as class_3127;
         var _loc3_:String = _loc2_.name;
         switch(_loc3_)
         {
            case "link":
               if((_loc4_ = String(localizations.getLocalization("widget.furni.info.url"))).indexOf("http") == 0)
               {
                  HabboWebTools.navigateToURL(_loc4_,"habboMain");
                  break;
               }
               break;
            case "exchange":
               sendRedeemMessage();
               break;
            case "cancel":
            case "close":
               hideInterface();
         }
      }
      
      private function onWindowClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         hideInterface();
      }
   }
}
