package login
{
   import com.sulake.core.runtime.IDisposable;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.utils.Timer;
   import onBoardingHcUi.Button;
   import onBoardingHcUi.ColouredButton;
   import onBoardingHcUi.LoaderUI;
   
   public class EnvironmentView extends Sprite implements IDisposable
   {
      
      private static const flag_icon_de:Class = flag_icons_de;
      
      private static const flag_icon_dev:Class = flag_icons_dev;
      
      private static const flag_icon_en:Class = flag_icons_en;
      
      private static const flag_icon_es:Class = flag_icons_es;
      
      private static const flag_icon_fi:Class = flag_icons_fi;
      
      private static const flag_icon_fr:Class = flag_icons_fr;
      
      private static const flag_icon_it:Class = flag_icons_it;
      
      private static const flag_icon_nl:Class = flag_icons_nl;
      
      private static const flag_icon_pt:Class = flag_icons_pt;
      
      private static const flag_icon_tr:Class = flag_icons_tr;
      
      private static const flag_icon_selected:Class = flag_icon_selected;
      
      private static const ITEMS_PER_ROW:int = 9;
      
      private static const THUMB_SIZE:int = 160;
      
      private static const THUMB_SCALE:Number = 0.5;
      
      private static const SPACING:int = 10;
      
      private var var_46:Vector.<Bitmap>;
      
      private var _context:login.LoginFlow;
      
      private var var_120:TextField;
      
      private var var_198:Bitmap;
      
      private var _environmentName:TextField;
      
      private var var_78:int = 0;
      
      private var _loginButton:Button;
      
      private var _loginWithCodeButton:Button;
      
      private var _environmentImageContainers:Array;
      
      private var _chosenIcon:Bitmap;
      
      private var var_1407:int = 10;
      
      private var var_99:Array;
      
      private var var_66:Boolean;
      
      private var var_92:Sprite;
      
      public function EnvironmentView(param1:login.LoginFlow)
      {
         _environmentImageContainers = [];
         super();
         _context = param1;
         addEventListener("addedToStage",onAddedToStage);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         var _loc2_:Timer = new Timer(20,1);
         _loc2_.addEventListener("timerComplete",onAlignElements);
         _loc2_.start();
      }
      
      private function onAlignElements(param1:TimerEvent = null) : void
      {
         LoaderUI.alignAnchors(this,0,"c",var_198);
         if(_loginButton)
         {
            LoaderUI.alignAnchors(var_198,0,"r",_loginButton);
            LoaderUI.lineUpHorizontallyRevers(_loginButton,20,_loginWithCodeButton);
         }
         else
         {
            LoaderUI.alignAnchors(var_198,0,"r",_loginWithCodeButton);
         }
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(_loginButton)
         {
            _loginButton.dispose();
         }
         _loginWithCodeButton.dispose();
         for each(var _loc1_ in var_46)
         {
         }
         var_46 = null;
         _context = null;
      }
      
      public function get disposed() : Boolean
      {
         return _context == null;
      }
      
      private function initEnvironmentImages() : void
      {
         var_99 = _context.getProperty("live.environment.list").split("/");
         var_46.push(Bitmap(new flag_icon_en()));
         var_46.push(Bitmap(new flag_icon_pt()));
         var_46.push(Bitmap(new flag_icon_de()));
         var_46.push(Bitmap(new flag_icon_es()));
         var_46.push(Bitmap(new flag_icon_fi()));
         var_46.push(Bitmap(new flag_icon_fr()));
         var_46.push(Bitmap(new flag_icon_it()));
         var_46.push(Bitmap(new flag_icon_nl()));
         var_46.push(Bitmap(new flag_icon_tr()));
         var_46.push(Bitmap(new flag_icon_dev()));
      }
      
      public function init() : void
      {
         if(var_66)
         {
            return;
         }
         var_66 = true;
         var_46 = new Vector.<Bitmap>();
         if(var_99 == null)
         {
            initEnvironmentImages();
         }
         updateEnvironment();
         initView();
      }
      
      public function updateEnvironment() : void
      {
         var _loc1_:String = _context.getProperty("environment.id");
         var _loc2_:int = var_99.indexOf(_loc1_);
         if(_loc2_ == -1)
         {
            class_14.log("Missing environment, require hotel selection! " + _loc1_);
            var_78 = 0;
         }
         else
         {
            var_78 = _loc2_;
         }
         chooseEnvironment();
      }
      
      public function initView() : void
      {
         var _loc7_:int = 0;
         var _loc8_:Sprite = null;
         var _loc10_:Bitmap = null;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc6_:int = 0;
         var _loc9_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         addTitleField();
         var_198 = LoaderUI.createBalloon(640,100,0,false,995918,"none");
         var_198.visible = false;
         addChild(var_198);
         var_92 = new Sprite();
         addChild(var_92);
         _chosenIcon = Bitmap(new flag_icon_selected());
         var_92.addChild(_chosenIcon);
         var_92.scaleX = var_92.scaleY = 0.5;
         _loc7_ = 0;
         while(_loc7_ < var_46.length)
         {
            _loc8_ = new Sprite();
            if((_loc10_ = var_46[_loc7_] as Bitmap) != null)
            {
               _loc8_.addChild(_loc10_);
            }
            addChild(_loc8_);
            _environmentImageContainers.push(_loc8_);
            _loc8_.name = String(_loc7_);
            _loc8_.addEventListener("click",onEnvironmentClick);
            _loc8_.scaleX = _loc8_.scaleY = 0.5;
            _loc3_ = 80;
            _loc2_ = 5;
            _loc6_ = _loc7_ % 9;
            _loc9_ = _loc7_ / 9;
            _loc4_ = _loc6_ * _loc3_ + _loc6_ * _loc2_;
            _loc5_ = _loc9_ * _loc3_ + _loc9_ * _loc2_;
            _loc8_.x = _loc4_;
            _loc8_.y = 100 + _loc5_;
            _loc7_++;
         }
         _environmentName = LoaderUI.createTextField("Title",20,16777215,false,true,false,false);
         _environmentName.width = 260;
         _environmentName.y = 300;
         addChild(_environmentName);
         _loginWithCodeButton = new ColouredButton("gfreen","${connection.login.useTicket}",new Rectangle(0,300,0,40),true,onButtonSelectToken);
         addChild(_loginWithCodeButton);
         chooseEnvironment();
      }
      
      private function addTitleField() : void
      {
         if(!var_120)
         {
            var_120 = LoaderUI.createTextField("${connection.login.environment.choose}",40,16777215,false,true,false,false,"left");
            var_120.x = 0;
            var_120.y = 0;
            var_120.width = 500;
            var_120.multiline = false;
            var_120.thickness = 50;
            addChild(var_120);
         }
      }
      
      private function onEnvironmentClick(param1:Event) : void
      {
         var_78 = int(param1.currentTarget.name);
         chooseEnvironment();
         _context.updateEnvironment(var_99[var_78],true);
         onAlignElements();
      }
      
      private function chooseEnvironment() : void
      {
         var _loc1_:Sprite = _environmentImageContainers[var_78];
         if(_loc1_ == null)
         {
            return;
         }
         var_92.x = _loc1_.x - (0 - _loc1_.width) / 2 - 1;
         var_92.y = _loc1_.y - (0 - _loc1_.height) / 2 - 1;
         var_92.visible = true;
         if(_loginButton)
         {
            _loginButton.active = true;
         }
         updateDescription();
      }
      
      private function onButtonSelect(param1:DisplayObject) : void
      {
         _context.updateEnvironment(var_99[var_78],false);
         _context.showScreen(2);
      }
      
      private function onButtonSelectToken(param1:DisplayObject) : void
      {
         _context.updateEnvironment(var_99[var_78],false);
         _context.showScreen(4);
      }
      
      private function updateDescription() : void
      {
         var _loc1_:String = "null";
         _environmentName.text = _context.getProperty("connection.info.name." + _loc1_);
      }
      
      public function get environmentId() : String
      {
         return var_99[var_78];
      }
      
      public function get environmentAvailable() : Boolean
      {
         var _loc1_:String = _context.getProperty("environment.id");
         return var_99.indexOf(_loc1_) > -1;
      }

   }
}
