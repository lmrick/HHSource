package com.sulake.habbo.roomevents.userdefinedroomevents.conditions
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import package_79.class_1554;
   
   public class class_3499 extends DefaultConditionType
   {
       
      
      private var _cont:class_3151;
      
      public function class_3499()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3523.TRIGGERER_MATCHES;
      }
      
      override public function get negativeCode() : int
      {
         return class_3523.NOT_TRIGGERER_MATCHES;
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         _cont = param1;
         getCertainAvatarRadio().addEventListener("WE_SELECT",onCertainAvatarSelect);
         getCertainAvatarRadio().addEventListener("WE_UNSELECT",onCertainAvatarUnselect);
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var _loc3_:int = int(param2.intParams[0]);
         getUserTypeSelector().setSelected(getUserTypeRadio(_loc3_));
         if(param2.stringParam != "")
         {
            getUserNameSelector().setSelected(getCertainAvatarRadio());
            getUserNameInput().text = param2.stringParam;
            getUserNameInput().visible = true;
         }
         else
         {
            getUserNameSelector().setSelected(getAnyAvatarRadio());
            getUserNameInput().text = "";
            getUserNameInput().visible = false;
         }
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(getUserTypeSelector().getSelected().id);
         return _loc2_;
      }
      
      override public function readStringParamFromForm(param1:class_3151) : String
      {
         var _loc2_:String = String(getUserNameInput().text);
         return !!getCertainAvatarRadio().isSelected ? _loc2_ : "";
      }
      
      private function getUserTypeRadio(param1:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(_cont.findChildByName("usertype_" + param1 + "_radio"));
      }
      
      private function getUserTypeSelector() : ISelectorWindow
      {
         return ISelectorWindow(_cont.findChildByName("usertype_selector"));
      }
      
      private function getUserNameInput() : ITextFieldWindow
      {
         return ITextFieldWindow(_cont.findChildByName("avatar_name_txt"));
      }
      
      private function getCertainAvatarRadio() : IRadioButtonWindow
      {
         return IRadioButtonWindow(_cont.findChildByName("certain_avatar_radio"));
      }
      
      private function getAnyAvatarRadio() : IRadioButtonWindow
      {
         return IRadioButtonWindow(_cont.findChildByName("any_avatar_radio"));
      }
      
      private function getUserNameSelector() : ISelectorWindow
      {
         return ISelectorWindow(_cont.findChildByName("avatar_radio"));
      }
      
      private function onCertainAvatarSelect(param1:class_3134) : void
      {
         getUserNameInput().visible = true;
      }
      
      private function onCertainAvatarUnselect(param1:class_3134) : void
      {
         getUserNameInput().text = "";
         getUserNameInput().visible = false;
      }
   }
}
