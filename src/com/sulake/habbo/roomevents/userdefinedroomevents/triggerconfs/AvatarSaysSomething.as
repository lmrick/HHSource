package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import package_79.class_1554;
   
   public class AvatarSaysSomething extends DefaultTriggerConf
   {
       
      
      public function AvatarSaysSomething()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3431.AVATAR_SAYS_SOMETHING;
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(!!getMeRadio(param1).isSelected ? 1 : 0);
         _loc2_.push(!!getExactMatchRadio(param1).isSelected ? 1 : 0);
         return _loc2_;
      }
      
      override public function readStringParamFromForm(param1:class_3151) : String
      {
         return getInput(param1).text;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         param1.findChildByName("me_txt").caption = param2.userName;
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         getInput(param1).text = param2.stringParam;
         if(param2.intParams.length > 0 && param2.intParams[0] == 1)
         {
            getSelector(param1).setSelected(getMeRadio(param1));
         }
         else
         {
            getSelector(param1).setSelected(getAnyAvatarRadio(param1));
         }
         if(param2.intParams.length > 1 && param2.intParams[1] == 1)
         {
            getTriggerTypeSelector(param1).setSelected(getExactMatchRadio(param1));
         }
         else
         {
            getTriggerTypeSelector(param1).setSelected(getChatContainsRadio(param1));
         }
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      private function getInput(param1:class_3151) : ITextFieldWindow
      {
         return ITextFieldWindow(param1.findChildByName("chat_txt"));
      }
      
      private function getAnyAvatarRadio(param1:class_3151) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName("any_avatar_radio"));
      }
      
      private function getMeRadio(param1:class_3151) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName("me_radio"));
      }
      
      private function getSelector(param1:class_3151) : ISelectorWindow
      {
         return ISelectorWindow(param1.findChildByName("avatar_radio"));
      }
      
      private function getChatContainsRadio(param1:class_3151) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName("chat_contains_radio"));
      }
      
      private function getExactMatchRadio(param1:class_3151) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName("exact_match_radio"));
      }
      
      private function getTriggerTypeSelector(param1:class_3151) : ISelectorWindow
      {
         return ISelectorWindow(param1.findChildByName("triggertype_radio"));
      }
   }
}
