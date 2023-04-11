package com.sulake.habbo.help
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import package_4.class_181;
   import package_4.class_616;
   
   public class ChatReviewReporterFeedbackCtrl implements class_13
   {
       
      
      private var _habboHelp:com.sulake.habbo.help.HabboHelp;
      
      private var _window:class_3281;
      
      public function ChatReviewReporterFeedbackCtrl(param1:com.sulake.habbo.help.HabboHelp)
      {
         super();
         _habboHelp = param1;
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_616(onTicketResolved));
         _habboHelp.communicationManager.addHabboConnectionMessageEvent(new class_181(onCreateResult));
      }
      
      public function dispose() : void
      {
         _habboHelp = null;
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _habboHelp == null;
      }
      
      private function onTicketResolved(param1:class_616) : void
      {
         show(param1.getParser().localizationCode);
      }
      
      private function onCreateResult(param1:class_181) : void
      {
         show(param1.getParser().localizationCode);
      }
      
      public function show(param1:String) : void
      {
         if(!enabled)
         {
            return;
         }
         prepare();
         setText("caption_txt",param1,"caption");
         setText("body_txt",param1,"body");
         setText("note_txt",param1,"note");
         var _loc2_:ITextWindow = ITextWindow(_window.findChildByName("caption_txt"));
         _window.findChildByName("body_txt").y = _loc2_.y + _loc2_.textHeight + 5;
         _window.visible = true;
      }
      
      private function setText(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:String = "guide.bully.request.reporter." + param2 + "." + param3;
         if(_habboHelp.localization.getLocalization(_loc4_,"") == "")
         {
            _loc4_ = "guide.bully.request.reporter." + param3;
         }
         _window.findChildByName(param1).caption = "${" + _loc4_ + "}";
      }
      
      private function prepare() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = class_3281(_habboHelp.getXmlWindow("chat_review_reporter_feedback"));
         _window.procedure = windowProcedure;
         _window.center();
      }
      
      private function windowProcedure(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK" || _window == null || false)
         {
            return;
         }
         if(param2.name == "close_button" || param2.name == "header_button_close")
         {
            _window.visible = false;
         }
      }
      
      private function get enabled() : Boolean
      {
         return _habboHelp.getBoolean("chatreviewreporterfeedbackctrl.enabled");
      }
   }
}
