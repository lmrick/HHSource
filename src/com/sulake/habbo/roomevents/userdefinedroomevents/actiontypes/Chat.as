package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import package_79.class_1554;
   
   public class Chat extends DefaultActionType
   {
       
      
      public function Chat()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3520.CHAT;
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
         return ITextFieldWindow(param1.findChildByName("chat_message"));
      }
      
      override public function validate(param1:class_3151, param2:HabboUserDefinedRoomEvents) : String
      {
         var _loc4_:String = null;
         if(getInput(param1).text.length > 100)
         {
            _loc4_ = "wiredfurni.chatmsgtoolong";
            return param2.localization.getLocalization(_loc4_,_loc4_);
         }
         return null;
      }
   }
}
