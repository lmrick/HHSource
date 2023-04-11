package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetSpinnerEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class SpinnerCatalogWidget extends CatalogWidget implements class_3321
   {
      
      private static const SPIN_BUTTONDOWN_HOLD_VALUE_STEP_DELAY_MS:int = 75;
      
      private static const const_841:int = 35;
       
      
      private var _catalog:HabboCatalog;
      
      private var var_195:int = 1;
      
      private var name_3:int = 1;
      
      private var name_5:int = 100;
      
      private var var_2101:Timer;
      
      private var var_3408:Boolean = false;
      
      private var var_3290:Boolean = false;
      
      private var var_2511:Boolean = false;
      
      private var var_2974:int = 1;
      
      private var var_2913:Array;
      
      private var _promoInfo:class_3127;
      
      public function SpinnerCatalogWidget(param1:class_3151, param2:HabboCatalog)
      {
         var_2913 = new Array(0);
         super(param1);
         _catalog = param2;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_2101 != null)
            {
               var_2101.stop();
               var_2101 = null;
            }
            events.removeEventListener("CWSE_RESET",onRequestResetEvent);
            events.removeEventListener("CWSE_SHOW",onShowEvent);
            events.removeEventListener("CWSE_HIDE",onHideEvent);
            events.removeEventListener("CWSE_SET_MAX",onSetMaxEvent);
            events.removeEventListener("CWSE_SET_MIN",onSetMinEvent);
            super.dispose();
         }
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         attachWidgetView("spinnerWidget");
         window.visible = false;
         if(true)
         {
            return true;
         }
         window.procedure = spinnerWindowProcedure;
         var _loc1_:ITextFieldWindow = window.findChildByName("text_value") as ITextFieldWindow;
         if(_loc1_)
         {
            _loc1_.addEventListener("WKE_KEY_UP",onInputEvent);
         }
         events.addEventListener("CWSE_RESET",onRequestResetEvent);
         events.addEventListener("CWSE_SHOW",onShowEvent);
         events.addEventListener("CWSE_HIDE",onHideEvent);
         events.addEventListener("CWSE_SET_MAX",onSetMaxEvent);
         events.addEventListener("CWSE_SET_MIN",onSetMinEvent);
         var_2101 = new Timer(75);
         var_2101.addEventListener("timer",onSpinnerTimerEvent);
         _promoInfo = window.findChildByName("promo.info");
         return true;
      }
      
      private function refresh() : void
      {
         var _loc1_:int = 0;
         var_195 = Math.max(var_195,name_3);
         var_195 = Math.min(var_195,name_5);
         events.dispatchEvent(new CatalogWidgetSpinnerEvent("CWSE_VALUE_CHANGED",var_195));
         setValueText(var_195.toString());
         if(_promoInfo && false)
         {
            _loc1_ = _catalog.utils.getDiscountItemsCount(var_195);
            window.findChildByName("discountContainer").visible = _loc1_ > 0;
            _catalog.localization.registerParameter("shop.bonus.items.count","amount",_loc1_.toString());
         }
      }
      
      private function onRequestResetEvent(param1:CatalogWidgetSpinnerEvent) : void
      {
         var_195 = param1.value;
         if(param1.skipSteps != null)
         {
            var_2913 = param1.skipSteps;
         }
         refresh();
      }
      
      private function onShowEvent(param1:CatalogWidgetSpinnerEvent) : void
      {
         window.visible = true;
      }
      
      private function onHideEvent(param1:CatalogWidgetSpinnerEvent) : void
      {
         window.visible = false;
      }
      
      private function onSetMaxEvent(param1:CatalogWidgetSpinnerEvent) : void
      {
         name_5 = param1.value;
      }
      
      private function onSetMinEvent(param1:CatalogWidgetSpinnerEvent) : void
      {
         name_3 = param1.value;
      }
      
      private function onSpinnerTimerEvent(param1:TimerEvent) : void
      {
         if(disposed)
         {
            return;
         }
         var_2511 = true;
         if(var_3408)
         {
            increaseValue();
            if(var_195 - var_2974 > 35)
            {
               increaseValue();
            }
         }
         if(var_3290)
         {
            decreaseValue();
            if(var_2974 - var_195 > 35)
            {
               decreaseValue();
            }
         }
         refresh();
      }
      
      private function increaseValue() : void
      {
         var _loc1_:int = var_195 + 1;
         while(var_2913.indexOf(_loc1_) != -1)
         {
            _loc1_++;
         }
         var_195 = _loc1_;
      }
      
      private function decreaseValue() : void
      {
         var _loc1_:int = var_195 - 1;
         while(var_2913.indexOf(_loc1_) != -1)
         {
            _loc1_--;
         }
         var_195 = _loc1_;
      }
      
      private function setValueText(param1:String) : void
      {
         if(_window == null)
         {
            return;
         }
         if(_window.findChildByName("text_value") is ITextFieldWindow)
         {
            if(_window.findChildByName("text_value").caption.length > 0)
            {
               _window.findChildByName("text_value").caption = param1;
            }
         }
         else
         {
            _window.findChildByName("text_value").caption = param1;
         }
      }
      
      private function spinnerWindowProcedure(param1:class_3134, param2:class_3127 = null) : void
      {
         if(!param1)
         {
            return;
         }
         if(param1.type != "WME_CLICK" && param1.type != "WME_DOWN" && param1.type != "WME_UP" && param1.type != "WME_UP_OUTSIDE")
         {
            return;
         }
         loop0:
         switch(param1.target.name)
         {
            case "button_less":
               switch(param1.type)
               {
                  case "WME_DOWN":
                     var_3290 = true;
                     var_2974 = var_195;
                     var_2101.start();
                     break loop0;
                  case "WME_UP":
                  case "WME_UP_OUTSIDE":
                     break;
                  case "WME_CLICK":
                     if(!var_2511)
                     {
                        decreaseValue();
                     }
                     refresh();
                     var_2511 = false;
               }
               var_3290 = false;
               var_2101.stop();
               break;
            case "button_more":
               switch(param1.type)
               {
                  case "WME_DOWN":
                     var_3408 = true;
                     var_2974 = var_195;
                     var_2101.start();
                     break loop0;
                  case "WME_UP":
                  case "WME_UP_OUTSIDE":
                     break;
                  case "WME_CLICK":
                     if(!var_2511)
                     {
                        increaseValue();
                     }
                     refresh();
                     var_2511 = false;
               }
               var_3408 = false;
               var_2101.stop();
         }
      }
      
      private function onInputEvent(param1:WindowKeyboardEvent) : void
      {
         var_195 = parseInt(param1.target.caption);
         refresh();
      }
   }
}
