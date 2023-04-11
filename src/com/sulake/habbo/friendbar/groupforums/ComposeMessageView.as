package com.sulake.habbo.friendbar.groupforums
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.utils.FriendlyTime;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import package_155.class_1560;
   import package_155.class_1629;
   import package_155.class_1641;
   
   public class ComposeMessageView
   {
      
      public static const SUBJECT_MIN_LENGTH:int = 10;
      
      public static const SUBJECT_MAX_LENGTH:int = 120;
      
      public static const MESSAGE_MIN_LENGTH:int = 10;
      
      public static const MESSAGE_MAX_LENGTH:int = 4000;
      
      public static const const_1131:int = 30000;
       
      
      private var var_282:com.sulake.habbo.friendbar.groupforums.GroupForumController;
      
      private var var_1534:com.sulake.habbo.friendbar.groupforums.GroupForumView;
      
      private var var_1635:Timer;
      
      private var _window:class_3281;
      
      private var var_2033:ITextFieldWindow;
      
      private var var_330:ITextFieldWindow;
      
      private var _postButton:class_3127;
      
      private var _status:class_3127;
      
      private var var_506:class_1641;
      
      private var var_2234:class_1629;
      
      private var _hasErrors:Boolean = false;
      
      private var var_3118:Boolean = false;
      
      public function ComposeMessageView(param1:com.sulake.habbo.friendbar.groupforums.GroupForumView, param2:int, param3:int, param4:class_1641, param5:class_1629, param6:class_1560)
      {
         super();
         var_1534 = param1;
         var_282 = var_1534.controller;
         var_506 = param4;
         var_2234 = param5;
         _window = class_3281(var_282.windowManager.buildFromXML(XML(new HabboFriendBarCom.groupforum_compose_message_xml())));
         _window.x = param2;
         var _loc7_:int = int(var_282.windowManager.getDesktop(1).width);
         if(NaN > _loc7_)
         {
            _window.x = _loc7_ - 0;
         }
         _window.y = param3;
         initControls(param6);
         if(_status.caption.length == 0)
         {
            _status.caption = var_282.localizationManager.getLocalization("groupforum.compose.reply_hint");
         }
         var_1635 = new Timer(1000,0);
         var_1635.addEventListener("timer",onTimerEvent);
         var_1635.start();
      }
      
      public function focus(param1:class_1641, param2:class_1629, param3:class_1560) : void
      {
         if(!var_3118)
         {
            var_506 = param1;
            if(var_2234 != null && param2 == null)
            {
               var_2033.text = "";
            }
            var_2234 = param2;
            initControls(param3);
         }
         _window.activate();
      }
      
      private function initControls(param1:class_1560) : void
      {
         var _loc3_:IRegionWindow = com.sulake.habbo.friendbar.groupforums.GroupForumView.initTopAreaForForum(_window,var_506);
         _loc3_.removeEventListener("WME_CLICK",onTopAreaClick);
         _loc3_.addEventListener("WME_CLICK",onTopAreaClick);
         var _loc5_:class_3127 = _window.findChildByName("thread_subject_header");
         var_2033 = _window.findChildByName("thread_subject") as ITextFieldWindow;
         if(var_2234)
         {
            _loc5_.caption = var_282.localizationManager.getLocalization("groupforum.compose.subject_replying_to");
            var_2033.text = var_2234.header;
            var_2033.disable();
         }
         else
         {
            _loc5_.caption = var_282.localizationManager.getLocalization("groupforum.compose.subject");
            var_2033.addEventListener("WKE_KEY_UP",onHeaderKeyUpEvent);
            var_2033.maxChars = 120;
            var_2033.enable();
         }
         var_330 = _window.findChildByName("message_text") as ITextFieldWindow;
         var_330.removeEventListener("WKE_KEY_UP",onMessageKeyUpEvent);
         var_330.addEventListener("WKE_KEY_UP",onMessageKeyUpEvent);
         var_330.maxChars = 4000;
         if(param1 != null)
         {
            addQuote(param1);
         }
         var _loc2_:class_3127 = _window.findChildByName("cancel_btn");
         _loc2_.removeEventListener("WME_CLICK",onCancelButtonClick);
         _loc2_.addEventListener("WME_CLICK",onCancelButtonClick);
         var _loc4_:class_3127;
         (_loc4_ = _window.findChildByName("header_button_close")).removeEventListener("WME_CLICK",onCancelButtonClick);
         _loc4_.addEventListener("WME_CLICK",onCancelButtonClick);
         _postButton = _window.findChildByName("post_btn");
         _postButton.removeEventListener("WME_CLICK",onPostButtonClick);
         _postButton.addEventListener("WME_CLICK",onPostButtonClick);
         _status = _window.findChildByName("status_text");
         validateInputs();
      }
      
      private function addQuote(param1:class_1560) : void
      {
         var _loc2_:* = undefined;
         var _loc4_:StringBuffer;
         (_loc4_ = new StringBuffer()).add(var_330.text);
         if(_loc4_.length > 0)
         {
            _loc4_.add("\r\r");
         }
         _loc4_.add(var_282.localizationManager.getLocalizationWithParams("groupforum.compose.reply_template","","author_name",param1.authorName,"creation_time",var_1534.getAsDaysHoursMinutes(param1.creationTimeAsSecondsAgo)));
         _loc4_.add("\r");
         var _loc5_:Array = param1.messageText.split("\r");
         var _loc6_:Boolean = false;
         for each(var _loc3_ in _loc5_)
         {
            _loc2_ = MessageListView.const_430.exec(_loc3_);
            if(_loc2_ != null)
            {
               if(!_loc6_)
               {
                  _loc6_ = true;
                  _loc4_.add("> ").add(var_282.localizationManager.getLocalization("groupforum.compose.skipped_quote")).add("\r");
               }
            }
            else
            {
               _loc4_.add("> ").add(_loc3_).add("\r");
               _loc6_ = false;
            }
         }
         _loc4_.add("\r");
         var_330.text = _loc4_.toString();
      }
      
      public function dispose() : void
      {
         var_1635.stop();
         var_1635.removeEventListener("timer",onTimerEvent);
         var_1635 = null;
         var_282.composeMessageView = null;
         _window.dispose();
         _window = null;
      }
      
      private function onTimerEvent(param1:TimerEvent) : void
      {
         validateInputs();
      }
      
      private function onHeaderKeyUpEvent(param1:WindowKeyboardEvent) : void
      {
         validateInputs();
      }
      
      private function onMessageKeyUpEvent(param1:WindowKeyboardEvent) : void
      {
         validateInputs();
      }
      
      private function onTopAreaClick(param1:WindowMouseEvent) : void
      {
         var_282.context.createLinkEvent("group/undefined");
      }
      
      private function onPostButtonClick(param1:WindowMouseEvent) : void
      {
         if(var_3118)
         {
            return;
         }
         validateInputs();
         if(_hasErrors)
         {
            return;
         }
         var_3118 = true;
         var_2033.disable();
         var_330.disable();
         _postButton.disable();
         _status.caption = var_282.localizationManager.getLocalization("groupforum.compose.posting");
         if(var_2234)
         {
            var_282.postNewMessage(var_506.groupId,var_2234.threadId,var_330.text);
         }
         else
         {
            var_282.postNewThread(var_506.groupId,var_2033.text,var_330.text);
         }
      }
      
      private function onCancelButtonClick(param1:WindowMouseEvent) : void
      {
         dispose();
      }
      
      private function validateInputs() : void
      {
         var _loc1_:int = 0;
         _hasErrors = false;
         if(!var_2234)
         {
            if(var_2033.text.length <= 10)
            {
               _hasErrors = true;
               _status.caption = var_282.localizationManager.getLocalization("groupforum.compose.subject_too_short");
            }
         }
         if(!_hasErrors && var_330.text.length <= 10)
         {
            _hasErrors = true;
            _status.caption = var_282.localizationManager.getLocalization("groupforum.compose.message_too_short");
         }
         if(!_hasErrors && !var_3118)
         {
            _loc1_ = getTimer() - 0;
            if(_loc1_ < 30000)
            {
               _hasErrors = true;
               _status.caption = var_282.localizationManager.getLocalizationWithParams("groupforum.compose.post_cooldown","","time_remaining",FriendlyTime.getFriendlyTime(var_282.localizationManager,(30000 - _loc1_) / 1000 + 1,"",1));
            }
         }
         if(!var_3118 && !_hasErrors)
         {
            _postButton.enable();
            _status.caption = "";
         }
         else
         {
            _postButton.disable();
         }
      }
   }
}
