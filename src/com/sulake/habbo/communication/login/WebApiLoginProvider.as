package com.sulake.habbo.communication.login
{
   import com.sulake.habbo.communication.IHabboWebApiSession;
   import com.sulake.habbo.communication.class_25;
   import com.sulake.habbo.communication.class_33;
   import com.sulake.habbo.utils.CommunicationUtils;
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   
   public class WebApiLoginProvider extends EventDispatcher implements class_33, ILoginProvider, class_32
   {
      
      public static const ERROR_TYPE_IO_ERROR:String = "ioError";
      
      public static const ERROR_CODE_MAINTENANCE:String = "maintenance";
      
      private static const AUTO_RECONNECT:Boolean = false;
      
      private static const POCKET_MODE_LOGIN_AND_REGISTER:int = 1;
      
      private static const const_261:int = 2;
       
      
      private var _communication:class_25;
      
      private var var_183:String;
      
      private var var_22:com.sulake.habbo.communication.login.ILoginViewer;
      
      private var _pendingLoginError:Object;
      
      private var _autoLogin:Boolean = false;
      
      private var _localizationLoaded:Boolean;
      
      private var var_1418:Boolean;
      
      private var var_1417:Boolean;
      
      private var var_291:int = 1;
      
      private var _name:String;
      
      private var var_976:String;
      
      private var var_1371:int;
      
      private var var_1369:String;
      
      private var _ssoToken:String;
      
      private var _session:IHabboWebApiSession;
      
      private var var_196:com.sulake.habbo.communication.login.class_34;
      
      public function WebApiLoginProvider(param1:com.sulake.habbo.communication.login.ILoginViewer)
      {
         super();
         var_22 = param1;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function init(param1:class_25) : void
      {
         _communication = param1;
         var _loc2_:String = getProperty("web.api");
         class_14.log("[WebApiLoginProvider] Init with: " + _loc2_);
         if(_loc2_ != null)
         {
            _communication.createHabboWebApiSession(this,_loc2_);
         }
         _session = createHabboWebApiSession();
         initHabboWebApiSession();
      }
      
      public function loginWithCredentials(param1:String, param2:String, param3:int = 0) : void
      {
         _name = param1;
         var_976 = param2;
         var_1371 = param3;
         if(_session)
         {
            _session.login(param1,param2);
         }
         else
         {
            class_14.log("[WebApiLoginProvider] Login not available");
         }
      }
      
      public function loginWithCredentialsWeb(param1:String) : void
      {
         var_1369 = param1;
         if(_session)
         {
            _session.selectAvatar(param1);
         }
         else
         {
            class_14.log("[WebApiLoginProvider] Login not available");
         }
      }
      
      private function createHabboWebApiSession() : IHabboWebApiSession
      {
         var _loc2_:* = _communication.getHabboWebApiSession();
         if(_loc2_ != null)
         {
            _loc2_.dispose();
            _loc2_ = null;
         }
         var _loc1_:String = getProperty("web.api");
         if(_loc1_ == "")
         {
            _loc1_ = getProperty("url.prefix");
            _loc1_ = _loc1_.replace("http:","https:");
         }
         return _communication.createHabboWebApiSession(this,_loc1_);
      }
      
      private function initHabboWebApiSession() : void
      {
         if(_session)
         {
            _session.hello();
            return;
         }
         throw new Error("Tried to init null IHabboWebApiSession");
      }
      
      public function habboWebApiError(param1:String, param2:int, param3:String, param4:Object, param5:Boolean = false) : void
      {
        
         var _loc8_:Boolean = false;
         class_14.log("[WebApiLoginProvider] Api Error: id: " + param1 + " type: " + param3 + " captcha: " + param5);
         if((String(param4 && param4.error ? param4.error : "")) == "maintenance")
         { }
        
         var _loc9_:Boolean = false;
         if(param3 == "ioError")
         {
            _loc9_ = true;
         }
         var _loc6_:IHabboWebApiSession = _communication.getHabboWebApiSession();
        
         switch(param1)
         {
            case "/api/ssotoken":
               if(_autoLogin)
               {
                  _loc9_ = true;
                  _loc6_.login(_name,var_976);
               }
            case "/api/public/info/hello":
               var_22.showLoginScreen();
               break;
            case "/api/public/registration/new":
               var_22.showRegistrationError(param4);
               break;
            case "/api/ssotoken":
               class_14.log("[WebApiLoginProvider] There was an error getting the SSO-token (is this an employee account?)...");
               var_22.showInvalidLoginError(param4);
               break;
            case "/api/user/avatars":
               class_14.log("[WebApiLoginProvider] There was an error getting the Avatars");
               var_22.showInvalidLoginError(param4);
               break;
            case "/api/newuser/name/check":
            case "/api/newuser/name/select":
               class_14.log("[WebApiLoginProvider] There was an error checking name");
               var_22.nameCheckResponse(param4,param1 == "/api/newuser/name/check");
               break;
            case "/api/public/authentication/login":
            case "/api/public/authentication/facebook":
            case "/api/force/tos-accept":
               class_14.log("[WebApiLoginProvider] There was an error authorizing connection...");
              
               if(param4 != null && (param4.message != null || param4.error != null || param4.errors != null))
               {
                  if(param5)
                  {
                     if(!(_loc8_ = param4.captcha == true && param4.message == "invalid-captcha"))
                     {
                        _pendingLoginError = param4;
                     }
                     showCaptchaView();
                     break;
                  }
                  var_22.showInvalidLoginError(param4);
                  break;
               }

               if(param5)
               {
                  showCaptchaView();
                  break;
               }
               var_22.showInvalidLoginError(null);
               break;
            case "/api/user/avatars/select":
               class_14.log("[WebApiLoginProvider] There was an error selecting avatar");
               if(_loc6_)
               {
                  var_22.showAccountError(param4);
                  var_22.showLoadingScreen();
                  _loc6_.avatars();
                  break;
               }
               var_22.showInvalidLoginError(param4);
               break;
            case "/api/newuser/room/select":
               class_14.log("[WebApiLoginProvider] There was an error selecting home room.");
               break;
            case "/api/user/look/save":
               var_22.saveLooksError(param4);
               break;
            default:
               class_14.log("[WebApiLoginProvider] Did not process Habbo API message: " + param1);
         }
         if(!_loc9_)
         {
            _autoLogin = false;
         }
      }
      
      public function onUserList(param1:Vector.<AvatarData>) : void
      {
         var _loc2_:String = null;
       
         if(_autoLogin)
         {
            _loc2_ = CommunicationUtils.readSOLString("useruniqueid");
         
            if(!userExists(param1,_loc2_))
            {
               var_22.populateCharacterList(param1);
            }
         }
        
         else
         {
            var_22.populateCharacterList(param1);
         }
      }
      
      public function habboWebApiResponse(param1:String, param2:Object) : void
      {
         var _loc5_:String = null;
         var _loc8_:Array = null;
         var _loc7_:* = undefined;
         var _loc4_:int = 0;
         class_14.log("[WebApiLoginProvider] Got Habbo Web Api Response: " + param1,param2);
         var _loc6_:IHabboWebApiSession;
        
         if((_loc6_ = _communication.getHabboWebApiSession()) == null)
         {
            return;
         }
       
         if(param2 != null && param2.force != null && param2.force is Array)
         {
            
            if((_loc8_ = param2.force as Array).indexOf("TOS") > -1)
            {
               var_22.showTOS();
               return;
            }
           
            if(_loc8_.indexOf("EMAIL") > -1 || _loc8_.indexOf("PASSWORD") > -1)
            {
               var_22.showInvalidLoginError({"errors":["account_issue"]});
               return;
            }
         }
         switch(param1)
         {
            case "/api/public/info/hello":
               if(var_291 == 1)
               {
               }
               if(_autoLogin)
               {
                  _loc6_.ssoToken();
                  break;
               }
               var_22.environmentReady();
               break;
            case "/api/user/avatars/select":
               if(var_291 != 2)
               {
                  _loc6_.ssoToken();
                  break;
               }
               break;
            case "/api/public/authentication/login":
            case "/api/public/authentication/facebook":
            case "/api/force/tos-accept":
               _loc5_ = param1 == "/api/public/authentication/login" ? "habbo" : "facebook";
               CommunicationUtils.writeSOLProperty("loginmethod",_loc5_);
               fetchAvatars();
               break;
            case "/api/user/avatars":
               if(var_291 != 2)
               {
                  _loc7_ = new Vector.<AvatarData>(0);
                  for each(var _loc3_ in param2)
                  {
                     _loc7_.push(new AvatarData(_loc3_));
                  }
                  if(_loc7_.length == 1)
                  {
                     CommunicationUtils.writeSOLProperty("useruniqueid",_loc7_[0].uniqueId);
                     _loc6_.selectAvatar(_loc7_[0].uniqueId);
                     break;
                  }
                  if(!_autoLogin)
                  {
                     var_22.populateCharacterList(_loc7_);
                     break;
                  }
                  break;
               }
               break;
            case "/api/ssotoken":
               _ssoToken = param2["ssoToken"];
               var_291 = 2;
               dispatchEvent(new SsoTokenAvailableEvent("SSO_TOKEN_AVAILABLE",_ssoToken));
               break;
            case "/api/public/registration/new":
               if(param2 != null)
               {
                  _loc4_ = parseInt(param2.id);
                  CommunicationUtils.writeSOLProperty("userid",_loc4_.toString());
               }
               var_22.showSelectAvatar(param2);
               break;
            case "/api/public/lists/hotlooks":
               var_22.showPromoHabbos(param2 as XML);
               break;
            case "/api/newuser/name/select":
            case "/api/newuser/name/check":
               var_22.nameCheckResponse(param2,param1 == "/api/newuser/name/check");
               break;
            case "/api/user/look/save":
               var_22.showSelectRoom();
               break;
            case "/api/newuser/room/select":
               CommunicationUtils.writeSOLProperty("loginmethod","habbo");
               fetchAvatars();
         }
      }
      
      public function habboWebApiRawResponse(param1:String, param2:Object) : void
      {
      }
      
      public function closeCaptcha() : void
      {
         removeCaptchaView();
      }
      
      private function showCaptchaView() : void
      {
         var_196 = var_22.createCaptchaView();
         if(var_196 == null)
         {
            var_22.showCaptchaError();
         }
      }
      
      public function handleCaptchaError() : void
      {
         removeCaptchaView();
         var_22.showCaptchaError();
      }
      
      public function handleCaptchaResult(param1:String) : void
      {
         removeCaptchaView();
         var_22.captchaReady();
         if(_pendingLoginError)
         {
            var_22.showInvalidLoginError(_pendingLoginError);
            _pendingLoginError = null;
         }
         if(param1 == null || _session == null)
         {
            var_22.showCaptchaError();
            return;
         }
         var _loc2_:Boolean = _session.setCaptchaToken(param1);
      }
      
      private function removeCaptchaView() : void
      {
         if(var_196 != null)
         {
            var_196.dispose();
            var_196 = null;
         }
      }
      
      public function getProperty(param1:String, param2:Dictionary = null) : String
      {
         return var_22.getProperty(param1,param2);
      }
      
      private function userExists(param1:Vector.<AvatarData>, param2:String) : Boolean
      {
         for each(var _loc3_ in param1)
         {
            if(_loc3_.uniqueId == param2)
            {
               return true;
            }
         }
         return false;
      }
      
      private function fetchAvatars() : void
      {
         var _loc1_:String = null;
         if(_session == null)
         {
            return;
         }
         if(_autoLogin)
         {
            _loc1_ = CommunicationUtils.readSOLString("useruniqueid");
            if(_loc1_)
            {
               _session.selectAvatar(_loc1_);
            }
            else
            {
               _session.avatars();
            }
         }
         else if(var_291 == 1)
         {
            _session.avatars();
         }
      }
      
      public function selectAvatar(param1:int) : void
      {
      }
      
      public function selectAvatarUniqueid(param1:String) : void
      {
         if(_session == null)
         {
            return;
         }
         _session.selectAvatar(param1);
      }
   }
}
