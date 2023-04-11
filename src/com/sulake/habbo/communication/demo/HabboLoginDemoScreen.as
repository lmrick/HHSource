package com.sulake.habbo.communication.demo
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.class_19;
   import com.sulake.core.runtime.events.EventDispatcherWrapper;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.class_24;
   import com.sulake.core.window.class_3127;
   import com.sulake.core.window.class_3151;
   import com.sulake.core.window.components.*;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.class_3134;
   import com.sulake.habbo.communication.login.AvatarData;
   import com.sulake.habbo.communication.login.ILoginViewer;
   import com.sulake.habbo.communication.login.class_34;
   import com.sulake.habbo.utils.CommunicationUtils;
   import com.sulake.habbo.window.class_1684;
   import com.sulake.habbo.window.utils.IModalDialog;
   import flash.events.Event;
   import flash.utils.Dictionary;

   public class HabboLoginDemoScreen extends EventDispatcherWrapper implements ILoginViewer
   {
      
      public static const INIT_LOGIN:String = "INIT_LOGIN";
      
      public static const AVATAR_SELECTED:String = "AVATAR_SELECTED";
      
      public static const ENVIRONMENT_SELECTED:String = "ENVIRONMENT_SELECTED";
       
      
      private var var_2585:class_19;
      
      private var var_3560:class_1684;
      
      private var var_3578:class_21;
      
      private var var_1680:IModalDialog;
      
      private var _window:class_3151;
      
      private var _firstTryUsingExistingSession:Boolean = false;
      
      public var name:String = "";
      
      public var password:String = "";
      
      private var var_3531:Dictionary;
      
      private var var_3781:class_3127;
      
      private var _loginButton:class_3140;
      
      private var var_1886:ITextFieldWindow;
      
      private var var_2407:ITextFieldWindow;
      
      private var var_1740:com.sulake.habbo.communication.demo.class_3354;
      
      private var var_1094:int;
      
      private var var_228:Vector.<AvatarData>;
      
      private var var_4025:AvatarData;
      
      public function HabboLoginDemoScreen(param1:class_19, param2:class_21, param3:class_1684)
      {
         super();
         var_2585 = param1;
         var_3578 = param2;
         var_3560 = param3;
         var_3531 = new Dictionary();
         var_1680 = getModalXmlWindow("login_window",var_3578,var_3560,"");
         _window = var_1680.rootWindow as class_3151;
         createWindow();
      }
      
      public static function getModalXmlWindow(param1:String, param2:class_21, param3:class_1684, param4:String = "_xml") : IModalDialog
      {
         var _loc7_:IAsset = null;
         var _loc5_:XmlAsset = null;
         var _loc6_:IModalDialog = null;
         try
         {
            _loc7_ = param2.getAssetByName(param1 + param4);
            _loc5_ = XmlAsset(_loc7_);
            _loc6_ = param3.buildModalDialogFromXML(XML(_loc5_.content));
         }
         catch(e:Error)
         {
            ErrorReportStorage.addDebugData("Communication","Failed to build modal window " + param1 + "_xml, " + _loc7_ + "!");
            throw e;
         }
         return _loc6_;
      }
      
      public function get avatarId() : int
      {
         return var_1094;
      }
      
      public function get selectedAccount() : AvatarData
      {
         return var_4025;
      }
      
      public function get selectedEnvironment() : String
      {
         return var_1740.selectedEnvironment;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(var_1680)
         {
            var_1680.dispose();
            var_1680 = null;
         }
         if(var_1740)
         {
            var_1740.removeEventListener("ENVIRONMENT_SELECTED_EVENT",onEnvironmentSelected);
            var_1740.dispose();
            var_1740 = null;
         }
         var_3531 = null;
      }
      
      public function closeLoginWindow() : void
      {
         if(var_1680)
         {
            var_1680.dispose();
            var_1680 = null;
         }
      }
      
      public function get useWebApi() : Boolean
      {
         var _loc1_:ISelectableWindow = _window.findChildByName("useTicket") as ISelectableWindow;
         if(_loc1_ != null)
         {
            return _loc1_.isSelected;
         }
         return false;
      }
      
      public function get useExistingSession() : Boolean
      {
         return false;
      }
      
      private function createWindow() : void
      {
         _window.center();
         _window.caption = "undefined (air)";
         _window.findChildByName("useExistingSession").disable();
         _window.findChildByName("useExistingSession").blend = 0.5;
         _loginButton = _window.findChildByName("login_btn") as class_3140;
         var_1886 = _window.findChildByName("name_field") as ITextFieldWindow;
         var_2407 = _window.findChildByName("pwd_field") as ITextFieldWindow;
         var _loc3_:String = CommunicationUtils.readSOLString("environment");
         _loginButton.addEventListener("WME_CLICK",windowEventProcessor);
         _loginButton.caption = _loc3_ == null ? "Select environment above" : "Initializing (" + _loc3_ + ")";
         _loginButton.disable();
         if(var_1886 != null)
         {
            var_1886.textBackground = true;
            var_1886.textBackgroundColor = 16777215;
            var_1886.text = CommunicationUtils.readSOLString("login");
            var_1886.focus();
            var_1886.setSelection(var_1886.text.length,var_1886.text.length);
            var_1886.addEventListener("WKE_KEY_UP",windowEventProcessor);
         }
         if(var_2407 != null)
         {
            var_2407.textBackground = true;
            var_2407.textBackgroundColor = 16777215;
            var_2407.text = CommunicationUtils.restorePassword();
            var_2407.addEventListener("WKE_KEY_UP",windowEventProcessor);
         }
         var _loc2_:ISelectableWindow = _window.findChildByName("useTicket") as ISelectableWindow;
         _loc2_.addEventListener("WME_CLICK",windowEventProcessorCheckbox);
         if(_loc2_)
         {
            _loc2_.select();
         }
         var _loc1_:ISelectableWindow = _window.findChildByName("useExistingSession") as ISelectableWindow;
         if(_loc1_)
         {
            _loc1_.unselect();
         }
         if(var_2585.getBoolean("try.existing.session"))
         {
            _firstTryUsingExistingSession = true;
            _window.visible = false;
            windowEventProcessor(class_3134.allocate("WE_OK",_window,null,false));
         }
         var _loc4_:IItemListWindow;
         var_3781 = (_loc4_ = _window.findChildByName("list") as IItemListWindow).removeListItemAt(0);
         var_1740 = new com.sulake.habbo.communication.demo.class_3354(_window.findChildByName("environment_list") as class_3303,var_2585,var_3560,var_3578);
         var_1740.addEventListener("ENVIRONMENT_SELECTED_EVENT",onEnvironmentSelected);
      }
      
      private function onEnvironmentSelected(param1:Event = null) : void
      {
         dispatchEvent(new Event("ENVIRONMENT_SELECTED"));
         _loginButton.disable();
         _loginButton.caption = "Initializing (undefined)";
         showInfoMessage("Initializing Web Api connection to (" + var_1740.getEnvironmentName(var_1740.selectedEnvironment) + ")");
      }
      
      public function populateUserList(param1:class_24) : void
      {
         var _loc3_:class_3127 = null;
         var _loc4_:int = 0;
         var _loc5_:IItemListWindow;
         if(!(_loc5_ = _window.findChildByName("list") as IItemListWindow))
         {
            return;
         }
         _window.findChildByName("users_info").visible = false;
         var _loc2_:class_3127 = var_3781.clone();
         _loc2_.procedure = listEventHandler;
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = _loc2_.clone();
            _loc3_.id = param1.getKey(_loc4_);
            _loc3_.caption = param1.getWithIndex(_loc4_);
            _loc5_.addListItem(_loc3_);
            _loc4_++;
         }
         _loc2_.dispose();
      }
      
      public function displayResults(param1:String) : void
      {
         var _loc2_:ITextWindow = _window.findChildByName("text002") as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.text = param1;
         }
      }
      
      private function handleKeyUp(param1:WindowKeyboardEvent) : void
      {
         var _loc3_:int = 0;
         var _loc6_:String = null;
         var _loc4_:String = null;
         var _loc5_:ITextFieldWindow = null;
         var _loc2_:ITextFieldWindow = null;
         var _loc7_:WindowKeyboardEvent;
         if((_loc7_ = param1 as WindowKeyboardEvent).ctrlKey)
         {
            _loc3_ = _loc7_.keyCode - 49;
            if(_loc3_ >= 0 && _loc3_ < 10)
            {
               _loc6_ = String(var_2585.getProperty("login.user." + _loc3_ + ".name"));
               _loc4_ = String(var_2585.getProperty("login.user." + _loc3_ + ".pass"));
               _loc5_ = _window.findChildByName("name_field") as ITextFieldWindow;
               _loc2_ = _window.findChildByName("pwd_field") as ITextFieldWindow;
               if(_loc6_ != "")
               {
                  _loc5_.caption = _loc6_;
               }
               if(_loc4_ != "")
               {
                  _loc2_.caption = _loc4_;
               }
               _loc5_.setSelection(_loc5_.text.length,_loc5_.text.length);
               if(_loc7_.cancelable)
               {
                  _loc7_.preventDefault();
                  _loc7_.preventWindowOperation();
               }
               param1.stopImmediatePropagation();
               param1.stopPropagation();
            }
         }
      }
      
      private function windowEventProcessor(param1:class_3134 = null, param2:class_3127 = null) : void
      {
         if(param1.type == "WKE_KEY_UP")
         {
            handleKeyUp(param1 as WindowKeyboardEvent);
            if((param1 as WindowKeyboardEvent).keyCode != 13)
            {
               return;
            }
         }
         if(var_1886 != null)
         {
            name = var_1886.text;
         }
         if(var_2407 != null)
         {
            password = var_2407.text;
         }
         CommunicationUtils.writeSOLProperty("login",name);
         CommunicationUtils.storePassword(password);
         dispatchEvent(new Event("INIT_LOGIN"));
         _loginButton.disable();
      }
      
      private function windowEventProcessorCheckbox(param1:class_3134 = null, param2:class_3127 = null) : void
      {
         _loginButton.enable();
      }
      
      private function listEventHandler(param1:class_3134, param2:class_3127) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         if(useWebApi)
         {
            var_4025 = var_228[param2.id];
         }
         else
         {
            var_1094 = var_228[param2.id].id;
         }
         dispatchEvent(new Event("AVATAR_SELECTED"));
      }
      
      public function showError(param1:int, param2:int, param3:String) : void
      {
         _window.findChildByName("users_info").caption = "Received error: " + param1 + " regarding message: " + param2;
      }
      
      private function showErrorMessage(param1:String) : void
      {
         _window.findChildByName("users_info").caption = "Error:\n\n" + param1;
      }
      
      private function showInfoMessage(param1:String) : void
      {
         _window.findChildByName("users_info").caption = param1;
      }
      
      public function showLoginScreen() : void
      {
      }
      
      public function showRegistrationError(param1:Object) : void
      {
         showErrorMessage("Registration error");
      }
      
      public function showInvalidLoginError(param1:Object) : void
      {
         showErrorMessage("Invalid login");
      }
      
      public function nameCheckResponse(param1:Object, param2:Boolean) : void
      {
      }
      
      public function showCaptchaError() : void
      {
         showErrorMessage("Captcha required, please add your IP to Housekeeping property to avoid this.");
      }
      
      public function showAccountError(param1:Object) : void
      {
         showErrorMessage("Error with account during login");
      }
      
      public function showLoadingScreen() : void
      {
         dispose();
      }
      
      public function saveLooksError(param1:Object) : void
      {
         showErrorMessage("Save looks error ");
      }
      
      public function showTOS() : void
      {
         showErrorMessage("Web-api wants to show Terms of Service");
      }
      
      public function environmentReady() : void
      {
         _loginButton.enable();
         _loginButton.caption = "Login (undefined)";
         showInfoMessage("Web Api connection is established for (" + var_1740.getEnvironmentName(var_1740.selectedEnvironment) + "). Ready to connect.");
      }
      
      public function populateCharacterList(param1:Vector.<AvatarData>) : void
      {
         var _loc3_:* = null;
         var_228 = param1;
         var _loc6_:String = CommunicationUtils.readSOLString("useruniqueid");
         var _loc2_:class_24 = new class_24();
         var _loc4_:int = 0;
         for each(var _loc5_ in param1)
         {
            if(_loc5_.uniqueId == _loc6_)
            {
               _loc3_ = _loc5_;
            }
            _loc2_[_loc4_] = _loc5_.name;
            _loc4_++;
         }
         populateUserList(_loc2_);
      }
      
      public function showSelectAvatar(param1:Object) : void
      {
      }
      
      public function showPromoHabbos(param1:XML) : void
      {
      }
      
      public function showSelectRoom() : void
      {
      }
      
      public function showDisconnectedWithText(param1:int) : void
      {
         showErrorMessage("Hotel is closed");
      }
      
      public function showDisconnected(param1:int, param2:String) : void
      {
         showErrorMessage("Disconnected reason: " + param2 + " (" + param1 + ")");
      }
      
      public function getProperty(param1:String, param2:Dictionary = null) : String
      {
         return !!var_2585 ? var_2585.getProperty(param1,param2) : "";
      }
      
      public function createCaptchaView() : class_34
      {
         return undefined;
      }
      
      public function captchaReady() : void
      {
      }
   }
}
