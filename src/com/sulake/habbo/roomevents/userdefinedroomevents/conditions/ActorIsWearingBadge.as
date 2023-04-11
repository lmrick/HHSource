package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextFieldWindow;
   import package_79.class_1554;
   
   public class class_3435 extends DefaultConditionType
   {
       
      
      public function class_3435()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3523.ACTOR_IS_WEARING_BADGE;
      }
      
      override public function get negativeCode() : int
      {
         return class_3523.NOT_ACTOR_IS_WEARING_BADGE;
      }
      
      override public function readStringParamFromForm(param1:class_3151) : String
      {
         return String(getInput(param1).text);
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         getInput(param1).text = param2.stringParam;
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      private function getInput(param1:class_3151) : ITextFieldWindow
      {
         return ITextFieldWindow(param1.findChildByName("badge_code"));
      }
   }
}
