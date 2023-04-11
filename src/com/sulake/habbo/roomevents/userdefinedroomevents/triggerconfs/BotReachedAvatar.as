package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import package_79.class_1554;
   
   public class BotReachedAvatar extends DefaultTriggerConf
   {
       
      
      public function BotReachedAvatar()
      {
         super();
      }
      
      private static function getTriggererRadio(param1:class_3151, param2:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName("triggerer_" + param2 + "_radio"));
      }
      
      private static function getTriggererSelector(param1:class_3151) : ISelectorWindow
      {
         return ISelectorWindow(param1.findChildByName("triggerer_radio"));
      }
      
      override public function get code() : int
      {
         return class_3431.BOT_AVATAR_REACHED;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_NONE;
      }
      
      override public function readStringParamFromForm(param1:class_3151) : String
      {
         return getInput(param1).text;
      }
      
      override public function readIntParamsFromForm(param1:class_3151) : Array
      {
         var _loc2_:* = [];
         _loc2_.push(getTriggererSelector(param1).getSelected().id);
         return _loc2_;
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         getInput(param1).text = param2.stringParam;
         var _loc3_:int = int(param2.intParams[0]);
         getTriggererSelector(param1).setSelected(getTriggererRadio(param1,_loc3_));
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      private function getInput(param1:class_3151) : ITextFieldWindow
      {
         return ITextFieldWindow(param1.findChildByName("bot_name"));
      }
   }
}
