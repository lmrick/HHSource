package com.sulake.habbo.window.utils
{
   public class AlertDialogCaption implements ICaption
   {
       
      
      private var _text:String;
      
      private var var_3377:String;
      
      private var var_805:Boolean;
      
      public function AlertDialogCaption(param1:String, param2:String, param3:Boolean)
      {
         super();
         _text = param1;
         var_3377 = param2;
         var_805 = param3;
      }
      
      public function get text() : String
      {
         return _text;
      }
      
      public function set text(param1:String) : void
      {
         _text = param1;
      }
      
      public function get toolTip() : String
      {
         return var_3377;
      }
      
      public function set toolTip(param1:String) : void
      {
         var_3377 = param1;
      }
      
      public function get visible() : Boolean
      {
         return var_805;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var_805 = param1;
      }
   }
}
