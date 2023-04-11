package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.class_3217;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
   import com.sulake.habbo.window.widgets.class_3308;
   import package_79.class_1554;
   
   public class BotChangeFigure extends DefaultActionType
   {
      
      private static const STRING_PARAM_DELIMITER:String = "\t";
       
      
      private var var_1460:HabboUserDefinedRoomEvents;
      
      private var _figureString:String;
      
      private var _botName:String;
      
      private var _window:class_3151;
      
      public function BotChangeFigure()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3520.BOT_CHANGE_FIGURE;
      }
      
      override public function get requiresFurni() : int
      {
         return UserDefinedRoomEventsCtrl.STUFF_SELECTION_OPTION_NONE;
      }
      
      override public function onInit(param1:class_3151, param2:HabboUserDefinedRoomEvents) : void
      {
         var_1460 = param2;
      }
      
      override public function readStringParamFromForm(param1:class_3151) : String
      {
         var _loc2_:String = String(getInput(param1,"bot_name").text);
         return _loc2_ + "\t" + _figureString;
      }
      
      override public function onEditStart(param1:class_3151, param2:class_1554) : void
      {
         var _loc3_:Array = param2.stringParam.split("\t");
         if(_loc3_.length > 0)
         {
            _botName = _loc3_[0];
         }
         if(_loc3_.length > 1)
         {
            _figureString = _loc3_[1];
         }
         getInput(param1,"bot_name").text = _botName;
         class_3308(class_3217(param1.findChildByName("avatar_image")).widget).figure = _figureString;
         param1.findChildByName("capture_figure").procedure = captureFigureButtonProcedure;
         _window = param1;
      }
      
      override public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      private function getInput(param1:class_3151, param2:String) : ITextFieldWindow
      {
         return ITextFieldWindow(param1.findChildByName(param2));
      }
      
      private function captureFigureButtonProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type == "WME_CLICK")
         {
            _figureString = var_1460.sessionDataManager.figure;
            class_3308(class_3217(_window.findChildByName("avatar_image")).widget).figure = _figureString;
         }
      }
   }
}
