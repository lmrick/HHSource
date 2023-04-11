package login
{
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.class_31;
   import com.sulake.habbo.communication.HabboCommunicationManager;
   import com.sulake.habbo.communication.login.AvatarData;
   import com.sulake.habbo.communication.login.ILoginProvider;
   import com.sulake.habbo.communication.login.ILoginViewer;
   import com.sulake.habbo.communication.login.SsoTokenAvailableEvent;
   import com.sulake.habbo.communication.login.WebApiLoginProvider;
   import com.sulake.habbo.communication.login.class_34;
   import com.sulake.habbo.configuration.HabboConfigurationManager;
   import com.sulake.habbo.localization.HabboLocalizationManager;
   import com.sulake.habbo.utils.CommunicationUtils;
   import com.sulake.habbo.utils.animation.TweenUtils;
   import flash.display.Bitmap;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import onBoardingHcUi.Button;
   import onBoardingHcUi.ColouredButton;
   import onBoardingHcUi.LoaderUI;
   import onBoardingHcUi.LocalizedSprite;
   import onBoardingHcUi.LocalizedTextField;
   
   public class LoginFlow extends Sprite implements ILoginContext, IDisposable, ILoginViewer
   {
      
      public static const LOGIN_FLOW_FINISHED_EVENT:String = "LOGIN_FLOW_FINISHED_EVENT";
      
      private static const ERROR_TYPE_IO_ERROR:String = "ioError";
      
      private static const LOGO_AREA_HEIGHT:int = 50;
      
      private static const MAIN_AREA_MARGIN:int = 5;
      
      public static const SCREEN_ENVIRONMENT:int = 1;
      
      public static const SCREEN_LOGIN:int = 2;
      
      public static const SCREEN_AVATARS:int = 3;
      
      public static const SCREEN_SSO_TOKEN:int = 4;
      
      public static var ubuntu_regular:Class = class_30;
      
      public static var ubuntu_bold:Class = class_28;
      
      public static var ubuntu_italic:Class = class_29;
      
      public static var ubuntu_bold_italic:Class = class_27;
      
      private static const habbo_logo_png:Class = logo_new_png;
       
      
      private var _background:login.Background;
      
      private var var_81:Sprite;
      
      private var var_150:login.EnvironmentView;
      
      private var var_22:login.LoginView;
      
      private var var_372:login.SsoTokenView;
      
      private var var_219:login.AvatarView;
      
      private var var_311:Boolean;
      
      private var var_96:class_31;
      
      private var _errorBalloon:Sprite;
      
      private var var_56:Sprite;
      
      private var var_666:Sprite;
      
      private var _configuration:HabboConfigurationManager;
      
      private var _communication:HabboCommunicationManager;
      
      private var _localization:HabboLocalizationManager;
      
      private var var_114:ILoginProvider;
      
      private var _ssoToken:String;
      
      private var _closeButton:ColouredButton;
      
      private var var_125:Loader;
      
      private var var_104:Loader;
      
      private var _lastFrameTime:int;
      
      public function LoginFlow(param1:Dictionary)
      {
         super();
         createFakeContext(param1);
      }
      
      public function get ssoToken() : String
      {
         return _ssoToken;
      }
      
      public function dispose() : void
      {
         removeEventListener("enterFrame",onEnterFrame);
         if(var_311)
         {
            return;
         }
         if(var_96)
         {
            var_96.dispose();
            var_96 = null;
         }
         if(_background)
         {
            removeChild(_background);
            _background.dispose();
            _background = null;
         }
         if(var_56 != null)
         {
            removeChild(var_56);
            var_56 = null;
         }
         hideViews();
         var_150.dispose();
         var_22.dispose();
         var_219.dispose();
         var_372.dispose();
         var_114 = null;
         stage.removeChild(this);
         var_311 = true;
         LocalizedSprite.localizationManager = null;
         LocalizedTextField.localizationManager = null;
      }
      
      public function get disposed() : Boolean
      {
         return var_311;
      }
      
      private function createConfiguration(param1:class_31) : HabboConfigurationManager
      {
         var _loc5_:XML = <manifest><library /></manifest>;
         var _loc2_:ByteArray = new HabboConfigurationCom.manifest() as ByteArray;
         var _loc3_:XML = {_loc2_.readUTFBytes(_loc2_.length)};
         _loc5_.library.appendChild(_loc3_.component.assets);
         var _loc4_:class_21;
         (_loc4_ = new AssetLibrary("_assetsConfiguration@")).loadFromResource(_loc5_,HabboConfigurationCom);
         return new HabboConfigurationManager(param1,0,_loc4_);
      }
      
      private function createLocalization(param1:class_31) : HabboLocalizationManager
      {
         var _loc5_:XML = <manifest><library /></manifest>;
         var _loc2_:ByteArray = new HabboLocalizationCom.manifest() as ByteArray;
         var _loc3_:XML = {_loc2_.readUTFBytes(_loc2_.length)};
         _loc5_.library.appendChild(_loc3_.component.assets);
         var _loc4_:class_21;
         (_loc4_ = new AssetLibrary("_assetsLocalization@")).loadFromResource(_loc5_,HabboLocalizationCom);
         return new HabboLocalizationManager(param1,0,_loc4_);
      }
      
      private function createCommunication(param1:class_31) : HabboCommunicationManager
      {
         var _loc3_:ByteArray = new HabboCommunicationCom.manifest() as ByteArray;
         var _loc4_:XML = {_loc3_.readUTFBytes(_loc3_.length)};
         var _loc2_:XML = <manifest><library /></manifest>;
         _loc2_.library.appendChild(_loc4_.component.assets);
         var _loc5_:class_21;
         (_loc5_ = new AssetLibrary("_assetsTemp@",_loc2_)).loadFromResource(_loc2_,HabboCommunicationCom);
         return new HabboCommunicationManager(param1,0,_loc5_);
      }
      
      private function createFakeContext(param1:Dictionary) : void
      {
         var_96 = new FakeContext(param1);
         var _loc3_:XML = <manifest><library /></manifest>;
         var _loc2_:class_21 = new AssetLibrary("_assetsTemp@",_loc3_);
         (var_96.assets as AssetLibraryCollection).addAssetLibrary(_loc2_);
         _configuration = createConfiguration(var_96);
         _localization = createLocalization(var_96);
         _communication = createCommunication(var_96);
         LocalizedSprite.localizationManager = _localization;
         LocalizedTextField.localizationManager = _localization;
         _localization.loadDefaultEmbedLocalizations(_configuration.getProperty("environment.id"));
         var_114 = new WebApiLoginProvider(this);
         var_114.addEventListener("SSO_TOKEN_AVAILABLE",onSsoTokenAvailable);
      }
      
      private function onSsoTokenAvailable(param1:SsoTokenAvailableEvent) : void
      {
         _ssoToken = param1.ssoToken;
         dispatchEvent(new Event("LOGIN_FLOW_FINISHED_EVENT"));
      }
      
      public function initLoginWithSsoToken(param1:String, param2:String) : void
      {
         updateEnvironment(param1,false);
         _ssoToken = param2;
         dispatchEvent(new Event("LOGIN_FLOW_FINISHED_EVENT"));
      }
      
      public function init() : void
      {
         stage.addEventListener("resize",onStageResize);
         _background = new login.Background();
         addChild(_background);
         var_125 = new Loader();
         var_125.visible = false;
         var_125.alpha = 0;
         addChild(var_125);
         var_104 = new Loader();
         var_104.visible = false;
         var_104.alpha = 0;
         addChild(var_104);
         var_666 = new Sprite();
         addChild(var_666);
         var _loc1_:Bitmap = new habbo_logo_png();
         _loc1_.x = 40;
         _loc1_.y = 40;
         var_666.addChild(_loc1_);
         var_56 = new Sprite();
         addChild(var_56);
         var_56.y = 50;
         var_56.x = 5;
         var_81 = new Sprite();
         var_81.x = 0;
         var_81.y = 50;
         var_81.visible = true;
         var_56.addChild(var_81);
         var_150 = new login.EnvironmentView(this);
         var_22 = new login.LoginView(this);
         var_219 = new login.AvatarView(this);
         var_372 = new login.SsoTokenView(this);
         _closeButton = new ColouredButton("red","X",new Rectangle(0,0,0,40),true,onClose,14211288);
         var_150.init();
         loadImages();
         showScreen(4);
         layoutMainElements();
         addEventListener("addedToStage",onAddedToStage);
         addEventListener("enterFrame",onEnterFrame);
      }
      
      private function loadImages() : void
      {
         ImageLoader.CreateLoader(var_104,getProperty("landing.view.background_right.uri"),onImageComplete);
         ImageLoader.CreateLoader(var_125,getProperty("landing.view.background_left.uri"),onImageComplete);
      }
      
      private function onImageComplete(param1:ImageLoaderEvent) : void
      {
         class_14.log("Image complete: " + param1.url);
         param1.loader.visible = true;
         TweenUtils.alphaTweenVisible(param1.loader,0,1.2);
         layoutMainElements();
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         removeEventListener("addedToStage",onAddedToStage);
         _lastFrameTime = getTimer();
         layoutMainElements();
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         TweenUtils.var_300.advanceTime((getTimer() - _lastFrameTime) / 1000);
         _lastFrameTime = getTimer();
      }
      
      private function onStageResize(param1:Event) : void
      {
         if(disposed)
         {
            return;
         }
         layoutMainElements();
      }
      
      private function layoutMainElements() : void
      {
         var _loc2_:int = 0;
         if(disposed)
         {
            return;
         }
         if(var_311)
         {
            return;
         }
         if(_background != null)
         {
            _background.resize();
         }
         var _loc1_:int = 0;
         if(stage.stageWidth > _loc1_)
         {
            _loc2_ = (0 - _loc1_) / 2;
            if(_loc2_ < 5)
            {
               _loc2_ = 5;
            }
            var_56.x = _loc2_;
         }
         else
         {
            var_56.x = 5;
         }
         var_56.y = 50;
         _closeButton.y = 30;
         _closeButton.x = 0 - 0 - 30;
         var_104.x = Math.max(400,0 - 0 + 50);
         var_104.y = 0 - 0 + 50;
         var_125.x = -50;
         var_125.y = 0 - 0 + 50;
      }
      
      public function showErrorMessage(param1:String) : void
      {
         var _loc4_:TextField = null;
         var _loc3_:Bitmap = null;
         if(_errorBalloon == null)
         {
            _loc4_ = LoaderUI.createTextField(param1,12,16777215,true);
            LoaderUI.addEtching(_loc4_,true);
            _loc3_ = LoaderUI.createBalloon(_loc4_.width + 30,_loc4_.height + 17,-1,true,11411485,"down");
            _errorBalloon = new Sprite();
            _errorBalloon.addChild(_loc3_);
            _errorBalloon.addChild(_loc4_);
            _loc4_.x = 15;
            _loc4_.y = 14;
            var_56.addChild(_errorBalloon);
            _errorBalloon.x = 300;
            _errorBalloon.y = 300;
            _errorBalloon.filters = [new GlowFilter(0,0.24,6,6)];
         }
         var _loc2_:Timer = new Timer(3000,1);
         _loc2_.addEventListener("timerComplete",onHideError);
         _loc2_.start();
         _errorBalloon.visible = true;
      }
      
      private function onHideError(param1:TimerEvent) : void
      {
         if(_errorBalloon)
         {
            _errorBalloon.visible = false;
         }
      }
      
      public function editorFinished() : void
      {
         dispatchEvent(new Event("LOGIN_FLOW_FINISHED_EVENT"));
      }
      
      public function showScreen(param1:int) : void
      {
         hideViews();
         switch(param1 - 1)
         {
            case 0:
               var_81.addChild(var_150);
               var_150.init();
               break;
            case 1:
               var_81.addChild(var_22);
               var_22.init();
               var_114.init(_communication);
               break;
            case 2:
               var_81.addChild(var_219);
               var_219.init();
               var_219.baseUrl = getProperty("web.api");
               layoutMainElements();
               break;
            case 3:
               var_81.addChild(var_372);
               var_372.init();
         }
         layoutMainElements();
      }
      
      public function get debugText() : TextField
      {
         return null;
      }
      
      private function hideViews() : void
      {
         while(false)
         {
            var_81.removeChildAt(0);
         }
      }
      
      public function initLogin(param1:String, param2:String) : void
      {
         var_114.loginWithCredentials(param1,param2);
      }
      
      public function loginWithAvatar(param1:AvatarData) : void
      {
         var_114.loginWithCredentialsWeb(param1.uniqueId);
      }
      
      public function showLoginScreen() : void
      {
      }
      
      public function showRegistrationError(param1:Object) : void
      {
         showError(param1);
      }
      
      public function showInvalidLoginError(param1:Object) : void
      {
         showError(param1);
      }
      
      public function nameCheckResponse(param1:Object, param2:Boolean) : void
      {
      }
      
      public function showAccountError(param1:Object) : void
      {
         showError(param1);
      }
      
      public function showLoadingScreen() : void
      {
      }
      
      public function saveLooksError(param1:Object) : void
      {
         showError(param1);
      }
      
      public function showTOS() : void
      {
         showErrorMessage("Need to show TOS");
      }
      
      public function environmentReady() : void
      {
         var_22.ready();
      }
      
      public function populateCharacterList(param1:Vector.<AvatarData>) : void
      {
         showScreen(3);
         var_219.populateAvatars(param1);
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
      
      public function showCaptchaError() : void
      {
         showScreen(2);
         showErrorMessage("Error with captcha");
      }
      
      private function showError(param1:Object) : void
      {
         var _loc3_:String = null;
         var _loc4_:Array;
         var _loc2_:String = String((_loc4_ = param1.errors) && _loc4_.length > 0 ? _loc4_[0] : "");
         if(_loc2_ == "" && param1 != null)
         {
            if(param1.error != null)
            {
               _loc2_ = String(param1.error);
            }
            else if(param1.message != null)
            {
               _loc2_ = String(param1.message);
            }
         }
         switch(_loc2_)
         {
            case "invalid-captcha":
               showCaptchaError();
               break;
            case "login.user_banned":
               _loc3_ = "connection.login.error.banned.desc";
               break;
            case "login.blocked":
               _loc3_ = "connection.login.error.blocked.desc";
               break;
            case "unauthorized-staff-login":
               _loc3_ = "connection.login.error.unauthorized.staff";
               break;
            case "pocket.auth.login_failed":
               _loc3_ = "connection.login.error.-3.desc";
               break;
            case "pocket.auth.no_avatars":
               _loc3_ = "connection.login.missing_avatars";
               break;
            case "pocket.auth.valid_email_required":
               _loc3_ = "connection.login.missing_credentials";
               break;
            case "pocket.auth.password_required":
               _loc3_ = "connection.login.missing_credentials";
               break;
            case "pocket.auth.facebook_disabled":
               _loc3_ = "connection.login.error.facebook_disabled.desc";
               break;
            case "pocket.auth.facebook_not_connected":
               break;
            case "pocket.auth.access_token_required":
               _loc3_ = "connection.login.error.facebook_accesstoken.desc";
               break;
            case "ioError":
               _loc3_ = "connection.login.error.-400.desc";
               break;
            case "account_issue":
               _loc3_ = "generic.error";
               break;
            default:
               _loc3_ = "generic.error";
         }
         if(_loc3_ && _loc3_.length > 0)
         {
            showErrorMessage(_localization.getLocalization(_loc3_));
         }
      }
      
      public function getProperty(param1:String, param2:Dictionary = null) : String
      {
         var _loc3_:String = !!_configuration ? _configuration.getProperty(param1,param2) : "";
         if(!_loc3_ || _loc3_.length == 0)
         {
            class_14.log("[LoginFlow] Add property: " + param1);
         }
         return _loc3_;
      }
      
      public function createCaptchaView() : class_34
      {
         addChild(_closeButton);
         var _loc1_:WebCaptchaView = new WebCaptchaView(var_114 as WebApiLoginProvider);
         addChild(_loc1_);
         layoutMainElements();
         return _loc1_;
      }
      
      public function captchaReady() : void
      {
         removeChild(_closeButton);
         showScreen(2);
      }
      
      private function onClose(param1:Button) : void
      {
         removeChild(_closeButton);
         var_114.closeCaptcha();
         showScreen(2);
      }
      
      public function updateEnvironment(param1:String, param2:Boolean) : void
      {
         if(param2)
         {
            _localization.loadDefaultEmbedLocalizations(param1);
            return;
         }
         CommunicationUtils.writeSOLProperty("environment",param1);
         _configuration.updateEnvironmentId(param1);
         if(var_150)
         {
            var_150.updateEnvironment();
         }
         _localization.loadDefaultEmbedLocalizations(_configuration.getProperty("environment.id"));
         class_14.log("[LoginFlow] updated environment to: " + param1);
         _communication.updateHostParameters();
         _localization.requestLocalizationInit();
      }
   }
}
