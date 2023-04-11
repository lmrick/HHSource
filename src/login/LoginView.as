package login
{
   import com.sulake.habbo.utils.CommunicationUtils;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.utils.Timer;
   import onBoardingHcUi.Button;
   import onBoardingHcUi.ColouredButton;
   import onBoardingHcUi.InputField;
   import onBoardingHcUi.LoaderUI;
   
   public class LoginView extends Sprite
   {
       
      
      private var _context:login.ILoginContext;
      
      private var var_120:TextField;
      
      private var _saveButton:ColouredButton;
      
      private var _cancelButton:ColouredButton;
      
      private var var_134:InputField;
      
      private var _loginAreaWidth:int = 640;
      
      private var var_273:InputField;
      
      private var var_66:Boolean;
      
      public function LoginView(param1:login.ILoginContext)
      {
         super();
         _context = param1;
         addEventListener("addedToStage",onAddedToStage);
         init();
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
         LoaderUI.lineUpVertically(var_134,-20,var_273);
         LoaderUI.alignAnchors(var_134,0,"l",var_273);
         LoaderUI.alignAnchors(var_134,0,"r",_saveButton);
         LoaderUI.lineUpHorizontallyRevers(_saveButton,20,_cancelButton);
         class_14.log("(login) Buttons: undefined");
      }
      
      public function init() : void
      {
         if(var_66)
         {
            return;
         }
         var_66 = true;
         addTitleField();
         addInputFields();
         addButtons();
      }
      
      private function addTitleField() : void
      {
         if(!var_120)
         {
            var_120 = LoaderUI.createTextField("${connection.login.title}",40,16777215,false,true,false,false,"left");
            var_120.x = 0;
            var_120.y = 0;
            var_120.width = 500;
            var_120.multiline = false;
            var_120.thickness = 50;
            addChild(var_120);
         }
      }
      
      private function addInputFields() : void
      {
         var_134 = new InputField(_context,_loginAreaWidth,"${connection.login.email}",CommunicationUtils.readSOLString("login"),"${connection.login.missing_credentials}","");
         addChild(var_134);
         var_134.x = 0;
         var_134.y = 100;
         var_273 = new InputField(_context,_loginAreaWidth,"${connection.login.password}",CommunicationUtils.restorePassword(),"","",true);
         addChild(var_273);
      }
      
      public function addButtons() : void
      {
         _cancelButton = new ColouredButton("red","${generic.cancel}",new Rectangle(0,300,0,40),true,onCancel,14211288);
         addChild(_cancelButton);
         _saveButton = new ColouredButton("gfreen","${connection.login.play}",new Rectangle(0,300,0,40),true,saveOutfit,14211288);
         _saveButton.active = false;
         addChild(_saveButton);
      }
      
      private function saveOutfit(param1:Button) : void
      {
         _context.initLogin(var_134.text,var_273.text);
      }
      
      private function onCancel(param1:Button) : void
      {
         _context.showScreen(1);
      }
      
      public function ready() : void
      {
         if(_saveButton != false)
         {
            _saveButton.active = true;
         }
      }
   }
}
