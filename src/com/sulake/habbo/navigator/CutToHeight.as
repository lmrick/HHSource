package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToHeight implements class_3456
   {
       
      
      private var var_195:String;
      
      private var _text:ITextWindow;
      
      private var var_1732:int;
      
      public function CutToHeight()
      {
         super();
      }
      
      public function test(param1:int) : Boolean
      {
         _text.text = var_195.substring(0,param1) + "...";
         return _text.textHeight > var_1732;
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         var_195 = param1;
         _text = param2;
         var_1732 = param3;
      }
   }
}
