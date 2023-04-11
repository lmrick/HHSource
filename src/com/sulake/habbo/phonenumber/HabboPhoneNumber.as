package com.sulake.habbo.phonenumber
{
   import com.sulake.core.assets.class_21;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.ComponentDependency;
   import com.sulake.core.runtime.class_20;
   import com.sulake.core.runtime.class_31;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.localization.class_18;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDHabboWindowManager;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.utils.getTimer;
   import package_102.class_462;
   import package_102.class_724;
   import package_102.class_741;
   import package_45.class_437;
   import package_45.class_457;
   import package_45.class_667;
   import package_45.class_811;
   
   public class HabboPhoneNumber extends class_20
   {
       
      
      protected var _communicationManager:class_25;
      
      protected var _localizationManager:class_18;
      
      protected var _sessionDataManager:ISessionDataManager;
      
      protected var _toolbar:IHabboToolbar;
      
      protected var _windowManager:class_1684;
      
      private var _connection:IConnection;
      
      private var var_2508:com.sulake.habbo.phonenumber.PhoneNumberCollectView;
      
      private var var_2379:com.sulake.habbo.phonenumber.PhoneNumberCollectMinimizedView;
      
      private var var_2541:com.sulake.habbo.phonenumber.VerificationCodeInputView;
      
      private var var_2412:com.sulake.habbo.phonenumber.VerificationCodeInputMinimizedView;
      
      private var _retryEnableTime:int;
      
      public function HabboPhoneNumber(param1:class_31, param2:uint, param3:class_21)
      {
         super(param1,param2,param3);
      }
      
      override protected function get dependencies() : Vector.<ComponentDependency>
      {
         return super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(),function(param1:class_25):void
         {
            _communicationManager = param1;
         },true),new ComponentDependency(new IIDSessionDataManager(),function(param1:ISessionDataManager):void
         {
            _sessionDataManager = param1;
         }),new ComponentDependency(new IIDHabboWindowManager(),function(param1:class_1684):void
         {
            _windowManager = param1;
         }),new ComponentDependency(new IIDHabboLocalizationManager(),function(param1:class_18):void
         {
            _localizationManager = param1;
         }),new ComponentDependency(new IIDHabboToolbar(),function(param1:IHabboToolbar):void
         {
            _toolbar = param1;
         })]);
      }
      
      override protected function initComponent() : void
      {
         if(getBoolean("sms.identity.verification.enabled"))
         {
            _connection = _communicationManager.connection;
            _connection.addMessageEvent(new class_741(onStateMessage));
            _connection.addMessageEvent(new class_724(onPhoneNumberResultMessage));
            _connection.addMessageEvent(new class_462(onVerificationCodeResultMessage));
         }
      }
      
      public function sendTryPhoneNumber(param1:String, param2:String) : void
      {
         _connection.send(new class_811(param1,param2));
      }
      
      public function sendTryVerificationCode(param1:String) : void
      {
         if(!param1)
         {
            return;
         }
         param1 = param1.toUpperCase();
         _connection.send(new class_457(param1));
      }
      
      public function setNeverAgain() : void
      {
         _connection.send(new class_437(2));
         destroyCollectView();
      }
      
      public function setCollectViewMinimized(param1:Boolean) : void
      {
         if(param1)
         {
            destroyCollectView();
            createCollectMinimizedView();
         }
         else
         {
            destroyCollectMinimizedView();
            createCollectView();
         }
      }
      
      public function setVerifyViewMinimized(param1:Boolean) : void
      {
         if(param1)
         {
            destroyVerifyView();
            createVerifyMinimizedView();
         }
         else
         {
            destroyVerifyMinimizedView();
            createVerifyView();
         }
      }
      
      public function requestPhoneNumberCollectionReset() : void
      {
         destroyVerifyView();
         _connection.send(new class_667());
      }
      
      private function onPhoneNumberResultMessage(param1:class_724) : void
      {
         switch(param1.getParser().resultCode - 1)
         {
            case 0:
            case 2:
            case 8:
               destroyCollectView();
               _retryEnableTime = param1.getParser().millisToAllowProcessReset + getTimer();
               createVerifyView();
               break;
            case 1:
               destroyCollectView();
               break;
            case 3:
            case 4:
            case 5:
            case 9:
               if(!var_2379 && !var_2508)
               {
                  createCollectView();
               }
               else if(var_2379)
               {
                  setCollectViewMinimized(false);
               }
               _windowManager.alert("${generic.alert.title}","${phone.number.collect.error." + param1.getParser().resultCode + "}",0,null);
               var_2508.handleSubmitFailure(param1.getParser().resultCode);
         }
      }
      
      private function onVerificationCodeResultMessage(param1:class_462) : void
      {
         switch(param1.getParser().resultCode - 2)
         {
            case 0:
            case 1:
               destroyVerifyView();
               break;
            case 2:
               if(!var_2412 && !var_2541)
               {
                  _retryEnableTime = getTimer() + param1.getParser().millisecondsToAllowProcessReset;
                  createVerifyView();
               }
               else if(var_2412)
               {
                  setVerifyViewMinimized(false);
               }
               var_2541.handleSubmitFailure(param1.getParser().resultCode);
         }
      }
      
      private function onStateMessage(param1:class_741) : void
      {
         var _loc2_:int = param1.getParser().collectionStatusCode;
         var _loc3_:int = param1.getParser().phoneStatusCode;
         context.configuration.setProperty("phone.collection.status",_loc2_.toString());
         context.configuration.setProperty("phone.verification.status",_loc3_.toString());
         if(_loc2_ == 2)
         {
            return;
         }
         if(_loc2_ == 3 && (_loc3_ == 9 || _loc3_ == 1))
         {
            destroyCollectView();
            if(_loc2_ == 1)
            {
               createVerifyMinimizedView();
            }
            else
            {
               _retryEnableTime = param1.getParser().millisecondsToAllowProcessReset + getTimer();
               createVerifyView();
            }
            return;
         }
         switch(_loc3_)
         {
            case 0:
            case 9:
               createCollectView();
               break;
            case 2:
            case 3:
               destroyCollectView();
               destroyVerifyView();
               break;
            case 4:
            case 5:
            case 6:
               class_14.log("INVALID STATE!! Phone number / verify errors should not be handled here!");
         }
      }
      
      public function get windowManager() : class_1684
      {
         return _windowManager;
      }
      
      public function get localizationManager() : class_18
      {
         return _localizationManager;
      }
      
      public function get retryEnableTime() : int
      {
         return _retryEnableTime;
      }
      
      private function createCollectView() : void
      {
         destroyCollectView();
         var _loc2_:String = String(context.configuration.getProperty("phone.number.preferred.countries"));
         var _loc1_:Array = _loc2_.split(",");
         var_2508 = new com.sulake.habbo.phonenumber.PhoneNumberCollectView(this,_loc1_);
      }
      
      private function createVerifyView() : void
      {
         destroyVerifyView();
         var_2541 = new com.sulake.habbo.phonenumber.VerificationCodeInputView(this);
      }
      
      private function createCollectMinimizedView() : void
      {
         destroyCollectMinimizedView();
         var_2379 = new com.sulake.habbo.phonenumber.PhoneNumberCollectMinimizedView(this);
         _toolbar.extensionView.attachExtension("phone_number",var_2379.window,12);
      }
      
      private function createVerifyMinimizedView() : void
      {
         destroyVerifyMinimizedView();
         var_2412 = new com.sulake.habbo.phonenumber.VerificationCodeInputMinimizedView(this);
         _toolbar.extensionView.attachExtension("verification_code",var_2412.window,12);
      }
      
      private function destroyCollectView() : void
      {
         if(var_2508)
         {
            var_2508.dispose();
            var_2508 = null;
         }
      }
      
      private function destroyVerifyView() : void
      {
         if(var_2541)
         {
            var_2541.dispose();
            var_2541 = null;
         }
      }
      
      private function destroyCollectMinimizedView() : void
      {
         _toolbar.extensionView.detachExtension("phone_number");
         if(var_2379)
         {
            var_2379.dispose();
            var_2379 = null;
         }
      }
      
      private function destroyVerifyMinimizedView() : void
      {
         _toolbar.extensionView.detachExtension("verification_code");
         if(var_2412)
         {
            var_2412.dispose();
            var_2412 = null;
         }
      }
   }
}
