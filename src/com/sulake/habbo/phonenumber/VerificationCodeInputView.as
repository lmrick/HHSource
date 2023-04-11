package com.sulake.habbo.phonenumber
{
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.components.ILabelWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.class_3281;
   import com.sulake.core.window.events.class_3134;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class VerificationCodeInputView
   {
      
      private static const INPUT_MAX_CHARS:int = 10;
       
      
      private var var_1460:com.sulake.habbo.phonenumber.HabboPhoneNumber;
      
      private var _window:class_3281;
      
      private var _inputTextNeedsClearing:Boolean = true;
      
      private var var_1946:Timer;
      
      public function VerificationCodeInputView(param1:com.sulake.habbo.phonenumber.HabboPhoneNumber)
      {
         super();
         var_1460 = param1;
         createWindow();
      }
      
      public function dispose() : void
      {
         if(_window)
         {
            _window.dispose();
            _window = null;
         }
         if(var_1946)
         {
            var_1946.reset();
            var_1946 = null;
         }
         var_1460 = null;
      }
      
      public function handleSubmitFailure(param1:int) : void
      {
         var_1460.windowManager.alert("${generic.alert.title}","${phone.number.verify.error." + param1 + "}",0,null);
         ITextFieldWindow(_window.findChildByName("verification_code_input")).textColor = 16711680;
         _window.findChildByName("verification_code_input").enable();
         _inputTextNeedsClearing = true;
      }
      
      private function createWindow() : void
      {
         if(_window)
         {
            return;
         }
         _window = class_3281(var_1460.windowManager.buildFromXML(XML(var_1460.assets.getAssetByName("phonenumber_verify_xml").content)));
         _window.center();
         if(_window.findChildByName("wait_link"))
         {
            _window.findChildByName("wait_link").procedure = onInputButtons;
         }
         _window.findChildByName("ok_button").procedure = onInputButtons;
         if(_window.findChildByName("header_button_close"))
         {
            _window.findChildByName("header_button_close").visible = false;
         }
         _window.findChildByName("verification_code_input").procedure = onInputButtons;
         _window.findChildByName("did_not_receive_code_link").procedure = onInputButtons;
         _window.findChildByName("ok_button").disable();
         _window.findChildByName("verification_code_input").enable();
         if(0 - getTimer() <= 0)
         {
            showRetry();
         }
         else
         {
            showWaitForRetry();
         }
         ITextFieldWindow(_window.findChildByName("verification_code_input")).maxChars = 10;
         _inputTextNeedsClearing = true;
      }
      
      private function onInputButtons(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "header_button_close":
            case "wait_link":
               var_1460.setVerifyViewMinimized(true);
               break;
            case "did_not_receive_code_link":
               var_1460.requestPhoneNumberCollectionReset();
               break;
            case "ok_button":
               var_1460.sendTryVerificationCode(_window.findChildByName("verification_code_input").caption);
               _window.findChildByName("ok_button").disable();
               _window.findChildByName("verification_code_input").disable();
               break;
            case "verification_code_input":
               if(_inputTextNeedsClearing)
               {
                  _window.findChildByName("verification_code_input").caption = "";
                  _inputTextNeedsClearing = false;
               }
               _window.findChildByName("ok_button").enable();
               ITextFieldWindow(_window.findChildByName("verification_code_input")).textColor = 0;
         }
      }
      
      public function showRetry() : void
      {
         _window.findChildByName("did_not_receive_code_link").visible = true;
         _window.findChildByName("retry_wait_label").visible = false;
      }
      
      public function showWaitForRetry(param1:int = 0) : void
      {
         _window.findChildByName("did_not_receive_code_link").visible = false;
         _window.findChildByName("retry_wait_label").visible = true;
         onWaitTimer();
         var_1946 = new Timer(1000);
         var_1946.addEventListener("timer",onWaitTimer);
         var_1946.start();
      }
      
      private function onWaitTimer(param1:TimerEvent = null) : void
      {
         var _loc3_:String = String(var_1460.localizationManager.getLocalization("phone.number.verify.wait.remaining",""));
         var _loc2_:int = Math.max(0,(0 - getTimer()) / 1000);
         _loc3_ = _loc3_.replace("{0}",_loc2_);
         (_window.findChildByName("retry_wait_label") as ILabelWindow).text = _loc3_;
         if(_loc2_ == 0)
         {
            if(var_1946)
            {
               var_1946.stop();
            }
            var_1946 = null;
            showRetry();
         }
      }
   }
}
