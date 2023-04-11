package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.class_3140;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.window.utils.class_3132;
   
   public class MadMoneyCatalogWidget extends CatalogWidget implements class_3321
   {
       
      
      private var _buyButton:class_3140;
      
      public function MadMoneyCatalogWidget(param1:class_3151)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(_buyButton != null)
         {
            _buyButton.removeEventListener("WME_CLICK",eventProc);
            _buyButton = null;
         }
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         _buyButton = _window.findChildByName("ctlg_madmoney_button") as class_3140;
         if(_buyButton != null)
         {
         }
         return true;
      }
      
      private function eventProc(param1:WindowMouseEvent) : void
      {
         var event:WindowMouseEvent = param1;
         page.viewer.catalog.windowManager.alert("TODO","Fix in MadMoneyCatalogWidget.as",0,function(param1:class_3132, param2:class_3134):void
         {
            param1.dispose();
         });
      }
   }
}
