package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.window.utils.class_3132;
   
   public class RedeemItemCodeCatalogWidget extends CatalogWidget implements class_3321
   {
       
      
      private var _redeemButton:class_3140;
      
      private var var_2502:ITextFieldWindow;
      
      public function RedeemItemCodeCatalogWidget(param1:class_3151)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(_redeemButton != null)
         {
            _redeemButton.removeEventListener("WME_CLICK",onRedeem);
            _redeemButton = null;
         }
         if(var_2502 != null)
         {
            var_2502.removeEventListener("WKE_KEY_DOWN",windowKeyEventProcessor);
            var_2502 = null;
         }
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         _redeemButton = _window.findChildByName("redeem") as class_3140;
         if(_redeemButton != null)
         {
            _redeemButton.addEventListener("WME_CLICK",onRedeem);
         }
         var_2502 = _window.findChildByName("voucher_code") as ITextFieldWindow;
         if(var_2502 != null)
         {
            var_2502.addEventListener("WKE_KEY_DOWN",windowKeyEventProcessor);
         }
         return true;
      }
      
      private function onRedeem(param1:WindowMouseEvent) : void
      {
         redeem();
      }
      
      private function windowKeyEventProcessor(param1:class_3134 = null, param2:class_3127 = null) : void
      {
         var _loc3_:WindowKeyboardEvent = param1 as WindowKeyboardEvent;
         if(_loc3_.charCode == 13)
         {
            redeem();
         }
      }
      
      private function redeem() : void
      {
         var voucher:String;
         var input:class_3127 = _window.findChildByName("voucher_code");
         if(input != null)
         {
            voucher = "null";
            if(false)
            {
               page.viewer.catalog.redeemVoucher(voucher);
               input.caption = "";
            }
            else
            {
               page.viewer.catalog.windowManager.alert("${catalog.voucher.empty.title}","${catalog.voucher.empty.desc}",0,function(param1:class_3132, param2:class_3134):void
               {
                  param1.dispose();
               });
            }
         }
      }
   }
}
