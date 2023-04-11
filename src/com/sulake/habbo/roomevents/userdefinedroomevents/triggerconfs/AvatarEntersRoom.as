package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import package_79.class_1554;
   
   public class AvatarEntersRoom extends DefaultTriggerConf
   {
       
      
      private var _cont:class_3151;
      
      public function AvatarEntersRoom()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3431.AVATAR_ENTERS_ROOM;
      }
      
      override public function readStringParamFromForm(param1:class_3151) : String
      {
         var _loc2_:String = String(getInput().text);
         return !!getCertainAvatarRadio().isSelected ? _loc2_ : "";
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         _cont = param1;
         getCertainAvatarRadio().addEventListener("WE_SELECT",onCertainAvatarSelect);
         getCertainAvatarRadio().addEventListener("WE_UNSELECT",onCertainAvatarUnselect);
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         if(param2.stringParam != "")
         {
            getSelector().setSelected(getCertainAvatarRadio());
            getInput().text = param2.stringParam;
            getInput().visible = true;
         }
         else
         {
            getSelector().setSelected(getAnyAvatarRadio());
            getInput().text = "";
            getInput().visible = false;
         }
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      private function getInput() : ITextFieldWindow
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
      
      private function getSelector() : ISelectorWindow
      {
         return ISelectorWindow(_cont.findChildByName("avatar_radio"));
      }
      
      private function onCertainAvatarSelect(param1:class_3134) : void
      {
         getInput().visible = true;
      }
      
      private function onCertainAvatarUnselect(param1:class_3134) : void
      {
         getInput().text = "";
         getInput().visible = false;
      }
   }
}
