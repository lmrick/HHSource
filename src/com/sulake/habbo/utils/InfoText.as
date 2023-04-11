package com.sulake.habbo.utils
{
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.class_3134;
   
   public class InfoText
   {
       
      
      private var var_1519:ITextFieldWindow;
      
      private var _includeInfo:Boolean;
      
      private var var_3469:String = "";
      
      public function InfoText(param1:ITextFieldWindow, param2:String = null)
      {
         super();
         var_1519 = param1;
         if(param2 != null)
         {
            _includeInfo = true;
            var_3469 = param2;
            var_1519.text = param2;
         }
         var_1519.addEventListener("WE_FOCUSED",onFocus);
      }
      
      public function dispose() : void
      {
         if(var_1519)
         {
            var_1519.dispose();
            var_1519 = null;
         }
      }
      
      public function goBackToInitialState() : void
      {
         var_1519.text = var_3469;
         _includeInfo = true;
      }
      
      public function getText() : String
      {
         return _includeInfo ? "" : String(var_1519.text);
      }
      
      public function setText(param1:String) : void
      {
         _includeInfo = false;
         var_1519.text = param1;
      }
      
      public function get input() : ITextFieldWindow
      {
         return var_1519;
      }
      
      private function onFocus(param1:class_3134) : void
      {
         if(!_includeInfo)
         {
            return;
         }
         var_1519.text = "";
         _includeInfo = false;
      }
   }
}
