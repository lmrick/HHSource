package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.TextInputEvent;
   
   public class TextInputCatalogWidget extends CatalogWidget implements class_3321
   {
       
      
      private var var_2901:ITextFieldWindow;
      
      public function TextInputCatalogWidget(param1:class_3151)
      {
         super(param1);
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         var_2901 = _window.findChildByName("input_text") as ITextFieldWindow;
         if(var_2901 != null)
         {
            var_2901.addEventListener("WKE_KEY_UP",onKey);
         }
         return true;
      }
      
      private function onKey(param1:WindowKeyboardEvent) : void
      {
         if(var_2901 == null)
         {
            return;
         }
         events.dispatchEvent(new TextInputEvent(var_2901.text));
      }
   }
}
