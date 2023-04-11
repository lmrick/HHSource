package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import package_79.class_1554;
   
   public class BotReachedStuff extends DefaultTriggerConf
   {
       
      
      public function BotReachedStuff()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3431.BOT_DESTINATION_REACHED;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_BY_ID_OR_BY_TYPE;
      }
      
      override public function readStringParamFromForm(param1:class_3151) : String
      {
         return getInput(param1).text;
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
         return ITextFieldWindow(param1.findChildByName("bot_name"));
      }
   }
}
