package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.class_13;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.components.class_3287;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.window.utils.class_3132;
   import package_137.class_1612;
   import package_59.class_224;
   
   public class SendMsgsCtrl implements class_13, ITrackedWindow
   {
      
      private static const TOPIC_ID_NOT_SELECTED:int = -999;
       
      
      private var _main:com.sulake.habbo.moderation.ModerationManager;
      
      private var var_1873:int;
      
      private var _targetUserName:String;
      
      private var var_3425:class_1612;
      
      private var _frame:class_3281;
      
      private var var_2699:class_3287;
      
      private var var_1935:ITextFieldWindow;
      
      private var _disposed:Boolean;
      
      private var _placeHolderMessage:Boolean = true;
      
      public function SendMsgsCtrl(param1:com.sulake.habbo.moderation.ModerationManager, param2:int, param3:String, param4:class_1612)
      {
         super();
         _main = param1;
         var_1873 = param2;
         _targetUserName = param3;
         var_3425 = param4;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function show() : void
      {
         _frame = class_3281(_main.getXmlWindow("send_msgs"));
         _frame.caption = "Msg To: " + _targetUserName;
         _frame.findChildByName("send_message_but").procedure = onSendMessageButton;
         var_1935 = ITextFieldWindow(_frame.findChildByName("message_input"));
         var_1935.procedure = onInputClick;
         var_2699 = class_3287(_frame.findChildByName("msgTemplatesSelect"));
         prepareMessageSelection(var_2699);
         var_2699.procedure = onSelectTemplate;
         var _loc1_:class_3127 = _frame.findChildByTag("close");
         _loc1_.procedure = onClose;
         _frame.visible = true;
      }
      
      public function getType() : int
      {
         return 2;
      }
      
      public function getId() : String
      {
         return _targetUserName;
      }
      
      public function getFrame() : class_3281
      {
         return _frame;
      }
      
      private function prepareMessageSelection(param1:class_3287) : void
      {
         class_14.log("MSG TEMPLATES: " + _main.initMsg.messageTemplates.length);
         param1.populate(_main.initMsg.messageTemplates);
      }
      
      private function onSelectTemplate(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WE_SELECTED")
         {
            return;
         }
         var _loc3_:String = String(_main.initMsg.messageTemplates[var_2699.selection]);
         if(_loc3_ != null)
         {
            _placeHolderMessage = false;
            var_1935.text = _loc3_;
         }
      }
      
      private function onSendMessageButton(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         if(_placeHolderMessage || false)
         {
            _main.windowManager.alert("Alert","You must input a message to the user",0,onAlertClose);
            return;
         }
         class_14.log("Sending message...");
         _main.connection.send(new class_224(var_1873,var_1935.text,-999,var_3425 != null ? var_3425.issueId : -1));
         this.dispose();
      }
      
      private function onClose(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         dispose();
      }
      
      private function onInputClick(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WE_FOCUSED")
         {
            return;
         }
         if(_placeHolderMessage)
         {
            var_1935.text = "";
            _placeHolderMessage = false;
         }
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(_frame != null)
         {
            _frame.destroy();
            _frame = null;
         }
         var_2699 = null;
         var_1935 = null;
         _main = null;
      }
      
      private function onAlertClose(param1:class_3132, param2:class_3134) : void
      {
         param1.dispose();
      }
   }
}
