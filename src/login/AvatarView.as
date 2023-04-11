package login
{
   import com.sulake.habbo.communication.login.AvatarData;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.Sprite;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.text.TextField;
   import flash.utils.Timer;
   import onBoardingHcUi.Button;
   import onBoardingHcUi.ColouredButton;
   import onBoardingHcUi.LoaderUI;
   
   public class AvatarView extends Sprite
   {
      
      private static const avatar_halo_png:Class = avatar_halo_png;
      
      private static const avatar_glow_png:Class = avatar_glow_png;
      
      private static const placeholder_avatar:Class = placeholder_avatar;
      
      private var _context:login.ILoginContext;
      
      private var var_120:TextField;
      
      private var _saveButton:ColouredButton;
      
      private var _cancelButton:ColouredButton;
      
      private var var_66:Boolean;
      
      private var var_228:Vector.<AvatarData>;
      
      private var var_1407:int = 10;
      
      private var var_138:String;
      
      private var var_70:Sprite;
      
      private var _avatarDescription:TextField;
      
      private var _avatarName:TextField;
      
      private var var_85:int;
      
      private var var_245:Vector.<DisplayObjectContainer>;
      
      private var var_84:Bitmap;
      
      private var _avatarGlow:Bitmap;
      
      public function AvatarView(param1:login.ILoginContext)
      {
         super();
         _context = param1;
         init();
         addEventListener("addedToStage",onAddedToStage);
      }
      
      public function set baseUrl(param1:String) : void
      {
         var_138 = param1;
      }
      
      public function dispose() : void
      {
         _saveButton.dispose();
         _cancelButton.dispose();
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         var _loc2_:Timer = new Timer(20,1);
         _loc2_.addEventListener("timerComplete",onAlignElements);
         _loc2_.start();
      }
      
      private function onAlignElements(param1:TimerEvent) : void
      {
         LoaderUI.lineUpVerticallyRevers(_saveButton,20,var_70);
         LoaderUI.alignAnchors(var_70,0,"r",_saveButton);
         LoaderUI.lineUpHorizontallyRevers(_saveButton,20,_cancelButton);
         class_14.log("(avatar) Information panel: undefined");
      }
      
      public function init() : void
      {
         var_85 = 0;
         if(var_66)
         {
            return;
         }
         var_66 = true;
         var_70 = new Sprite();
         addChild(var_70);
         var _loc1_:Bitmap = LoaderUI.createBalloon(640,100,0,false,995918,"none");
         var_70.addChild(_loc1_);
         var_70.y = 180;
         _avatarDescription = LoaderUI.createTextField("",18,8309486,false);
         _avatarName = LoaderUI.createTextField("",20,16777215,false,true,false,false);
         _avatarName.width = 260;
         _avatarName.x = 50;
         _avatarDescription.x = 50;
         _avatarDescription.width = 260;
         var_70.addChild(_avatarDescription);
         var_70.addChild(_avatarName);
         LoaderUI.lineUpVertically(_loc1_,15 - _loc1_.height,_avatarName,20,_avatarDescription);
         _avatarGlow = new avatar_glow_png();
         _avatarGlow.blendMode = "add";
         _avatarGlow.visible = false;
         var_84 = new avatar_halo_png();
         var_84.blendMode = "overlay";
         var_84.visible = false;
         addTitleField();
         addChild(var_84);
         addChild(_avatarGlow);
         addButtons();
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
      }
      
      private function addTitleField() : void
      {
         if(!var_120)
         {
            var_120 = LoaderUI.createTextField("${connection.login.account.choose}",40,16777215,false,true,false,false,"left");
            var_120.x = 0;
            var_120.y = 0;
            var_120.width = 500;
            var_120.multiline = false;
            var_120.thickness = 50;
            addChild(var_120);
         }
      }
      
      public function addButtons() : void
      {
         _cancelButton = new ColouredButton("red","${generic.cancel}",new Rectangle(0,300,0,40),true,onCancel,14211288);
         addChild(_cancelButton);
         _saveButton = new ColouredButton("gfreen","${connection.login.play}",new Rectangle(0,300,0,40),true,onChooseAvatar,14211288);
         _saveButton.active = false;
         addChild(_saveButton);
      }
      
      public function populateAvatars(param1:Vector.<AvatarData>) : void
      {
         var _loc4_:Loader = null;
         var _loc5_:URLRequest = null;
         var _loc3_:Sprite = null;
         var _loc8_:Bitmap = null;
         var _loc2_:int = 0;
         var_245 = new Vector.<DisplayObjectContainer>(0);
         var_228 = param1;
         var _loc6_:int = 0;
         for each(var _loc7_ in param1)
         {
            if(_loc6_ > 6)
            {
               break;
            }
            class_14.log("Adding avatar: " + _loc7_.name);
            (_loc4_ = new Loader()).name = String(_loc6_);
            _loc5_ = new URLRequest(getAvatarUrl(_loc7_));
            _loc4_.load(_loc5_);
            _loc4_.contentLoaderInfo.addEventListener("complete",avatarImageLoadCompleteHandler);
            _loc4_.contentLoaderInfo.addEventListener("error",onImageError);
            _loc4_.contentLoaderInfo.addEventListener("ioError",onImageError);
            _loc4_.contentLoaderInfo.addEventListener("securityError",onImageError);
            _loc3_ = new Sprite();
            var_245.push(_loc3_);
            _loc8_ = new placeholder_avatar();
            _loc3_.addChild(_loc8_);
            _loc3_.addChild(_loc4_);
            addChild(_loc3_);
            _loc3_.name = String(_loc6_);
            _loc3_.addEventListener("click",onAvatarClick);
            _loc2_ = (_loc6_ + 1) * var_1407 + _loc6_ * 100;
            _loc3_.x = _loc2_;
            _loc3_.y = 50;
            _loc6_++;
         }
         if(param1.length > 0)
         {
            updateDescription();
            var_85 = 0;
            _saveButton.active = true;
            _avatarGlow.visible = true;
            var_84.visible = true;
            hilightAvatar(var_245[var_85]);
         }
         else
         {
            _saveButton.active = false;
         }
      }
      
      private function onImageError(param1:ErrorEvent) : void
      {
         class_14.log("Failed to load image " + param1.text);
      }
      
      private function onAvatarClick(param1:MouseEvent) : void
      {
         var_85 = int(param1.currentTarget.name);
         updateDescription();
         hilightAvatar(var_245[var_85]);
         _saveButton.active = true;
      }
      
      private function avatarImageLoadCompleteHandler(param1:Event) : void
      {
         (param1.currentTarget as LoaderInfo).loader.parent.removeChildAt(0);
         _avatarGlow.visible = true;
         var_84.visible = true;
         hilightAvatar(var_245[var_85]);
      }
      
      private function updateDescription() : void
      {
         if(var_228 == null || false)
         {
            return;
         }
         var _loc1_:AvatarData = var_228[var_85];
         _avatarName.text = _loc1_.name;
         _avatarDescription.text = _loc1_.motto;
      }
      
      private function hilightAvatar(param1:DisplayObject) : void
      {
         var _loc2_:int = param1.x + param1.width / 2;
         var _loc3_:int = param1.y + param1.height / 2;
         _avatarGlow.x = _loc2_ - 0;
         _avatarGlow.y = _loc3_ - 0 + 15;
         var_84.x = _loc2_ - 0;
         var_84.y = _loc3_ + var_84.height - 40;
      }
      
      private function getAvatarUrl(param1:AvatarData) : String
      {
         var _loc3_:String = null;
         var _loc2_:String = var_138 + "/habbo-imaging/avatarimage?user=" + param1.name;
       
         if(var_138.indexOf("local") > -1 || var_138.indexOf("127.0.0.1") > -1)
         {
            _loc3_ = "s-0.g-1.d-3.h-3.a-0";
            _loc2_ = "https://www.habbo.com/habbo-imaging/avatarimage?size=m&figure=" + param1.figure + "&direction=2";
         }
         
         return _loc2_;
      }
      
      private function onCancel(param1:Button) : void
      {
         _context.showScreen(2);
      }
      
      private function onChooseAvatar(param1:Button) : void
      {
         var _loc2_:int = var_85;
         _context.loginWithAvatar(var_228[_loc2_]);
      }
   }
}
