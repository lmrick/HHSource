package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import package_79.class_1554;
   
   public class BotFollowAvatar extends DefaultActionType
   {
       
      
      public function BotFollowAvatar()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3520.BOT_FOLLOW_AVATAR;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_NONE;
      }
      
      override public function readStringParamFromForm(param1:class_3151) : String
      {
         return String(getInput(param1,"bot_name").text);
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         return [getSelector(param1,"type_selector").getSelected().id];
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         getInput(param1,"bot_name").text = param2.stringParam;
         getSelector(param1,"type_selector").setSelected(getRadio(param1,"radio_" + param2.intParams[0]));
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      private function getInput(param1:class_3151, param2:String) : ITextFieldWindow
      {
         return ITextFieldWindow(param1.findChildByName(param2));
      }
      
      private function getSelector(param1:class_3151, param2:String) : ISelectorWindow
      {
         return ISelectorWindow(param1.findChildByName(param2));
      }
      
      private function getRadio(param1:class_3151, param2:String) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName(param2));
      }
   }
}
