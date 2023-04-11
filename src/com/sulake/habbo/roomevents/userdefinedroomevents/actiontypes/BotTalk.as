package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import package_79.class_1554;
   
   public class BotTalk extends DefaultActionType
   {
      
      private static const STRING_PARAM_DELIMITER:String = "\t";
       
      
      public function BotTalk()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3520.BOT_TALK;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_NONE;
      }
      
      override public function readStringParamFromForm(param1:class_3151) : String
      {
         var _loc2_:String = String(getInput(param1,"bot_name").text);
         var _loc3_:String = String(getInput(param1,"chat_message").text);
         return _loc2_ + "\t" + _loc3_;
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var _loc3_:Array = param2.stringParam.split("\t");
         getInput(param1,"bot_name").text = _loc3_.length >= 1 ? _loc3_[0] : "";
         getInput(param1,"chat_message").text = _loc3_.length == 2 ? _loc3_[1] : "";
         getSelector(param1,"type_selector").setSelected(getRadio(param1,"radio_" + param2.intParams[0]));
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         return [getSelector(param1,"type_selector").getSelected().id];
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
