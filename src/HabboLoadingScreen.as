package
{
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.class_21;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.class_31;
   import com.sulake.habbo.configuration.HabboConfigurationManager;
   import com.sulake.habbo.localization.HabboLocalizationManager;
   import flash.desktop.NativeApplication;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.text.TextField;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import onBoardingHcUi.LoaderUI;
   import splash.PhotoSplashScreen;
   
   public class HabboLoadingScreen extends Sprite implements IDisposable, IHabboLoadingScreen
   {
      
      private static const const_45:int = 28;
      
      public static const LOADING_BAR_WIDTH:int = 400;
      
      public static const LOADING_BAR_HEIGHT:int = 25;
      
      public static const LOADING_BAR_BORDER_WIDTH:int = 2;
      
      public static const LOADING_BAR_BORDER_SPACING:int = 2;
      
      public static const CONTAINER:String = "container";
      
      public static const FILE_LOADING_BAR:String = "fileLoadingBar";
      
      public static const FILE_BAR_SPRITE:String = "fileBarSprite";
      
      public static const PHOTO_SPLASH_SCREEN:String = "photoSplashScreen";
      
      public static const BACKGROUND:String = "background";
      
      public static const const_23:String = "habboLogo";
      
      public static const const_373:String = "textField";
      
      public static const VERSION_TEXT_FIELD:String = "versionTextField";
      
      public static const const_256:String = "loadingNumberTextField";
       
      
      private var var_303:Timer;
      
      private var _barProgression:int = 0;
      
      private var var_588:PhotoSplashScreen;
      
      private var _disposed:Boolean = false;
      
      private var var_202:int = 0;
      
      private var var_444:String = null;
      
      private var var_96:class_31;
      
      private var _configuration:HabboConfigurationManager;
      
      private var _localization:HabboLocalizationManager;
      
      private var var_489:Boolean = false;
      
      public function HabboLoadingScreen(param1:int, param2:int, param3:Dictionary)
      {
         var _loc5_:Sprite = null;
         var _loc13_:Sprite = null;
         var _loc9_:Array = null;
         super();
         createFakeContext(param3);
         var _loc14_:Sprite;
         (_loc14_ = new Sprite()).name = "background";
         _loc14_.graphics.clear();
         _loc14_.graphics.beginFill(922908);
         _loc14_.graphics.drawRect(0,0,param1,param2);
         addChild(_loc14_);
         var_588 = new PhotoSplashScreen(this);
         var_588.name = "photoSplashScreen";
         addChild(var_588);
         (_loc5_ = new Sprite()).name = "fileLoadingBar";
         _loc5_.graphics.lineStyle(1,16777215,1,true);
         _loc5_.graphics.beginFill(2500143);
         _loc5_.graphics.drawRect(1,0,399,0);
         _loc5_.graphics.drawRect(400,1,0,24);
         _loc5_.graphics.drawRect(1,25,399,0);
         _loc5_.graphics.drawRect(0,1,0,24);
         _loc5_.graphics.endFill();
         addChild(_loc5_);
         var _loc10_:String = _localization.getLocalization("client.starting.revolving");
         var _loc4_:String = _localization.getLocalization("client.starting");
         var _loc11_:* = null;
         if(_loc10_ != null)
         {
            _loc9_ = _loc10_.split("/");
            var_202 = randomNumber(0,_loc9_.length - 1);
            var_444 = _loc10_;
            _loc11_ = String(_loc9_[var_202]);
         }
         else
         {
            _loc11_ = _loc4_;
         }
         var _loc6_:TextField;
         (_loc6_ = LoaderUI.createTextField(_loc11_,28,16777215,true,false,false,false,"center")).name = "textField";
         addChild(_loc6_);
         var _loc7_:TextField;
         (_loc7_ = LoaderUI.createTextField("0%",14,10066329,true,false,false,false,"center")).name = "loadingNumberTextField";
         addChild(_loc7_);
         (_loc13_ = new Sprite()).name = "fileBarSprite";
         _loc5_.addChild(_loc13_);
         _loc5_.visible = true;
         var _loc12_:XML;
         var _loc8_:Namespace = (_loc12_ = NativeApplication.nativeApplication.applicationDescriptor).namespace();
         var _loc16_:String = _loc12_._loc8_::versionNumber;
         var _loc15_:TextField;
         (_loc15_ = LoaderUI.createTextField(_loc16_,12,10066329,true,false,false,false,"right")).name = "versionTextField";
         addChild(_loc15_);
         addEventListener("addedToStage",onAddedToStage);
      }
      
      private function createFakeContext(param1:Dictionary) : void
      {
         var_96 = new FakeContext(param1);
         var _loc3_:XML = <manifest><library /></manifest>;
         var _loc2_:class_21 = new AssetLibrary("_assetsTemp@",_loc3_);
         (var_96.assets as AssetLibraryCollection).addAssetLibrary(_loc2_);
         _configuration = createConfiguration(var_96);
         _localization = createLocalization(var_96);
         _localization.loadDefaultEmbedLocalizations(_configuration.getProperty("environment.id"));
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
      
      private function onRemovedFromStage(param1:Event) : void
      {
         class_14.log("Habbo Loading Screen was removed from stage.");
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         removeEventListener("addedToStage",onAddedToStage);
         stage.addEventListener("resize",onResize);
         positionLoadingScreenDisplayElements();
         var_303 = new Timer(750);
         var_303.addEventListener("timer",onBarProgressEvent);
         var_303.start();
      }
      
      private function onResize(param1:Event) : void
      {
         positionLoadingScreenDisplayElements();
      }
      
      private function onBarProgressEvent(param1:Event) : void
      {
         var _loc4_:Array = null;
         var _loc2_:TextField = null;
         var _loc3_:TextField = null;
         if(_barProgression == 100)
         {
            if(var_489)
            {
               _loc4_ = var_444.split("/");
               _loc2_ = getChildByName("textField") as TextField;
               if(_loc2_ != null)
               {
                  removeElement("textField");
                  _loc3_ = LoaderUI.createTextField(_loc4_[var_202],28,16777215,true,false,false,false,"center");
                  _loc3_.x = (width - _loc3_.width) / 2;
                  _loc3_.y = _loc2_.y;
                  _loc3_.name = "textField";
                  addChild(_loc3_);
               }
               var_489 = false;
            }
            _barProgression = 0;
         }
         else
         {
            _barProgression += Math.min(randomNumber(35,Math.min(randomNumber(45,55))),100 - _barProgression);
         }
         if(_barProgression == 100 && var_444 != null)
         {
            var_489 = true;
            var_202 = (var_202 + 1) % (var_444.split("/").length - 1);
         }
         updateLoadingBarProgression(_barProgression / 100);
      }
      
      private function randomNumber(param1:Number, param2:Number) : Number
      {
         return Math.floor(Math.random() * (param2 - param1 + 1)) + param1;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function removeElement(param1:String) : void
      {
         var _loc2_:DisplayObject = getChildByName(param1);
         if(_loc2_ != null)
         {
            removeChild(_loc2_);
         }
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         _disposed = true;
         removeEventListener("addedToStage",onAddedToStage);
         removeEventListener("removedFromStage",onRemovedFromStage);
         removeElement("photoSplashScreen");
         removeElement("background");
         removeElement("textField");
         removeElement("habboLogo");
         removeElement("fileLoadingBar");
         removeElement("container");
         var_303.stop();
         var_303.removeEventListener("timer",onBarProgressEvent);
         if(var_96)
         {
            var_96.dispose();
            var_96 = null;
         }
         if(_localization)
         {
            _localization.dispose();
            _localization = null;
         }
         if(_configuration)
         {
            _configuration.dispose();
            _configuration = null;
         }
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function positionLoadingScreenDisplayElements() : void
      {
         var _loc11_:int = 0;
         var _loc14_:int = 0;
         var _loc8_:Stage;
         if((_loc8_ = this.stage) != null)
         {
            _loc11_ = _loc8_.stageWidth;
            _loc14_ = _loc8_.stageHeight;
         }
         else
         {
            _loc11_ = this.width;
            _loc14_ = this.height;
         }
         var _loc9_:Sprite;
         if((_loc9_ = getChildByName("background") as Sprite) != null)
         {
            _loc9_.x = 0;
            _loc9_.y = 0;
            _loc9_.graphics.clear();
            _loc9_.graphics.beginFill(922908);
            _loc9_.graphics.drawRect(0,0,_loc11_,_loc14_);
         }
         var _loc15_:int = 0;
         var _loc12_:int = 0;
         var _loc1_:int = 0;
         var _loc7_:Sprite;
         if((_loc7_ = getChildByName("photoSplashScreen") as Sprite) != null)
         {
            _loc7_.x = (_loc11_ - _loc7_.width) / 2;
            _loc1_ = _loc7_.y + _loc7_.height;
         }
         var _loc5_:TextField;
         if((_loc5_ = getChildByName("textField") as TextField) != null)
         {
            _loc5_.x = (_loc11_ - _loc5_.width) / 2;
            if(_loc5_.width > _loc12_)
            {
               _loc12_ = _loc5_.width;
               _loc15_ = _loc5_.x;
            }
         }
         var _loc2_:TextField = getChildByName("versionTextField") as TextField;
         if(_loc2_ != null)
         {
            _loc2_.x = _loc11_ - _loc2_.width;
            _loc2_.y = 0;
         }
         var _loc13_:Sprite;
         if((_loc13_ = getChildByName("fileLoadingBar") as Sprite) != null)
         {
            _loc13_.x = (_loc11_ - _loc13_.width) / 2;
            _loc13_.y = _loc1_;
            _loc1_ = _loc13_.y + _loc13_.height;
            if(_loc13_.width > _loc12_)
            {
               _loc12_ = _loc13_.width;
               _loc15_ = _loc13_.x;
            }
         }
         var _loc10_:TextField;
         if((_loc10_ = getChildByName("loadingNumberTextField") as TextField) != null)
         {
            _loc10_.x = (_loc11_ - _loc10_.width) / 2;
            if(_loc10_.width > _loc12_)
            {
               _loc12_ = _loc10_.width;
               _loc15_ = _loc10_.x;
            }
         }
         _loc1_ = (_loc14_ - _loc1_) / 2;
         _loc1_ -= 20;
         if(_loc7_ != null)
         {
            _loc7_.y = _loc1_;
            _loc1_ = _loc7_.y + _loc7_.height;
         }
         if(_loc5_ != null)
         {
            _loc5_.y = _loc1_ + 50;
            _loc1_ = _loc5_.y + _loc5_.height + 10;
         }
         if(_loc13_ != null)
         {
            _loc13_.y = _loc1_;
            _loc1_ = _loc13_.y + _loc13_.height + 5;
         }
         if(_loc10_ != null)
         {
            _loc10_.y = _loc1_;
         }
      }
      
      public function updateLoadingBarProgression(param1:Number) : void
      {
         var _loc8_:Sprite;
         if((_loc8_ = getChildByName("fileLoadingBar") as Sprite) == null)
         {
            return;
         }
         var _loc7_:Sprite;
         if((_loc7_ = _loc8_.getChildByName("fileBarSprite") as Sprite) == null)
         {
            return;
         }
         _loc7_.x = 2 + 2;
         _loc7_.y = 2 + 2;
         _loc7_.graphics.clear();
         var _loc4_:int = 25 - 2 * 2 - 2 * 2;
         var _loc2_:int = (400 - 2 * 2 - 2 * 2) * param1;
         _loc7_.graphics.beginFill(0);
         _loc7_.graphics.drawRect(-1,-1,400 - 2 * 2,25 - 2 * 2);
         _loc7_.graphics.endFill();
         _loc7_.graphics.beginFill(12241619);
         _loc7_.graphics.drawRect(0,0,_loc2_,_loc4_ / 2);
         _loc7_.graphics.endFill();
         _loc7_.graphics.beginFill(9216429);
         _loc7_.graphics.drawRect(0,_loc4_ / 2,_loc2_,_loc4_ / 2 + 1);
         _loc7_.graphics.endFill();
      }
      
      public function updateLoadingBar(param1:Number) : void
      {
         var _loc2_:TextField = getChildByName("loadingNumberTextField") as TextField;
         if(_loc2_ != null)
         {
            _loc2_.text = Math.round(param1 * 100) + "%";
         }
      }
   }
}
